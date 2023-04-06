-- ┌─────────────────────────┐
-- │문자열 패딩 함수 LPAD('문자열', '문자길이', '채울문자' )│
-- │( 빈공간이 생기면 문자열 왼쪽부터 문자를 채운다       │
-- └─────────────────────────┘
SELECT LPAD('HELLO',5) FROM DUAL;
SELECT LPAD('HELLO',5, 0) FROM DUAL;
SELECT LPAD('HELLO','10','0') FROM DUAL;
-- ┌─────────────────────────┐
-- │문자열 패딩 함수 RPAD('문자열', '문자길이', '채울문자' )│
-- │( 빈공간이 생기면 문자열 오른쪽부터 문자를 채운다 )   │
-- └─────────────────────────┘
SELECT RPAD('HELLO',5) FROM DUAL;
SELECT RPAD('HELLO',5,0) FROM DUAL;
SELECT RPAD('HELLO',10,'★') FROM DUAL;
-- 회원의 이름을 조회 ( 단, 이름의 길이가 3자가 안되는 경우는 이름 오른쪽을 ★로 채우시오)
-- PAD()를 사용할 때 한글의 길이 = 2 로 계산해야 합니다.
-- PAD()를 사용할 때 영어는 길이 = 1 로 계산해야 합니다.
-- PAD()를 사용할 때 기호는 길이 = 1 로 계산해야 합니다.
SELECT RPAD(NAME, 5, '★') AS NAME FROM MEMBER WHERE LENGTH(NAME) = 2;

-- ┌──────────────────────────┐
-- │INITCAP( 문자열의 첫글자를 대문자로 변경해주는 함수 )  │
-- │( ★ 한글의 다음에 오는 문자도 대문자로 변환이 된다 )    │
-- └──────────────────────────┘
SELECT INITCAP('in the 세계 wor★ld') FROM DUAL;
SELECT INITCAP(ID) FROM MEMBER;

-- ┌─────────────────────────┐
-- │INSTR( 문자열, 검색문자열 ) : 찾은 문자열 인덱스 반환  │
-- └─────────────────────────┘
SELECT INSTR('I want study Java', 'Java') FROM DUAL;                                        -- 첫번째 위치 : 14번째 자리 반환
-- ┌────────────────────┐
-- │INSTR( 문자열, 검색문자열 , 다시 찾을 위치 )│
-- └────────────────────┘
SELECT INSTR('I am Developer, I have to study', 'I', 5) FROM DUAL;                      -- 두번째 위치 : 17번째 자리 반환
-- ┌────────────────────────────────┐
-- │INSTR( 문자열, 검색문자열 , 첫번째를 찾았다면, 두번째 위치를 찾아라 )│
-- └────────────────────────────────┘
SELECT INSTR('SEE Java, SEE C, SEE Python', 'SEE', 1, 2) FROM DUAL;                     -- 두번째 위치 : 11번째 자리 반환
-- ┌────────────────────────────────┐
-- │INSTR( 문자열, 검색문자열 , 첫번째를 찾았다면, 세번째 위치를 찾아라 )│
-- └────────────────────────────────┘
SELECT INSTR('SEE Java, SEE C, SEE Python', 'SEE', 1, 3) FROM DUAL;      -- 세번째 위치 : 31번째 자리 반환

-- 회원의 전화번호에서 두 번째 대시(-) 문자가 존재하는 위치를 출력
SELECT INSTR(PHONE, '-', 1,2) AS Dash FROM MEMBER WHERE ID = 'takyou';

-- 회원의 전화번호에서 첫 번째 대시(-) 문자와 두 번째 대시(-) 문자가 사이의 간격은?
SELECT INSTR(PHONE, '-', 1,2) - INSTR(PHONE, '-') FROM MEMBER WHERE UPPER(ID) = 'TAKYOU';
-- 거리의 길이가 4이지만 계산적으로는 5가 나오기 때문에 -1을 해줘야한다.
SELECT INSTR(PHONE, '-', 1,2) - INSTR(PHONE, '-', 1,1) -1 FROM MEMBER WHERE UPPER(ID) = 'TAKYOU';

-- ┌────────────────────┐
-- │ LENGTH() : 문자열의 길이를 얻는 함수       │
-- └────────────────────┘
--  문자열 길이를 얻는 함수 :
SELECT LENGTH('WE ARE ONE') AS LEN FROM DUAL;

-- 모든 회원의 핸드폰 번호와 번호의 문자열 길이를 조회
SELECT NAME, PHONE, LENGTH(PHONE) AS LEN FROM MEMBER;

-- 만약에 회원의 전화번호 컬럼에 포함된 문자 '-'를 없앤 전화번호의 길이를 출력하시오
SELECT NAME, PHONE, LENGTH(REPLACE(PHONE, '-', '')) AS LEN
 FROM MEMBER;