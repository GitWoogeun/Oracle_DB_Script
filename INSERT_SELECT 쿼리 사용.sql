--쓰레기 테이블 삭제하기
PURGE RECYCLEBIN;
SELECT * FROM TAB;

-- 데이터 삽입하기 - INSERT
-- 테이블의 모든 컬럼의 데이터를 저장
INSERT INTO MEMBER VALUES('', '', '', '', '', '', '', '', '', ''); 

-- INSERT 명명 규칙 특정 컬럼에 데이터 저장 
INSERT INTO MEMBER( ID, PWD ) VALUES ('takyou', '1234');
INSERT INTO MEMBER( ID, PWD ) VALUES ('dragon', '1234');

-- * : 모든 컬럼 조회
SELECT * FROM MEMBER;

-- 특정 컬럼만 조회
SELECT ID, PWD FROM MEMBER;

SELECT ID       AS 아이디
        , PWD     AS 비밀번호
    FROM MEMBER;
    
SELECT ID AS "user id"
  FROM MEMBER;