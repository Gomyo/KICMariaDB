-- CREATE
create database test1;

use test1;

create table dept1 (
    deptno int(2),
    dname varchar(14),
    loc varchar(13)
);

create table salgrade (
    grade int(1),
    losal decimal(7,2),
    hisal decimal(7,2)
);

-- Create에 대한 서브쿼리 사용
create table dept2 as SELECT * from dept;

-- 부분데이터만 가져오기
create table dept3 as select loc, deptno from dept where deptno=10;

-- 테이블을 생성하고 거기에 값 넣기
create table emp2 as select empno, ename, sal*12 + ifnull(comm,0) annualsal, hiredate from emp where deptno=10;

create table emp3 as select empno, ename, sal*12 + ifnull(comm,0), hiredate from emp where deptno=10;

-- 껍데기만 복사하기 Ver.1 강제로 부정조건 넣기 : empty set 생성됨. 껍데기만 복사하는 방법. 데이터가 나오지 못할 어떤 조건을 줘도 상관이 없다.
create table dept4 as SELECT * FROM dept where 1 !=1;
-- 껍데기만 복사하기 Ver 2 : create like
create table dept5 like dept;

-- ALTER
-- add [column] :컬럼을 추가해 보자
alter table emp2 add job varchar(10);
-- modify [column] : 컬럼 수정
alter table emp2 modify job varchar(20);
-- change : 컬럼 이름 수정
alter table emp2 change column job work varchar(20);
-- drop : 컬럼 삭제
alter table emp2 drop work;
-- table 삭제
drop table dept4;

-- 테이블 어케 생성했나 보기
show create table emp;
-- 테이블 행을 볼 때. 얼마만큼 행이 들어와 있나?
show table status;