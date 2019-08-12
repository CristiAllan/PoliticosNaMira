class HomeController < ApplicationController
  def index
    @political01 =  Politician.offset(rand(Politician.count)).first
    @political02 =  Politician.offset(rand(Politician.count)).first
  end

  def ranking
    @rankings = Vote.all
  end

  def vote

  end
end
