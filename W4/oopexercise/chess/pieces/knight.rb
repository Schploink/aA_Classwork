require_relative "piece.rb"
require_relative "stepable.rb"

class Knight < Piece
    include Stepable

    def symbol
        :kn
    end

    protected
    def move_diffs
        KNIGHT_MOVES
    end
end