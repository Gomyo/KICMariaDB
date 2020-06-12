-- 컬럼 단위 제약 조건
create table dept_u1
(
    deptno int(2) unique,
    -- unique
    -- deptno int(2) primary key,
    dname varchar(14),
    loc varchar(13)
);
-- 제약조건 검사
select constraint_name, table_schema, table_name, constraint_type
from information_schema.table_constraints
where constraint_schema = 'sample';

-- 테이블단위 제약조건 생성하기
create table dept_u2
(
    deptno int(2),
    dname varchar(14),
    loc varchar(15),
    constraint dept_u2_deptno_uk unique(deptno)
    -- 테이블 단위 제약 조건!
    -- constraint dept_u2_deptno_uk primary key(deptno)
);

-- Unique 제약조건의 의미 알아보기ㅇ
insert into dept_u1
values(10, 'dev', 'swift');
insert into dept_u1
values(20, 'dev', 'swift');
-- 여기까진 당연히 되고,
insert into dept_u1
values(10, 'dev', 'swift');
-- 이렇게 unique에 해당하는 key가 겹치면 Duplicate entry ERROR 발생
insert into dept_u1
values(null, 'dev', 'swift');
-- 근데 null이 허용되어 있는데, null은 중복된다. 값에 대한 중복이 거부되어 있는데, null은 값이라고 취급받지 않음을 의미한다.


-- 참조제약조건 - 참조키,외래키
create table dept_p
(
    -- 참조하는 key 값은 특수 키여야 함.
    deptno int(2) primary key,
    dname varchar(14),
    loc varchar(13)
);

-- key의 속성을 참조하여 가져옴. 따라서 참조하는 부분의 데이터가 있어야 가져올 수 잇슴.
-- dept_p가 비어 있으면 이런 에러가 뜬다.

/*
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`sample`.`emp_f`, CONSTRAINT `emp_f_deptno_fk` FOREIGN KEY (`deptno`) REFERENCES `dept_p` (`deptno`)) 
*/

create table emp_f
(
    emp int(4),
    ename varchar(10),
    deptno int(2),
    -- dept_p에 있는 deptno
    CONSTRAINT emp_f_deptno_fk FOREIGN KEY (deptno) REFERENCES dept_p (deptno)
);



-- parent low를 수정하면 이런 에러가 뜬다.
update dept_p set deptno=20 where loc=3;
/*
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`sample`.`emp_f`, CONSTRAINT `emp_f_deptno_fk` FOREIGN KEY (`deptno`) REFERENCES `dept_p` (`deptno`))
*/
-- 이것 또한 에러가 난다.
update emp_f set deptno=20 where emp=1000;
/*
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`sample`.`emp_f`, CONSTRAINT `emp_f_deptno_fk` FOREIGN KEY (`deptno`) REFERENCES `dept_p` (`deptno`))
*/
-- 기댈 구석이 있어야 바꿀 수 있다. (참조하는 테이블에 해당하는 key 값이 존재해야 그 값으로 바꿀 수 있다.)
insert into dept_p values(20,'R&D','Seoul');
update emp_f set deptno=20 where emp=1000;

-- parent row는 child row가 엮여 있으면 update or delete가 안됨!
delete from dept_p where dname='R&D';
-- 그래서 자식을 먼저 지우고, 위의 명령을 실행한다. 그러면 지울 수 있슴.
delete from emp_f where deptno=20;

-- alter로 primary 키로의 변환 가능
-- 그냥 테이블 생성 후, 변환
create table dept_p (
    deptno int(2),
    dname varchar(13),
    loc varchar(12)
);
alter table dept_p add CONSTRAINT primary key(deptno);

create table emp_f (
    empno int(4),
    ename varchar(10),
    deptno int(2)
);
-- 마찬가지로 aleter로 외래 키를 참조 가능
-- 이름을 지정하지 않고 만들면 emp_f_ibfk_1과 같이 이상한 이름으로 만들어줌
alter table emp_f add CONSTRAINT FOREIGN key (deptno) REFERENCES dept_p(deptno);

-- 제약조건 이름값 삭제도 가능. 어느 테이블에 있는지 잘 찾아야 함!
alter table emp_f drop FOREIGN key emp_f_ibfk_1;

-- 그냥 key에다 PRIMARY 제약 조건을 넣은 경우, 그 조건을 삭제하려면 어떻게 해야 하는가?
-- 해당 조건이 있는 table을 삭제 해 버리면 된다.
drop table dept_p;
