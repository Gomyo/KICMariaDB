/*
개요
파일 -> 데이터베이스 테이블에 입력

File IO -> Java -> insert to DB 테이블
*/
create database project;
use project;
create table zipcode (
    zipcode char(7) not null,
    sido varchar(4) not null,
    gugun varchar(17) not null,
    dong varchar(26) not null,
    ri varchar(45),
    bunji varchar(17),
    seq int(5) unsigned PRIMARY KEY
);
