def maxcom(x):
    num_list = []

    for i in x:  # (9,52,30,55,30)

        num = str(i)

        num_split = list(num)

        num_list.append(num_split)  # [['9'], ['5', '2'], ['5', '5'], ['3', '0'], ['3', '0']]

    first_list = []

    for i in num_list:
        first_list.append(i[0])

    first_list.sort()

    first_list.reverse()  # ['9', '5', '5', '3', '3'] 맨 앞자리 내림차순 정렬

    final = list(range(len(num_list)))  # 숫자 개수만큼의 자리 만들기

    index_list = []

    for i in num_list:

        index = first_list.index(i[0])  # 맨 앞자리 배치 순서를 인덱스로 활용

        ## ===맨 앞자리의 값이 동일할 때 에러방지를 위해 인데스를 조정해주는 과정=============

        # 인덱스는 왼쪽에서부터 찾음

        if first_list.count(i[0]) >= 2:  # 맨 앞자리가 같은 수가 2개 이상이라면

            # ['9', '5', '5', '3', '3'] 에서 앞자리가 5인 수는 모두 인덱스가 1이 됨

            l = [j for j in num_list if i[0] in j[0]]

            sortnum = []

            for k in l:  # [['5', '2'], ['5', '5']]

                joinnum = "".join(k)

                sortnum.append(joinnum)  # ['52','55']

            sortnum.sort()

            sortnum.reverse()  # ['55','52'] 순서정렬

            id = "".join(i)

            addindex = sortnum.index(id)  # 여기서 추가인덱스가 55는 0, 52는 1이됨

            index += addindex  # 앞자리가 5인 숫자의 기존 인덱스인 1에 각각 0,1을 더함

            index_list.append(index)  # 따라서 55는 1+0=1, 52는 1+1=2 의 인덱스가 주어짐

            ## ===중복되는 수 에러방지 [['3', '0'], ['3', '0']]=========================

            # 중복되는 수가 있는 경우 두 수가 같은 인덱스를 갖게되어

            # 합쳐질 때 오류가 발생함

            if index in index_list:
                addadd = index_list.count(index) - 1

                # 동일한 값이 먼저 인덱스를 부여받으면

                # 뒤늦게 인덱스를 부여받는 숫자는 앞에 먼저 인덱스를 부여받은 동일값의

                # 개수만큼 인덱스를 더해줌

                index += addadd  # 30이 두개일 때 첫번째 30이 3이라는 인덱스를 부여받으면

                # 두번째 30은 3+1의 인덱스를 부여받게됨

                # 30이 4개 있다면 마지막 30은 3+ (4-1)의 인덱스를 부여받게 되는것

        final[index] = i

    print(final)

    solve = []

    for i in final:
        solve.extend(i)

    return "".join(solve)


num = [9, 55, 30, 52, 30]

maxcom(num)
# 2.
# 4개의 직사각형이 평면에 있는데 밑변이 모두 가로축에 평행하다. 이 직사각형들이 차지하는 면적을 구하는 프로그램을 작성하시오. 이 네 개의 직사각형들은 서로 떨어져 있을 수도 있고 겹쳐 있을 수도 있다. 또한 하나가 다른 하나를 포함할 수도 있으며, 변이나 꼭지점이 겹쳐질 수도 있다.
#
# 입력형식 하나의 직사각형은 왼쪽 아래의 꼭지점과 오른쪽 위의 꼭지점의 좌표로 주어진다. 입력은 네 줄이며, 각 줄은 네 개의 정수로 하나의 직사각형을 나타낸다. 첫 번째와 두 번째의 정수는 사각형의 왼쪽 아래 꼭지점의 x좌표, y좌표이고, 세 번째와 네 번째의 정수는 사각형의 오른쪽 위 꼭지점의 x좌표, y좌표이다. 단, x좌표와 y좌표는 1 이상이고 1000 이하인 정수이다.
#
# 출력형식 화면에 4개의 직사각형이 차지하는 면적을 출력한다.
#
# 입력예제 1 2 4 4 2 3 5 7 3 1 6 5 7 3 8 6
#
# 출력예제 26 -->



fst=[1,2,4,4]

snd=[2,3,5,7]

trd=[3,1,6,5]

fth=[7,3,8,6]

lecinfo=[fst,snd,trd,fth]



x_start=[]

for i in lecinfo:

    x_start.append(i[0])

big_x_start=min(x_start)

y_start=[]

for i in lecinfo:

    y_start.append(i[1])

big_y_start=min(y_start)

x_end=[]

for i in lecinfo:

    x_end.append(i[2])

big_x_end=max(x_end)

y_end=[]

for i in lecinfo:

    y_end.append(i[3])

big_y_end=max(y_end)

big_lec_info=(big_x_start,big_y_start,big_x_end,big_y_end)

print(big_lec_info)



all_y_block=[]

for i in lecinfo:

    all_y_block.append(list(range(i[1],i[3])))

print(all_y_block)





y_list=[]

for i in range(big_y_start,big_y_end):

    which_lec=[]

    for j in range(len(all_y_block)):

        if i in all_y_break[j]:

            which_lec.append(j+1)

    info_list=[len(which_lec),which_lec]

    y_list.append(info_list)

print(y_list)



length_list=[]

for i in y_list:

    all_x_list=[]

    for j in i[1]:

        min_x_list=list(range(lecinfo[j-1][0],lecinfo[j-1][2]))

        for k in min_x_list:

            if k not in all_x_list:

                all_x_list.append(k)

    print(all_x_list)

    length_list.append(len(all_x_list))

sum(length_list)

print(lecinfo)



print(sum(length_list))


# 각 행이 하나의 층(y)라고 보면 됨
#
# [3, 4, 5]              1층(y=1~2): x=3~4~5~6 :3칸
#
# [1, 2, 3, 4, 5]       2층(y=2~3) x=1~2~3~4~5~6: 5칸
#
#  [1, 2, 3, 4, 5, 7]   3층(y=3~4) x=1~2~3~4~5~6, 7~8: 6칸
#
#  [2, 3, 4, 5, 7]      4층(y=4~5) x=2~3~4~5~6, 7~8: 5칸
#
#  [2, 3, 4, 7]         5층 (y=5~6)   x=2~3~4~5, 7~8 4칸
#
# [2, 3, 4]               6층(y=6~7) x=2~3~4~5 :3칸



# 3. 현재 페이지에 출력된 질문의 '제목' 부분을 모두 추출하여 출력하시오.

# 참고주소) 1페이지 https://stackoverflow.com/questions/tagged/python

# 설치===========================================================

from selenium import webdriver

import time

from bs4 import BeautifulSoup

driver=webdriver.Chrome("c:/scrap/chromedriver.exe")

# 설치===========================================================



url="https://stackoverflow.com/questions/tagged/python"

driver.get(url)



html=driver.page_source

soup=BeautifulSoup(html,"html.parser")



soup.select("div.summary > h3 > a")



print(len(soup.select("div.summary > h3 > a")))

for i in soup.select("div.summary > h3 > a"):

    print("제목:",i.text)

# 4. 검색 포털 사이트 '네이버'에 있는 영화 댓글을 추출하시오.(가능하면 여러 페이지 추출도 ok)
#
# https://movie.naver.com/ 에서
#
# 원더우먼984들어간 후
#
# 리뷰 출력하기
#
# https://movie.naver.com/movie/bi/mi/review.nhn?code=163834&page=1
#
# (1페이지)

#===============================================================

from selenium import webdriver

from bs4 import BeautifulSoup

driver=webdriver.Chrome("c:/scrap/chromedriver.exe")


# 설치===========================================================

url="https://movie.naver.com/"

driver.get(url)#접속



#원더우먼 상세페이지 접속 버튼 경로

rankBtn="#RESERVE_tab > a > em"

driver.find_element_by_css_selector(rankBtn).click()

time.sleep(2)

movieBtn="#flick0 > li.item1 > div.obj_off.tab4 > a > span.mask"

driver.find_element_by_css_selector(movieBtn).click()

time.sleep(2)



reviewBtn="#movieEndTabMenu > li:nth-child(6) > a > em"

driver.find_element_by_css_selector(reviewBtn).click()

time.sleep(2)



#상세페이지 html 소스 긁어와서 soup에 저장

html=driver.page_source

soup=BeautifulSoup(html,"html.parser")



# 상세페이지 리뷰 리스트 개수 검색

reviewlists=soup.select("#reviewTab > div > div > ul > li")

numlist=len(soup.select("#reviewTab > div > div > ul > li"))#한페이지에 리뷰목록 개수: 10개



#각 리뷰 클릭해서 리뷰 세부내용 텍스트만 전부 스크랩 roop

for i in range(1,numlist+1):

    driver.find_element_by_css_selector("#reviewTab > div > div > ul > li:nth-child(%d) > a"%i).click()

    #i 번째 리뷰 상세보기 클릭 (1~10까지)

    time.sleep(2)

    html=driver.page_source

    soup=BeautifulSoup(html,"html.parser")

    #리뷰상세페이지에서 html soup객체로

    contents=soup.select("#content > div.article > div.obj_section.noline.center_obj > div.review > div.user_tx_area > p > span")

    print("%d 번째 리뷰:"%i)

    for content in contents:

        print(content.text)#리뷰에서 텍스트만 scrapping

    print("="*50)

    driver.find_element_by_css_selector("#content > div.article > div.obj_section.noline.center_obj > div.reple_btn_area > a").click()

    #목록으로 되돌아감