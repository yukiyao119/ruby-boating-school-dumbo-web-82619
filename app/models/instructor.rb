class Instructor

    attr_reader :name
    @@all =  []

    def initialize(name)
        @name = name
        @@all << self
    end  

    def self.all
        @@all
    end 

    def pass_student(student, test_name)
        matched_tests = BoatingTest.all.select {|test| test.student == student && test.test_name == test_name}

        if matched_tests.size == 0
            student.add_boating_test(test_name, 'passed', self)
        else 
            matched_tests.each {|test| test.test_status = 'passed'}
        end
    end 

    def fail_student(student, test_name)
        matched_tests = BoatingTest.all.select {|test| test.student == student && test.test_name == test_name}

        if matched_tests.empty? == true
            student.add_boating_test(test_name, 'failed', self)
        else
            matched_tests.each {|test| test.test_status = 'failed'}
        end
    end 



        



end
