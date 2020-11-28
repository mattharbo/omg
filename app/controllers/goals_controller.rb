class GoalsController < ApplicationController
	before_action :set_goal, only: [:show,:edit,:update]

	def index
		@goals=Goal.all
	end

	def new
		@savedgoals=Goal.where(fixture:params[:fixture])
		@passed_fixture = Fixture.find(params[:fixture])
		@goal=Goal.new
	end

	def create

		Goal.create(
			team:Team.find(params['goal']['team']),
			minute:params['goal']['minute'],
			fixture:Fixture.find(params['goal']['fixture'])
		)

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
