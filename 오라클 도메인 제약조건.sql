-- 도메인 제약조건 : 데이터를 입력 받을 떄 제약을 걸겠다.
-- 제약조건의 순서
-- 도메인 > 엔티티 > 릴레이션(테이블관의 관계)

-- 도메인 제약조건 : ex) 학번 : 0보다 큰 정수, 이름 :  20자 내의 문자 등
-- 유효한 값의 범위 

-- 속성에 도메인이 아닌 값이 올 수 없도록 하는 제약조건
-- 1. NOT NULL : 필수값 ( 반드시 데이터가 존재 해야 한다. )
-- 2. DEFAULT   : 사용자가 데이터를 전달하기 전의 기본으로 있어야 하는 값
-- 3. CHECK     : 도메인의 범위를 체크하는 체크 제약조건

-- ┌─────────────
-- │ NOT NULL 제약조건 (필수값)
-- └─────────────
CREATE TABLE TEST
(
    ID              VARCHAR2(50)     NOT NULL,
    EMAIL         VARCHAR2(200)   NULL,
    PHONE        CHAR(13)            NOT NULL
);
INSERT INTO TEST ( ID ) VALUES ( '222');
-- SQL 오류 발생 : ORA-01400: NULL을 ("NEWLEC"."TEST"."PHONE") 안에 삽입할 수 없습니다
INSERT INTO TEST(PHONE) VALUES('222');
-- SQL 오류 발생 : ORA-01400 : NULL을 ("HR","TEST","PHONE") 안에 삽입할 수 없습니다. 

-- 테이블이 생성된 후 NOT NULL 제약조건 적용하는 방법
ALTER TABLE TEST MODIFY EMAIL NVARCHAR2(50) NOT NULL;

-- ┌─────────────
-- │ DEFAULT 제약조건
-- └─────────────
--테이블을 생성할 때 적용 방법
CREATE TABLE TEST
(
    ID          VARCHAR2(50) NOT NULL,
    EMAIL     VARCHAR2(200) NULL,
    PHONE   CHAR(13) NOT NULL,
    PWD      VARCHAR2(200) DEFAULT '111'
);
-- 컬럼에 DEFAULT 제약조건이 있다면, 데이터를 삽입할 때 따로 값을 지정 안해줘도 된다.
INSERT INTO TEST ( ID, PHONE ) VALUES ( 'testId', '010-0000-0000' );
SELECT * FROM TEST;
DROP TABLE  TEST;
PURGE RECYCLEBIN;

-- 굳이 직접 입력할 필요 없는 컬럼들
-- 등록일
-- 조회수
-- 관리자가 부여하는 비밀번호 등

-- 테이블이 생성된 후에 DEFAULT 제약조건 적용방법
ALTER TABLE NOTICE MODIFY REGDATE TIMESTAMP(6) DEFAULT SYSTIMESTAMP;
-- 확인 데이터 저장
INSERT INTO NOTICE ( ID, TITLE, WRITER_ID ) VALUES('6', '이제 곧 출근한다.', 'takyou');
-- REGDATE가 DEFAULT가 SYSTIMESTAMP로 정상적으로 데이터값이 들어왔는지 확인
SELECT * FROM NOTICE ORDER BY ID DESC;