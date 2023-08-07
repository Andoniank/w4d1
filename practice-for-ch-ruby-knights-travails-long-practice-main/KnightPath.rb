class KnightPathFinder
    attr_accessor :considered_positions
    
    def initialize(position)
        @position = position
        @root_node = position
        @considered_positions = [position]
    end

    def build_move_tree

    end

    def find_path

    end

    def new_move_positions(pos)
        valid = KnightPathFinder.valid_moves(pos)    # return an array of valid moves from given position
        valid.select!{|move| !@considered_positions.include?(move)}
        @considered_positions += valid                        # check each valid move if considered position.include?
        valid                         # return positions array of new moves 
    end

    def self.valid_moves(pos)
        arr = [[1,2], [-1,2], [-2,1], [2, 1], [-2, -1], [-1, -2], [2, -1], [1, -2]]
        moves = []

        arr.each do |position|
            if (pos[0] + position[0] < 8 && pos[0] + position[0] >= 0) && (pos[1] + position[1] < 8 && pos[1] + position[1] >= 0)
                moves << [pos[0] + position[0], pos[1] + position[1]]
            end
        end
        return moves
    end
end