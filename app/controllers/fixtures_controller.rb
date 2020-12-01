class FixturesController < ApplicationController

	before_action :set_fixture, only: [:show,:edit,:update]

	def index
		@fixtures=Fixture.all.order(stage: :desc)
	end

	def show
		goals=Goal.where(fixture:params[:id])

		@goals=[]

		goals.each do |goal|

			goalscored = Goalevent.where(goal:goal.id)

			unless goalscored.empty?
			  if Goalevent.where(goal:goal.id).take.eventtype.name="goal"
					@goals << Goalevent.where(goal:goal.id).take	
				end
			end
	
		end
	end

	def edit
	end

	def update
		game = @fixture.update(fixture_params)

		if (params['fixture']['scorehome'].to_i+params['fixture']['scoreaway'].to_i)==0
			redirect_to fixtures_path
		else
			redirect_to new_goal_path(:fixture => params[:id])
		end
		
	end

	private 

	def fixture_params
		params.require(:fixture).permit(:scorehome,:scoreaway,:status)
	end

	def set_fixture
		@fixture = Fixture.find(params[:id])
	end
end
