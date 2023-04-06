
-- 시퀀스 ( SEQUENCE ) : 일련번호
CREATE SEQUENCE NOTICE_ID_SEQ      -- 시퀀스 이름
     INCREMENT BY 1                         -- 1씩 증가
         START WITH 1                         -- 1부터 시작
            MINVALUE 1                        -- 최소값 = 1
                 CACHE 20                       -- 캐쉬 20
                 ORDER;                          -- 정렬을 하겠다.

INSERT INTO NOTICE ( ID, WRITER_ID, TITLE )
VALUES ( NOTICE_ID_SEQ.NEXTVAL, 'WOOGEUN', '시퀀스 예제2');
                 
-- 오라클 설정으로 시퀀스를 자동으로 생성되게 하면 PK를 입력하지 않아도
-- 자동으로 PK값이 +1씩 SEQUENCE가 증가한 값이 삽입된다.
INSERT INTO NOTICE ( WRITER_ID, TITLE )
VALUES ( 'WOOGEUN', '시퀀스 예제2');

-- 다음 시퀀스 값을 불러온다.
SELECT NOTICE_ID_SEQ.NEXTVAL FROM DUAL;

-- 레코드 삭제 시 시퀀스의 증가한 값이 다시 원래로 돌리는 방법
-- SEQUENCE.NEXTVAL을 사용 시 계속 -1씩 되기 때문에
-- 한번 되돌리면 다시 INCREMENT BY 1로 시퀀스를 설정해줘야 한다.

-- SEQUENCE.NEXTVAL을 호출 시 -1씩 시퀀스 값이 감소
ALTER SEQUENCE NOTICE_ID_SEQ INCREMENT BY -1;

SELECT NOTICE_ID_SEQ.NEXTVAL FROM DUAL;

-- SEQUENCE.NEXTVAL을 호출 시 +1씩 시퀀스 값이 증가
ALTER SEQUENCE NOTICE_ID_SEQ INCREMENT BY 1;