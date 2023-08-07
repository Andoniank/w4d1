require_relative "PolyTreeNode.rb"

class KnightPathFinder
    attr_accessor :considered_positions, :root_node
    
    def initialize(position)
        @position = position
        @root_node = PolyTreeNode.new(position)
        @considered_positions = [position]
    end

    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            move_nodes = new_move_positions(queue.first.position)
            move_nodes.each do |pos| 
                new_node = PolyTreeNode.new(pos)
                new_node.parent=(queue.first) 
                queue.first.children << new_node
                queue << new_node
            end
            queue.shift
        end
    end
    
    def find_path(end_pos)
        route = []
        target_node = @root_node.bfs(end_pos)
        route = trace_path_back(target_node) 
        return route.reverse
    end

    def trace_path_back(node)
        return [node.position] if node.parent == nil
        route = [node.position]
        
        route += trace_path_back(node.parent)
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