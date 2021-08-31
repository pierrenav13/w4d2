require_relative "piece.rb"
require "byebug"
class Board
    attr_reader :row
    def self.setup_board
        arr = Array.new(8) {Array.new(8)}

        arr.each.with_index do |row, i|
            if i == 0 || i == 1 || i == 6 || i == 7
                row.map! {|ele| Piece.new}
            else
                row.map! {|ele| nil}
            end
        end
    end

    def initialize
        @rows = Board.setup_board
        # @null_piece = NullPiece.new
    end

    def[](pos)
        row, col = pos
        @rows[row][col]
    end

    def[]=(pos, value)
        row, col = pos
        @rows[row][col] = value
    end

    def move_piece(start_pos, end_pos)
        raise "No piece at start position" if self[start_pos] == nil
        raise "End position invalid" unless self[end_pos] == nil
        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end
end
