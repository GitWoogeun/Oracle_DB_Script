-- 부조회 ( 서브쿼리 )
-- 서브 쿼리를 사용하는 경우
-- 구절의 순서를 바꿔야 하는 경우
SELECT *
  FROM MEMBER
WHERE ROWNUM BETWEEN 1 AND 10;


-- 아래처럼 한다면 5개의 데이터를 가져오고 REGDATE의 최신 등록순으로 정렬이 되지만,
-- RANKING을 제대로 정할수가 없다.
SELECT ROWNUM AS RANKING, MEM.* 
FROM MEMBER MEM
WHERE ROWNUM BETWEEN 1 AND  5
ORDER BY REGDATE DESC, RANKING ASC;

--  위의 쿼리 해결 방법 
-- ┌─────────────────────────────────────────────────┐
-- │ 최신 등록순으로 정렬한 결과에서 상위 5명을 원하는 경우라면?                                                          │
-- │ 5개의 데이터를 뽑고 REGDATE로 정렬이 가능 한 이유 :                                                                     │ 
-- │ 쿼리의 순서상 FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY 입니다.                     │
-- │ 그렇기 때문에 WHERE 절이 먼저 실행이 되어서 5개의 데이터를 가져와서                                              │ 
-- │ SELECT절에서 OVER()함수를 이용하여 ORDER BY를 호출해서 REGDATE의 최신순으로 정렬이 가능 합니다.     │
-- └─────────────────────────────────────────────────┘
SELECT RANK() OVER(ORDER BY REGDATE DESC) AS RANKING, MEM.*
 FROM MEMBER MEM
WHERE ROWNUM BETWEEN 1 AND 10;


-- 서브쿼리를 이용한 5개의 데이터를 가져오고 REGDATE의 최신 등록순으로 정렬
-- FROM절에서 ( 서브쿼리를 이용하여 최신등록순의 데이터로 만들어 놓고 ) 
-- FROM절 밖에서 5개의 데이터를 가져오면 최신등록된 데이터의 레코드를 5개를 출력한다. 
SELECT ROWNUM RANKING, MEM.*
  FROM (SELECT * FROM MEMBER ORDER BY REGDATE DESC) MEM -- 서브 쿼리
WHERE ROWNUM  BETWEEN 1 AND 5;

-- 서브쿼리를 이용해 페이징 처리 하기
SELECT *
  FROM (SELECT ROWNUM AS RANKING, MEM.*
                FROM MEMBER MEM)
WHERE RANKING BETWEEN 5 AND 10;

-- 나이가 30이상인 회원 목록을 조회하시오
SELECT * FROM MEMBER WHERE AGE > 30; 

-- 평균나이가 30 이상인 회원 목록을 조회하시오
SELECT *
  FROM MEMBER
WHERE AGE >= (SELECT TRUNC(AVG(AGE))
                         FROM MEMBER);  