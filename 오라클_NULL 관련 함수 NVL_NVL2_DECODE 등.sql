-- NULL 관련 함수
-- 반환 값이 NULL일 경우에 대체 값을 제공하는 NVL( NULL인 경우, 대체 값 ) 함수
SELECT ID, NAME, EMAIL, NVL(AGE, 0) AS AGE FROM MEMBER;

SELECT NVL(null, '아자아자') from dual;

-- NVL에서 조건을 하나 더 확장한 NVL2( 입력값, NOTNULL 대체값, NULL 대체값 ) 함수
SELECT NVL2(AGE, TRUNC(AGE/10)*10, 0 ) FROM MEMBER;

-- 두 값이 같은 경우 NULL, 그렇지 않은 경우 첫 번째 값 반환 NULLIF(값1, 값2) 함수
-- NULL이 아닌 데이터를 NULL로 만드는 함수
SELECT NULLIF(AGE, 30) FROM MEMBER;

-- 조건에 따른 값 선택하기 DECODE(기준값, 비교값, 비교값일 경우, 비교값이 아닐 경우)
SELECT ID, NAME, PHONE, DECODE(GENDER, null, '남성', '여성') FROM MEMBER;
-- 조건에 따른 값 선택하기 DECODE(기준값, 비교값_1, 출력값_1, 비교값_2, 출력값_2)
SELECT ID, NAME, PHONE, DECODE(GENDER, '남성', '남성', null,'여성') FROM MEMBER;
