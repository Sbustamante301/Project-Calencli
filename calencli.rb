# Data
id = 0
events = [
  { id: (id = id.next),
    start_date: "2022-11-15T00:00:00-05:00",
    title:"Ruby Basics 1",
    end_date: "",
    notes: "Ruby Basics 1 notes",
    guests: %w[Teddy Codeka],
    calendar: "web-dev" },
    { id: (id = id.next),
    start_date:'Tue Nov 16',
    title:"Ruby Basics 1",
    end_date: "",
    notes: "Ruby Basics 1 notes",
    guests: %w[Teddy Codeka],
    calendar: "web-dev" },
    { id: (id = id.next),
    start_date:'Wed Nov 17',
    title:"Ruby Basics 1",
    end_date: "",
    notes: "Ruby Basics 1 notes",
    guests: %w[Teddy Codeka],
    calendar: "web-dev" },
]

# Methods

def list_calendar
  puts "#{'-' * 24} Welcome to CalenCLI #{'-' * 24}\n\n"
  
end

list_calendar
events.each do |event|
    puts " #{event[:start_date]}         #{event[:title]} (#{event[:id]})"
end

def ask_for_action_prompt
  puts "-" * 60
  puts "list | create | show | update | delete | next | prev | exit"
  puts "\n"

  print "action: "
  gets.chomp.strip
end
# Main Program

action = nil
while action != "exit"
  action = ask_for_action_prompt
  
  case action
  when "list"
    puts ""
  when ""
    puts ""
  when "completed"
    puts ""
  when "toggle"
    puts ""
  when "delete"
    puts ""
  when "exit"
    puts "Thanks for using calenCLI!"
  else
    puts "Invalid action"
  end
end

# require 'date'

# start_date = events[0][:start_date] 
# fecha = DateTime.parse(start_date)
# hoy = DateTime.now
# p fecha
# p hoy.strftime('%a %b %d')


