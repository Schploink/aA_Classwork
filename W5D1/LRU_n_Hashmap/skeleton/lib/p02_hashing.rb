class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    num = 0
    self.each_with_index do |ele, i|
      num += ele * (10 ** i)
    end
    num.hash
  end
end

class String # 'cat' ['c','a','t'] => 0 += 'c' * 1 
  def hash
    self.bytes.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.map(&:to_s).join.bytes.hash
  end
end

# { a: 1, b: 2, c: 3}.hash == { a: 1, c: 3, b: 2 }
# [[a,1], [b,2], [c,3]] != [[a,1], [c,3], [b,2]]