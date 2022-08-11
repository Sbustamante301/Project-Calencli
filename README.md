# Project: CalenCLI

Welcome to your first extended project of the Ruby Module. We hope it has been a
challenging but rewarding week for all of you. It is time to put all that effort
into practice and start working on a new project with a team.

Today's project is **CalenCLI,** the best calendar on a command-line interface
💻

With this app you will practice a lot of:

- Handling data structures to store, modify and delete information.
- Code organization through
  [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) principle using
  methods
- The ins and out of most of the built-in data types
- Control flow and iteration
- Even you will explore the usage of an external gem 😁 (an easy one)

The one "new" thing you will need to get used to on this project is how Ruby
handles **Dates,** a data type that is part of the Ruby standard library.

[Date documentation](https://ruby-doc.org/stdlib-2.7.2/libdoc/date/rdoc/Date.html)

[DateTime documentation](https://ruby-doc.org/stdlib-2.7.2/libdoc/date/rdoc/DateTime.html)

## Teams

Your team will be share via Slack!

<aside> 💡 Remember! 1 member of the team creates the team and the rest can
join. The name of the team is up to you but **it should start** with **w1ex-**
</aside>

## Happy paths

The happy path is the most obvious path your user is expected to take through an
interface.

The happy-path approach is tightly scripted. This path does not duplicate
real-world conditions where the user can do the unimaginable with your program.

![https://pics.me.me/developer-users-expectation-vs-reality-v3-final-38818863.png](https://pics.me.me/developer-users-expectation-vs-reality-v3-final-38818863.png)

The happy path verifies only that the required functionality is in place and
functions correctly.

### Start the program (happy)

Run `calencli.rb` and the program should show the welcome message, the weekly
agenda, the options footer, and prompt the user to input an action.

```bash
$ ruby calencli.rb
-----------------------------Welcome to CalenCLI------------------------------

Mon Nov 15                Ruby Basics 1 (1)
            12:00 - 13:30 English Course (2)

Tue Nov 16                Ruby Basics 2 (3)
            12:45 - 13:00 Soft Skill Session - Resilience (4)

Wed Nov 17                Ruby Methods (5)
            12:00 - 13:30 English Course (6)

Thu Nov 18                Extended Project (7)
            09:00 - 13:30 Summary Workshop (8)

Fri Nov 19                Extended Project (9)
            12:00 - 13:30 English for Engineers (10)

Sat Nov 20  10:00 - 11:00 Breakfast with my family (11)
            15:00 - 20:00 Hackaton (12)

Sun Nov 21                No events

------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: 
```

### Create an event (happy)

If the user input `create` the program should ask for each piece of information
about the new event (one at a time). It should ask for:

- **date:** this field is required the correct format for the program to work is
  YYYY-MM-DD **but you can assume that the user will behave.** The program just
  validates that the user input something.
- **title:** this field is also required. No restriction about the content.
- **calendar:** This field is optional. Is a label to categorize your events and
  display them in different colors. In this example we are using the following
  calendars: "tech" (light red), "english" (light magenta), and "soft skills"
  (green). If the user doesn't input a calendar the color is the default color
  of the terminal. I will [leave this](https://github.com/fazibear/colorize)
  over here 😉
- **start_end**: This field is also optional, It refers to the start and end
  time of the event. If the user does not specify and start and end time, the
  event should be stored without time (0 hours and 0 minutes). But if the user
  enters something it should follow this format: HH:MM HH:MM. **You can assume
  that the user will behave** with the format but you need to validate 2 things:
  that the user input 2 words separated with a space and that in the Time
  representation of those words, the end time is after the start time.
  `10:00 09:00` is invalid and `10:00 11:00` is valid.
- **notes:** this field is also optional and has no restriction about the
  content.
- **guests:** this field is also optional but the content should be stored as a
  list of people using the comma as the separator.

```bash
-----------------------------Welcome to CalenCLI------------------------------

Mon Nov 15                Ruby Basics 1 (1)
            12:00 - 13:30 English Course (2)

Tue Nov 16                Ruby Basics 2 (3)
            12:45 - 13:00 Soft Skill Session - Resilience (4)

Wed Nov 17                Ruby Methods (5)
            12:00 - 13:30 English Course (6)

Thu Nov 18                Extended Project (7)
            09:00 - 13:30 Summary Workshop (8)

Fri Nov 19                Extended Project (9)
            12:00 - 13:30 English for Engineers (10)

Sat Nov 20  10:00 - 11:00 Breakfast with my family (11)
            15:00 - 20:00 Hackaton (12)

Sun Nov 21                No events

------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: create
date: 2021-11-20
title: Push extended project!
calendar: tech
start_end: 23:00 23:30
notes: Don't forget to push our final work to the main branch
guests: Diego, Codeka
------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action:
```

### Error messages

When the user doesn't input a date:

```bash
------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: create
date: 
Type a valid date: YYYY-MM-DD
date: 2021-11-20
```

When the user doesn't input a title:

```bash
------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: create
date: 2021-11-20
title: 
Cannot be blank
title: My new event
```

When the user inputs an invalid start_end:

```bash
------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: create
date: 2021-11-20
title: My new event
calendar: optional-calendar
start_end: 11:00
Format: 'HH:MM HH:MM' or leave it empty
start_end: 11:00 09:00
Cannot end before start
start_end: 11:00 15:00
```

### List events

If the user inputs the word `list` the program should display the welcome
header, the agenda, the footer and prompt the user for the next action (exactly
the same as when the program started).

Notice that the events without a specific start and end time are shown as "daily
events". The daily events **should be displayed first** on each day.

```bash
------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: list
-----------------------------Welcome to CalenCLI------------------------------

Mon Nov 15                Ruby Basics 1 (1)
            12:00 - 13:30 English Course (2)

Tue Nov 16                Ruby Basics 2 (3)
            12:45 - 13:00 Soft Skill Session - Resilience (4)

Wed Nov 17                Ruby Methods (5)
            12:00 - 13:30 English Course (6)

Thu Nov 18                Extended Project (7)
            09:00 - 13:30 Summary Workshop (8)

Fri Nov 19                Extended Project (9)
            12:00 - 13:30 English for Engineers (10)

Sat Nov 20  10:00 - 11:00 Breakfast with my family (11)
            15:00 - 20:00 Hackaton (12)
            23:00 - 23:30 Push extended project! (15)

Sun Nov 21                No events

------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: 
```

### Show an event

If the user type `show` the program should ask for an `Event ID`. If the user
inputs a valid ID, then the program will show all the details of that event (in
the same format as they were introduced). Which are the events IDs? Each event
has a number displayed between `<>`. That's the ID. For example, the ID for
"English for Engineers" is 10.

```bash
------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: list
-----------------------------Welcome to CalenCLI------------------------------

Mon Nov 15                Ruby Basics 1 (1)
            12:00 - 13:30 English Course (2)

Tue Nov 16                Ruby Basics 2 (3)
            12:45 - 13:00 Soft Skill Session - Resilience (4)

Wed Nov 17                Ruby Methods (5)
            12:00 - 13:30 English Course (6)

Thu Nov 18                Extended Project (7)
            09:00 - 13:30 Summary Workshop (8)

Fri Nov 19                Extended Project (9)
            12:00 - 13:30 English for Engineers (10)

Sat Nov 20  10:00 - 11:00 Breakfast with my family (11)
            15:00 - 20:00 Hackaton (12)
            23:00 - 23:30 Push extended project! (15)

Sun Nov 21                No events

------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: show
Event ID: 15
date: 2021-11-20
title: Push extended project!
calendar: tech
start_end: 23:00 23:30
notes: Don't forget to push our final work to the main branch
guests: Diego, Codeka
------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action:
```

### Update an event (and show again to verify)

Similar to `show`, when the user types `update` the program asks for the Event
ID. And then, similar to `create` the program prompt for each piece of the event
information. Yes, the user needs to respond again to every property. If
something is left blank, that's the value the event will take (for the optional
properties at least). The same validations described on `create` apply here.

After updating an event, it won't be a bad idea to show the event again to
verify if the changes were applied.

```bash
------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: update
Event ID: 15
date: 2021-11-20
title: Push extended project updated!
calendar: tech
start_end: 23:00 23:30
notes: Dont forget to push our final work to the main branch
guests: Diego, Codeka, Teddy
------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: show
Event ID: 15
date: 2021-11-20
title: Push extended project updated!
calendar: tech
start_end: 23:00-23:30
notes: Don't forget to push our final work to the main branch
guests: Diego, Codeka, Teddy
------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: 
```

### Delete an event (and list again to verify)

Similar to `show` and `update`, when the user types `delete` the program asks
for the Event ID. And then, it performs the deletion. If everything goes well,
the actions footer is displayed (as always) and the program prompts the user for
the next action. You can list the events to verify if the deleted event shows up
(it shouldn't).

```bash
------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: delete
Event ID: 15
------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit
action: list
-----------------------------Welcome to CalenCLI------------------------------

Mon Nov 15                Ruby Basics 1 (1)
            12:00 - 13:30 English Course B1 (2)

Tue Nov 16                Ruby Basics 2 (3)
            12:45 - 13:00 Soft Skill Session - Resilience (4)

Wed Nov 17                Ruby Methods (5)
            12:00 - 13:30 English Course (6)

Thu Nov 18                Extended Project (7)
            09:00 - 13:30 Summary Workshop (8)

Fri Nov 19                Extended Project (9)
            12:00 - 13:30 English for Engineers (10)

Sat Nov 20  10:00 - 11:00 Breakfast with my family (11)
            15:00 - 20:00 Hackaton (12)

Sun Nov 21                No events

------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action:
```

### Go to next week and the previous week

Everything looks great but a calendar of just one week is not so useful. If the
user types `next` the program should display the welcome header, the agenda for
the next week, the actions footer, and prompt the user for the next action. The
same but in reverse when the user inputs `prev`.

Notice that on the days where there are no events scheduled, the message "No
events" is displayed instead.

```bash
------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: next
-----------------------------------CalenCLI-----------------------------------

Mon Nov 22                No events

Tue Nov 23                No events

Wed Nov 23                No events

Thu Nov 24                Extended Project (13)

Fri Nov 25                Extended Project (14)

Sat Nov 26                No events

Sun Nov 27                No events

------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: prev
-----------------------------Welcome to CalenCLI------------------------------

Mon Nov 15                Ruby Basics 1 (1)
            12:00 - 13:30 English Course B1 (2)

Tue Nov 16                Ruby Basics 2 (3)
            12:45 - 13:00 Soft Skill Session - Resilience (4)

Wed Nov 17                Ruby Methods (5)
            12:00 - 13:30 English Course (6)

Thu Nov 18                Extended Project (7)
            09:00 - 13:30 Summary Workshop (8)

Fri Nov 19                Extended Project (9)
            12:00 - 13:30 English for Engineers (10)

Sat Nov 20  10:00 - 11:00 Breakfast with my family (11)
            15:00 - 20:00 Hackaton (12)

------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action:
```

If the user keeps entering `next` he sooner or later will see an empty calendar:

```bash
------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: next
-----------------------------------CalenCLI-----------------------------------

Mon Nov 29                No events

Tue Nov 30                No events

Wed Nov 01                No events

Thu Nov 02                No events

Fri Nov 03                No events

Sat Nov 04                No events

Sun Nov 05                No events

------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: 
```

## Exit the program

When the user type `exit`, the program should end.

```bash
------------------------------------------------------------------------------
list | create | show | update | delete | next | prev | exit

action: exit
Thanks for using calenCLI
$ 
```
