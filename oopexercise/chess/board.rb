require_relative "pieces/piece.rb"
require_relative "pieces/rook.rb"

class Board

    def initialize
        # @null_piece = NullPiece.instance
        @rows = Array.new(8) {Array.new(8)}
        populate_board
    end

    def populate_board
        @rows.each_with_index do |row, idx|
            if idx.between?(0,1) || idx.between?(6,7)
                row.each_with_index do |spot, idx2|
                    #CHANGED TO ALL ROOKS FOR TESTING!!!
                    @rows[idx][idx2] = Rook.new(:b, self, [idx, idx2])
                end
            end
        end
    end

    def [](pos)
        row,col = pos
        @rows[row][col] 
    end

    def []=(pos, value)
        row,col = pos
        @rows[row][col] = value
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos] == nil
            raise "No piece there"
        end
        if !end_pos[0].between?(0, 7) || !end_pos[1].between?(0, 7)
            raise "Where you goin"
        end
        piece = self[start_pos]
        self[start_pos] = nil
        self[end_pos] = piece
        piece.pos = end_pos

    end
end