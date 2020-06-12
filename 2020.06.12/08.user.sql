/*
root에서 접속했음

user - 전체 설정
db - 데이터베이스 설정 잘안씀
*/
use mysql;
desc user;

-- 부분 데이터 뽑기
select host, user, password from mysql.user;
-- 비밀번호 비교
select password('123456');
-- user 추가. root와 동일한 방식으로 접근 가능!
create user tester@localhost identified by '12345';

-- grant
-- 사용자 추가 (권한 추가)
-- 접속 권한이 없으면 아래와 같이 ip로 접근이 불가능하다.
mysql -h 192.168.0.30 -u tester -p
-- access denied! (using password: YES)

/*
root
- 절대자 - 모든 권리를 가지고 있음
            사용자
            사용자
            사용자

권한을 허용하기 위해 root로 접속한 뒤, show grants for tester@localhost;
기존에 사용하던 계정에 외부 접근 권한을 부여하려면, Host를 '%' 로 하여 똑같은 계정을 추가한다
mysql > create user 'userid'@'%' identified by '비밀번호';
'%' 의 의미는 외부에서의 접근을 허용
*/

create user tester@'%' identified by '12345';

-- %로 들어갔음을 확인

-- 이제 아래의 코드로 tester 로그인 가능
mysql -h 192.168.0.30 -u tester -p

-- 전체 권한 부여하기(창 두개로 각각 root, tester에 로그인해서 진행)
root 창에서

-- tester 접속자에게 모든 권한 부여하는 코드
grant all privileges on sample.* to tester@'%';
-- 권한을 확인
show grants for tester@'%';
-- root에서만 보이던 sample database가 tester에서도 보임!

-- 사용자 삭제(권한 삭제)
-- revoke
-- 데이터 접속 권한 삭제
revoke all privileges on sample.* from tester@'%';
-- drop 
-- ip 접속 권한 삭제
drop user tester@'%';

-- 한방에 ip 권한이랑 데이터 권한 다 주려면
grant all privileges on sample.* to tester@'%' identified by '12345';
-- 한방에 권한을 싹 뺏는 것은 없음

-- 일부 권한만 주기
grant select, insert on sample.emp to tester@'%';
-- tester계정이선 sample database, emp table만 확인 가능

-- insert하고 update한 뒤 변화 보기.
insert emp values(1111,'BOB','DEVELOPER',3333,'2020-06-12',9999.00,NULL,20); -- insert 됨, 아직 root에서는 확인 불가