# Data
require "date"

id = 0
date = Date.today

events = [
  { id: (id = id.next),
    start_date: "2022-08-01T00:00:00-05:00",
    title: "Ruby Basics 1",
    end_date: "",
    notes: "Ruby Basics 1 notes",
    guests: %w[Teddy Codeka],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2022-08-05T12:00:00-05:00",
    title: "English Course",
    end_date: "2022-08-10T13:30:00-05:00",
    notes: "English notes",
    guests: ["Stephanie"],
    calendar: "english" },
  { id: (id = id.next),
    start_date: "2022-08-11T00:00:00-05:00",
    title: "Ruby Basics 2",
    end_date: "",
    notes: "Ruby Basics 2 notes",
    guests: %w[Andre Codeka],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2022-08-11T12:45:00-05:00",
    title: "Soft Skills - Mindsets",
    end_date: "2022-08-08T13:30:00-05:00",
    notes: "Some extra notes",
    guests: ["Diego"],
    calendar: "soft-skills" },
  { id: (id = id.next),
    start_date: "2022-08-11T00:00:00-05:00",
    title: "Ruby Methods",
    end_date: "",
    notes: "Ruby Methods notes",
    guests: %w[Diego Andre Teddy Codeka],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2022-08-12T12:00:00-05:00",
    title: "English Course",
    end_date: "2022-08-12T13:30:00-05:00",
    notes: "English notes",
    guests: ["Stephanie"],
    calendar: "english" },
  { id: (id = id.next),
    start_date: "2022-08-12T09:00:00-05:00",
    title: "Summary Workshop",
    end_date: "2022-08-12T13:30:00-05:00",
    notes: "A lot of notes",
    guests: %w[Diego Teddy Andre Codeka],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2022-08-13T09:00:00-05:00",
    title: "Extended Project",
    end_date: "",
    notes: "",
    guests: [],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2022-08-14T09:00:00-05:00",
    title: "Extended Project",
    end_date: "",
    notes: "",
    guests: [],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2022-08-15T12:00:00-05:00",
    title: "English for Engineers",
    end_date: "2022-08-15T13:30:00-05:00",
    notes: "English notes",
    guests: ["Stephanie"],
    calendar: "english" },
  { id: (id = id.next),
    start_date: "2022-08-16T10:00:00-05:00",
    title: "Breakfast with my family",
    end_date: "2022-08-16T11:00:00-05:00",
    notes: "",
    guests: [],
    calendar: "default" },
  { id: (id = id.next),
    start_date: "2022-08-26T09:00:00-05:00",
    title: "Extended Project",
    end_date: "",
    notes: "",
    guests: [],
    calendar: "web-dev" },
  { id: (id = id.next),
    start_date: "2022-08-27T09:00:00-05:00",
    title: "Extended Project",
    end_date: "",
    notes: "",
    guests: [],
    calendar: "web-dev" }
]

# Methods

def list_calendar(events)
  puts "#{'-' * 29}Welcome to CalenCLI#{'-' * 30}\n\n"
 
end

def delete_events(ids, events)
  events.delete_if { |event| ids == event[:id] }[0]
end

def print_menu
  puts "-" * 78
  puts "list | create | show | update | delete | next | prev | exit\n\n"
  print "action: "
  gets.chomp.strip
end

def show_list(id, events)
  event_details = events.select { |event| event[:id] == id }[0]
  puts "start_date : #{DateTime.parse(event_details[:start_date]).strftime("%Y-%m-%d")}"
  puts "     title : #{event_details[:title]}"
  puts "  end_date : #{event_details[:end_date]}"
  puts "     notes : #{event_details[:notes]}"
  puts "    guests : #{event_details[:guests]}"
  puts "  calendar : #{event_details[:calendar]}"
end

def create_event(events, new_event)
  events.push(new_event)
end

def update_event(id,events)
  print "date: "
  date = gets.chomp
  print "title: "
  title = gets.chomp
  print "calendar: "
  calendar = gets.chomp
  print "start_end: "
  start_end = gets.chomp
  start_end = start_end.split
  print "Notes: "
  notes = gets.chomp
  print "guests: "
  guests = gets.chomp

  index = events.find_index { |event| event[:id] == id }
  
  events[index][:start_date] = "#{date}T#{start_end[0]}:00-05:00"
  events[index][:title] = title
  events[index][:end_date] = "#{date}T#{start_end[1]}:00-05:00"
  events[index][:notes] = notes
  events[index][:guests] = guests
  events[index][:calendar] = calendar
end
today = DateTime.now

def list(today, events)
   
  days = (today..today+7).to_a 
  
  
  days.map! { |day| day.strftime("%a %b %d")}
  

  week ={} 
  days.each do |day| 
  week.store(day,[])
   
  end
  days.each do |day| 
    events.each do |event| 
      date= DateTime.parse(event[:start_date]).strftime("%a %b %d") 
      if date == day 
        week[day].push(event)
      end
    end
   

    
    if week[day].empty?
    week[day].push("No Event")
    end
  end

  days.each do |day| #"Sat Aug 13"
    
    week[day].each do |event| #week["Sat Aug 13"]
      
      unless event == "No Event"
      date=DateTime.parse(event[:start_date]).strftime("%a %b %d")
      start_hr=DateTime.parse(event[:start_date]).strftime("%H:%M")
      if event[:end_date].empty?
        end_hr = "00:00"
      else
        end_hr=DateTime.parse(event[:end_date]).strftime("%H:%M")
      end
      format_hr=start_hr + "-" + end_hr
      title= event[:title]
      id= event[:id]
    
    
      puts "#{date} \t #{format_hr} \t #{title} (#{id})"
    else 
      puts "#{day} \t \t \t No event"
    end 
    end
  end


   
end


# Main Program

list_calendar(events)
list(today ,events)
action = nil
while action != "exit"
  action = print_menu

  case action

  when "list"
   
   list(today, events)

  when "create"
    print "date: "
    date = gets.chomp
    print "title: "
    title = gets.chomp
    print "calendar: "
    calendar = gets.chomp
    print "start_end: "
    start_end = gets.chomp
    start_end = start_end.split

    print "Notes: "
    notes = gets.chomp
    print "guests: "
    guests = gets.chomp

    new_event = {
      id: (id = id.next),
      start_date: "#{date}T#{start_end[0]}:00-05:00",
      title: title,
      end_date: "#{date}T#{start_end[1]}:00-05:00",
      notes: notes,
      guests: guests,
      calendar: calendar
    }
    puts new_event[:start_date]
    create_event(events, new_event)
  when "show"
    print "Event Id: "
    show_id = gets.chomp.to_i
    show_list(show_id, events)
  when "update"
    print "Event Id: "
    update_id = gets.chomp.to_i
    update_event(update_id, events)
    
  when "delete"
    print "Id: "
    show_id = gets.chomp.to_i
    delete_events(show_id, events)
  when "next"
    today += 7
    
    list(today, events)
  when "prev"
    today -= 7
    list(today,events)
  when "exit"
    puts "Thanks for using calenCLI!"
  else
    puts "Invalid action"
  end
end

