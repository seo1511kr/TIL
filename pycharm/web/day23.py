# SSL(Secure Socket Layer)플토콜을 이용하여 서버와 클라이언트가 비밀통신
# 카카오 문자열 압축문제 더 효율적으로 해보기!
# while + for문을 사용했는데 그러지 말고 그냥 for문 하나로 해결 가능할듯.


# 장고
# 장고 서버 실행
# 개발시간 단축, 완성도 상당히 높음
#
# 웹 프레임워크
#
# 쿠키,로그인,로그아웃,DB 등 관리
# 쿠키:(내 인터넷 활동의 부스러기)
# 아이디 저장, 자동 로그인, 사이트 방문시 팝업창 안보기 설정 등
# DBMS: 검색 추가 삭제 갱신
#
# 다양한 해킹 종류에 대한 기본적인 보안 적용가능
# sql 명령문의 취약성을 노리는 공격
# 게시판을 이용한 공격(window.onload)
# (location href등)
#
# 관리자계정 만들기 등

# 설치
# 1. 파이썬 설치
# (cmd 창에서 python 실행 후 빠져나갈 떄 ctrl+break)
# 2. path설정
# 제어판->시스템->고급->환경변수설정->path(파이썬 path찾아서입력)
#
#
# 3. 가상환경 설정
#
# 가상환경: 프로젝트를 독립적으로 수행하기 위해 사용
# ex)개발 프로젝트가 2개(A-2.7버전 개발, B-3.8버전 개발)가 있는 경우
# 3.8버전 2.7버전이 모두 컴퓨터에 설치됨 명령을 내릴때마다 2.7에서 실행할지 3.8에서 실행할 지 지시해야함
# 이러한 상황에서 가상환경(독립된)을 설정하면, A가상환경에서 작업한 내용은 모두 2.7로 실행되고
# B가상환경에서 작업한 내용은 모두 3.8로 실행됨 파이썬 버전뿐만 아니라 모듈등도 모두 독립적으로 설치됨
#
# 3-1 가상환경 설치를 위한 디렉토리 생성, 이동
# 3-2 해당 디렉토리에서 가상환경 생성
#     python -m venv mysite
#     python(파이썬으로) -m(모듈을사용해라) venv(venv라는) mysite(설정하고 싶은 가상환경이름)
# 3-3 cd mysite(가상환경 디렉토리로 이동)
# 3-4 dir(Scripts 폴더가 생성되었는지 확인)
#     Scripts 폴더 안에 activate명령어가 있음
# 3-5 cd Scripts(Scripts 폴더로 이동)
# 3-6 activate
# (mysite) C:\Users\19178\venvs\mysite\Scripts> 앞에 (mysite)가 생기면서 가상환경에 입장함
# + deactivate(가상환경에서 빠져나가는 명령어)
#
# ====가상환경======================================================
# 4. 장고설치(가상환경에)
# pip install django==3.1.3
#
# python -m pip install --upgrade pip
#
# 5.장고에서 프로젝트 만들기(웹사이트 1개가 프로젝트 단위)
# cd 프로젝트 생성할 위치
# mkdir project(루트폴더 생성,프로젝트 이름)
# cd project(루트폴더로 이동)
# mkdir mysite(프로젝트 디렉토리 생성)
# cd mysite(프로젝트 디렉토리로 이동)
# django-admin startproject config .(프로젝트 생성, .은 현재 디렉토리를 의미함)
# dir(확인하기 config와 manage.py가 있는지)
# python manage.py runserver(mysite프로젝트 디렉토리 안에서 서버 구동)
# 디폴트는 8000번 포트
# runserver 뒤에 포트를 설정해줄 수 있음
# http://127.0.0.1:8000/ (웹브라우저에 입력, 로켓화면 뜨는지 확인)
# ctrl + c (or break 는 웹서버 중단)
#
# 배치파일 가상환경에 설정하기
# ==> 이따 더 해보기
#
# 파이참에서 프로젝트 열고 settings project => project interpreter => 톱니바퀴
# =>add => exsiting environment => ... => 가상환경 내의 Scripts 내의 python.exe파일 클릭

