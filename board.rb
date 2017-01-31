require_relative './piece'

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8){Array.new(8)}

    @grid[0][3]= Piece.new("queen")
  end

  def move_piece(start_pos,end_pos)
    raise "no piece here!" if self[start_pos].nil?
    raise "piece cannot move to end pos!" unless in_bounds(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def in_bounds(pos) #[1,2,3]
    pos.all? {|x| (x < 8) && (x >= 0)}
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end
  def []=(pos,value)
    x,y = pos
    @grid[x][y] = value
  end
end
