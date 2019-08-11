class PoliticiansController < ApplicationController

  #GET /politicians
  #GET /politicians.jason
  def index
    @poloticians =  Politician.all
  end

end
