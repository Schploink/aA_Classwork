require_relative "pieces/pieces_gathered.rb"


class Board
    attr_reader :rows
    def initialize
        @null_piece = NullPiece.instance
        @rows = Array.new(8) {Array.new(8)}
        populate_board
    end

    def populate_board
        @rows.each_with_index do |row, idx|                     #if idx 0, 0 or 7 = rook 1 or 6 = knight 2 or 5 =bishop
            row.each_with_index do |spot, idx2|                #if queen - 0, 4 - king 0,3 idx = 1 - all white pawn
                if idx == 1
                    @rows[idx][idx2] = Pawn.new(:white, self, [idx, idx2])
                elsif idx == 6
                    @rows[idx][idx2] = Pawn.new(:black, self, [idx, idx2])
                elsif idx == 0
                    @rows[idx][idx2] = create_back_row(:white, idx, idx2)
                elsif idx == 7
                    @rows[idx][idx2] = create_back_row(:black, idx, idx2)
                else 
                    @rows[idx][idx2] = @null_piece
                end
            end
        end
    end
                
    def create_back_row(color, idx, idx2)
        if idx2 == 0 || idx2 == 7
            Rook.new(color, self, [idx, idx2])
        elsif idx2 == 1 || idx2 == 6
            Knight.new(color, self, [idx, idx2])
        elsif idx2 == 2 || idx2 == 5
            Bishop.new(color, self, [idx, idx2])
        elsif idx2 == 4
            Queen.new(color, self, [idx, idx2])
        elsif idx2 == 3
            King.new(color, self, [idx, idx2])
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

    def move_piece(color, start_pos, end_pos)
        if self[start_pos] == @null_piece
            raise "No piece there"
        end
        if !valid_pos?(end_pos)
            raise "Where you goin"
        end
        piece = self[start_pos]
        if piece.color != color
            raise "wrong color"
        end
        if piece.valid_moves.include?(end_pos)
            self[start_pos] = @null_piece
            self[end_pos] = piece
            piece.pos = end_pos
        else
            raise "piece dont do that"
        end
    end

    def valid_pos?(pos)
        pos[0].between?(0, 7) || pos[1].between?(0, 7)
    end
end