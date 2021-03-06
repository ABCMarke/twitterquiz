class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :groups_users, dependent: :destroy
  has_many :groups, through: :groups_users
  has_many :answers
  has_many :questions, through: :answers

  def score
  	self.answers.select{ |answer| answer.is_correct? == true }.count
  end
end
