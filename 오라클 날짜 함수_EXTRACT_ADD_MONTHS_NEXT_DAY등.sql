-- 날짜 함수 :

-- 현재 시간을 얻는 함수 
SELECT SYSDATE                        -- SYS : 오라클 DBMS 위치가 설치된 서버의 시간 
        ,  CURRENT_DATE              -- 사용자 세션에 설정된 시간을 기반으로 나타내는 함수
        , SYSTIMESTAMP                -- 밀리세컨드까지 얻고 싶을 때는 TIMESTAMP
        , CURRENT_TIMESTAMP
  FROM DUAL;
  
-- 세션 시간 ( 한국 '09:00')
ALTER SESSION SET TIME_ZONE = '09:00';

-- 세션 시간 ( LA : '-08:00')
ALTER SESSION SET TIME_ZONE = '-08:00';

-- 세션 포맷 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

-- 날짜 추출함수 EXTRACT( YEAR/MONTH/DAY/HOUR/MINUTE/SECOND FROM 추출할 컬럼 및 테이블 )
SELECT EXTRACT( YEAR FROM SYSDATE ) FROM DUAL;          -- 년도
SELECT EXTRACT( MONTH FROM SYSDATE ) FROM DUAL;      -- 당월
SELECT EXTRACT( DAY FROM SYSDATE ) FROM DUAL;           -- 날일

-- 가입 회원 중에 비수기 ( 2, 3, 11, 12)월에 가입한 회원을 조회하시오
SELECT * FROM MEMBER WHERE EXTRACT(MONTH FROM REGDATE) IN (2, 3, 11, 12);

-- ADD_MONTH : 날짜를 누적하는 함수
SELECT ADD_MONTHS(SYSDATE, 1) FROM DUAL;

-- 가입 회원 중에 가입한지 6개월이 안 되는 회원을 조회
SELECT * FROM MEMBER WHERE REGDATE > ADD_MONTHS(SYSDATE, -6);
-- 가입 회원 중에 가입한지 6개월이 넘은 회원을 조회
SELECT * FROM MEMBER WHERE REGDATE < ADD_MONTHS(SYSDATE, -6);

SELECT ADD_MONTHS(SYSDATE, -1)      -- 지난 달 
         , ADD_MONTHS(SYSDATE, 0)       -- 이번 달
         , ADD_MONTHS(SYSDATE, 1)       -- 다음 달
FROM DUAL;

-- 몇개월의 날짜 차이를 알아내는 함수 : MONTHS_BETWEEN( 날짜, 날짜 )
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2021-07-13')) FROM DUAL;

-- 설정된 날짜 다음으로 오는 요일을 알려주는 함수 NEXT_DAY( 날짜설정, 돌아오는 요일 날짜)
SELECT NEXT_DAY(TO_DATE('2023-04-01'), '월요일') AS 찾는요일날짜 FROM DUAL;

-- 월의 마지막 일자를 알려주는 함수 LAST_DAY(날짜)
SELECT LAST_DAY(SYSDATE) FROM DUAL;
-- 설정달의 마지막 일자를 알아보자
SELECT LAST_DAY(TO_DATE('2023-04-01', 'YYYY-MM-DD')) FROM DUAL;

-- 지정된 범위에서 날짜를 반올림하는 함수 ROUND
SELECT ROUND(TO_DATE(SYSDATE,'YYYY-MM-DD'),'CC') FROM DUAL;
-- 지정된 범위에서 날짜를 자르는 TRUNC(날짜, 포멧)
SELECT TRUNC(SYSDATE, 'CC') FROM DUAL;

-- 현재로써는 이 3가지 (년, 월, 일)만 가능
SELECT TRUNC(SYSTIMESTAMP, 'YEAR')     AS TIME          -- 년 단위
         , TRUNC(SYSTIMESTAMP, 'MONTH') AS MONTH      -- 월 단위 절사
         , TRUNC(SYSTIMESTAMP, 'DD')        AS DAY           -- 일 단위 절사
  FROM DUAL;
  
-- 소수점 뒤자리를 제외 하는 TRUNC
-- 응용 나잇대를 알아볼수있음 10으로 나눈 뒤 TRUNC으로 소수점 뒤를 전부 제거 후 다시 10 곱하면 나잇대 확인 가능
SELECT TRUNC(NVL2(AGE, AGE/10, 0)) * 10 FROM MEMBER;