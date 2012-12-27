require 'spec_helper'

describe ArticlesController do
  login_user
  describe "GET index" do

    it "should have a current_user" do
      subject.current_user.should_not be_nil
    end

    it "populates an array of articles" do
      article = create(:article)
      get :index
      assigns(:articles).should eq [article]
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do
    it "assigns the requested article to @article" do
      article = create(:article)
      get :show, {:id => article.id}
      assigns(:article).should eq article
    end

    it "it renders the :show template" do
      article = create(:article)
      get :show, id: article
      response.should render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new Article to @article" do
      get :new
      assigns(:article).should be_a_new(Article)
    end

    it "renders the :new template" do
      get :new
      response.should render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested article to @article" do
      article = create(:article)
      get :edit, id: article
      assigns(:article).should eq article
    end
    it "renders the :edit template" do
      article = create(:article)
      get :edit, id: article
      response.should render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new message in the database" do
        expect{ post :create, article: attributes_for(:article)}.to change(Article, :count).by(1)
      end

      it "redirects to the home page" do
        post :create, article: attributes_for(:article)
        response.should redirect_to :articles
      end
    end
    context "with invalid attributes" do
      it "does not save the new message in the database" do
        expect{ post :create, article: attributes_for(:invalid_article)}.to_not change(Article, :count)
      end
      it "re-renders the :new template" do
        post :create, article: attributes_for(:invalid_article)
        response.should redirect_to :articles
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @article = create(:article,title: "testing" )
    end
    it "locates the requested @article" do
      put :update, id: @article, article: attributes_for(:article)
      assigns(:article).should eq(@article)
    end

    context "with valid attributes" do
      it "updates the message in the database" do

      end
      it "redirects to the message"
    end

    context "with invalid attributes" do
      it "does not update the message"
      it "re-renders the #edit template"
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the message from the database"
    it "redirects to the home page"
  end
end
