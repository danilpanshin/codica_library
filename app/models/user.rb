class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = %w[admin book_moderator category_moderator guest].freeze

  def user_name
    self.email.split('@').first.capitalize
  end 
  
  def admin?
    self.role == 'admin'
  end

  def book_moderator?
    self.role == 'book_moderator'
  end

  def category_moderator?
    self.role == 'category_moderator'
  end

  def guest?
    self.role == 'guest'
  end
end
