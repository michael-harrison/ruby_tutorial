require 'test_helper'

class FestivalTest < MiniTest::Unit::TestCase
  def setup
    @festival = Festival.new "Home Bake", "test/fixtures/home_bake_festival.csv", "test/fixtures/home_bake_walk_times.csv"
  end

  def test_performers
    assert_equal 39, @festival.performers.count, "Number of performers is incorrect"

    # Confirm the sort worked correctly
    previous_row = nil
    @festival.schedule.each do |row|
       if !previous_row.nil?
         assert row[:start] >= previous_row[:start], "Sorting failed"
       end
       previous_row = row
    end
  end

  def test_schedule_creation

  end
end