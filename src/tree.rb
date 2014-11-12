class Tree

  attr_accessor :children, :value

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

  def print(offset)
    offset.times {print ' '}
    print value
    puts
    @children.each  do |child|
      child.print offset+1
    end
  end

end

