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

    def initialize(name, title, salary, boss)

        @employees = []

    end

    def bonus(multiplier)

        # salaries = @employees.map { |employee| employee.salary}
        results = []
        until @employees.empty?

            current = @employees.shift
            if current.employees.empty?
                results << current.salary
            else
                @employees.concat(current.employees)
                results << current.salary
            end
           
        end

        results.sum * multiplier

    end

end