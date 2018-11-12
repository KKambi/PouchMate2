class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  #코멘트 관련 1:n 다은
  has_many :comments, dependent: :destroy

  # 프로필 사진 업로드할 수 있도록
  mount_uploader :profile_img, ProfileImgUploader




  # 1명의 사용자가 여러 개의 화장품 등록 + 탈퇴 시 등록한 화장품 삭제
  has_many :cosmetics, dependent: :destroy



  # 1명의 유저는 Best 테이블에 여러 번 입력된다.
  # 1개의 화장품은 Best 테이블에 1번만 입력된다. 
  # (Cosmetic 테이블의 화장품은 그 유저의 것이므로)
  has_many :bests
  has_many :best_cosmetics, through: :bests, source: :cosmetic



  # 친구신청 관련 N:N
  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend

  # 친구관리 기능 관련 N:N
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships






  # 닉네임, 이름 넣지 않으면 DB에 저장X
  validates :nickname, :age, :gender, presence: true





  # remove_friend는 User 클래스의 메소드이고, argument로 friend객체(=User객체)를 받는다.
  def remove_friend(friend)
    self.friends.destroy(friend)
  end

  def is_best? (cosmetic)
    Best.find_by(user_id: self.id, cosmetic_id: cosmetic.id).present?
  end
end
