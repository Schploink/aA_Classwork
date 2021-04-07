require_relative "piece.rb"
require_relative "slideable.rb"

class Bishop
    include Slideable

    def symbol
        :B
    end

    private
    def move_dirs
        diagonal_dirs
    end
end