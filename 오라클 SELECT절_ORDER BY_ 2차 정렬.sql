-- SELECT 구절
-- 연산 절
-- 순서 : (1).SELECT, (2).FROM, (3).WHERE, (4).GROUP BY, (5).HAVING, (6).ORDER BY

-- FROM 테이블이 올수도 있고, 레코드 합친 연산도 올수 있다.

-- 필터링
-- WHERE

-- 집계 함수
-- GOUP BY ( COUNT , AVG )
-- WHERE절을 못쓴다 그래서 쓸수 있는게 HAVING절이다.

-- 정렬 함수 
-- ORDER BY

-- ORDER BY ( 정렬 순서 ) 
-- ASC (오름차순) , DESC (내림차순)
-- 회원테이블에서 이름을 기준으로 역순으로 정렬해서 조회
SELECT * FROM MEMBER ORDER BY NAME DESC;

-- 회원 중에서 '박'씨 성을 가진 회원을 조회 (단, 나이를 (오름차순)으로 정렬
SELECT * FROM MEMBER WHERE NAME LIKE '박'||'%' ORDER BY AGE ASC;

-- (2차 정렬) 조회 수가 같을 때는 등록일이 더 빠른걸로 정렬을 해라
SELECT * FROM NOTICE ORDER BY REGDATE ASC, HIT DESC;