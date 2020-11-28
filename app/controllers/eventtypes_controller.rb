class EventtypesController < ApplicationController
  def index
  	@eventtypes=Eventtype.all
  end
end
