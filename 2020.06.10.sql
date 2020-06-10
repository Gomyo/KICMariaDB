-- Q : 직책별 연봉 (sal*12 +comm) 합을 구하시오
select job, sum(sal*12+ifnull(comm,0)) annual from emp group by job;
-- 최고급여를 받는 사원에 대한 정보를 출력하고 싶을 때
-- 1. 최고급여
-- 2. 급여에 해당하는 사원
-- where 안에 조건문 가능.
select ename, sal from emp where (select max(sal) from emp);

-- Q : ward 사원의 급여와 같은 사원에 대한 사원 번호
select * from emp where sal = (select sal from emp where ename = 'ward');

-- Q : scott의 급여보다 많은 사원에 대한 정보 출력
select * from emp where sal >= (select sal from emp where ename="scott");

-- Q : 20번 부서의 최고 급여보다 많은 사원
select ename,sal,deptno from emp where sal >= (select max(sal) from emp where deptno=20);

-- Q : 직책이 manager인 사원 전체의 급여보다 큰 사원정보
select empno, ename, job, sal from emp where sal > all(select sal from emp where job='manager');