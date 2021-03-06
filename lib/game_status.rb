# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? do |space|#{|space| space == "X" || space == "O"}
    space == "X" || space == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def turn_count(board)
  counter = 0
  board.each do|token|
    if token == "X" || token == "Y"
      counter += 1
    end
  end
counter
end

def winner(board)
  turn = turn_count(board)
  if won?(board)
    if turn.odd?
      "X"
    elsif turn.even?
      "O"
    end
  end
end

#def winner(board)
  #if winning_combo = won?(board)
    #board[winning_combo.first]
  #end
#end
