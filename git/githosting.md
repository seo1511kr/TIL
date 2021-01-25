## 대용량 100 mb이상 파일을 깃에 add하면 error가 발생함

1. 바이너리로 나눠서 올려야함

   git lfs install 

   git lfs track "*.mp4" 

   git add . git commit -m "Add huge file"

   git push origin master

   

2. 이후에도 대용량 푸쉬 로그가 남아있으면 오류발생

   https://rtyley.github.io/bfg-repo-cleaner/

   BFG Repo-Cleaner다운로드 후

   x.x.x에는 파일버전

   java -jar bfg-x.x.x.jar --strip-blobs-bigger-than 100M

   

3. 그럼에도 오류가 난다면

   git repack && git gc 먼저 시행 후 다시



### 깃으로 웹사이트 호스팅 할 때 홈화면 파일명을 index.html로 해야함

아니면 404오류 뜨거나 readme파일 읽어버림



1. 깃으로는 동적 사이트는 호스팅 불가능
2. netlify로 호스팅하면 깃 연동도 가능하고 https도 가능



###  1프로젝트 1폴더를 원칙으로함

=> 파일탐색기, 보기 숨김 파일확장명, 숨긴항목 체크후 .git 검색하고 가장 바깥쪽 .git 빼고는 전부 삭제

혹시 하나의 리포디렉토리 안에 또다른 리포를 생성할 경우 오류발생



### Git Push "error: failed to push some refs to"

   local과 remote의 파일 상태가 다른경우 파일 손실의 우려로 발생

   git push -f origin master로 강제 push 할 경우 파일 손실 위험

   1. 먼저 pull로 remote를 내려받은 후 
2. merge하기

