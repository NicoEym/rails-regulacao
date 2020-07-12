class ArticlesController < ApplicationController
  def index
    # @search = params["search"]
    #we declare the results of the click on the navbar

    @topic_params = params[:topic]
    #if the request come from the home page we go through the first condition that will deal with the form
    # if @search.present?

    #   @articles = Article.all
    #   @topics = []
    #   @articles.each do |article|
    #     topics_list = article.topics
    #       topics_list.each do |topic|
    #         @topics << topic.name
    #       end
    #   end
    #   @topics = @topics.uniq

    if !@topic_params.present?
      @articles = Article.all
    else
      @topic = Topic.where(id: params[:topic])
      @articles = @topic.articles
      @articles.each do |article|
      topics_list = article.topics
        topics_list.each do |topic|
          @topics << topic.name
        end
    end
      @topics = @topics.uniq
    end
  end

  def show
    @article = Article.find(params[:id])
  end
end
