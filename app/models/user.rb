class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true

  has_secure_password
  has_one :todo_container, dependent: :destroy
  has_many :todo_items, through: :todo_container

  def self.confirm(params)
    @user = User.find_by(username: params[:user][:username])
    @user ? @user.authenticate(params[:user][:password]) : false
  end

end
