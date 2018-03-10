class TodoContainer < ApplicationRecord
  belongs_to :user, optional: true
  has_many :todo_items, dependent: :destroy
end
