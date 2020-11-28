class FixturesController < ApplicationController

	before_action :set_fixture, only: [:show,:edit,:update]

	def index
		@fixtures=Fixture.all
	end

	def show
	end

	def edit
	end

	def update
		game = @fixture.update(fixture_params)
		redirect_to new_goal_path(:fixture => params[:id])
	end

	private 

	def fixture_params
		params.require(:fixture).permit(:scorehome,:scoreaway,:status)
	end

	def set_fixture
		@fixture = Fixture.find(params[:id])
	end
end
