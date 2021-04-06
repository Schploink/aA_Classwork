class Board

    def initialize
        @null_piece = NullPiece.instance
        @rows = Array.new(8) {Array.new(8)}
    end

    def populate_board
        @rows.each_with_index do |row, idx|

            if idx.between(0,1) || idx.between(6,7)

                row.each_with_index do |spot, idx2|
                    self[idx][idx2] = Piece.new(:b, 1, [idx, idx2])
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

    end
end