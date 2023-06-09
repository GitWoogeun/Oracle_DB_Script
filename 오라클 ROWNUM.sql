-- Oracle ROWNUM 그리고 행 제한하기
-- ROWNUM을 이용해 행 수를 제한하기
SELECT * FROM MEMBER;
-- 회원 목록에서 상위 5명만 조회 ( 페이징 AND 사용 )
SELECT * FROM MEMBER WHERE ROWNUM > 0 AND ROWNUM < 6;

-- 회원 목록에서 상위 1~ 5까지의 회원목록을 조회 ( 페이징 BETWEEN 사용 )
SELECT * FROM MEMBER WHERE ROWNUM BETWEEN 1 AND 5;

-- 회원 목록에서 상위 6~10까지의 회원목록을 조회 ( 페이징 BETWEEN 사용 )
-- SELECT * FROM MEMBER WHERE ROWNUM BETWEEN 6 AND 10;

-- 회원 목록 두번째 페이지 호출하기
SELECT * FROM ( SELECT ROWNUM AS NUM, MEMBER.* FROM MEMBER )
   WHERE NUM BETWEEN 5 AND 10;

-- 제일 첫번재 하나의 레코드를 조회
SELECT * FROM MEMBER WHERE ROWNUM = 1;

-- 원리 : FROM 에서부터 SELECT해서 데이터를 뽑는것
SELECT * 
  FROM (  SELECT ROWNUM NUM, MEMBER.* FROM MEMBER )
WHERE NUM BETWEEN 5 AND 10;

SELECT *
  FROM ( SELECT ROWNUM AS NUM, MEMBER.*
                FROM MEMBER )
WHERE NUM BETWEEN 6 AND 10;


SELECT * FROM MEMBER;

SELECT ROWNUM, ID, PWD, NAME
  FROM ( SELECT ROWNUM AS NUM
                      , MEMBER.ID
                      , MEMBER.PWD
                      , MEMBER.NAME
               FROM MEMBER )
WHERE NUM BETWEEN 3 AND 6;

SELECT *
  FROM (SELECT ROWNUM NUM, MEM.* FROM MEMBER MEM ORDER BY NUM, ID DESC) MEM
WHERE NUM BETWEEN 5 AND 10;
