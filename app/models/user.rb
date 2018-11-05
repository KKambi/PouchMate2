class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable




  # 친구신청 관련 N:N
  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend

  # 친구관리 기능 관련 N:N
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships


  # remove_friend는 User 클래스의 메소드이고, argument로 friend객체(=User객체)를 받는다.
  def remove_friend(friend)
    self.friends.destroy(friend)
  end
end
