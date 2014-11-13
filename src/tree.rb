class Tree

  attr_accessor :children
  attr_accessor :value

  def initialize(value)
    @value = value
    @children = []
  end

  def child(value)
    child = Tree.new(value)
    @children << child
    return child
  end

  def find_by_value(value)
    if value.eql? @value
      return self;
    end
    result = nil
    @children.each  do |child|
      if result.nil?
        result = child.find_by_value value
      end
    end
    return result
  end

  def each_child
    @children.each do |child|
      yield(child)
    end
  end


  def display(offset)
    offset.times {print ' '}
    puts value
    @children.each  do |child|
      child.display offset+1
    end
  end

end

