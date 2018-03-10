class CreateTodoContainers < ActiveRecord::Migration[5.1]
  def change
    create_table :todo_containers do |t|
      t.boolean :displayCompleted
      t.integer :count
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
