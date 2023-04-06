-- 오라클 정규식 표현 ( Regular Expression )
-- => 짧게 : regex, regexp라고도 한다.
-- 정규식을 볼때 참고 사이트 :: regexlib.com

SELECT * FROM NOTICE WHERE TITLE LIKE '%-%-%';

-- 정규식에서 가장 기본적으로 사용하는 것
-- 정규식에서 []는 하나의 문자를 대변한다.
-- [0123456789] :  0~9까지 대변 할수 있음
-- [0~9]            :  0~9까지 대변 할수 있음
-- 전화번호 정규식 :  01[0~9]-\d{4}-\d{4}

-- 설명 : 01[0~9까지 아무거나 가능]
--       : \d{3,4} 3자리수 아니면 4자리수 가능
--       : \d{4}   4자리수 가능 
SELECT * FROM NOTICE;
SELECT * FROM NOTICE WHERE REGEXP_LIKE(TITLE, '01[0~9]-\d{3,4}-\d{4}');

-- 이메일 ( 문자열 비교를 위한 정규화 )
-- \D\w*@\D\w*.( org | net | com )
-- \D : 숫자가 아닌 모든 항목과 일치 합니다.
-- \w : 모든 단어 문자와 일치합니다. [ a-zA-Z_0-9 ]과 동일
-- *    : 이전 표현식의 0개 이상 입니다.
-- |    : 교체 ( or )과 같다.
-- ( )  : 표현식의 일부의 논리적 그룹화 입니다.
SELECT *
   FROM MEMBER
WHERE REGEXP_LIKE(EMAIL, '^\D\w*@\D\w*.(org|net|com)$');