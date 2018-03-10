class TodoItem < ApplicationRecord
  belongs_to :todo_container, optional: true
  has_one :user, through: :todo_container
end
