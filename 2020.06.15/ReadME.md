java 언어
API         -> 드라이버(제작업체) -> 연결
java.sql*       *.jar

1. 드라이버 클래스
    org.mariadb.jdbc.Driver
2. How to Connect
    mysql -h 아이피 -u 아이디 -p 데이터베이스
    jdbc:mysql://ip:포트번호/데이터베이스명 

프로젝트 생성할 때 add external jar 옵션 넣기
클래스 패스(라이브러리 추가). 라이브러리는 뭐 나중에도 넣을 수 있음
(Build pass)

DB 동시접속 예방