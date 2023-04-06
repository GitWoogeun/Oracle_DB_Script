-- Admin Accounts 
-- SYS, SYSTEM

-- MEMBER TABLE 생성 ( ENTITY ) 생성
-- DDL : CREATE(생성), ALTER(수정), DROP(삭제) 등등
-- DML : INSERT(삽입), SELECT(조회), UPDATE(수정), DELETE(삭제) 등

-- 테이블 정의하기 : 데이터 구조 정의하기
-- 개념상의 데이터 정의하기 : ENTITY 정의하기

-- DDL 명령어
-- MEMBER(회원 테이블) 생성하기
CREATE TABLE MEMBER(
    ID              VARCHAR2(50),
    PWD           VARCHAR2(50),
    NAME         VARCHAR2(50),
    GENDER      NCHAR(2),              -- 남성, 여성 NCHAR(2) 
    AGE            NUMBER,
    BIRTHDAY    VARCHAR2(10),       -- 1994-07-15
    PHONE        CHAR(13),              -- 010-1234-2345
    REGDATE      DATE
);

-- 테이블에 데이터 저장 
INSERT INTO MEMBER ( GENDER ) VALUES ( '남성' );

-- 테이블 삭제
DROP TABLE MEMBER;
-- ; 명령어의 종료

-- 회원 테이블 조회
SELECT * FROM MEMBER;

-- 문자길이의 수
SELECT LENGTH('AB') FROM DUAL;
SELECT LENGTH('AB') FROM DUAL;
-- 문자의 데이터 사이즈 BYTE
-- 영문자는 한자가 1Byte를 사용
SELECT LENGTHB('AB') FROM DUAL;
  
-- 문자의 데이터 사이즈 BYTE
-- 한글은 한자가 3Byte를 사용
SELECT LENGTHB(GENDER) FROM MEMBER;

-- NCHAR or NVARCHAR2 사용해보기 ( 전세계 언어 저장할때 사용 )
SELECT LENGTHB(GENDER) FROM MEMBER;