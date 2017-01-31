require_relative './board'
require 'colorize'
require_relative './cursor'
require 'byebug'

class Display
  attr_reader :board
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    @cursor.get_input
    board.grid.each_with_index do |row, i|
      row.each_with_index do |el, j|
        square = "_"
        if (el.is_a?(Piece))
          square = "Q"
        end

        if([i,j] == @cursor.cursor_pos)
          print square.colorize(:red)
        else
          print square
        end
      end
      print "\n"
    end
  end

  def test_render
    20.times { render }
  end

end

# load 'display.rb'
board = Board.new
d = Display.new(board)
d.test_render
