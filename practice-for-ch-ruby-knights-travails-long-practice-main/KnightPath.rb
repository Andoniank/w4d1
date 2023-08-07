class KnightPathFinder

    def initialize(position)
        @position = position
        @root_node = PolyTreeNode.new(position)
        @considered_positions = [position]
    end

    def build_move_tree

    end

    def find_path

    end

    def new_move_positions(pos)
        self.valid_moves(pos)    # return an array of valid moves from given position
                                 # check each valid move if considered position.include?
                                 # return positions array of new moves 
    end

    def self.valid_moves(pos)
        arr = [[1,2], [-1,2], [-2,1], [2, 1], [-2, -1], [-1, -2], [2, -1], [1, -2]]
        moves = []

        arr.each do |position|
            if pos[0] + position[0] < 8 || pos[0] + position[0] >= 0 || pos[1] + position[1] < 8 || pos[1] + position[1] >= 0
                moves << [pos[0] + position[0], pos[1] + position[1]]
            end
        end

        @considered_positions += moves 
        return moves
    end
end