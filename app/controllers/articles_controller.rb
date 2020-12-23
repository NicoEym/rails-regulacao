class ArticlesController < ApplicationController
  def index

    @topic_params = params[:topic]
    #if the request come from the home page we go through the first condition that will deal with the form


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
    # we get the related topics for this article
    @topics = @article.topics
    # we create two arrays to put the related articles fromCVM and from ANBIMA
    @related_articles_CVM555 = []
    @related_articles_CVM558 = []
    @related_articles_ANBIMA = []

    # for each related topic, we check if the articles are from CVM or from Anbima and put then in the array
    @topics.each do |topic|
      this_topic_articles = topic.articles
      this_topic_articles.each do |article|
        if article.is_CVM555?
          @related_articles_CVM555 << article
        elsif article.is_CVM558?
          @related_articles_CVM558 << article
        elsif article.is_ANBIMA?
          @related_articles_ANBIMA << article
        end
      end
    end
    # we send only the first 5 articles
    @related_articles_CVM555 = @related_articles_CVM555.uniq.first(5)
    @related_articles_CVM558 = @related_articles_CVM558.uniq.first(5)
    @related_articles_ANBIMA = @related_articles_ANBIMA.uniq.first(5)
  end
end
