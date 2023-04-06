-- 순위 함수 : ROW_NUMBER( ), RANK( ), DENSE_RANK( )

-- ORDER BY를 하면 ROWNUM이 제대로 출력이 안되는 이유 :
-- ORACLE의 쿼리 실행 순서상
-- WHERE절이 실행이 되고, SELECT절, ORDER BY절의 순서로 실행이 되기 때문에
-- WHERE절에서 ROWNUM으로 레코드의 개수를 조건으로 정한다 하지만
-- ORDER BY절에서 다른 컬럼의 데이터로 정렬을 하면 ROWNUM의 번호가 정상적으로 출력이 될수 없다.
SELECT ROWNUM AS RANKING, MEM.* FROM MEMBER MEM WHERE ROWNUM BETWEEN 1 AND 5
ORDER BY REGDATE DESC;

-- ROW_NUMBER() OVER( ORDER BY 데이터 정렬 )
-- 정렬한 데이터의 상태에서 ROWNUMBER을 사용하는 방법
SELECT ROW_NUMBER() OVER(ORDER BY NVL(NOTICE.HIT, 0) DESC) AS RANKING
         , NOTICE.*
  FROM NOTICE;  

--  순위함수 RANK()를 사용 했을 때 공동순위인 경우 공동순위 레코드의 개수만큼 번호가 넘어가는 현상
SELECT RANK() OVER (ORDER BY HIT ASC) SEQ, ID, TITLE, WRITER_ID, REGDATE, HIT
  FROM NOTICE;

-- DENS_RANK() : RANK()함수와 다르게 공동 순위가 되어도 넘버링을 순서대로 출력한다. 
SELECT DENSE_RANK() OVER (ORDER BY HIT ASC) SEQ, ID, TITLE, WRITER_ID, REGDATE, HIT
  FROM NOTICE;
 / 
-- PARTITION BY : 컬럼의 공통된 데이터들 끼리 데이터를 모아서 출력  
--                     ( WRITER_ID로 모인 데이터의  HIT의 오름차순으로 순위가 정렬 된다. )
-- 이때 모인 데이터들의 WRITER_ID 또한 ABC 순위로 정렬이 된다.
SELECT DENSE_RANK() OVER (PARTITION BY WRITER_ID ORDER BY HIT ASC) AS RANKING 
         , ID, TITLE, WRITER_ID, REGDATE, HIT
  FROM NOTICE;