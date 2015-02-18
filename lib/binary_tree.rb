class BinaryTree
  attr_accessor :left, :right, :data, :parent

  def initialize(data, parent = nil)
    @data = data
    @parent = parent
  end

  def add(data)
    # If self.data is less than the new data,
    # the new data has to be added to the right
    # child of self
    if (self.data <=> data) == -1
      # If there already is a right child,
      # recursively add data to it
      if self.right
        self.right.add(data)
      # If there is no right child yet, assign
      # a new binary tree with data to it
      else
        self.right = BinaryTree.new(data, self)
      end
    # If self.data is greater than the new data,
    # the new data has to be added to the left
    # child of self
    elsif (self.data <=> data) == 1
      # If there already is a left child,
      # recursively add data to it
      if self.left
        self.left.add(data)
      # If there is no left child yet, assign
      # a new binary tree with data to it
      else
        self.left = BinaryTree.new(data, self)
      end
    end
  end

  def root?
    @parent.nil?
  end

  # Find the tree that is to be removed
  # recursively
  def remove(data)
    # If the data is greater than self's data,
    # it must be in its right child
    tree = if (self.data <=> data) == -1
      if self.right
        self.right.remove(data)
      end
    # If the data is less than self's data,
    # it must be in its left child
    elsif (self.data <=> data) == 1
      if self.left
        self.left.remove(data)
      end
    # If the data is equal to self's data,
    # self must be removed
    else
      self
    end

    # If any tree found, remove it
    unless tree.nil?
      # If the tree is root, set its data to nil
      # and set both children to nil as well
      if tree.root?
        tree.data = nil
        tree.left = nil
        tree.right = nil
      # If the tree is a child itself, set it to
      # nil
      else
        # If the tree is a left child, set it to nil
        # through its parent
        if tree == tree.parent.left
          tree.parent.left = nil
        # If the tree is a right child, set it to nil
        # through its parent
        else
          tree.parent.right = nil
        end
      end
    end
  end
end
