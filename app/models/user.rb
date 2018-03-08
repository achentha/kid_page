class User < ApplicationRecord
  validates :first_name, :last_name, :username, presence: true
  validates :username, uniqueness: true
  has_secure_password

  def self.confirm(params)
    @user = User.find_by(username: params[:user][:username])
    @user ? @user.authenticate(params[:user][:password]) : false
  end

end
