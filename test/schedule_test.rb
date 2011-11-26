require "test_helper"

class ScheduleTest < MiniTest::Unit::TestCase
  def setup
    @festival = Festival.new "test/fixtures/home_bake_2009.csv"
  end

  def test_missing_performer
    my_favourite_performers = ["Boy and Bear", "The missing link", "Midnight Juggernauts"]

    festival_schedule = Schedule.new @festival
    my_schedule = festival_schedule.personal_schedule_for my_favourite_performers

    # Check there are two performers (ie the missing performer isn't included)
    assert_equal 2, my_schedule.count, "The number of performances is incorrect"

    # Check the schedule is as expected
    # NB: The following tests also assure that "The missing link" is not included in my schedule
    assert_equal "Boy and Bear", my_schedule[0][0][:performer], "The first performer is incorrect"
    assert_equal "Midnight Juggernauts", my_schedule[1][0][:performer], "The second performer is incorrect"
  end

  def test_clashing_performances
    my_favourite_performers = ["Powderfinger", "Midnight Juggernauts", "Boy and Bear"]

    festival_schedule = Schedule.new @festival
    my_schedule = festival_schedule.personal_schedule_for my_favourite_performers

    #assert_equal 1, my_schedule[0].count, "Incorrect number of acts for time frame"
    #assert_equal 2, my_schedule[1].count, "Incorrect number of acts for time frame"

    assert_equal "Boy and Bear", my_schedule[0][0][:performer], "Unexpected performer"
    assert_equal "Midnight Juggernauts", my_schedule[1][0][:performer], "Unexpected performer"
    assert_equal "Powderfinger", my_schedule[1][1][:performer], "Unexpected performer"
  end
end