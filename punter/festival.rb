require 'readline'
require 'csv'

class Festival
  def initialize schedule_csv
    load_schedule schedule_csv
  end

  def load_schedule schedule_csv
    @schedule = CSV.read(schedule_csv, headers: true, header_converters: :symbol)

    # Create a list of performers based on the schedule
    @performers = []
    for performance in @schedule
      # Put the performer in the perform list if they're not already there
      if !@performers.include?(performance[:performer])
        @performers[performers.length] = performance[:performer]
      end

      # Convert the performance start and end time from string to date/time
      performance[:start] = DateTime.strptime performance[:start], "%Y-%m-%d %H:%M"
      performance[:end] = DateTime.strptime performance[:end], "%Y-%m-%d %H:%M"
    end

    @schedule = @schedule.sort_by { |row| row[:start]}
    @performers.sort!
    @selections = []
  end

  def performers
    @performers
  end

  def schedule
    @schedule
  end

end