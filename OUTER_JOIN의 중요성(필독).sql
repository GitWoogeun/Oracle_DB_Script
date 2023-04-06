-- OUTER JOIN을 이용한 게시글 목록 쿼리

-- 게시글의 컬럼명을 식별하기 위해 테이블명을 사용
-- 테이블 명에도 별칭 가능 MEMBER => MEM, NOTICE => NTC
SELECT NTC.ID, MEM.NAME, NTC.TITLE
 FROM MEMBER MEM
  JOIN NOTICE NTC
    ON  MEM.ID = NTC.WRITER_ID;
    
-- ★★★★★★★★ ( 엄청 중요 ) ★★★★★★★★
-- ID, NAME 그리고 회원별 작성한 모든 게시글 개수를 조회
-- 모든 회원은 전부 출력해야 한다.
-- OUTER JOIN == 주인공(기준)을 잡는 것
SELECT MEM.ID, MEM.NAME, NTC.WRITER_ID, COUNT(NTC.TITLE) AS TITLE_CNT
  FROM MEMBER MEM
LEFT OUTER JOIN NOTICE NTC
             ON MEM.ID = NTC.WRITER_ID
GROUP BY WRITER_ID, MEM.NAME, MEM.ID;