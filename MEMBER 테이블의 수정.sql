-- 테이블 수정하기 => CREATE / DROP / ALTER
-- MEMBER(회원 테이블) 수정하기
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

-- MEMBER 테이블의 ID 컬럼의 데이터 형식 변경
ALTER TABLE MEMBER MODIFY ID NVARCHAR2(50);

-- MEMBER 테이블의 AGE 컬럼 삭제
ALTER TABLE MEMBER DROP COLUMN AGE;