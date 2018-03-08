class AddDisplayCompletedTodoFlagToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :displayCompletedTodoFlag, :boolean
  end
end
