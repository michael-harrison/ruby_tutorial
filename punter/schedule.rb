require "net/smtp"

class Schedule
  def initialize festival
    @festival = festival
    @selections = []
  end

  def personal_schedule_for selected_performers
    @festival.schedule.select { |performance| performance if selected_performers.include? performance[:performer]}
  end

  def personal_schedule_to_s personal_schedule
    personal_schedule_str = ""
    last_performance = nil
    personal_schedule.each do |performance|

      personal_schedule_str += performance[:start].strftime("%H:%M") + " to " +
        performance[:end].strftime("%H:%M") + " " +
        performance[:performer] + " at " + performance[:stage] +
        walk_time_between(last_performance, performance) +
        performances_clash?(last_performance, performance) + "\n"

      last_performance = performance
    end

    personal_schedule_str
  end

  def performances_clash? previous, current
    previous.nil? ? "" : (previous[:end] > current[:start] ? " (clashes with previous performance)" : "" )
  end

  def walk_time_between previous, current
    previous.nil? ? "" : " with " + @festival.walk_time_between(previous[:stage], current[:stage]).to_s + " min walk "
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
          args = line.slice(line.index(" ")+1,line.length);
        end

        case command
          when "add" || "a"
            if @festival.performers.include? args
              if !@selections.include? args
                 @selections << args
              end
              show_selected_performers
            else
              puts "Sorry that performer isn't on the bill (hit tab twice to see the performers)"
            end

          when "remove" || "rm"
            @selections.delete args
            show_selected_performers

          when "list" || "ls"
            show_selected_performers

          when "times"
            puts "Performance Times"
            show_performance_times

          when "schedule"
            puts "Your Schedule"
            schedule = personal_schedule_for @selections
            puts personal_schedule_to_s schedule

          when "email"
            email_schedule args
            puts "Sent schedule in an email to " + args

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


  def email_schedule email_address
    email = "From: Punter <michael@focalpause.com>\n" +
        "To: <#{email_address}>\n" +
        "Subject: Your schedule for #{@festival.name}\n" +
        "\n" +
        "Your scheduled for #{@festival.name}:\n" +
        personal_schedule_to_s(personal_schedule_for @selections)

    Net::SMTP.start("mail.bigpond.com") { |smtp| smtp.send_message email, "michael@focalpause.com", email_address  }
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
      "email <email_address> - email the current schedule to <email_address>\n" +
      "done - your done selecting your performers\n" +
      "help or h - this list"

    puts help
  end

  def show_selected_performers
    print "Your performers to see: "
    p @selections
  end

end