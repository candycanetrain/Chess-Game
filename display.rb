require_relative './board'
require 'colorize'
require_relative './cursor'

class Display
  attr_reader :board
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    pos = @cursor.get_input
    board.grid.each_with_index do |row, i|
      row.each_with_index do |el, j|
        if [i,j] == pos
          puts el.colorize(:yellow)
        else
          puts el
        end
      end
    end
  end

end
