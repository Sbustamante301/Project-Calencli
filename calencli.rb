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
    title:"Ruby Basics 2",
    end_date: "",
    notes: "Ruby Basics 1 notes",
    guests: %w[Teddy Codeka],
    calendar: "web-dev" },
    { id: (id = id.next),
    start_date:'Wed Nov 17',
    title:"Ruby Basics 3",
    end_date: "",
    notes: "Ruby Basics 1 notes",
    guests: %w[Teddy Codeka],
    calendar: "web-dev" },
]

# Methods

def delete_events(ids,events)
   events.delete_if{ |event| ids == event[:id]}
    
end


    

def list_calendar
  puts "#{'-' * 24} Welcome to CalenCLI #{'-' * 24}\n\n"
  
end


def show_list(id,events)
  event_details = events.select{ |event| event[:id] == id}[0] 
  p "======="
  p event_details
  p "======="
  puts "start_date : #{event_details[:start_date]}" 
    puts "     title : #{event_details[:title]}"
end 
=begin  
  [{id: 1}, {id: 2}].select { |event| event[:id] == 1 } #=> #Event 1
  events.each_with_index do |(key, value), index| 
    
    end
  end
[{id:1, name: "dd"}]
select_event = [{id:1, name: "dd"}]
select_event[0][:id]
select_event[0][:name]
=end


def ask_for_action_prompt
  puts "-" * 60
  puts "list | create | show | update | delete | next | prev | exit"
  puts "\n"

  print "action: "
  gets.chomp.strip
end

# Main Program
list_calendar
events.each do |event|
    puts " #{event[:start_date]}         #{event[:title]} (#{event[:id]})"
end

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
  when "show"
    print "Id: "
    show_id = gets.chomp.to_i
    show_list(show_id,events)
  when "delete"
    print "Id: "
    show_id = gets.chomp.to_i
    delete_events(show_id,events)
    p events 
    list_calendar

  when "exit"
    puts "Thanks for using calenCLI!"
 
  else
    puts "Invalid action"
  end
end


 require 'date'

 start_date = events[0][:start_date] 
 fecha = DateTime.parse(start_date)
 hoy = DateTime.now
 p fecha
 p hoy.strftime('%a %b %d')

