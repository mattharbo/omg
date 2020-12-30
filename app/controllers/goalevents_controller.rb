class GoaleventsController < ApplicationController

	before_action :set_goalevent, only: [:edit,:update]

  def index
  	@goalevents=Goalevent.all
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
  	






  	
  end

  private

	def set_goalevent
		@event = Goalevent.find(params[:id])
	end
end
