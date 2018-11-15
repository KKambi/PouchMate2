class CarouselBackground < ApplicationRecord
	# 1개의 화장대배경은 여러 개의 화장대를 가질 수 있다.
	has_many :carousels

end
