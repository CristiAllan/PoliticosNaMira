class RankingsController < ApplicationController
  def index
    @politicians = Politician.all
  end
end
