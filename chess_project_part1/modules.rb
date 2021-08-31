# require_relative 'piece.rb'

module Stepable
    def moves(start_pos)
        moves = []
        self.move_diffs.each do |ele|
            moves << [self.pos.first + ele.first, self.pos.last + ele.last]
        end
        moves
    end

    private
    def move_diffs
    end
end

module Slidable

    def moves
        moves = []
        self.moves_dirs.each do |ele|
            moves << [self.pos.first + ele.first, self.pos.last + ele.last]
        end
        moves
    end
    
    def horizontal_dirs
        directions = []
        (-8..8).each do |ele|
            directions << [0, ele] unless ele == 0
            directions << [ele, 0] unless ele == 0
        end
        direction
    end

    def diagonal_dirs
        directions = []
        (-8..8).each do |ele|
            (-8..8).each do |ele1|
                directions << [ele, ele2] unless ele == 0 || ele1 == 0
            end
        end
        directions
    end
    
    private
    HORIZONTAL_ARRAY = self.horizontal_dirs
    DIAGONAL_ARRAY = self.diagonal_dirs

    def move_dirs
    end

end