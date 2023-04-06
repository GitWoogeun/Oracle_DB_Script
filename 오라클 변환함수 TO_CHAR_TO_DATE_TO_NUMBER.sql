-- 형식 변환 함수
-- 숫자, 문자열, 날짜

-- 숫자 => 문자열 TO_CHAR()
-- 문자 => 날짜    TO_DATE()
-- 날짜 => 문자    TO_CHAR()
-- 문자 => 숫자    TO_NUMBER()

-- NUMBER 형식을 문자열(VARCHAR2)로 변환 TO_CHAR(NUMBER)
-- 문자열 포멧 :: 3자릿수 마다 표현 (숫자 보다 길어야 함)
SELECT TO_CHAR(1234567890, '$9,999,999,999') AS FROM DUAL;
SELECT TO_CHAR(1234567890, '9,999,999,999') AS NFMAT FROM DUAL;

-- 숫자를 문자열로 변환 후 문자열 합치기
SELECT TO_CHAR(123) || 'HELLO' FROM DUAL; 
SELECT '내 번호는 '||TO_CHAR(01012345678, 'fm999,999,999,999') FROM DUAL;

-- 숫자를 포멧팅해서 ,(콤마) 찍기
SELECT TO_CHAR(12345678, 'fm99,999,999') || 'HELLO' FROM DUAL;

-- TRIM을 사용하여 빈 공백을 제거
SELECT TRIM(TO_CHAR(1234567890, 'fm9,999,999,999')) || '원' FROM DUAL;


-- 변환함수 
-- DATE 형식을 문자열(VARCHAR2)로 변환 TO_CHAR(DATETIME)
-- ┌──────────────────────────────────────
-- │포맷문자                            : 설명
-- │YYYY/RRRR/YY/YEAR             | 년도표시 : 4자리 / Y2K/2자리/영문
-- │MM/MON/MONTH              | 월표시    : 2자리 / 영문3자리/영문전체
-- │DD/DAY/DDTH                    | 일표시    : 2자리 / 영문/2자리ST  
-- │AM/PM                             | 오전 / 오후 표시
-- │HH/HH24                          | 시간표시 : 12시간 / 24시간
-- │MI                                   | 분 표시   : 0 ~ 59분
-- │SS                                    | 초 표     : 0 ~ 59초
-- └──────────────────────────────────────

-- 자신이 원하는 형태로 포맷팅 할 수 있다.
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD PM HH24:MI:SS') FROM DUAL; 

-- 문자열을 날짜 형식으로 변환하는 함수 TO_DATE(문자열, 날짜포맷)
-- TO_DATE는 포맷팅을 해도 일자까지만 출력된다 ( 왜 그런건지는 모르겠음 )
SELECT TO_DATE('2023-03-23 12:23:03', 'YYYY-MM-DD HH:MI:SS') FROM DUAL;


-- 문자열을 숫자형식으로 변환하는 함수 TO_NUMBER(문자열)
SELECT TO_NUMBER('19940715') AS BIRTH FROM DUAL;

-- 1. 숫자형을 데이터형으로 변경
-- 2. 데이터형을 문자열형으로 변경
-- 3. 숫자형을 문자열형으로 포맷팅변경은 불가
SELECT TO_CHAR(TO_DATE(20230101, 'YYYY-MM-DD'),'YYYY-MM-DD') FROM DUAL;