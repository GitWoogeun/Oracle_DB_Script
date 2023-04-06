-- 집계함수와 GROUP BY절

-- NOTICE 테이블에 TITLE이 몇개인지 확인
SELECT COUNT(TITLE) FROM NOTICE;
SELECT * FROM NOTICE;

-- COUNT() 함수는 컬럼의 데이터가 NULL인 경우는 COUNT를 세지 않는다.
-- 테이블의 레코드를 셀 때는 COUNT(*) or 데이터가 null값 인 경우가 없는 PK컬럼을 해줘야 한다.
SELECT COUNT(TITLE) FROM NOTICE;

-- NOTICE 테이블의 총 조회수와 조회수의 평균을 구하시오
SELECT SUM(HIT), AVG(HIT) FROM NOTICE;

-- COUNT() : NULL것은 카운트하지 않는다.
-- 작성자별로 게시글의 개수와 게시글의 합친 수를 구하시오
SELECT WRITER_ID, COUNT(TITLE)
  FROM NOTICE
GROUP BY WRITER_ID;

-- 조회수가 제일 많은 사람의 순서대로 타이틀의 개수와, 누가 제일 많은 조회수를 받았고 작성자 또한 출력하세요
SELECT WRITER_ID
         , COUNT(TITLE)         AS TITLE_CNT
         , SUM(NVL(HIT, 0))     AS TOTAL_HIT_CNT
  FROM NOTICE
GROUP BY WRITER_ID
ORDER BY TOTAL_HIT_CNT DESC, TITLE_CNT DESC;

-- SQL 실행 순서 :
-- FROM절 -> CONNECT BY절 -> WHERE절 -> GROUP BY절 -> HAVING절 -> SELECT -> ORDER BY절 
-- SELECT 에서 만든 별칭은 ORDER BY절만 가능하다.
SELECT COUNT(HIT) COUNT FROM NOTICE ORDER BY COUNT DESC;