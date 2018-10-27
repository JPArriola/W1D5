require_relative "Poly_Tree_Node/skeleton/lib/00_tree_node"

class KnightPathFinder
  def initialize(position)
    @position = position
    @root_node = PolyTreeNode.new(position)
    @visited_positions = [position]
  end
  
  def find_path(pos)
    
  end
  
  def build_move_tree(target)
    
    new_moves = new_move_positions(self.position)
    new_moves.each do |pos|
      pos = PolyTreeNode.new(pos)
      pos.parent = self
      
      return pos if pos.value == target
    end
    
    self.children.build_move_tree(target)
    
    # queue = []
    # 
    # queue << self
    # until queue.empty?
    #   front = queue.shift
    #   return front if front.value == target_value
    # 
    #   queue.concat(front.children)
    # end
    # 
  
  end

  
  def self.valid_moves(pos)
    x = pos[0]
    y = pos[1]    
    results = []
    results << [x + 1, y + 2]
    results << [x - 1, y + 2]
    results << [x + 1, y - 2]
    results << [x - 1, y - 2]
    results << [x + 2, y + 1]
    results << [x - 2, y + 1]
    results << [x + 2, y - 1]
    results << [x - 2, y - 1]
    results.reject do |el|
      (el[0] < 0 || el[0] > 7) || (el[1] < 0 || el[1] > 7)
    end
  end 
  
  def new_move_positions(pos)
    potential_moves = KnightPathFinder.valid_moves(pos)
    potential_moves.reject {|pos| @visited_positions.include?(pos)}
    visited_positions.concat(potential_moves)
  end
  
  
end