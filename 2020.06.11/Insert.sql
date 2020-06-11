insert dept values(10000000,'개발','부산');
insert into dept (loc, deptno, dname) values('성남',77,'IOS');

-- null을 허용하는 경우 ()에서 빼도 된다. Null로 값이 자동으로 드감
insert into dept (deptno, dname) values(330,'IOS');
-- null을 불허하는 deptno 삭제하면 에러뜸
insert into dept (dname, loc) values('개발','부산');

-- 괄호 없이 값도 없으면 안들어감
insert into dept values(50,'개발');
-- null이라도 넣어 줘야됨
insert into dept values(50,'개발',null);

-- 여러 개의 value 넣기(Bulk 벌크)
insert into dept2 values (20,'생산',null),(40,'영업2',null);
-- 서브쿼리로 벌크 - create as와 비슷하다고 보믄 됨 ㅇㅇ
insert into dept2 select * from dept;

-- Q : 10번 부서의 데이터만 emp_10 테이블에 입력
insert into emp_10 select * from emp where deptno=10;

-- 컬럼에 default 옵션을 넣으면 insert 시 default 옵션 사용 가능
insert into dept3 values (default, 'dev','kakao');

-- 자동 증가 컬럼값
create table testtbl (
    seq int(2) primary key auto_increment,
    name varchar(10)
);
-- 0을 넣어도 1씩 추가되어 올라간다! 123 하다가 10을 넣어서 생성하면, 이후 0을 넣었을 때 11부터 생성된다.(중간에 빌 수 있다)
insert into testtbl values(10,'홍길떵');


-- Update : 수정
update dept2 set loc='부산';
-- 조건 update
update dept2 set loc='Chicago' where deptno=10;

-- 삭제 : DELETE
delete from dept2;