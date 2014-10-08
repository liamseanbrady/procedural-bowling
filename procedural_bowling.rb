# Problem scope:
#   Create a bowling game
#   Game has two players
#   Basic game has 10 frames
#   Each frame has two balls unless the first ball is a strike
#   If a player gets a spare then the score for that frame is 10 plus the next ball
#   If a player gets a strike then the score for that frame is 10 plus the next two balls
#   If the ball is a spare on the 10th frame, you get an extra ball
#   If the ball is a strike on the 10th frame, you get two extra balls

require "pry"

# Methods

def create_scoreboard
  return []
end

def bowl(pins_left)
  return rand(0..pins_left)
end

def frame_sum(frame)
    total = 0
    frame.each{ |b| total += b }
    return total
end

def calculate_score(player_scoreboard, spares_indices, strikes_indices)
  total = 0
  # Deal with strikes
  strikes_indices.each do |index|
    total += (10 + frame_sum(player_scoreboard[index + 1]))
  end
  # Deal with spares
  spares_indices.each do |index|
    total += (10 + (player_scoreboard[index + 1].first))
  end
  # Delete all strikes
  strikes_indices.each do |index|
    player_scoreboard.delete_at(index)
  end
  # Delete all spares
  spares_indices.each do |index|
    player_scoreboard.delete_at(index)
  end
  total += frame_sum(player_scoreboard.flatten)
  return total
end

def complete_frame(pins_left, frame, name)
  2.times do
    gets.chomp
    pins_knocked_down = bowl(pins_left)
    puts "#{name} knocked down #{pins_knocked_down} pins"
    frame << pins_knocked_down
    pins_left -= pins_knocked_down
    if frame.first == 10
      break
    end
  end
end

# Main

# Create blank scoreboards for player and comp
player_scoreboard = create_scoreboard
comp_scoreboard = create_scoreboard

while comp_scoreboard.count < 3

  # Player's turn

  players_spares_indices = []
  players_strikes_indices = []

  pins_left = 10
  frame = []
  complete_frame(pins_left, frame, "You")
  player_scoreboard << frame
  puts "Your current score: #{player_scoreboard}"
  if frame.first == 10
    puts "You got a strike"
    players_strikes_indices << (player_scoreboard.count - 1)
  elsif frame_sum(frame) == 10
    puts "You got a spare"
    players_spares_indices << (player_scoreboard.count - 1)
  end

# Comps's turn

  comps_spares_indices = []
  comps_strikes_indices = []

  pins_left = 10
  frame = []
  complete_frame(pins_left, frame, "Computer")
  comp_scoreboard << frame
  puts "Computer's current score: #{comp_scoreboard}"
  if frame.first == 10
    puts "Computer got a strike"
    comps_strikes_indices << (comp_scoreboard.count - 1)
  elsif frame_sum(frame) == 10
    puts "Computer got a spare"
    comps_spares_indices << (comp_scoreboard.count - 1)
  end

end

# Get final scores with scores added for strikes and spares

player_total = calculate_score(player_scoreboard, players_spares_indices, players_strikes_indices)
comp_total = calculate_score(comp_scoreboard, comps_spares_indices, comps_strikes_indices)

puts "Your score #{player_total}"
puts "Computers's score #{comp_total}"

if player_total > comp_total
  puts "Player wins!"
elsif comp_total > player_total
  puts "Computer wins!"
else
  puts "OoOoOoo. It was a tie!"
end
  


















