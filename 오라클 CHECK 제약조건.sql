-- 체크 제약조건
-- 테이블을 생성할 때 설정하는 방법

-- 체크 제약조건( PHONE 데이터가 010으로 시작하면서 뒷 자릿수는 4자리 )
CREATE TABLE TEST (
        ID          VARCHAR2(50)        NULL,
        PHONE   VARCHAR2(200)  CHECK(PHONE LIKE '010-%-____')  NOT NULL,
        EMAIL     VARCHAR2(500)      NULL
);

-- 테이블을 생성 한 후에  적용방법 ( CONSTRAINT = 제약조건 )
ALTER TABLE MEMBER MODIFY PHONE CHAR(13) NOT NULL CHECK(PHONE LIKE '010-%-____');

-- CHECK 제약조건이 맞지 않으면 : SQL 오류 : 
-- ORA-02290 : 체크 제약조건(HR.CK_TEST_PHONE)이 위배되었습니다.
INSERT INTO MEMBER (ID, NAME, PHONE) VALUES ('8', '테스트폰', '010-313-32');