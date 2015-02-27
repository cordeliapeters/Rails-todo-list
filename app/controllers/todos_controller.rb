class TodosController < ApplicationController

  def index
    @todos = current_user.todos
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @new_todo = Todo.new(title: params[:todo][:title], description: params[:todo][:description], user_id: session[:user_id])
    if @new_todo.save
      redirect_to todos_path
    else
      @errors = "You need to complete all of the fields"
      render :new
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update_attributes(title: params[:todo][:title], description: params[:todo][:description])
    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end

end
