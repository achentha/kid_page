class TodoItems < ActiveRecord::Migration[5.1]
  def change
    create_table :todo_items do |t|
      t.text :description
      t.boolean :completed
      t.datetime :due
      t.belongs_to :todo_container, foreign_key: true

      t.timestamps
end

  end
end
