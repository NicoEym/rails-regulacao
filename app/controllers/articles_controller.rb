class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @topics = []
    @articles.each do |article|
      topics_list = article.topics
        topics_list.each do |topic|
          @topics << topic.name
        end
    end

    @topics = @topics.uniq
  end

  def show
    @article = Article.find(params[:id])
  end
end
