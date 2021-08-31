require "byebug"
class Employee
    attr_reader :boss, :salary

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        if !@boss.nil?
            @boss.juniors << self
        end
    end

    def bonus(multiplier)
        @salary * multiplier
    end

    

end


class Manager < Employee
    attr_accessor :juniors

    def initialize(name, title, salary, boss = nil, *employees)
        super(name, title, salary, boss)
        @juniors = []
    end

    def bonus(multiplier)
        sum = 0
        @juniors.each do |ele|
            sum += ele.salary
            if ele.is_a?(Manager)
                sum += ele.bonus(1)
            end
        end
        sum * multiplier
    end
end

ned =  Manager.new('Ned', 'Founder', 1000000)
darren = Manager.new('Darren', 'TA Manager', 78000, ned)
shawna = Employee.new('Shawna', 'TA', 12000, darren)
david = Employee.new('David', 'TA', 10000, darren)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)