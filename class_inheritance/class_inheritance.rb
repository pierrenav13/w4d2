class Employee
    attr_reader :boss, :salary

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end

    

end


class Manager < Employee
    attr_reader :juniors

    def initialize(name, title, salary, boss = nil, *employees)
        super(name, title, salary, boss)
        @juniors = []
    end

    def bonus(multiplier)
        sum = @juniors.inject {|a, b| a.salary + b.salary}
        sum * multiplier
    end

    def add_juniors(*employees)
        employees.each do |el|
            if el.is_a?(Manager) && el.boss == self
                el.juniors.each {|employee| @juniors << employee}
            elsif el.boss == self
                @juniors << el
            end
        end
    end

    
end

ned =  Manager.new('Ned', 'Founder', 1000000)
darren = Manager.new('Darren', 'TA Manager', 78000, ned)
shawna = Employee.new('Shawna', 'TA', 12000, darren)
david = Employee.new('David', 'TA', 10000, darren)

darren.add_juniors(shawna, david)


ned.add_juniors(darren)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)