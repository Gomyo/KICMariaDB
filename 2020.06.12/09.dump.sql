-- 백업시킬때 사용! 즉, restore가 가능하다.
-- exit 한 다음에 해야함.
mysqldump -u root -p sample > c:/coding/kicmariadb/dump.sql

-- sample database를 새로 만든 뒤에 스크립트로 넣음 (Redirection)
mysql -u root -p sample < c:/coding/kicmariadb/2020.06.12/dump.sql


