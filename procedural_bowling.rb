# Problem scope:
#   Create a bowling game
#   Game has two players
#   Basic game has 10 frames
#   Each frame has two balls unless the first ball is a strike
#   If a player gets a spare then the score for that frame is 10 plus the next ball
#   If a player gets a strike then the score for that frame is 10 plus the next two balls
#   If the ball is a spare on the 10th frame, you get an extra ball
#   If the ball is a strike on the 10th frame, you get two extra balls

# Methods

def create_scoreboard
  return []
end

def bowl
  return rand(0..10)
end

# Main

# Create blank scoreboards for player and comp
player_scoreboard = create_scoreboard
comp_scoreboard = create_scoreboard

puts "Player's score is: #{player_scoreboard}"
puts "Computer's score is: #{comp_scoreboard}"

# Player's turn

while player_scoreboard.count != 10
  frame = []
  puts "Press any key to bowl..."
  gets.chomp
  pins_knocked_down = bowl
  puts "You knocked down #{pins_knocked_down} pins"
  frame << pins_knocked_down
  player_scoreboard << frame
  puts "Here is your scoreboard: #{player_scoreboard}"
end