class TopicsController < ApplicationController
  def index
    @topics = Topic.first(15)
    @all_topics = Topic.all
  end

  def show
    @search = params["search"]

    #if the user made a search and press enter then
    if @search.present?
      #we will find the topic
      @topic = Topic.find_by(name: @search["topic"])
      #if this topic exists we will load all the articles related to this topic
      #if this topic does not exist or because of a typo, we will load all the articles and reload the index page
      if !@topic.nil?
        @articles = @topic.articles
      else
        @topics = Topic.all
        render :index
      end
      #if there is no search but instead a click on the card, we load directly the topic
    else
      @topic = Topic.find(params[:id])
      @articles = @topic.articles
    end
  end
end
