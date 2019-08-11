class PoliticiansController < ApplicationController

  #GET /politicians
  #GET /politicians.jason
  def index
    @politicians =  Politician.all
  end

end
