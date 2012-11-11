class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  require 'will_paginate/array'

  # GET /users
  # GET /users.json
  def index

    @search = User.search(params[:q])
    @users = @search.result
    if params[:approved] == "false"
      @users = @users.find_all_by_approved(false)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(:page => params[:page])
    @favorites = User.favorited_articles_by(@user).paginate(:page => params[:page])
    session[:last_article_page] = request.env['HTTP_REFERER'] || user_path(@user)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def published
    @articles = @user.articles.order("created_at DESC").paginate(:page => params[:page])
    session[:last_article_page] = request.env['HTTP_REFERER'] || articles_url
  end

  def favorited
    @favorites = User.favorited_articles_by(@user).paginate(:page => params[:page])
    session[:last_article_page] = request.env['HTTP_REFERER'] || articles_url
  end

  def approve
    user = User.find(params[:id])
    user.approved = true
    user.save

    redirect_to :back
  end

  def block
    user = User.find(params[:id])
    user.approved = false
    user.save

    redirect_to :back
  end
end
