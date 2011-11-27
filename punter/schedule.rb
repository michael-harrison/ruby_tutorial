class Schedule
  def initialize festival
    @festival = festival
    @selections = []
  end

  def personal_schedule_for selected_performers
    @festival.schedule.select { |performance| performance if selected_performers.include? performance[:performer]}
  end

  def show_personal_schedule personal_schedule
    last_performance = nil
    personal_schedule.each do |performance|

      puts performance[:start].strftime("%H:%M") + " to " +
        performance[:end].strftime("%H:%M") + " " +
        performance[:performer] + " at " + performance[:stage] +
        performances_clash?(last_performance, performance)


      last_performance = performance
    end
  end

  def performances_clash? previous, current
     previous.nil? ? "" : (previous[:end] > current[:start] ? " (clashes with last performance)" : "" )
  end

  def show_performance_times
    @festival.schedule.each do |performance|
      puts performance[:start].strftime("%H:%M") + " to " +
        performance[:end].strftime("%H:%M") + " " +
        performance[:performer] + " at " + performance[:stage]
    end
  end

  def choose_performers
    comp = proc { |s| @festival.performers.grep( /^#{Regexp.escape(s)}/ ) }

    Readline.completion_append_character = ""
    Readline.completion_proc = comp

    while line = Readline.readline('> ', true)
      if (line != "")

        if (line.index(" ") == nil)
          command = line
        else
          command = line.slice 0, line.index(" ")
          performer = line.slice(line.index(" ")+1,line.length);
        end

        case command
          when "add" || "a"
            if @festival.performers.include? performer
              if !@selections.include? performer
                 @selections << performer
              end
              show_selected_performers
            else
              puts "Sorry that performer isn't on the bill (hit tab twice to see the performers)"
            end

          when "remove" || "rm"
            @selections.delete performer
            show_selected_performers

          when "list" || "ls"
            show_selected_performers

          when "times"
            puts "Performance Times"
            show_performance_times


          when "schedule"
            puts "Your Schedule"
            schedule = personal_schedule_for @selections
            show_personal_schedule schedule

          when "done"
            break

          when "help" || "h"
            display_help

          else
            puts "say what holmes? Try help"

        end
      end
    end

    @selections
  end

  def display_help
    help =
      "Auto complete features:\n" +
      " - Hit the tab key twice on a blank line shows a list of performers\n" +
      " - Type a partial performer name then hit tab to auto complete\n" +
      "add <performer> - add a performer to the list of performers to see\n" +
      "remove <performer> - remove a performer from the list of performers to see\n" +
      "list - show the list of performers to see\n" +
      "schedule - show your schedule\n" +
      "times - show the times for all performances\n" +
      "done - your done selecting your performers\n" +
      "help or h - this list"

    puts help
  end

  def show_selected_performers
    print "Your performers to see: "
    p @selections
  end

end