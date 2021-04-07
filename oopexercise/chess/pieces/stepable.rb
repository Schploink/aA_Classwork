module Stepable

    HORIZONTAL_DIRS = [[0,1],[0,-1], [1,0], [-1,0]]
    DIAGONAL_DIRS = [[1,1], [-1,1], [1,-1], [-1,-1]]
    KNIGHT_MOVES = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]]

    def moves
        potential_moves = []
        ox, oy = @pos

        move_diffs.each do |pos|
            x, y = pos
            cx, cy = ox+x, oy+y
            if !cx.between?(0,7) || !cy.between?(0,7)
                next
            elsif @board[[cx,cy]].color == @board[[ox,oy]].color
                next
            end
            potential_moves << [cx,cy]
        end
        potential_moves
    end

    protected
    def move_diffs
    end

end