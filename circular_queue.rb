class CircularQueue
  def initialize(size)
    @max_size = size
    @buffer = []
  end

  def enqueue(obj)
    if @buffer.size < @max_size
      @buffer << obj
    else
      dequeue
      @buffer.push(obj)
    end
  end

  def dequeue
    return nil if empty?
    @buffer.shift
  end

  def to_s
    "#{@buffer}"
  end

  def empty?
    @buffer.all? { |elem| elem == nil }
  end
end


queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
