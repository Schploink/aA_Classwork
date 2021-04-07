

class Piece
    attr_accessor :color
    attr_writer :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s

    end

    def empty?

    end

    def valid_moves
        moves
    end

    def symbol

    end

    private
    def move_into_check?(end_pos)

    end
end