class GoaleventsController < ApplicationController

	before_action :set_goalevent, only: [:edit,:update]

  def index
  	@goalevents=Goalevent.all.order("id DESC")
  end

  def edit
  	allplayers=Player.where(team:@event.goal.fixture.hometeam).or(Player.where(team:@event.goal.fixture.awayteam)).order(:shirtnumber)
	@players = allplayers.map do |d|
		[d.shirtnumber.to_s+" | "+d.name+" "+d.forename+" ("+d.team.club.acronym+")", d.id]
	end
	@players.unshift(nil)

	alltypes=Eventtype.all
	@types=alltypes.map do |t|
		[t.name, t.id]
	end
	@types.unshift(nil)
  end

  def update

  	player=Player.find(params['goalevent']['player'])
  	eventtype=Eventtype.find(params['goalevent']['eventtype'])

  	Goalevent.update(
  		params['id'],
		player:player,
		startdepth:params['goalevent']['startdepth'],
		startwidth:params['goalevent']['startwidth'],
		enddepth:params['goalevent']['enddepth'],
		endwidth:params['goalevent']['endwidth'],
		goalxcoord:params['goalevent']['goalxcoord'],
		goalycoord:params['goalevent']['goalycoord'],
		eventtype:eventtype,
		# # ######### if eventtype is 1 then assist is 0
		assist:0
		# penalty:eventattribute['penalty'],
		# autogoal:og
	)

	redirect_to goal_path(Goalevent.find(params['id']).goal)

  end

  private

	def set_goalevent
		@event = Goalevent.find(params[:id])
	end
end
