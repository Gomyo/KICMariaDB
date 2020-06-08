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

mysql -h (ip_address) -u root -p : 이 아이피로 접속하겠다.
남의 ip를 쓰면 그 사람의 mysql으로 접속이 됨.

mysql client  
    <Command>
        show 
            databases; : print database list
            tables; : print table
        use {database_name} : 데이터베이스를 사용.  
        출력 : 'Database changed' 
    <SQL>
*SQL  
DML(Data Manipulation Language) : 데이터 조작  
    SELECT - 출력 : 가장 복잡함. 원하는 데이터를 출력하는 것이 쉽지 않다
    INSERT - 입력
    UPDATE - 수정 
    DELETE - 삭제
DDL(Data Definition Language) : 저장공간 조작 
    CREATE - 생성
    ALTER - 수정
    DROP - 삭제
DCL(Data Control Language) : 데이터 보안
    GRANT - 권한 부여
    REVOKE - 권한 회수
TCL(Transaction Control Language) : 트랜잭션 관리
    COMMIT
    ROLLBACK
    SAVEPOINT


* 데이터베이스 테이블 구조 (의미를 잘 파악하고 있어야 함!.)
dept        - 부서정보
    deptno  - 부서번호
    dname   - 부서이름
    loc     - 부서위치

emp         - 사원정보
    empno   - 사원번호
    ename   - 사원이름
    job     - 담당업무
    mgr     - 관리자
    hiredate- 입사일자
    sal     - 급여
    comm    - 상여금
    deptno  - 부서번호

salgrade    - 호봉정보
    grade   - 호봉등급
    losal   - 최저급여
    hisal   - 최고급여

SELECT 컬럼명, ....(여러개 가능, *:모든 컬럼) FROM 테이블(데이터저장소명)
1. 대소문자 구별없음
2. 문장끝은 ;
3. 엔터키를 통해서 정리해서 코딩(O) 한줄에 주르르륵 다 적지 말고 -->에 한줄씩 깰끔하고 좋음.

SELECT * 컬럼명: 컬럼의 모든 내용 출력
describe/desc 컬럼명 : 컬럼의 원소 출력

Q. 사원정보 테이블에서 사원이름, 사원번호, 급여를 출력하라
A. select ename, empno, sal from emp;

컬럼별칭(alias - 아리아스)
as를 쓰면 된다.
select empno as no from emp;
select empno as 사원번호 from emp;
select empno as '사원 번호' ~ 글자 사이를 띄우고 싶다면 ''로 묶어 줘야 한다.


* 산술연산자 사용 가능
select 1 + 1; 다른 언어와 같이 사칙연산이 가능. //(몫)은 안됨.

select sal, sal*12 from emp; 
컬럼의 모든 데이터에 *12가 적용됨. 숫자가 아닌 데이터의 경우 연산당하면 0이 되고 warning이 뜸

> desc를 해 보면 자료형이 존재한다는 것을 알 수 있음. 

자료형 구분

    숫자
        정수
            int(자리수 넣기 가능) ex) int(2) 2자리 정수
            bigint
        실수
            float(자리수 - 전체,소수부분) ex)decimal(7,2) :7자리 수, 두 번째 소수점까지
            double
            decimal
    문자
        고정문자열 - 데이터 변경이 있을 때는 고정문자열이 좋음
            char(자리수) 
        가변문자열 - 공간의 효율성이 좋음
            varchar(자리수) 
    날짜
        date - 날짜
        datetime - 날짜+시간

Q : '종류의 수'를 알고 싶을 때
A : 컬럼 앞에 distinct를 붙인다.
select distinct job from emp;

* 필터링 :특정 행만 선택해서 볼 수도 있다.

WHERE 컬럼명 비교연산자 값

WHERE 컬럼명 비교연산자 값 {논리연산자} WHERE 컬럼명 비교연산자 값 
위와 같이 여러 개의 조건도 필터링이 가능하다.

비교연산자
    =, !, < , > , <= ,>=
논리연산자
    기호로 표현(&&, ||)하지 않고 not, and, or 이렇게 쓴다.

30번 부서의 모든 사람
select * from emp where deptno=30;

급여가 2000 이상인 사람
select * from emp where sal>=2000;

select * from emp where job= 'manager';

select * from emp where job>'M';

select empno, ename, hiredate from emp where hiredate>= '2011-12-03';

논리연산자 조합

급여가 1000 이상이고, 2000 이하인 사원에 대한 사원번호, 사원이름, 급여
select empno, ename, sal from emp where sal>=1000 and sal<=2000;

사원명이 s로 시작하는 사원에 대한 사원번호, 사원이름, 급여
select empno, ename, sal from emp where ename>='s' and ename <'t';

10번부서나 20번부서 사원에 대한 사원번호, 사원이름, 급여, 부서번호 출력
select empno, ename, sal, deptno from emp where deptno=10 or deptno=20;


범위형
    컬럼명 between 하한 and 상한

select empno, ename, job from emp where sal between 1000 and 2000;

목록형

직책이 clerk, manager, salesman 사원에 대한 사원번호, 사원이름, 급여, 직책을 출력
select empno, ename, sal, job from emp where job in ('clerk','manager','salesman');