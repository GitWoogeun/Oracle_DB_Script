-- 정규식을 이용한 체크제약 조건 만들기
-- 오라클의 LIKE패턴으로만드는 CHECK 제약조건일 경우,
-- 자릿수를 포맷팅하는것에 한계가 있다. 
-- CHECK( PHONE LIKE '010-____-____') 그렇기 때문에
-- 010-AAAA-BBBB 이런식으로 자릿수만 포맷팅해줘도 
-- 문자형태의 데이터가 삽입이 되기 때문에
-- 정규식을 이용하여 숫자 NUMBER만 컬럼에 삽입될 수 있도록
-- 정규식을 이용한 CHECK 제약조건을 좀 더 정밀하게 만들어야 한다.

-- 정규식을 이용한 CHECK 제약조건을 적용한 테이블 생성
CREATE TABLE TEST (
    ID          NVARCHAR2(50)   CONSTRAINT TEST_ID_PK PRIMARY KEY NOT NULL,
    PHONE   CHAR(13)              CHECK(REGEXP_LIKE(PHONE, '^01[0-9]-\d{3,4}-\d{3,4}$'))
);
ALTER TABLE TEST DROP CONSTRAINT TEST_ID_PK;

-- 정상적인 데이터 삽입
INSERT INTO TEST ( ID, PHONE ) VALUES ( 'TEST_ID', '010-1234-4321' );
-- 비정상적인 데이터 삽입
-- ORA-02290 : 체크제약조건 ( )이 위배되었습니다. 오류 발생!
INSERT INTO TEST ( ID, PHONE ) VALUES ( 'TEST_ID', '010-ASDV-123A' );


-- 제약조건 삭제하기
ALTER TABLE MEMBER DROP CONSTRAINT MEMBER_PHONE_CHK1;

-- 정규식을 이용해 CHECK제약조건으로 테이블 수정하기
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_PHONE_CHK1 
CHECK(REGEXP_LIKE(PHONE, '^01[0-9]-\d{3,4}-\d{3,4}$'));

-- PHONE컬럼의 데이터를 삽입할 때 숫자가 아닌 다른 문자가 기입이 될 시
-- ORA-02290 : 체크제약조건 (MEMBER_PHONE_CHK1)이 위배 되었습니다 발생
-- 설명 : MEMBER_PHONE_CHK1의 제약조건에 맞지 않는 형식이다.
INSERT INTO MEMBER
(ID, NAME, PWD, PHONE) VALUES('TESTNAME','NAME','1234','010-AAAA-BBBB');

