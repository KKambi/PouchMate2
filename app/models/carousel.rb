class Carousel < ApplicationRecord
  # 1개의 화장대는 1명의 유저에 속한다.
  belongs_to :user

  # 1개의 화장대는 1개의 화장대배경에 속한다.
  belongs_to :carousel_background

  # 1개의 화장대에는 여러 개의 화장품이 속할 수 있다.
  has_many :cosmetics
end
