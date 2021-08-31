require_relative 'modules.rb'
require_relative "board.rb"

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

    def initialize(color, board, pos, symbol)
        super(color, board, pos)
        @symbol = symbol
    end

    protected
    def move_diffs
        result = []
        (-1..1).each do |i|
            (-1..1).each do |i2|
                result << [i, i2]
            end
        end
        result
    end
end

class Knight < Piece
    attr_reader :symbol
    include Stepable

    def initialize(color, board, pos, symbol)
        super(color, board, pos)
        @symbol = symbol
    end

    protected
    def move_diffs
        [[2, 1]
        [2, -1]
        [-1, 2]
        [-1, -2]
        [1, 2]
        [1, -2]
        [-2, 1]
        [-2, -2]
        ]
    end
end

class Rook < Piece
    attr_reader :symbol
    include Slidable

    def initialize(color,board,pos,symbol)
        super(color,board,pos)
        @symbol = symbol
    end

    protected
    def move_dirs
        HORIZONTAL_ARRAY
    end
end

class Bishop < Piece
    attr_reader :symbol
    include Slidable

    def initialize(color,board,pos,symbol)
        super(color,board,pos)
        @symbol = symbol
    end

    protected
    def move_dirs
        DIAGONAL_ARRAY
    end
end

class Queen < Piece
    attr_reader :symbol
    include Slidable

    def initialize(color,board,pos,symbol)
        super(color,board,pos)
        @symbol = symbol
    end

    protected
    def move_dirs
        DIAGONAL_ARRAY + HORIZONTAL_ARRAY
    end
end

class NullPiece < Piece
    attr_reader :symbol
    include Singleton

    def initialize
        @symbol = " "
    end

    def moves
    end
end

class Pawn < Piece
    attr_reader :symbol

    def initialize(color,board,pos,symbol)
        super(color,board,pos)
        @symbol = symbol
    end

    def moves
        result = []
        self.forward_steps.each do |pos|
            result << [self.pos.first + pos.first, self.post.last + pos.last]
        end
        self.side_attack.each do |pos|
            result << [self.pos.first + pos.first, self.pos.last + pos.last]
        end
        result
    end

    private
    def at_start_row?
        @pos.first == 2
    end

    def forward_dir
        if @color == "white"
            return -1
        else
            return 1
        end
    end

    def forward_steps
        result = []
        if self.at_start_row?
            result << [0, self.forward_dir], [0, self.forward_dir * 2]
        else
            result << [0, self.forward_dir]
        end
        result
    end

    def side_attack
        result = []
        result << [self.forward_dir, self.forward_dir], [self.forward_dir, -(self.forward_dir)]
        result
    end
end