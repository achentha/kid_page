class TodoItemsController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    if @user.nil?
      flash[:error] = "Fail to find user id #{params[:id]}"
      return
    end
    @TodoItems = @user.todo_container.todo_items
  end

  def new
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.find_by(id: params[:id])
    if @user.nil?
      flash[:error] = "Fail to find user id #{params[:id]}"
      return
    end
    todo = TodoItem.new(todo_params)
    todo.todo_container = @user.todo_container

    if todo.save
      @TodoItems = @user.todo_container.todo_items
      redirect_to todos_path(@user.id)
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :completed, :due)
  end

end
