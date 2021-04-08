class Array

  def remove_dups
    self.select {|ele| self.count(ele) == 1}
  end

end