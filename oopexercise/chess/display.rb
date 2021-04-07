require_relative "board.rb"
require_relative "cursor.rb"
require "colorize"

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.rows.each do |row|
      puts
      row.each do |piece|
        print piece.to_s.colorize(piece.color)
      end
    end
    return nil
  end

end
