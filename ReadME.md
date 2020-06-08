대체로 관계형 데이터베이스 RDBMS(Relational DataBase Management System)


대형 DB2
중대형 - Oracle / MSQQL
중형 - MySQL / MariaDB
소형 - SQLite / Access

Oracle - 범위 - 튜닝(DBA)

저장구조
    DB - 폴더 역할
        Table - 실제 데이터가 저장되는 곳. 데이터 저장소. 엑셀과 거의 같음
        row(행) - 데이터
        Column(열) - 데이터의 구분

서비스 숨겨져서 실행
    -> 서버 (아이피, 포트, 사용자 아이디, 비밀번호)
    -> 클라이언트
    
    => 이 두개를 묶어 C/S라고 부름
    서버와 클라이언트가 같은 컴퓨터에 존재할 필요는 없다.

클라이언트 <- CRUD (Create, Read, Update, Delete-> 서버와 원격으로 연결
                테이블 존재
SQL(Structured Query language) - 데이터를 관리하기 위해 설계된 특수 목적의 프로그래밍 언어.
SQL은 클라이언트를 통해 서버에 명령을 준다.

데이터베이스 관련
모델러
    데이터베이스 구성(Architecture) - 구조론만 알면 됨
관리자(DBA)
    유지보수 - 모든 걸 할줄 알아야 함
프로그래머
    응용프로그램 제작자(CRUD SQL)


MariaDB
Service Name : MariaDB
root / 123456
TCP port : 3306

클라이언트 툴 만들기
    Program files > MariaDB 10.3 > bin > Open CMD(Powershell은 안됨) > mysql -u root -p > 비밀번호 입력

데이터베이스 서버