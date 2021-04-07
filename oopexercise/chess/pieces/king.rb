require_relative "piece.rb"
require_relative "stepable.rb"

class King < Piece
    include Stepable

    def symbol
        :K
    end

    # protected
    def move_diffs
        DIAGONAL_DIRS + HORIZONTAL_DIRS
    end
end