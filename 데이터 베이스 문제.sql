1. 데이터베이스의 목록을 확인할 수 있는 SQL 문장을 기술하십시오.
show databases;
2. 테이블의 목록을 확인할 수 있는 SQL 문장을 기술하십시오.
show tables;
3. 테이블의 구조를 확인할 수 있는 SQL 문장을 기술하십시오.
desc table;
4. 사원 테이블에서 직원들의 연봉(SAL*12+comm)을 계산하여, 컬럼명은 "사원 연봉"으로 출력하는 SQL 문장을 기술하십시오.
select sal*12+ifnull(comm,0) as '사원 연봉' from emp;

* 현재 사용하는 있는 데이터베이스의 이름을 출력하는 SQL 문장을 기술하십시오.
select database();
* 현재 사용자 이름을 출력하는 SQL 문장을 기술하십시오.
select user();
5. 사원 테이블을 이용하여 다음과 같은 결과를 얻을 수 있는 SQL 문장을 기술하십시오.
사원정보
-----------------------------------------------------------------------
SMITH의 업무는 CLERK이고 급여는 800만원입니다
ALLEN의 업무는 SALESMAN이고 급여는 1600만원입니다
WARD의 업무는 SALESMAN이고 급여는 1250만원입니다
JONES의 업무는 MANAGER이고 급여는 2975만원입니다
MARTIN의 업무는 SALESMAN이고 급여는 1250만원입니다
BLAKE의 업무는 MANAGER이고 급여는 2850만원입니다
CLARK의 업무는 MANAGER이고 급여는 2450만원입니다
SCOTT의 업무는 ANALYST이고 급여는 3000만원입니다
KING의 업무는 PRESIDENT이고 급여는 5000만원입니다
TURNER의 업무는 SALESMAN이고 급여는 1500만원입니다
ADAMS의 업무는 CLERK이고 급여는 1100만원입니다
JAMES의 업무는 CLERK이고 급여는 950만원입니다
FORD의 업무는 ANALYST이고 급여는 3000만원입니다
MILLER의 업무는 CLERK이고 급여는 1300만원입니다
14 개의 행이 선택되었습니다.

select concat(ename,"의 업무는 ",job,"이고 급여는 ",truncate(sal,0),"만원입니다.") '사원정보' from emp;

6. 사원 테이블에서 입사일이 2011년도인 사원의 사원번호, 사원이름, 입사일, 업무, 급여를 검색하는 SQL 문장을 기술하십시오.
select empno, ename, hiredate, job, sal from emp where year(hiredate)=2011;

7. 사원 테이블에서 입사일이 2011년이고 업무가 'SALESMAN'이 아닌 사원의 사원번호, 사원이름, 입사일, 업무, 급여를 검색하는 SQL 문장을 기술하십시오.
select empno, ename, hiredate, job, sal from emp where year(hiredate)=2011 and job != 'SALESMAN';

8. 사원 테이블의 사원번호, 사원이름, 입사일, 업무, 급여를 급여가 높은 순으로 정렬하고, 급여가 같으면 입사일이 빠른 사원으로 정렬하는 SQL 문장을 기술하십시오.
select empno, ename, hiredate, job, sal from emp order by sal desc, hiredate;

9. 사원 테이블에서 사원이름의 세 번째 알파벳이 'N'인 사원의 사원번호, 사원이름을 검색하는 SQL 문장을 기술하십시오.
select empno, ename from emp where ename like '__n%';

10. 사원 테이블에서 연봉(SAL*12)이 35000 이상인 사번, 사원명, 연봉을 검색하는 SQL 문장을 기술하십시오.
select empno, ename, sal*12 from emp where sal*12>=35000;

11. 사원 테이블의 사원명에서 2번째 문자부터 3개의 문자를 추출하여 출력하는 SQL 문장을 기술하십시오.
select mid(ename,2,3) from emp;

12. 사원 테이블에서 입사일이 12월인 사원의 사번, 사원명, 입사일을 검색하는 SQL 문장을 기술하십시오.
select empno, ename, hiredate from emp where month(hiredate) = 12;

13. 다음과 같은 결과를 출력하는 SQL 문장을 기술하십시오.
  EMPNO ENAME 입사일
---------- ---------- ----------
7369 SMITH 1980-12-17
7499 ALLEN 1981-02-20
7521 WARD 1981-02-22
...
7934 MILLER 1982-01-23

14 개의 행이 선택되었습니다.

select empno, ename, date_sub(hiredate, interval 30 year) '입사일' from emp;