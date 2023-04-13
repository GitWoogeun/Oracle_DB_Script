-- Entity 제약조건
-- Primary Key / Unique

-- PRIMARY KEY와 UNIQUE
-- 중복된 레코드가 없도록 제한 한다.
-- 레코드가 절대로 같지 않도록 만들어야 한다.
-- 식별할수 있는 컬럼이 있어야한다. :: 식별컬럼 생성

-- 두 가지의 식별키값이 존재.
-- PRIMARY KEY : 식별할수 있고 절대 NULL 값이 들어가면 안된다.
-- UNIQUE : 식별은 할 수 있지만, NULL값도 들어갈 수 있다.

-- 테이블 생성 시 Entity 제약조건 PRIMARY KEY와 UNIQUE 첫번째 적용방법
CREATE TABLE NOTICE
(
      ID              NUMBER             CONSTRAINT NOTICE_ID_PK PRIMARY KEY            -- PRIMARY KEY 제약 조건 : NOTICE_ID_PK : 제약조건 이름
   ,  TITLE           VARCHAR2(300)   NOT NULL                                                        -- NOT NULL
   ,  WRITER_ID    VARCHAR2(50)     NOT NULL UNIQUE                                           -- NOT NULL / UNIQUE
   ,  "CONTENT"   VARCHAR2(4000)
   ,  REGDATE      DATE                 DEFAULT SYSDATE                                              -- 기본값 현재 날짜
   ,  HIT              NUMBER            DEFAULT 0                                                        -- 기본값 0
);

-- 테이블 생성 시 Entity 제약조건 PRIMARY KEY와 UNIQUE 2번째 적용방법
CREATE TABLE NOTICE
(
      ID              NUMBER             
   ,  TITLE           VARCHAR2(300)           NOT NULL                            -- NOT NULL
   ,  WRITER_ID    VARCHAR2(50)             NOT NULL                            -- NOT NULL / UNIQUE
   ,  "CONTENT"   VARCHAR2(4000)
   ,  REGDATE      DATE                          DEFAULT SYSDATE                 -- 기본값 현재 날짜
   ,  HIT              NUMBER                     DEFAULT 0                           -- 기본값 0
   ,  CONSTRAINT NOTICE_ID_PK              PRIMARY KEY (ID)
   ,  CONSTRAINT NOTICE_WRITER_ID_UK  UNIQUE(WRITER_ID)
);

-- 테이블이 이미 생성 시 PRIMARY KEY, UNIQUE KEY 제약조건 적용방법
ALTER TABLE NOTICE ADD CONSTRAINT NOTICE_ID_PK PRIMARY KEY(ID);
ALTER TABLE NOTICE ADD CONSTRAINT NOTICE_WRITER_ID_UK UNIQUE(WRITER_ID);

-- 테이블에 적용된 제약조건 삭제하기
ALTER TABLE NOTICE DROP CONSTRAINT NOTICE_ID_PK;
ALTER TABLE NOTICE DROP CONSTRAINT NOTICE_WRITER_ID_UK;