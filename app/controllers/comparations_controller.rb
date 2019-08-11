class ComparationsController < ApplicationController
  def index
    @politicians = Politician.all
  end
end
