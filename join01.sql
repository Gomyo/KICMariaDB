-- 관계형 데이터베이스
-- 여러개의 테이블을 하나로 병합하는 join
-- 무작위로 쭉 연결된다
select *
from emp cross join dept;

-- inner join
select *
from emp join dept on (emp.deptno = dept.deptno);

select *
from emp cross join dept
on
(emp.deptno = dept.deptno);

select *
from emp inner join dept on (emp.deptno = dept.deptno);

select *
from emp inner join dept using (deptno) ;

SELECT *
from emp e inner join dept d on (e.deptno = d.deptno);

select empno, ename, dname, loc
from emp inner join dept using (deptno) ;

select empno, ename, dname, loc, deptno
from emp e inner join dept using (deptno) ;

select *
from emp e inner join salgrade s on (e.sal >= s.losal and e.sal<=s.hisal);

select *
from emp e inner join salgrade s on (e.sal between s.losal and s.hisal);

-- Q : 20번 부서의 사원에 대한 사원번호, 이름, 급여, 호봉등급을 출력
select empno, ename, sal, grade
from emp e inner join salgrade s on (e.sal between s.losal and s.hisal)
where deptno=20;

-- 3개 이상의 테이블 join
SELECT empno, ename, sal, grade, dname, loc
from emp e inner join dept d on e.deptno = d.deptno inner join salgrade s on e.sal BETWEEN s.losal and s.hisal order by grade;

-- outer join을 사용한다. 
-- 한쪽 테이블에만 존재하는 항목을 추가하려면 : 예를 들어 부서원이 없는 부서
-- left outer join : 왼쪽을 중심으로 뭉치기, right는 오른쪽으로 뭉치기

SELECT empno, ename, d.deptno dname, loc from dept d left outer join emp e on d.deptno = e.deptno;
SELECT empno, ename, d.deptno dname, loc from dept d left outer join emp e on d.deptno = e.deptno where empno is null;

SELECT empno, ename, d.deptno dname, loc from dept d right outer join emp e on d.deptno = e.deptno; -> emp를 중심으로 뭉치면 d에만 있는 40번 deptno가 없음

-- 계층도 만들기
-- 1. 확인
select empno, ename, mgr from emp;
-- 2. 구현
SELECT e.empno, e.ename '사원', m.empno,m.ename '관리자' from emp e inner join emp m on e.mgr = m.empno;
-- 3. 빠져 있는 king을 구현하려면? 사원 쪽으로 뭉친 left outer 사용, 혹은 m.empno가 아니라 e.mgr로 바꾸기
SELECT e.empno, e.ename '사원', m.empno,m.ename '관리자' from emp e left outer join emp m on e.mgr = m.empno;
SELECT e.empno, e.ename '사원', e.mgr,m.ename '관리자' from emp e left join emp m on e.mgr = m.empno;

-- Q. mgr 빼고, null을 관리자 없음으로 출력하기
SELECT e.empno, e.ename '사원', ifnull(m.ename,'관리자 없음') '관리자' from emp e left outer join emp m on e.mgr = m.empno;