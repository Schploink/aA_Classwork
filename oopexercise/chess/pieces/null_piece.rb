require_relative "piece.rb"
require "Singleton"

class NullPiece < Piece
  include Singleton
  def initialize
    super(:thevoid, nil, nil)
  end

  def moves

  end

  def symbol
    :n
  end

end