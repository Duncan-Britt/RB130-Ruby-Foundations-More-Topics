class Element
  attr_reader :datum
  attr_writer :succ

  def initialize(datum, succ=nil)
    @datum = datum
    @succ = succ
  end

  def tail?
    !succ
  end

  def succ
    @succ
  end
  alias_method :next, :succ
end

class SimpleLinkedList
  def self.from_a(arr)
    return SimpleLinkedList.new unless arr

    list = SimpleLinkedList.new
    arr.reverse_each do |e|
      list << e
    end
    list
  end

  attr_reader :size, :head

  def initialize
    @size = 0
    @head = nil
  end

  def empty?
    size == 0
  end

  def push(datum)
    self.size += 1

    if head
      node = head
      self.head = Element.new(datum)
      head.succ = node
    else
      self.head = Element.new(datum)
    end
  end
  alias_method :<<, :push

  def pop
    return unless head

    self.size -= 1
    node = head
    self.head = head.next
    node.datum
  end

  def peek
    return unless head
    head.datum
  end

  def to_a
    node = head
    arr = []

    while node
      arr << node.datum
      node = node.next
    end

    arr
  end

  def reverse
    rev = SimpleLinkedList.new
    i = 0
    node = head
    while node
      rev << node.datum
      node = node.next
    end
    rev
  end

  def [](index)
    i = 0
    node = head
    while i <= index - 1
      node = node.next
      i += 1
    end

    node.datum
  end

  private

  attr_writer :size, :head

  def tail
    return unless head
    element = head
    while element.next
      element = element.next
    end
    element
  end
end
