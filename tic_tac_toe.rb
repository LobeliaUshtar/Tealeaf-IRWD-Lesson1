# https://gist.github.com/cglee/b30124da1d5e71b4ffc5 tictactoe-procedural.rb
# https://gist.github.com/LobeliaUshtar/f431494a571ab5172f29 my tic_tac_toe.rb

def initialize_board
  b = {}
  (1..9).each { |position| b[position] = ' '}
  b
end

def draw_board(b)
  system 'clear'
  puts " #{b[1]} | #{b[2]} | #{b[3]} "
  puts "-----------"
  puts " #{b[4]} | #{b[5]} | #{b[6]} "
  puts "-----------"
  puts " #{b[7]} | #{b[7]} | #{b[9]} "
end

def empty_squares(b)
  b.select { |k, v| v == ' '}.keys
end

def player_picks_square(b)
  puts "Pick a square #{empty_squares(b)}:"
  position = gets.chomp.to_i
  b[position] = 'X'
end

def computer_picks_square(b)
  position = empty_squares(b).sample
  b[position] = 'O'
end

def check_winner(b)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  winning_lines.each do |line|
    return "Player" if b.values_at(*line).count('X') == 3
    return "Computer" if b.values_at(*line).count('O') == 3
  end
  nil
end

board = initialize_board
draw_board(board)

begin
  player_picks_square(board)
  draw_board(board)
  computer_picks_square(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_squares(board).empty?

if winner
  puts"#{winner} won!"
else
  puts "It's a tie."
end