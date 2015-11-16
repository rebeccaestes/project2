class User < ActiveRecord::Base
  # has_many :attendances
  # has_many :concerts, through: :attendances
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
