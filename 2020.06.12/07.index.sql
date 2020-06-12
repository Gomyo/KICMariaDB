/*
index(색인, 목차) 사전을 생각하면 됨
    1. 전체를 스캔 
    2. 목차 -> 페이지 번호 -> 페이지
데이터 -> 날짜 -> index 생성 : 정렬 -> 목차

정렬
    오름차순 (작은 수부터)
    내림차순 (큰 수부터)
    B(Balanced) - Tree : insert, update, delete를 해도 기본적으로 트리의 구조는 변하지 않음. 따라서 편향된 트리가 생길 수 있는데, 이것을 방지하기 위해 인덱스의 리빌딩(이라는 이름의 튜닝)이 필요하다. 주로 새벽에 하면 됨.
    
    인덱스 - 별도의 저장공간에 저장
    
*/
show index from emp;

use information_schema;

-- index 실습을 위한 table 생성
create table dept_idx (
    deptno int(2),
    dname varchar(14),
    loc varchar(13)
);
-- 현 단계에서는 이렇게 해도 Empty set return
show index from dept_idx;
-- primary key를 넣어야 비로소 인덱스를 찾을 수 있음
-- index의 key_name은 primary이고 index_tipe은 btree인 것을 알면 된다.
alter table dept_idx add CONSTRAINT PRIMARY key (deptno);
-- primary key 삭제
alter table dept_idx drop PRIMARY key;
show index from dept_idx;

-- 다시 index 생성
-- key_name: dept_idx_1. Column_name : dname, 
-- dname이 Primary가 아니라 mul이다.
create index dept_idx_1 on dept_idx (dname);
-- 그리고 index는 alter가 아니라 rebuild임을 기억할 것

-- 인덱스 다시 삭.제
drop index dept_idx_1 on dept_idx;

-- 유니크 키를 잡고, 인덱스 생성 여부 보기 : 생긴다.
alter table dept_idx add unique (deptno);
alter table dept_idx drop uni