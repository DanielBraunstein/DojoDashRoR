class DojosController < ApplicationController
    
    def home
        @dojos = Dojo.all
    end

    def new
    end
    
    def create
        @dojo = Dojo.create(dojo_params)
        redirect_to '/'
    end
    def show
        @dojo = Dojo.find(params[:id])
        if @dojo.students
            @students = @dojo.students.all
        else
            @students = 0
        end
    end
    def delete
        Dojo.find(params[:id]).destroy
        redirect_to '/'
    end
    def edit
        @dojo = Dojo.find(params[:id])
        @name = @dojo.name
        puts @dojo.name
    end
    def update
        puts "1"
        puts params[:id]
        puts "1.5"
        puts params
        puts "2"
        @dojo = Dojo.find(params[:id])
        puts "2.5"
        puts @dojo
        puts "3"
        puts dojo_params
        @dojo.update(dojo_params)
        redirect_to '/show/'+params[:id].to_s
    end
    private
        def dojo_params
            params.require(:dojo).permit(:name, :street, :state, :city)
        end
end
