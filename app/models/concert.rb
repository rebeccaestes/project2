class Concert < ActiveRecord::Base
	# has_many :users, through: :attendances
	belongs_to :venue
	has_many :attendances
	has_many :users, through: :attendances
end
