require "./festival.rb"
require "./schedule.rb"

home_bake = Festival.new "Home Bake", "../test/fixtures/home_bake_festival.csv", "../test/fixtures/home_bake_walk_times.csv"
home_bake_schedule = Schedule.new home_bake

home_bake_schedule.display_help
performers = home_bake_schedule.choose_performers
my_schedule = home_bake_schedule.personal_schedule_for performers
