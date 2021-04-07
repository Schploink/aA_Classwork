module Slideable

    HORIZONTAL_DIRS = [[0,1],[0,-1], [1,0], [-1,0]]
    DIAGONAL_DIRS = [[1,1], [-1,1], [1,-1], [-1,-1]]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        potential_moves = []
        move_dirs.each do |move_dir|
            x,y = move_dir
            potential_moves.concat(grow_unblocked_moves_in_dir(x,y))
        end
        potential_moves
    end

    private
    def move_dirs
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        #rook - method takes in direction - add direction to position - return array of possible moves
        #until hit piece of same color, edge of board, one after piece of different color
        ox, oy = @pos
        cx, cy = ox+dx, oy+dy
        positions = []
        while True
            if @board[[cx,cy]].color == @board[[ox,oy]].color
                break
            elsif @board[[cx,cy]].color != @board[[ox,oy]].color && @board[[cx,cy]].color != :thevoid
                positions << [cx,cy]
                break
            elsif !cx.between?(0,7) || !cy.between?(0,7)
                break
            end
            positions << [cx,cy]
            cx+= dx
            cy+= dy
        end
        positions
    end
end