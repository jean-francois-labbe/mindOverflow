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
end
