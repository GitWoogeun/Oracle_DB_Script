-- 데이터 수정하기
-- 모든 행의 PWD를 222로 수정하기
UPDATE MEMBER SET PWD = '222';

-- 특정 유저만 PWD를 111로 수정하기
UPDATE MEMBER 
      SET PWD = '111' 
WHERE ID = 'dragon';

UPDATE MEMBER
      SET NAME = '손오공', PWD = '333'
WHERE ID = 'dragon';

SELECT ID, PWD, NAME FROM MEMBER;

INSERT INTO MEMBER ( ID, PWD, NAME ) VALUES( 'TEST', '111', 'TEST유저');

-- 특정 데이터 삭제하기
DELETE MEMBER WHERE NAME = 'TEST유저';

-- ORACLE SQL은 12강까지 했고, JDBC 강의 듣고 13강부터 다시 듣기