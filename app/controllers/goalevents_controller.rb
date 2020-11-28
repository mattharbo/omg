class GoaleventsController < ApplicationController
  def index
  	@goalevents=Goalevent.all
  end
end
