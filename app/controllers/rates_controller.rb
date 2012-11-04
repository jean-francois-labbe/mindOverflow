class RatesController < ApplicationController
  def plus
    @article = Article.find(params[:article_id])
    @article.rated_by(current_user, 1)

    respond_to do |format|
      format.html { redirect_to article_path(@article)}
    end
  end

  def minus
    @article = Article.find(params[:article_id])
    @article.rated_by(current_user, -1)

    respond_to do |format|
      format.html { redirect_to article_path(@article)}
    end
  end
end
