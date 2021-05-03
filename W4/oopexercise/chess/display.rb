require_relative "board.rb"
require_relative "cursor.rb"
require "colorize"

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.rows.each_with_index do |row, idx1|
      puts
      row.each_with_index do |piece, idx2|
        if @cursor.cursor_pos == [idx1, idx2]
            print piece.to_s.colorize( :color => piece.color, :background => :red,)
        else
            print piece.to_s.colorize(piece.color)
        end
      end
    end
    return nil
  end

  def render_with_cursor

    while true
        system("clear")
        render
        @cursor.get_input
    end

  end

end

b = Board.new
d = Display.new(b)

d.render_with_cursor
