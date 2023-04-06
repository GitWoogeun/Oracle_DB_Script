-- Oracle 데이터베이스 문자열 함수 #1

-- ┌──────────────┐
-- │   문자열 자르기 SUBSTR( )     │
-- └──────────────┘
-- 문자열 추출함수 SUBSTR( 문자열 시작 )
SELECT SUBSTR('저는 반드시 차세대 IT리더가 될꺼에요!', 8)  FROM DUAL;  -- 8번째 부터 문자열 출력
SELECT SUBSTR('저는 개발자에요', 4) FROM DUAL;
-- 문자열 추출함수 SUBSTR( 문자열, 시작위치, 출력길이 )
SELECT SUBSTR('ABCDEFG',3,4) FROM DUAL;                                       -- 3번째부터 4개의 문자만 출력 => CDEF
SELECT SUBSTR('안녕하세요 저는 탁우근 입니다.', 7, 6) FROM DUAL;         -- 7번째부터 6개의 문자만 출력 => 저는 탁우근

-- 모든 학생의 이름과 나이 몇십대 인지만을 조회하시오
SELECT SUBSTR(NAME, 2,3) AS NAME , SUBSTR(AGE,1,1) AS AGE FROM MEMBER;
  
-- 회원 중에서 전화번호가 010으로 시작하는 회원의 모든 정보를 출력
SELECT * FROM MEMBER WHERE SUBSTR(PHONE,1,3) = '010';

-- LIKE문으로 출력
SELECT * FROM MEMBER WHERE PHONE LIKE '010'||'%';

-- 회원 중에서 생년 월이 7,8,9인 회원의 모든 정보를 출력
SELECT * FROM MEMBER WHERE SUBSTR(BIRTHDAY, 6,2) IN('07','08','09');

-- 전화번호를 등록하지 않은 회원 중에서 생년 월이 7,8,9인 회원의 모든 정보를 출력
-- 연속된 숫자라 IN() 가능하지만, BETWEEN도 사용 가능
SELECT * FROM MEMBER WHERE PHONE IS NULL AND SUBSTR(BIRTHDAY, 6,2) BETWEEN 7 AND 9;

-- ┌──────────────┐
-- │   문자열 합치기 CONCAT( )    │
-- └──────────────┘
-- 문자열 덧셈 함수
SELECT CONCAT('탁', '우근') FROM DUAL;

-- ┌──────────────┐
-- │   문자열 합치기 기호 ||          │
-- └──────────────┘
-- 문자열 덧셈 연산자 
SELECT '탁우근개발자는' || ' IT리더에요' FROM DUAL;
SELECT ('탁우근개발자는' + 'IT리더에요') FROM DUAL;

-- ┌──────────────┐
-- │ TRIM() : 양쪽의 빈공백을 제거 │
-- └──────────────┘
SELECT '       안녕안녕       '            AS BASIC_COLUMN FROM DUAL;
SELECT TRIM('       안녕안녕       ') AS TRIM_COLUMN FROM DUAL;
-- ┌───────────────┐
-- │ LTRIM() : 왼쪽의 빈공백을 제거  │
-- └───────────────┘
SELECT LTRIM('      안녕안녕      A') AS TRIM_COLUMN FROM DUAL;
-- ┌────────────────┐
-- │ RTRIM() : 오른쪽의 빈공백을 제거  │
-- └────────────────┘
SELECT RTRIM('A    안녕안녕       ') AS TRIM_COLUMN FROM DUAL;
-- ┌─────────────────┐
-- │ LOWER : 모든 문자를 소문자로 변경 │
-- └─────────────────┘
SELECT LOWER('TAKWOOGEUN') FROM DUAL;
-- ┌─────────────────┐
-- │  UPPER : 모든 문자를 대문자로 변경 │
-- └─────────────────┘
SELECT UPPER('takwoogeun') FROM DUAL;
-- 회원의 아이디가 takyou로 된 회원을 조회 ( 단 소/대문자 가리지 않음 )
SELECT * FROM MEMBER WHERE UPPER(ID) = 'TAKYOU';
-- ┌─────────────────────┐
-- │ REPLACE(문자열, 찾는 문자열, 대치할 문자열  │
-- └─────────────────────┘
SELECT REPLACE('NO I CAN', 'NO', 'YES') FROM DUAL;
-- 회원의 이름과 주소를 조회 ( 단, 주소는 빈칸이 없이 출력 )
SELECT NAME, REPLACE(ADDRESS, ' ', '') FROM MEMBER;
-- ┌─────────────────────┐
-- │ TRANSLATE(문자열, 기존문자, 변경 할 문자 )  │
-- │ W -> Y로, E -> O로 변환                           │
-- └─────────────────────┘
SELECT TRANSLATE('WHERE WE ARE', 'WE', 'YO') FROM DUAL;
-- 특별시 -> 성남시로 변경해서 출력하세요
SELECT TRANSLATE(ADDRESS, '특별시', '성남시') FROM MEMBER;