/*
    [Oracle]계층형 쿼리 사용법 ( START WITH, CONNECT BY PRIOR, ORDER SIBLINGS BY )
    
    [ 개념정리 ]
    계층형 쿼리 : 부모, 자식 간의 수직관계를 트리 구조 형태로 보여주는 쿼리
    
    START WITH  : 트리 구조의 최상위 행을 지정합니다.
    CONNECT BY : 부모, 자식의 관계를 지정합니다.
    PRIOR          : CONNECT BY 절에 사용되며, PRIOR에 지정된 컬럼이 맞은  컬럼을 찾아갑니다.
    
    CONNECT BY PRIOR : 자식 컬럼 = 부모 컬럼 : 부모 -> 자식 순방향 전개
    CONNECT BY PRIOR : 부모 컬럼 = 자식 컬럼 : 자식 -> 부모 역방향 전개
    ORDER SIBLINGS : 계층형 쿼리에서 정렬을 수행 합니다.
*/

CREATE TABLE TEST_TABLE
(
    parent_c    VARCHAR2(1),
    child_c      VARCHAR2(1)
);

INSERT INTO TEST_TABLE
SELECT 'a', 'b' from dual
UNION ALL
SELECT 'b', 'c' from dual
UNION ALL
SELECT 'a', 'c' from dual
UNION ALL
SELECT 'c', 'd' from dual
UNION ALL
SELECT 'c', 'e' from dual
UNION ALL
SELECT 'e', 'f' from dual;
commit;

-- [ 테스터 데이터 조회 ]
SELECT PARENT_C AS P
         , CHILD_C AS C 
  FROM TEST_TABLE;

-- [ 부모->자식 순방향 전개 계층형 쿼리 예제 ]
-- 첫번째 부모행을 시작으로 자식 탐색
-- e f 4    첫번째 부모행의 자식 탐색 종료

-- a c 1    두번째 부모행의 자식 탐색 시작
-- e f 3    두번째 부모행의 자식 탐색 종료
SELECT PARENT_C AS P
         , CHILD_C   AS C
         , LEVEL
  FROM TEST_TABLE
START WITH PARENT_C = 'a'
CONNECT BY PRIOR CHILD_C = PARENT_C;
/*
    [ 실행 결과 해석 ]
    LEVEL을 보면 첫 번째 최상위 부모 행을 찾으면 자식이 없을때 까지 계속 타고 들어갔다가
    마지막까지 탐색 후 두 번째 최상위 부모 행의 자식을 탐색 합니다.
*/

-- [ CONNECT BY에 조건절을 넣을 경우 예제 ]
SELECT PARENT_C AS P, CHILD_C AS C, LEVEL
 FROM TEST_TABLE
START WITH PARENT_C = 'a'
CONNECT BY PRIOR CHILD_C = PARENT_C AND PARENT_C = 'c';
/*
    [ 실행 결과 해석 ]
    START WITH 절에서 선택된 부모 데이터는 무조건 포함이 되고 자식 데이터들에 의해
    PARENT_C = 'C'조건으로 필터링된 결과가 나타납니다.
*/

-- [ ORDER SIBLINGS 사용한 계층형 쿼리 예제 ]
SELECT PARENT_C AS P
         , CHILD_C   AS C
         , LEVEL
  FROM TEST_TABLE
START WITH PARENT_C = 'a'
CONNECT BY PRIOR CHILD_C = PARENT_C
ORDER SIBLINGS BY CHILD_C DESC;
/*
    [ 실행결과 해석 ]
    child_c = 'f'에 대한 자식행이 1행 밖에 없으므로 (테스트 데이터 참조)
    마지막 부모 계층까지 탐색 후 종료 됩니다.
*/

/*
    [ 결론 ]
    계층형 쿼리 사용법을 알아두면 부서별 계층 관계, 품목 설계도에서 부품 간 계층 관계 등
    여러 비즈니스 로직에 활용할 수 있을 것으로 생각 된다.
*/