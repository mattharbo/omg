class PlayersController < ApplicationController
  
  def index
  	@players=Player.all
  end

  def new
  	@player=Player.new
  	@positions={
		"Forward" => "Forward",
		"Midfielder" => "Midfielder",
		"Defender" => "Defender",
		"Goalkeeper" => "Goalkeeper"
	}
	allteams=Team.all
	@teams = allteams.map do |t|
		[t.club.shortname, t.id]
	end
	@teams.unshift(nil)
  end

  def create
  	Player.create(
  		forename:params['player']['forename'],
  		name:params['player']['name'],
  		shirtnumber:params['player']['shirtnumber'],
  		nationality:params['player']['nationality'],
  		position:params['player']['position'],
  		team:Team.find(params['player']['team'])
  	)
	redirect_to fixtures_path
  end

  private

	# def player_params
	# 	params.require(:player).permit(:forename,:name,:shirtnumber,:nationality,:position,:team)
	# end

end
