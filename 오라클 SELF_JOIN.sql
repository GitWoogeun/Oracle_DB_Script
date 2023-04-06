-- SELF_JOIN
-- 자기 조인
-- 데이터가 서로 포함 관계를 가지는 경우 : 담당, 구성, 연락
-- 테이블에 참조 컬럼이 하나 있어야 한다.

-- MEMBER의 모든 레코드가 나올 수 있도록 LEFT OUTER JOIN
-- 자기가 자기를 JOIN을 해서 컬럼 하나 추가하기(BOSS_NAME) 컬럼 추가
SELECT MEM.*, BOSS.NAME AS BOSS_NAME
  FROM MEMBER MEM LEFT OUTER JOIN MEMBER BOSS
     ON BOSS.ID = MEM.ID;