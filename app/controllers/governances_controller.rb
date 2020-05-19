class GovernancesController < ApplicationController

  def index
    @governances = Governance.all
  end

  def show
    @governance = Governance.find(params[:id])
    @articles = @governance.articles.all
    @articles = @articles.sort_by { |article| [article.number] }

    @chapters = []
    @articles.each do |article|
      @chapters << article.chapter
    end

    @chapters = @chapters.uniq

  end
end
