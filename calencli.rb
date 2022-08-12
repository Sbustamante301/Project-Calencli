# Data
id = 0
events = [
  { id:(id = id.next),
    start_date:"2021-11-15T00:00:00-05:00",
    title: "Ruby Basics 1",
    end_date: "",
    notes:"Ruby Basics 1 notes",
    guests: %w[Teddy Codeka],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2021-11-15T12:00:00-05:00",
    title: "English Course",
    end_date: "2021-11-15T13:30:00-05:00",
    notes:"English notes",
    guests:["Stephanie"],
    calendar: "english" },
  { id:(id = id.next),
    start_date: "2021-11-16T00:00:00-05:00",
    title: "Ruby Basics 2",
    end_date: "",
    notes: "Ruby Basics 2 notes",
    guests: %w[Andre Codeka],
    calendar: "web-dev" },
  { id:(id = id.next),
    start_date: "2021-11-16T12:45:00-05:00",
    title: "Soft Skills - Mindsets",
    end_date: "2021-11-15T13:30:00-05:00",
    notes:"Some extra notes",
    guests: ["Diego"],
    calendar: "soft-skills" },
  { id:(id = id.next),
    start_date: "2021-11-17T00:00:00-05:00",
    title:"Ruby Methods",
    end_date:"",
    notes: "Ruby Methods notes",
    guests: %w[Diego Andre Teddy Codeka],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2021-11-17T12:00:00-05:00",
    title: "English Course",
    end_date: "2021-11-15T13:30:00-05:00",
    notes: "English notes",
    guests:["Stephanie"],
    calendar:"english" },
  { id:(id = id.next),
    start_date:"2021-11-18T09:00:00-05:00",
    title: "Summary Workshop",
    end_date: "2021-11-19T13:30:00-05:00",
    notes: "A lot of notes",
    guests:%w[Diego Teddy Andre Codeka],
    calendar:"web-dev" },
  { id: (id = id.next),
    start_date: "2021-11-18T09:00:00-05:00",
    title:"Extended Project",
    end_date: "",
    notes:"",
    guests: [],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date:"2021-11-19T09:00:00-05:00",
    title: "Extended Project",
    end_date:"",
    notes: "",
    guests: [],
    calendar:"web-dev" },
  { id: (id = id.next),
    start_date: "2021-11-19T12:00:00-05:00",
    title:"English for Engineers",
    end_date: "2021-11-19T13:30:00-05:00",
    notes: "English notes",
    guests:["Stephanie"],
    calendar: "english" },
  { id: (id = id.next),
    start_date: "2021-11-20T10:00:00-05:00",
    title: "Breakfast with my family",
    end_date: "2021-11-20T11:00:00-05:00",
    notes: "",
    guests: [],
    calendar: "default" },
  { id: (id = id.next),
    start_date: "2021-11-20T15:00:00-05:00",
    title: "Study",
    end_date: "2021-11-20T20:00:00-05:00",
    notes: "",
    guests: [],
    calendar: "default" },
  { id: (id = id.next),
    start_date: "2021-11-25T09:00:00-05:00",
    title: "Extended Project",
    end_date:"",
    notes: "",
    guests: [],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date:"2021-11-26T09:00:00-05:00",
    title: "Extended Project",
    end_date: "",
    notes: "",
    guests: [],
    calendar:"web-dev" }, 
]

# Methods

def list_calendar(events)
  puts "#{'-' * 29}Welcome to CalenCLI#{'-' * 30}\n\n"
  events.each do |event|
    puts " #{event[:start_date]}                #{event[:title]} (#{event[:id]})\n\n"
  end
end

def delete_events(ids,events)
   events.delete_if{ |event| ids == event[:id]}
    
end

list_calendar(events)

def print_menu
  puts "-" * 60
  puts "list | create | show | update | delete | next | prev | exit"
  puts "\n"
  print "action: "
  gets.chomp.strip
end


def show_list(id, events)
  event_details = events.select { |event| event[:id] == id }[0]
  puts "start_date : #{event_details[:start_date]}"
  puts "     title : #{event_details[:title]}"
end

# Main Program
list_calendar
events.each do |event|
    puts " #{event[:start_date]}         #{event[:title]} (#{event[:id]})"
end

action = nil
while action != "exit"
  action = print_menu

  case action
  when "list"
    puts ""
  when "create"
    puts ""
  when "show"
    print "Event Id: "
    show_id = gets.chomp.to_i
    show_list(show_id, events)
  when "update"
    puts ""
  when "delete"
   print "Id: "
    show_id = gets.chomp.to_i
    delete_events(show_id,events)
    p events 
    list_calendar
  when "next"
    puts ""
  when "prev"
    puts ""
  when "exit"
    puts "Thanks for using calenCLI!"
  else
    puts "Invalid action"
  end
end

 start_date = events[0][:start_date] 
 fecha = DateTime.parse(start_date)
 hoy = DateTime.now
 p fecha
 p hoy.strftime('%a %b %d')

