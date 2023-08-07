class PolyTreeNode
    attr_reader :position, :parent, :children
  def initialize(position)
    @position = position
    @parent = nil
    @children = []
  end

  def parent=(node)
    if @parent
        @parent.children.delete(self)
    end
    
    
    @parent = node
    if !self.parent.nil?
        if !node.children.include?(self) 
            node.children << self 
        end
    end
  end
 
  def add_child(node)
    node.parent=(self)
  end

  def remove_child(node)
    raise 'Not a child' if !self.children.include?(node)
    node.parent=(nil)
  end

  def dfs(target)
    return self if self.position == target 
    
    if self.children.length > 0
        self.children.each do |child| 
            result = child.dfs(target) 
            return result if !result.nil?
        end
    end
    nil  
  end

  def bfs(target)
    queue = [self]
    
    until queue.size == 0
      node = queue.shift
      if node.position == target
        return node
      else
        queue += node.children
      end
    end
    nil
  end

  def inspect
    return "position: #{position}, parent: #{parent}, children: #{children}"
  end
end