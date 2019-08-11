class PagesController < ApplicationController
  def index
    @deputies = ExternalRequestsService.list_deputies
    # @senators = ExternalRequestsService.list_senators
    
    @politician1 = @deputies.sample
    @politician2 = @deputies.sample
  end
end
