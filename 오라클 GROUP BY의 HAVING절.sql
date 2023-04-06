
--GROUP BY의 조건절인 HAVING절
-- 집계함수는 GROUP BY절, HAVING절, SELECT절에서만 사용 가능
-- 집계함수는 WHERE절, FROM절에서는 사용 불가 (서브쿼리를 사용하면 가능하다)

-- 회원별 게시글 수를 조회하시오, 단 게시글이 2이하인 레코드만 출력하시오
SELECT WRITER_ID, TITLE, HIT
  FROM NOTICE
GROUP BY WRITER_ID, TITLE, HIT
HAVING TITLE IS NOT NULL
     AND HIT < 2;     