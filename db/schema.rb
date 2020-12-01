# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_01_171509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.string "shortname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "eventtypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fixtures", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.bigint "hometeam_id", null: false
    t.bigint "awayteam_id", null: false
    t.integer "scorehome"
    t.integer "scoreaway"
    t.string "date"
    t.string "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "stage"
    t.string "status"
    t.index ["awayteam_id"], name: "index_fixtures_on_awayteam_id"
    t.index ["hometeam_id"], name: "index_fixtures_on_hometeam_id"
    t.index ["season_id"], name: "index_fixtures_on_season_id"
  end

  create_table "goalevents", force: :cascade do |t|
    t.bigint "goal_id", null: false
    t.bigint "player_id", null: false
    t.integer "assist"
    t.float "startdepth"
    t.float "startwidth"
    t.float "enddepth"
    t.float "endwidth"
    t.bigint "eventtype_id", null: false
    t.boolean "penalty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "autogoal"
    t.index ["eventtype_id"], name: "index_goalevents_on_eventtype_id"
    t.index ["goal_id"], name: "index_goalevents_on_goal_id"
    t.index ["player_id"], name: "index_goalevents_on_player_id"
  end

  create_table "goals", force: :cascade do |t|
    t.bigint "fixture_id", null: false
    t.bigint "team_id", null: false
    t.string "minute"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fixture_id"], name: "index_goals_on_fixture_id"
    t.index ["team_id"], name: "index_goals_on_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "forename"
    t.bigint "team_id", null: false
    t.integer "shirtnumber"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nationality"
    t.string "position"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.bigint "competition_id", null: false
    t.string "startyear"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["competition_id"], name: "index_seasons_on_competition_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "level"
    t.bigint "club_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["club_id"], name: "index_teams_on_club_id"
  end

  add_foreign_key "fixtures", "seasons"
  add_foreign_key "goalevents", "eventtypes"
  add_foreign_key "goalevents", "goals"
  add_foreign_key "goalevents", "players"
  add_foreign_key "goals", "fixtures"
  add_foreign_key "goals", "teams"
  add_foreign_key "players", "teams"
  add_foreign_key "seasons", "competitions"
  add_foreign_key "teams", "clubs"
end
