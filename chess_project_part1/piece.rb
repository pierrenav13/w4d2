require_relative 'modules.rb'
class Piece 
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    # def valid_moves
    #     self.moves(@pos).select do |ele|
    #         ele.none?{ |i| i < 0 } &&
    #         ele.none?{ |i| i > 7 }
    #     end
    # end
end

class King < Piece
    attr_reader :symbol

    include Stepable

    protected
    def move_diffs
        result = []
        (0..-1).each do |i|
            (0..-1).each do |i2|
                result << [i, i2]
            end
        end
        result
    end



end