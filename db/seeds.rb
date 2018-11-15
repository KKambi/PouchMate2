# seeds 사용 방법
#1 rake db:migrate -> rake db:seed
#2 rake db:setup

# 화장품 카테고리 default value
skincare = Category.create(name: '기초 스킨케어')

skincare_skin = Category.create(name: '스킨', parent: skincare)
skincare_loation = Category.create(name: '로션', parent: skincare)
skincare_essence = Category.create(name: '에센스', parent: skincare)
skincare_cream = Category.create(name: '크림', parent: skincare)
skincare_mist = Category.create(name: '미스트', parent: skincare)
skincare_faceoil = Category.create(name: '페이스오일', parent: skincare)

cleanser = Category.create(name: '클렌징')

cleanser_foam = Category.create(name: '클렌징 폼', parent: cleanser)
cleanser_water = Category.create(name: '클렌징 워터', parent: cleanser)
cleanser_oil = Category.create(name: '클렌징 오일', parent: cleanser)
cleanser_cream = Category.create(name: '클렌징 크림', parent: cleanser)
cleanser_remover = Category.create(name: '포인트리무버', parent: cleanser)
cleanser_scrub = Category.create(name: '필링/스크럽', parent: cleanser)

base = Category.create(name: '베이스메이크업')

base_basic = Category.create(name: '기초 메이크업', parent: base)
base_basic_makeup_base = Category.create(name: '메이크업베이스', parent: base_basic)
base_basic_primer = Category.create(name: '프라이머', parent: base_basic)

base_tone = Category.create(name: '피부톤 메이크업', parent: base)
base_tone_cushion = Category.create(name: '쿠션', parent: base_tone)
base_tone_foundation = Category.create(name: '파운데이션', parent: base_tone)
base_tone_bb = Category.create(name: '비비/CC', parent: base_tone)
base_tone_concealer = Category.create(name: '컨실러', parent: base_tone)

base_finish = Category.create(name: '마무리', parent: base)
base_finish_powder = Category.create(name: '파우더/팩트', parent: base_finish)
base_finish_highlight = Category.create(name: '하이라이트/세이딩', parent: base_finish)
base_finish_fixer = Category.create(name: '메이크업픽서', parent: base_finish)

color = Category.create(name: '색조 메이크업')

color_eye = Category.create(name: '아이', parent: color)
color_eye_shadow = Category.create(name: '아이섀도', parent: color_eye)
color_eye_liner = Category.create(name: '아이라이너', parent: color_eye)
color_eye_brow = Category.create(name: '아이브로우', parent: color_eye)
color_eye_mascara = Category.create(name: '마스카라/픽서', parent: color_eye)

color_lip = Category.create(name: '립', parent: color)
color_lip_stick = Category.create(name: '립스틱', parent: color_lip)
color_lip_tint = Category.create(name: '립틴트/립글로스/락커', parent: color_lip)
color_lip_balm = Category.create(name: '립케어/립밤', parent: color_lip)

color_blusher = Category.create(name: '블러셔', parent: color)

bodyhair = Category.create(name: '바디/헤어')
bodyhair_body = Category.create(name: '바디 보습', parent: bodyhair)
bodyhair_handfoot = Category.create(name: '핸드/풋', parent: bodyhair)
bodyhair_hair = Category.create(name: '헤어', parent: bodyhair)

perfume = Category.create(name: '향수')
others = Category.create(name: '기타')


# 화장대 배경 default value
CarouselBackground.create(name: '배경1', img_address: '/back-1.jpg')

CarouselBackground.create(name: '배경2', img_address: '/back-2.jpg')

CarouselBackground.create(name: '배경3', img_address: '/back-3.jpg')