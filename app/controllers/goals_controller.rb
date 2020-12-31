class GoalsController < ApplicationController
	before_action :set_goal, only: [:show,:edit,:update]

	def index
		@goals=Goal.all.order("id DESC")
	end

	def show
		@goal=Goal.find(params[:id])
		@goalevents=Goalevent.where(goal:@goal.id)	

		@goalevents.each do |goalevent|
			# assist=0 is a goal
			if goalevent.assist = 0
				@scorer=Player.find(goalevent.player.id)			
			end

			if goalevent.penalty?
				@specialgoal="Penalty"
			elsif goalevent.autogoal?
				@specialgoal="Autogoal"
			end
		end

		# Define which goal of the game
		reffixture=Fixture.find(@goal.fixture.id)
		@whichgoal=definegoal(reffixture,@goal)

		# Update the date display
		@goal_date=display_date(@goal.fixture.date)
	end

	def new
		@savedgoals=Goal.where(fixture:params[:fixture])
		@passed_fixture = Fixture.find(params[:fixture])
		allplayers=Player.where(team:@passed_fixture.hometeam).or(Player.where(team:@passed_fixture.awayteam)).order(:shirtnumber)
		@players = allplayers.map do |d|
			[d.shirtnumber.to_s+" | "+d.name+" "+d.forename+" ("+d.team.club.acronym+")", d.id]
		end
		@players.unshift(nil)
		@goal=Goal.new
		#Following should be changed in the future for multiple goalevents created during the parent goal creation
		@goal.goalevents.build
	end

	def create
		Goal.create(
			team:Team.find(params['goal']['team']),
			minute:params['goal']['minute'],
			fixture:Fixture.find(params['goal']['fixture'])
		)

		#looping into something bigger when will have multiple goalevents added at a time
		params['goal']['goalevents_attributes'].each do |event,eventattribute|

			player=Player.find(eventattribute['player'])

			player.team!=Team.find(params['goal']['team']) ? og=true : og=false

			Goalevent.create(
				goal:Goal.last,
				player:player,
				startdepth:eventattribute['startdepth'],
				startwidth:eventattribute['startwidth'],
				enddepth:eventattribute['enddepth'],
				endwidth:eventattribute['endwidth'],
				goalxcoord:eventattribute['goalxcoord'],
				goalycoord:eventattribute['goalycoord'],
				eventtype:Eventtype.find(1),
				# if eventtype is 1 then assist is 0
				assist:0,
				penalty:eventattribute['penalty'],
				autogoal:og
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

	#useless can't make it work…
	# def goal_params
	# 	params.require(:goal).permit(:team,:minute,:fixture)
	# end

	def set_goal
		@goal = Goal.find(params[:id])
	end

	def display_date(date)
		# 2020-11-20 >> Oct. 23 2020
		month=Date::ABBR_MONTHNAMES[date[/\-(.*?)-/,1].to_i]
		year=date.strip[0,4]
		day=date[date.rindex(/-/)+1,date.length]
		newdate=month+". "+day+" "+year
		return newdate
	end

	def definegoal(fixture,targetgoal)
		allfixturegoals=Goal.where(fixture:fixture.id)
		homecounter=0
		awaycounter=0
		scoreattime=""

		allfixturegoals.each do |fixturegoal|
			# Si la team du goal est celle de home alors increm home counter
			if fixturegoal.team==fixture.hometeam
				homecounter+=1
			else
			# Sinon increm away counter
				awaycounter+=1
			end
			
			scoreattime="#{homecounter}-#{awaycounter}"
			break if fixturegoal==targetgoal
		end

		return scoreattime
	end
end
