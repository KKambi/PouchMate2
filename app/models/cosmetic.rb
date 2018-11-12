class Cosmetic < ApplicationRecord

	# 유저와 화장품은 one-to-many
	belongs_to :user

	# 1명의 유저는 Best 테이블에 여러 번 입력된다.
	# 1개의 화장품은 Best 테이블에 1번만 입력된다. 
	# (Cosmetic 테이블의 화장품은 그 유저의 것이므로)
	has_one :best
	has_one :best_user, through: :bests, source: :user


	# 빈 값이 DB에 들어가는 것을 방지
	validates :title, :category, presence: true
end
