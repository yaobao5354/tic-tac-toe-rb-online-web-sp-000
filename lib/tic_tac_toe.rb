WIN_COMBINATIONS = [ 
  [0,1,2], [3,4,5], [6,7,8], 
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6] ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(index)
  index = index.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if position_taken?(board, index)  
  elsif index >= 0 && index <= 8 
  true
  else
end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |token|
    if token != " "
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board).even? 
    return "X"
  else
    return "O"
  end
end 

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else 
      false
    end
  end
  false
end 

def full?(board)
  board.each do |token|
    if token == " "
      return false
    else
    end
  end
end 

def draw?(board)
  if won?(board)
    return false
  elsif full?(board) == false
    return false
  end
  true
end 

def over?(board)
  if won?(board)
    return true
  elsif draw?(board)
    return true
  end
  false
end 

def winner(board)
  if won?(board)
    token = board[won?(board)[0]]
    return token
  end 
  return nil
end 

def play(board)
  while over?(board) == false
  turn(board)
  end
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  else 
    puts "Cat's Game!"
  end
end
