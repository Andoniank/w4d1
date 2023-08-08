require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    brain =[]
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |ele, j|
        b_copy = board.dup
        if ele.nil?
          b_copy[[i,j]]=@next_mover_mark 
          brain << TicTacToeNode.new(b_copy,switch_move(@next_mover_mark), [i,j])
        end
      end
    end
    brain
  end
  
  def switch_move(mark)
    mark == :o ? :x : :o
  end
end