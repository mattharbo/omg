class GoalsController < ApplicationController
	before_action :set_goal, only: [:show,:edit,:update]

	def index
		@goals=Goal.all
	end

	def new
		@savedgoals=Goal.where(fixture:params[:fixture])
		@passed_fixture = Fixture.find(params[:fixture])
		allplayers=Player.where(team:@passed_fixture.hometeam).or(Player.where(team:@passed_fixture.awayteam))
		@players = allplayers.map do |d|
			["("+d.shirtnumber.to_s+") "+d.name, d.id]
		end
		@players.unshift(nil)
		@goal=Goal.new
		#Following should be changed in the future for multiple goalevents created during the parent goal creation
		@goal.goalevents.build
	end

	def create

		# raise

		Goal.create(
			team:Team.find(params['goal']['team']),
			minute:params['goal']['minute'],
			fixture:Fixture.find(params['goal']['fixture'])
		)

		#looping into something bigger when will have multiple goalevents added at a time
		params['goal']['goalevents_attributes'].each do |event,eventattribute|
			Goalevent.create(
				goal:Goal.last,
				player:Player.find(eventattribute['player']),
				# startdepth:eventattribute['startdepth'],
				# startwidth:eventattribute['startwidth'],
				enddepth:eventattribute['enddepth'],
				endwidth:eventattribute['endwidth'],
				eventtype:Eventtype.find(1),
				# if eventtype is 1 then assist is 0
				assist:0,
				penalty:eventattribute['penalty']
			)
		end

		totgoals=Fixture.find(params['goal']['fixture']).scorehome+Fixture.find(params['goal']['fixture']).scoreaway
		registeredgoals=Goal.where(fixture:params['goal']['fixture']).count

		if registeredgoals < totgoals
			redirect_to new_goal_path(:fixture => params['goal']['fixture'])
		else
			redirect_to fixtures_path
		end
	end

	private 

	#useless…
	# def goal_params
	# 	params.require(:goal).permit(:team,:minute,:fixture)
	# end

	def set_goal
		@goal = Goal.find(params[:id])
	end
end
