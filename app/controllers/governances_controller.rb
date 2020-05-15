class GovernancesController < ApplicationController

  def index
    @governances = Governance.all
  end

  def show
    @governance = Governance.find(params[:id])
  end

end
