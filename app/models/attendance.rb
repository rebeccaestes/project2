class Attendance < ActiveRecord::Base
  belongs_to :concert
  belongs_to :user
end
