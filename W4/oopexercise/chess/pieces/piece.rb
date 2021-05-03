

class Piece
    attr_accessor :color, :pos
    #attr_writer :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        symbol.to_s
    end

    def empty?

    end

    def valid_moves
        # if move puts you in check then it is not a valid move
        moves
    end

    def symbol

    end

    private
    def move_into_check?(end_pos)

    end
end