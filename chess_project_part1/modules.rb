module Stepable
    def moves(start_pos)
        moves = []
        self.move_diffs.each do |ele|
            moves << [start_pos.first + ele.first, start_pos.last + ele.last]
        end
        moves
    end

    private
    def move_diffs

    end



end