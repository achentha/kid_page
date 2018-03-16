class TodoItemsController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    if @user.nil?
      flash[:error] = "Fail to find user id #{params[:id]}"
      return
    end
    @TodoItems = @user.todo_container.todo_items.order(:due)
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
    todo.completed = false
    todo.todo_container = @user.todo_container
    todo.todo_container.count += 1
    todo.todo_container.save
    if todo.save
      @TodoItems = @user.todo_container.todo_items
      redirect_to todos_path(@user.id)
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    @todo = TodoItem.find_by(id: params[:todo_id])
  end

  def set_complete
    user = User.find_by(id: params[:id])
    todo = TodoItem.find_by(id: params[:todo_id])
    todo.completed = true
    todo.save
    redirect_to todos_path user
  end

  def clear_complete
    user = User.find_by(id: params[:id])
    todo = TodoItem.find_by(id: params[:todo_id])
    todo.completed = false
    todo.save
    redirect_to todos_path user
  end

  def update
    user = User.find_by(id: params[:id])
    todo = TodoItem.find_by(id: params[:todo_id])
    todo.update_attributes(todo_params)
    redirect_to todos_path user
  end

  def destroy
    user = User.find_by(id: params[:id])
    todo = TodoItem.find_by(id: params[:todo_id])
    todo.destroy
    user.todo_container.count -= 1
    user.todo_container.save
    redirect_to todos_path user
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :completed, :due)
  end

end
