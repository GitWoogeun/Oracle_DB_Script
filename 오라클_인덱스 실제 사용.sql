-- 인덱스 실습
CREATE TABLE STARBOX_ORDER (
    ORDER_NO        NUMBER(5,0)                 NOT NULL,               -- 주문번호
    ORDER_DT        VARCHAR2(8 BYTE)         NOT NULL,               -- 주문일자
    BRANCH          VARCHAR2(10 BYTE),                                     -- 지점
    ORDER_ITEM     VARCHAR2(100 BYTE),                                   -- 주문상품
    REG_NAME       VARCHAR2(20 BYTE),                                    -- 담당 파트너
    REG_DTS         DATE                                                          -- 등록일시
);

-- 인덱스 생성                                                                              
CREATE INDEX IDX_SB1 ON STARBOX_ORDER( REG_NAME );

-- 인덱스 키를 REG_NAME으로 잡고 조회
SELECT * FROM STARBOX_ORDER WHERE REG_NAME = '봄'; 

-- 실행 계획표
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));      
--┌───────────────────────────────────────
--│     인덱스 생성 전 SQL PLAN 결과 : ( FULL SCAN )        전체에서 찾음
--└───────────────────────────────────────
-- |*  1 |  TABLE ACCESS FULL| STARBOX_ORDER |      1 |
-- INDEX를 생성하지 않고 실행계획표를 돌려보면 ASSESS FULL 스캔하는걸 볼 수있다.

--┌───────────────────────────────────────
--│     인덱스 생성 후 SQL PLAN 결과 : ( RANGE SCAN )    인덱스 생성 범위에서 찾음
--└───────────────────────────────────────
-- |   0 | SELECT STATEMENT                    |               |        |
-- |   1 |  TABLE ACCESS BY INDEX ROWID BATCHED| STARBOX_ORDER |      1 |
-- |*  2 |   INDEX RANGE SCAN                  | IDX_SB1       |      1 |


-- 인덱스 삭제
DROP INDEX IDX_SB1;

-- 사용자 인덱스 확인 쿼리  
SELECT * FROM USER_INDEXES;

-- 데이터 생성
INSERT INTO STARBOX_ORDER
VALUES
(
    '2',
    '20230403',
    '강남점',
    '아메리카노',
    '봄',
    SYSDATE
);

