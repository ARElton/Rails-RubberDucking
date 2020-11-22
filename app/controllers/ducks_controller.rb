class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def new
    @duck = Duck.new 
    @students = Student.all 
  end

  def create
    @duck = Duck.create(duck_params)
      if @duck.valid?
        redirect_to @duck
      else
        flash[:errors] = @duck.errors.full_messages 
        redirect_to new_duck_path
      end
  end

  def show
    @duck = Duck.find(params[:id])
  end

  def edit 
    @students = Student.all 
    @duck = Duck.find(params[:id])
  end 

  def update
    @duck = Duck.find(params[:id])
    @duck.update(duck_params)

    redirect_to duck_path(@duck)
  end

  private 

  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end


end
