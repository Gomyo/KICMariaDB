-- 아래 코드를 java로 구현하기 (Read data from ResultSet) => KICeclipse/jdbcTest2.java
select empno, ename, job, sal* 12+ifnull(comm,0) from emp where deptno=10