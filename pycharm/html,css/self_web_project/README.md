# hizzeomi-web(html, css)

=> online artist gallery and shop
## 기본구조(header: 로고, 메뉴바 공통 ->  contents(페이지마다 변동) -> footer 로고, 홈페이지 정보 공통))
font stlye: 미정

## 1. main => (about, works, shop, contact)
### header( logo, menu, music)
### contents{[main image | video(iframe, youtube)] | gif(움짤)] 중 택1 }
### footer(로고, 홈페이지 정보)

## 1-1.about
### header( logo, menu, music)
### contents(히쩌미&만두부 소개, 추구하는 그림 스타일, 다른 채널들(유튭, 인스타, 블로그, 그라폴리오))
### footer(로고, 홈페이지 정보)


## 1-2.works 
### header( logo, menu, music))
### contents(artworks 4columns grid )
### footer(로고, 홈페이지 정보)

## 1-2-1. detail(1,2,3,4.....n)
### header( logo, menu, music)
### contents1: (2 rows 구조 좌우 margin 높게)
### contents2: (contents1 하단에 works 화면을 그대로 배치 or 8 columns 구조로 더 축소하여 배치)
### footer(로고, 홈페이지 정보)


## 1-3.shop: 네이버스토어 연동
### header( logo, menu, music)
### contents:
### footer(로고, 홈페이지 정보)

## 1-4.contact
### header( logo, menu, music)
### contents: 이메일, 인스타그램 혹은 qr코드 활용한 어떤 연락방식 고려
### footer(로고, 홈페이지 정보)


## 해결과제========================================================================================================================================================

### 1. main page:
1. music: autoplay크롬에서 맊아둠 => 접속 처음에 alert로 음악재생 여부 묻는 기능 추가하기
2. main image: *random으로 works에서 뽑아오는 기능 넣으면 좋을듯
3. video 넣을때 크롬에서 autoplay 맊아둠, 추천영상 안뜨게하는 기능도 맊힘 ==> (영상 mute 추가해서 자동재생 실시, 유튭 플레이리스트별로 묶어두면 그 리스트 속 영상만 추천됨)

### 2. work page:
1. *시간순서로 배열, 연도별 혹은 category 별로 나눠서 볼 수 있도록 하면 좋을듯 => img파일명 혹은 id로 date 정보와 category 정보사용


### 3. shop page:
1 .네이버스토어 연동(새로 tab 생기도록 or *네이버스토어 화면을 그대로 가져올 수 있으면 더 좋을듯)

### 4. contact page:
1. qr코드로 바로 이메일 혹은 연락취해지는 방식 실시하면 좋아보임


### 5. pop up창으로 제작하고 싶은 굿즈 추천

### 6. 정적사이트, 동적사이트: 호스팅 및 도메인 연결
