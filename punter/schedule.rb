class Schedule
  def initialize festival
    @festival = festival
    @selections = []
  end

  def personal_schedule_for selected_performers
    personal_schedule = []
    @festival.schedule.each do |performance|
      if selected_performers.include? performance[:performer]
        if personal_schedule.count == 0
          personal_schedule << [performance]
        else
          last_performance = personal_schedule.last.last
          if (last_performance[:end] <= performance[:start])
            personal_schedule << [performance]
          else
            # Performance clashes so add it to the last viewing time
            personal_schedule.last << performance
          end
        end
      end
    end

    personal_schedule
  end

  def display_personal_schedule personal_schedule
    personal_schedule.each do |schedule_entry|
      if schedule_entry.count > 1
        puts "-- clash --"
      end

      schedule_entry.each do |performance|
        puts performance[:performer] +
            " at " + performance[:stage] + " " +
            performance[:start].strftime("%H:%M") + " to " +
            performance[:end].strftime("%H:%M") + ""
      end

      if schedule_entry.count > 1
        puts "----------"
      end
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
              self.show_selected_performers
            else
              puts "Sorry that performer isn't on the bill (hit tab twice to see the performers)"
            end

          when "remove" || "rm"
            @selections.delete performer
            self.show_selected_performers

          when "list" || "ls"
            self.show_selected_performers

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
      "add <performer> - add a performer\n" +
      "remove <performer> - remove a performer\n" +
      "list - show the list of your selected performers\n" +
      "done - your done selecting your performers\n" +
      "help or h - this list"

    puts help
  end

  def show_selected_performers
    print "Your selection: "
    p @selections
  end

end