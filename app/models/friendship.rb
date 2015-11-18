class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  validates_uniqueness_of :friend, scope: :user
  validate :check_user
  def check_user
   	if self.friend_id == self.user_id
   	  errors.add(:friend, "can't befriend yourself")
   	end
  end
end