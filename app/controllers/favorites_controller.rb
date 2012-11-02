class FavoritesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @article.favorited_by(current_user)
    respond_to do |format|
      format.html { redirect_to articles_path}
      format.js
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    favorite = Favorite.find(params[:id])
    favorite.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
      format.js
    end
  end
end
