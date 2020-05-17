class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @search = params["search"]

    if @search.present?

    @topic = Topic.find_by(name: @search["topic"])
    @articles = @topic.articles
    else
      @topic = Topic.find(params[:id])
      @articles = @topic.articles
    end


  end
end
