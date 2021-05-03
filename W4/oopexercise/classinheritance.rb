class Employee
    attr_reader :salary
    def initialize(name, title, salary, boss)
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
    attr_reader :employees

    def initialize(name, title, salary, boss)

        @employees = []
        super

    end

    def bonus(multiplier)

        # salaries = @employees.map { |employee| employee.salary}
        results = []
        until @employees.empty?

            current = @employees.shift
            if (current.is_a?(Manager) && current.employees.empty?) || (!current.is_a?(Manager))
                results << current.salary
            else
                @employees.concat(current.employees)
                results << current.salary
            end
           
        end

        results.sum * multiplier

    end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
ned.employees << darren
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
darren.employees << shawna << david

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000