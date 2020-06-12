-- emp_vu view에 select 문 '저장'. 테이블은 아님!
create view emp_vu as SELECT * from emp;

show full tables;

show create view emp_vu;

show create view emp_vu \G;

-- 근데 보통 뷰를 만들 때는 테이블을 추출함
create view emp_vw_10 as select empno, ename, mgr, job from emp where deptno=10;

-- Q : Scott의 직책은 salesman이고, 연봉은 000 입니다. 10번 부서에서
create view emp_vw_test as select concat(ename,'의 직책은',job,'이고 연봉은 ',truncate(sal*12+ifnull(comm,0),0), '입니다.') contents from emp where deptno=10;

-- view의 조합. 복잡한 sql 문장을 간단하게 보려고 할 때
create view emp_dept as select empno, ename, e.deptno, dname, loc from emp e inner join dept d on e.deptno = d.deptno;

-- view의 목록 보기
show full tables where table_type='view';
-- view와 실제 테이블의 join. deptno가 ambiguos 하기 때문에 태그를 붙여줘야 한다.
select empno, ename, dname from emp_vu e inner join dept d on e.deptno = d.deptno;

create view emp_vu1 as select empno no, ename name from emp where deptno=10;

alter view emp_vw_10 as SELECT empno, ename, mgr, job from emp where deptno=20;