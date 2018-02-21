class StudentsController < ApplicationController
    
    # def home
    #     @students = Dojo.students
    # end
    def new
        @dojos=Dojo.all
        @count = @dojos.size
        puts @count
    end
    def create
        Student.create(student_params)
        redirect_to '/'
    end
    def show
        @dojo = Dojo.find(params[:dojo_id])
        @student = Student.find(params[:id])
        if @dojo.students.length > 0
            puts @dojo.id.to_s
            startDate = @student.created_at
            # startDate = startDate[0, startDate.length-4]
            sql = "SELECT * FROM STUDENTS WHERE dojo_id = "+ @dojo.id.to_s
            #  + " AND DATE(created_at) = DATE(SELECT created_at FROM STUDENTS WHERE id = " +@student.id.to_s+ ")"
            @cohort = ActiveRecord::Base.connection.execute(sql)
            # ~>couldn't figure out the date stuff but I can figure it out with some more time
            @cohort.each do |cohort|
                puts "#{cohort['created_at']}"
            end

        else
            @cohort = 0
        end
        puts @dojo.students
        puts @student
        puts "cohort:"
        puts @cohort.class
    end
    def destroy
        Student.find(student_params[:id]).destroy
        redirect_to '/dojos/<%= @dojo.id %>'
    end
    def edit
        @dojos = Dojo.all
        @count = @dojos.count
        @dojo = Dojo.find(params[:dojo_id])
        @student = Student.find(params[:id])
    end
    def update
        @student = Student.find(params[:id])
        @dojo = Dojo.find(params[:student][:dojo])
        puts @dojo[:name]
        @student.update(student_params)
        @student.update(dojo: @dojo)
        
        redirect_to '/dojos/' + @dojo[:id].to_s + '/students/show/' + params[:id]
    end
    private
        def student_params
            params.require(:student).permit(:first_name, :last_name, :email)
        end
end
