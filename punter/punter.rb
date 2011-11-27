require "./festival.rb"
require "./schedule.rb"

home_bake = Festival.new "../test/fixtures/home_bake_2009.csv"
home_bake_schedule = Schedule.new home_bake

home_bake_schedule.display_help
performers = home_bake_schedule.choose_performers
my_schedule = home_bake_schedule.personal_schedule_for performers
puts "Your final schedule:"
home_bake_schedule.show_personal_schedule my_schedule
