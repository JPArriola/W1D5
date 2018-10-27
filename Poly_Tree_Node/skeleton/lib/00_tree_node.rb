require 'byebug'
class PolyTreeNode
  attr_reader :parent, :children, :value
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  
  def parent=(parent_node) # view from child #parent_node is_a new parent
    if self.parent # if child has a parent
      self.parent.children.delete(self) # remove child from parent
    end
    
    @parent = parent_node # set child parent to the new parent
    
    unless parent_node == nil
      parent_node.children << self unless parent_node.children.include?(self) 
    # puts child in new parent's children array unless child is already there 
    end
  end
  
  def add_child(child_node) # view from parent
    @children << child_node unless @children.include?(child_node) 
    child_node.parent = self
  end
  
  def remove_child(child_node) # view from parent
    raise "Here's an error" if child_node.parent != self
    self.children.delete(child_node)
    child_node.parent = nil unless child_node.parent.nil?
  end 
  
  def dfs(target_value)
    return self if self.value == target_value
    
    
    self.children.each do |child|
      target_node = child.dfs(target_value)
      return target_node if target_node
    end
    
    nil
  end
  
  def bfs(target_value)
    queue = []
    
    queue << self
    until queue.empty?
      front = queue.shift
      return front if front.value == target_value
      
      queue.concat(front.children)
    end
    
    nil
  end
end