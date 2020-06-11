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

#### 2020.06.09
데이터베이스

시스템 구조
데이터베이스 클라이언트
    1. 자체 제공 클라이언트
        1. prompt
            접근환경설정: mysql
                - 사용자환경
                - 관리자환경
        2. Heidi : GUI 느낌

    2. Third Party - 상용화시켜서 파는 경우
        www.quest.com > toad

    * java - 연결관리자 제작 가능
<->
데이터베이스 서버(서비스 등록)
    관리 시스템
    데이터베이스(파일)
*
foreground process - 전면(일반적인 프로그램)
background process - 후면(백신):service(window같이 시작/종료)

* 데이터베이스의 분류
왜 이 DB를 쓰는가? = 중형에 쓸만하니까 MariaDB!
데이터베이스 관리자가 되고 싶다면 Oracle / DB2를 배워야. 자격증(ocp - ocm) sqld

* mariaDB

* 처음보는 데이터에 접근할 때 이 순서로
- 자바에서 UML이 모델링의 틀이 되듯, 
    데이터모델링의 틀이 되는 ERD(Entity Relationship Diagram)이 있다.
        논리적 모델링 - 한글 중심으로 씀
        물리적 모델링 - 데이터베이스 중심으로 씀
            1. 기획
            2. 외부에서 시스템을 확인할 때 사용
            
1. show databases;
2. use databaseName;
3. show tables;
4. desc table; describe
절대 하지 말 것 : select * from 테이블명; (X) 잘못하면 프로그램 다운됨. 
5. select count(*) from 테이블명;으로 개수를 확인한 뒤애
select * from limit 0,2; 로 맛만 본다.
--
이 모든 것이 DML 조작을 위한 것.
어떤 db인지 정하지 않고 그때그때 사용하려면 from 뒤 테이블명 적기

아예 처음에 시작할때 사용할 샘플부터 시작 가능
select * from table.column;

dml
select 컬렴명 /*        // select 절
    별명, distinct
from 테이블명           // from 절
where 조건              // where 절
    비교연산자 / 논리연산자
    between

Null의 비교는 그냥 = 써서는 안되고 is null; 해야 함

급여가 1000에서 2000 사이가 아닌 사원
select empno, ename, job, sal from emp where sal not between 1000 and 2000;

동이름이 신사로 시작하는..
동이름이 신사를 포함하는..

=> 비교연산자를 사용하지 못함

like + 연산자 : 유사비교
        _ : 문자 한 글자 대치
            ex)한_ = 무조건 두글자. 한국, 한조
        % : 0개 이상 무한대를 대치
            한% / %한 / %한%

=> 논리연산자를 사용해야 함

s로 시작하는 사람
select empno, ename from emp where ename like 's%';
k로 끝나는 사람
select empno, ename from emp where ename like '%k';
두번째 문자가 M인 사원
select empno, ename from emp where ename like '_m%';
이름이 4글자인 사원
select empno, ename from emp where ename like '____';

시간에 대해서도 이 개념의 활용 가능

2월에 입사한 사람에 대한 정보
근데 아래와 같이 하면 4월 02일도 찍힌다.
select empno, ename, hiredate from emp where hiredate like '%02%';
특수기호를 하나 넣어 줘야 함
select empno, ename, hiredate from emp where hiredate like '%02-%';


정렬
    오름차순 / 내림차순
    ORDER BY acs / desc 디폴트는 오름차순인 acs
(!)정렬시켰다 해도 데이터 자체의 변화는 없음

Q : 입사일자로 정렬(역순)된 사원정보 출력 사원번호, 이름, 입사일자
select empno, ename, hiredate from emp order by hiredate desc;

정렬도 여러번 가능하다. 1차정렬 이후, 겹치는 것에 한해 2차정렬이 이루어진다.
select empno, ename,job, deptno from emp order by job, deptno;

select ename e, job j from emp order by j;

Q: 월급을 연봉으로 바꾸어서 정리할 때 이런 식으로 쓴다.
select empno, ename, sal, sal*12 yearsal from emp order by yearsal;

컬럼이 여러개일 때는 순서값을 줘도 됨.
select empno, ename, sal, sal*12 yearsal from emp order by 4 desc;

일정 개수만 가져올 때
limit : index를 사용하면 된다. 시작점 디폴트는 0
Q: 시작부터 상위 4개만 가져올 때
select empno, ename, sal, sal*12 yearsal from emp order by 4 desc limit 0,4;

함수(모듈화)
    단일행 함수 - 1행 : 1행

    복수행 함수 - 多행 : 1행 (결과가 묶이는 것)
레퍼런스 보면 됨. https://dev.mysql.com/doc/refman/8.0/en/func-op-summary-ref.html

abs, round, ceil... 왠만한 수학 관련 함수는 다 있음
truncate(num, 소수점) 소수점 자르는 함수
pow 제곱함수
mod 나머지

* 문자열 관련 함수
ascii() 아스키 값 리턴
length() 글자 길이 '테 스 트' = 8
char_length 글자 길이 '테 스 트' = 5

select ename from emp where length(ename) = 4;

concat : 문자열 이어붙이기
select concat('asp','php');

select concat(ename,job) from emp where deptno=10;

select concat(ename, '의 직책은 ', job, '입니다.') as result from emp where deptno=10;

Q : 사원이름의 연봉은 xxxx입니다.
select concat(ename, '의 연봉은 ', truncate(sal*12,0),'입니다.') as result from emp;

instr :문장 내 원하는 단어의 시작위치 리턴
select instr('mysql database study','study'); : 16
일반적인 경우와 다르게 시작위치가 0이 아니라 1부터 시작함.

select ename, instr(ename,'mi')
Java의 indexOf와 비슷

right(~-1), left(1~), mid(start,개수) : 슬라이싱

select substring('mysql database study',start,end); mid와 같음

Q : S로 시작하는 사람들에 대한 정보
select empno, ename, job, sal from emp where left(ename,1) = 's';

select empno, ename, job, sal from emp where substring(ename,1,2) = 's';

select empno, ename, job, sal from emp where mid(ename,0,1) = 's';

replace : 대체 함수
select replace('mysql database study','study','스터디');

lower, upper, reverse

ltrim, rtrim 공백 제거

select lpad('hi',4,'*'); 4개의 글자에서 hi 왼쪽을 *로 채워라

select sysdate();
select curdate();
select curtime();

select now(), now()+1;

**날짜 연산**
select now(), date_add(now(), interval 2 day);
select year(now());
select year('2019-11-02');
select dayname(now());
select to_days(now());  유닉스 타임부터 지금까지를 날짜로 환산하면?
select to_days(now())-to_days('2020-02-01'); : 현재부터 2020년 2월 1일까지의 일 차

select now(), date_format(now(), '%Y-%m-%d'); : 날짜 출력 포매팅

Q : 30번 부서의 입사일자를 년도:월:일로 표시
select ename 이름, date_format(hiredate,'%Y:%m:%d') 취직일 from emp where deptno=30;

select greates(100,101,102);
select greatest(sal, 2000) from emp; : 2천 이하인 것은 2000으로 만들고 그 위의 값은 걍 자기값을 표시

**조건문**
select if(1=2, '참','거짓');
select ename,sal, if(sal<2000,'박봉','개꿀') from emp where deptno=30;

ifnull(x,y) x가 null이면 y값이 찍히고 아니면 x가 찍힘
예외처리에 사용함
select ename,sal,comm, sal*12+ifnull(comm,0) from emp where deptno=30;

select case 4 when 1 then 'one' when 2 then 'two' when 3 then 'sam' when 4 then 'for' else 'more' end;

select case when 1>0 then 'true' else 'false' end;

* 급여 상승분 계산
직책이 analyist면 급여 10% 인상, clerk이면 20%, manager면 30% 인상 그 외에는 급여인상 음슴
select empno, ename, job, sal, case job when 'analyst' then sal*1.1 when 'clerk' then sal*1.2 when 'manager' then sal*1.3 else sal end from emp;

**다른 폴더에서 sql 스크립트를 불러와 사용하기**
source {path}
source c:/coding/kicmariadb/ex01.sql

행의 개수
select count(sal) from emp;
Null이 있더라도 개수를 정상적으로 뽑아오려면
1. * 사용
select count(comm) from emp; = 4
select count(*) from emp; = 14
2. ifnull 사용
select count(ifnull(comm,0)) from emp;

avg도 null을 내부적으로 제거한다.
select avg(comm) from emp;

select avg(comm), sum(comm), count(*) from emp;

select avg(comm), sum(comm)/count(*) from emp;
select avg(ifnull(comm,0)), sum(comm)/count(*) from emp;

select max(sal), min(sal) from emp;
select ename, max(sal) from emp; 첫번째 데이터만 가져옴
select ename, sal from emp where sal>=5000;

**부분합을 위한 그룹화**
select {컬럼}
        group by에 쓰여진 컬럼 이외의 컬럼은 쓸 수 없다.
        group 함수만 사용 가능하다.
from emp
group by {bew_컬럼};

deptno에 의해 그룹화된 deptno를 출력하라
select deptno from emp group by deptno;
부서 별 합계를 구하라
select deptno,sum(sal) from emp group by deptno;
select job,deptno,sum(sal) from emp group by deptno;

select deptno, max(sal) from emp group by deptno;

Q : 직책별 최고급여
select job,max(sal) from emp group by job;

Q : 부서 내부의 직책별로 연봉합계 구하기
select deptno, job, truncate(sum(sal),0) sumsal from emp group by deptno,job order by 3;
Q : 연봉이 2천 이상인 사람만 걸러내고 싶을 때
이렇게 하면 안됨
select deptno, job, truncate(sum(sal),0) as sumsal from emp group by deptno,job where sumsal>=2000 order by 3 desc;
having을 써야 함
select deptno, job, truncate(sum(sal),0) as sumsal from emp group by deptno,job having sumsal>=2000 order by 3 desc;

#### 2020.06.10
select
from
where
order by
limit 

select
from
where   그룹함수(X)
group by 
having  그룹함수(O)
order by
limit 

단일행 함수
    문자열 = java의 String 클래스와 유사
    날짜

그룹 함수(복수행 함수)
    count - ifnull 처리
    avg / sum
    min / max
    group by 부분합

쿼리
    - 내부쿼리 : subquery

연산자 별로 처리할 수 있는 데이틔 개수가 다름
1. 배교연산자 = 한 행의 결과 / = >  >= <= <
2. in-any   =여러명의 결과
        < any : 서브쿼리 리턴값중 최대값보다 작은
        > any : 최소값보다 큰
        < all : 최소값보다 작은
        > all : 서브쿼리 리턴값 중 최대값보다 큰

**관계형 데이터베이스**
서로 연관관계가 있는 데이터를 확인하려면 Join을 사용하게 된다. 여러 테이블의 데이터를 사용하는 것! 어려우니 집중하자.

조건이 같은 데이터를 가져오고 싶다면 equi.join을 사용한다.

equi join
non equi join
테이블 삭제하려면 drop table [table name]

outer join
    left outer
    right outer
    full outer

DML
    SELECT
        한 개의 테이블
            일반적인 경우
                함수
            서브쿼리
                select 중첩
                    컬럼(X)
                    from(inline view)
                    where
                단일행 서브쿼리
                복수행 서브쿼리
                    in any all
        여러 개의 테이블 - join
    INSERT
    UPDATE
    DELETE


DDL 저장장소 설정
            database, table
    CREATE  
        create database [databasename] 데이터베이스 생성
        create or replace : 생성하거나 바꿔라

        create table [tablename] (
            [columnname] datatype(size) option,
            [columnname] datatype(size) option,
            ...
        )
        create table as select

    ALTER
        table
            컬럼에 대한 변경
    DROP
        database
        table

#### 2020.06.11
- 컬럼의 순서
insert into 테이블명 values ('String', 값, 값);
insert into (컬럼명,컬럼명,컬럼명) values('값','값',값);

- null의 허용/불허. not null을 쓰면 불허한다. default는 허용!
create table dept3 (
    deptno int(2) not null,
    dname varchar(13),
    loc varchar(14)
);

- 기본값
    값을 입력하지 않으면 기본값을 설정
create table dept3(
    deptno int(1) default 99999,
    dname varchar(13),
    loc varchar(14)
);

insert into dept3 values (default, 'dev','kakao');

- 자동 증가 컬럼값 (테이블 내에서 한 개의 컬럼만 가능함. 그래서 primary key를 써 줘야 함)
고유번호 같은 것은 +=1이 필요하다. (게시글 번호)
계산하게 하는 것은 귀찮기 때문에 데이터베이스에서 가져올 때 수를 세게 한다.
create table testtbl (
    seq int(2) primary key auto_increment,
    name varchar(10)
);

- 수정 : Update 테이블명 set [column name=값, 컬럼명 ="값"] : 전체 행이 바뀜. where을 사용해 조건적으로 바꿀 수도 있음.

- 삭제 : DELETE
delete from table명 : 전체 데이터 삭제
delete from table명 where 조건

- 테이블에 DML => 정상적인 데이터 입출력
    입력 검사 - 제약 조건 (constraint)

1. not null     - 필수입력시키기 
2. unique       - 중복입력 제거
3. primary key  - 필수입력 + 중복제거 (auto_increment에 필수)
4. foreign      - 참조
5. check        - 입력값 검사 (프로그램한테 위임)

**constraint.sql**
- 참조제약조건 
    - 참조키, 외래키
M 대 M 관계는 1 대 M 두개로 해소한다.
예를 들어 회원이 도서를 빌릴 때, 한 회원이 여러 개의 책을 빌릴 수가 있다. 도서 테이블에도 여러 회원이 들어온다. 이 관계 해소를 위해 '예약'테이블을 만들어 회원아이디, 도서번호를 (FK)로 하여 관리함으로써 다대다 관계를 해소한다.

모델링 