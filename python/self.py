from selenium import webdriver
from bs4 import BeautifulSoup
import time

driver = webdriver.Chrome("c:/scrap/chromedriver.exe")
url = "https://www.instagram.com/"
driver.get(url)
time.sleep(2)

emails = ["kelly_hipup", "hey.mr.sexy", "ggplot2021", "hello_limy", "kzy.kozy", "lim_b.rian", "kcs_koko"
          , "horang295", "yunhohoh0", "01037407978", "piz_a", "peak_official_kr", "artseekersweet",
          "theremyart", "bombstomach", "dooboopang", "artcodemachine", "artseeker88", "chrisartkim","injungyourart"]
password = ['sdfg#456', 'sdfg#456', 'sdfg#456', 'asdf@345', 'asdf@345', 'asdf@345', 'asdf@345',
            'dbsgh%464', 'dbsgh0!02', 'dbsgh0!02', 'dbsgh%464', 'kyh0102', 'dbsgh%464', 'dbsgh%464', 'dbsgh%464',
            'enqn1234', 'qwer!234', 'qwer!234', 'qwer!234', 'qwer!234']
print(emails.index("chrisartkim"))
print(password[emails.index("chrisartkim")])
for i in range(10, 20):
    print(emails[i],password[i])
    input_id = driver.find_element_by_css_selector("#loginForm > div > div:nth-child(1) > div > label > input")
    input_id.clear()
    input_id.send_keys(emails[i])
    input_pw = driver.find_element_by_css_selector("#loginForm > div > div:nth-child(2) > div > label > input")
    input_pw.clear()
    input_pw.send_keys(password[i])
    input_pw.submit()
    time.sleep(5)


    # 검색# ===================================================================================================================

    word = "leehyebni"
    url ="https://www.instagram.com/" + word  # 검색어 대입
    driver.get(url)
    time.sleep(4)


    # 게시물 클릭 # ===================================================================================================================
    #  rows=len(soup.select("div.Nnq7C.weEfm")) 로 1페이지 행 개수 확인가능 꽉차있으면 12개가 최대, 밑으로 내려가야함
    # div:nth-child(1) > div:nth-child(2) : 1행 2열
    first = driver.find_element_by_css_selector(
        "#react-root > section > main > div > div._2z6nI > article > div:nth-child(1) > div > div:nth-child(1) > div:nth-child(1) > a > div > div._9AhH0")
    first.click()
        #   첫 게시물 클릭할 때는 driver.find_element_by_css_selector("div._9AhH0")
        #         first.click()
    time.sleep(3)
    html = driver.page_source
    soup = BeautifulSoup(html, "html.parser")
    # 팔로우 check, 누르기=============================================================================================================
    # 본인계정으로 들어가면 코드가 달라서 오류가 발생할 수 있음! if 문으로 제외시켜주기
    if emails[i] != word:
        folowstatus = soup.select(
            "body > div._2dDPU.CkGkG > div.zZYga > div > article > header > div.o-MQd.z8cbW > div.PQo_0.RqtMr > div.bY2yH > button")[
            0].text
        print(folowstatus)
        if folowstatus == "팔로우":
            follow = driver.find_element_by_css_selector(
                "body > div._2dDPU.CkGkG > div.zZYga > div > article > header > div.o-MQd.z8cbW > div.PQo_0.RqtMr > div.bY2yH > button")
            follow.click()
        # 좋아요 check, 누르기=============================================================================================================
        likestatus = soup.select(
            "body > div._2dDPU.CkGkG > div.zZYga > div > article > div.eo2As > section.ltpMr.Slqrh > span.fr66n > button > div > span > svg")[
            0]["aria-label"]
        if likestatus == "좋아요":
            likes = driver.find_element_by_css_selector(
                "body > div._2dDPU.CkGkG > div.zZYga > div > article > div.eo2As > section.ltpMr.Slqrh > span.fr66n > button > div > span > svg")
            likes.click()
            time.sleep(2)  # sec:매크로 텀
        next = driver.find_element_by_css_selector(
            "body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a._65Bje.coreSpriteRightPaginationArrow")
        next.click()
        time.sleep(2)
        # 좋아요 check, 누르기 while 반복문 =================================================================================================
        s = 0
        while s < 1:  # 반복 수 지정
            html = driver.page_source
            soup = BeautifulSoup(html, "html.parser")
            if soup.select(
                    "body > div._2dDPU.CkGkG > div.zZYga > div > article > div.eo2As > section.ltpMr.Slqrh > span.fr66n > button > div > span > svg") == []:
                print(soup.select(
                    "body > div._2dDPU.CkGkG > div.zZYga > div > article > div.eo2As > section.ltpMr.Slqrh > span.fr66n > button > div > span > svg") == [])
                time.sleep(2)
                html = driver.page_source
                soup = BeautifulSoup(html, "html.parser")
            likestatus = soup.select(
                "body > div._2dDPU.CkGkG > div.zZYga > div > article > div.eo2As > section.ltpMr.Slqrh > span.fr66n > button > div > span > svg")[
                0]["aria-label"]
            print(likestatus)
            if likestatus == "좋아요":
                likes = driver.find_element_by_css_selector(
                    "body > div._2dDPU.CkGkG > div.zZYga > div > article > div.eo2As > section.ltpMr.Slqrh > span.fr66n > button > div > span > svg")
                likes.click()
                time.sleep(1)  # sec:매크로 텀
            next = driver.find_element_by_css_selector(
                "body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a._65Bje.coreSpriteRightPaginationArrow")
            next.click()
            time.sleep(3)
            s += 1
    # 게시물 창 끄기, 프로필 클릭, 로그아웃=============================================================================================
    driver.find_element_by_css_selector(
        "body > div._2dDPU.CkGkG > div.Igw0E.IwRSH.eGOV_._4EzTm.BI4qX.qJPeX.fm1AK.TxciK.yiMZG > button > div > svg").click()
    time.sleep(1)
    driver.find_element_by_css_selector(
        "#react-root > section > nav > div._8MQSO.Cx7Bp > div > div > div.ctQZg > div > div:nth-child(5) > span > img").click()
    time.sleep(2)
    driver.find_element_by_css_selector(
        "#react-root > section > nav > div._8MQSO.Cx7Bp > div > div > div.ctQZg > div > div:nth-child(5) > div.poA5q > div.uo5MA._2ciX.tWgj8.XWrBI > div._01UL2 > div:nth-child(6)").click()
    time.sleep(4)


