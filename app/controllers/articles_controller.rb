class ArticlesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  autocomplete :tag, :name, :class_name => 'ActsAsTaggableOn::Tag'

  # GET /articles
  # GET /articles.json
  def index
    @search = Article.search(params[:q])
    @articles = @search.result
    @articles = @articles.order("created_at DESC").paginate(:page => params[:page])

    @tags = Article.tag_counts_on(:tags,:limit => 100, :order => "name desc")
    if request.env['HTTP_REFERER'].nil? || (request.env['HTTP_REFERER'].include? '/users/sign_in')
      session[:last_article_page] = articles_path
    else
      session[:last_article_page] = request.env['HTTP_REFERER'] || articles_url
    end
    @article = Article.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
      format.atom
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])

  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])
    @article.title = params[:article][:title].capitalize
    @article.user = current_user

    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_url, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to articles_url, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  def tag
    @articles = Article.tagged_with(params[:tag_name]).paginate(:page => params[:page])
    @tags = Article.tag_counts_on(:tags)

    @article = Article.new

    render 'index'
  end

  def favorite
    @article = Article.find(params[:id])
    unless @article.is_favorited_by_user?(current_user)
      @article.favorited_by(current_user)
    end

    respond_to do |format|
      format.html { redirect_to article_path(@article)}
    end
  end

  def unfavorite
    @article = Article.find(params[:id])
    favorite = @article.article_user_favorites(current_user).first
    favorite.destroy

    respond_to do |format|
      format.html { redirect_to article_path(@article) }
    end
  end

  def download_attachment
    @article = Article.find(params[:id])
    send_file @article.attachment.path , :type => @article.attachment_content_type
  end

  def open_attachment
    @article = Article.find(params[:id])
    send_file @article.attachment.path , :type => @article.attachment_content_type, :disposition => 'inline'
  end


  def delete_attachment
    @article = Article.find(params[:id])
    @article.attachment = nil
    @article.save

    redirect_to article_path(@article)
  end
end
