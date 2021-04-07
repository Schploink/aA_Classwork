require_relative "piece.rb"

class Pawn < Piece

    def symbol
        :p
    end

    def moves
      potential_moves = get_potential_moves
      final_moves = []
      ox, oy = @pos

      potential_moves.each do |pos|
        x, y = pos
        cx, cy = ox+x, oy+y

        if !cx.between?(0,7) || !cy.between?(0,7)
          break
        elsif @board[[cx,cy]].color != :thevoid
          break
        end
        final_moves << [cx, cy]
      end

      side_attacks.each do |pos|
        x, y = pos
        cx, cy = ox+x, oy+y
        if @board[[cx,cy]].color != @board[[ox,oy]].color && @board[[cx,cy]].color != :thevoid
          final_moves << [cx,cy]
          next
        end 
      end  

      final_moves
    end

    def get_potential_moves
      potential_moves = []

      if at_start_row?
        potential_moves.concat(forward_steps)
      else 
        potential_moves << forward_steps[0]
      end

      potential_moves
    end
  
    private
    def at_start_row?
      if @pos[0] == 1 || @pos[0] == 6
        return true
      end
      false
    end

    def forward_dir 
      return 1 if @color == :w
      return -1 if @color == :b
    end

    def forward_steps
      [[forward_dir, 0], [forward_dir * 2, 0]]
    end

    def side_attacks
      [[forward_dir, 1], [forward_dir, -1]]
    end
end