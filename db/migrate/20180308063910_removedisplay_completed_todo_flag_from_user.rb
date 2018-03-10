class RemovedisplayCompletedTodoFlagFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :displayCompletedTodoFlag, :boolean
  end
end
