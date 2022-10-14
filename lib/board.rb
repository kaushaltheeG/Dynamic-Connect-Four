class Board

    attr_reader :max_height

    def self.build_stacks(n)
        Array.new(n) {Array.new(0)}
    end

    def initialize(num_stack, height)
        raise ArgumentError.new "rows and cols must be >= 4" if num_stack < 4 || height < 4
        @max_height = height
        @stacks = Board.build_stacks(num_stack)
    end
    
    def add(token, idx)
        return false if @stacks[idx].length >= @max_height
        @stacks[idx] << token
        true
    end

    def vertical_winner?(token)
        @stacks.each do |col|
            return true if col.count(token) == @max_height
        end 
        false
    end

    def horizontal_winner?(token)
        hash = Hash.new #{|h,k| h[k]=[]}

        @stacks.each do |col|
            col.each.with_index do |ele, i| 
                hash.include?(i) ? hash[i] << ele : hash[i] = [ele]
            end
        end 

        rows = hash.values
        rows.each {|row| return true if row.count(token) == @stacks.count} 
        false
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end










    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end

# b = Board.new(0, 4)
# b.print

# b2 = Board.new(5, 4)
# b2.print

p Board.build_stacks(0).length
