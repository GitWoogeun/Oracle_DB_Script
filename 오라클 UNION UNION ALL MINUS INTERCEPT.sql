-- UNION
-- 유니온과 조인
-- JOIN으로 합치는 방법

-- 컬럼이 늘어나는게 아니고 레코드를 합치는 작업
-- 주의할 점은 컬럼의 개수, 컬럼의 자료형을 맞춰줘야 한다.
-- 통합검색하는것처럼
-- 각 조건의 결과물을 합쳐서 하나의 테이블로 만들수도 있다.
-- UNION 
-- 두 개의 테이블을 합쳤을 때 두 개의 레코드가 같을 경우 
-- 중복된 레코드를 없애준다.
-- 중복되지 않은 데이터는 출력
SELECT ID FROM MEMBER
UNION
SELECT WRITER_ID FROM NOTICE;

-- MINUS : 두 테이블의 레코드가 동일하다면 없애주는것
-- 참조 관계인 데이터는 제외되고 참조되지 않은 레코드만 출력해준다.
-- MINUS : 두 테이블의 레코드가 동일하다면 없애주는것
SELECT ID FROM MEMBER
 MINUS
SELECT WRITER_ID FROM NOTICE;

-- INTERCEPT
-- 중복된 레코드만 화면에 출력해준다.
SELECT ID FROM MEMBER
 INTERSECT
SELECT WRITER_ID FROM NOTICE;


-- UNION ALL
-- 공통과 상관없이 두 테이블의 
-- 참조관계인 모든 레코드를 다 나오게 하고 싶을 때
SELECT ID, REGDATE FROM MEMBER
UNION ALL
SELECT WRITER_ID, REGDATE FROM NOTICE;