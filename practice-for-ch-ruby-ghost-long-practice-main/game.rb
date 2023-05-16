require_relative "dictionary.txt"
class Game 
def initialize(player_1,player_2)
@player_1=player_1
@player_2=player_2
@fragment=fragment
@dictionary=dictionary.txt
end


def current_player
  @player_1
end
def previous_player
  @player_2
end

def next_player!
  if current_player ==@player_1
  current_player=@player_2
  previous_player=  @player_1
  else
    current_player=@player_1
    previous_player=  @player_2
end


def valid_play?(string)
  alphabet=("a".."z").to_a
  if  alphabet.include?(string)
    if  @dictionary.include?(@fragment+string)
      return true
    end
  end
  return false
end

def take_turn(current_player)
  until valid_play?(string)
string=gets.chomp
end








end