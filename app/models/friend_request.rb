class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  # 친구신청을 받아들여 Friendships table에 편입시킨뒤, 신청기록을 없애는 메소드
  def accept
    user.friends << friend
    destroy
  end




  # add some validations to the models (uniqueness and presence)
  validates :user, presence: true
  validates :friend, presence: true, uniqueness: { scope: :user }

  # self-association을 막기 위한 코드(not_self)
  validate :not_self

  # 이미 보낸 친구신청이나, 이미 존재하는 친구에게 신청하는걸 막기 위한 코드(not_friends, not_pending)
  validate :not_friends
  validate :not_pending







private
  def not_self
    errors.add(:friend, "can't be equal to user") if user == friend
  end

  def not_friends
    errors.add(:friend, 'is already added') if user.friends.include?(friend)
  end

  def not_pending
    errors.add(:friend, 'already requested friendship') if friend.pending_friends.include?(user)
  end
end
