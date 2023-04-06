-- Character 형식

-- LONG : variable-length character string
--           containing up to 2 gigabytes -1, or 2^31-1 byte

-- CLOB   : 대용량 텍스트 데이터 타입 (최대 4Gbyte)                 => Character large Object ( 굉장히 큰 데이터 타입 )
-- NCLOB : 대용량 텍스트 유니코드 데이터타입(최대 4GByte)       => National Character large Object ( 유니코드 )

-- NUMBER [ ( p[ , s ] ) ]

-- A NUMBER value requires from 1 to 22 byte
-- The precision p can range from 1 to 38.
-- The scale s can range from -84 to 127

-- NUMBER(4)     => 최대 4자리로 이루어진 숫자
-- NUMBER(6,2)   => 소수점 2자리를 포함하는 최대 6자리의 숫자 ( 소수점 둘째 자리에서 반올림 )
-- NUMBER(6, -2) => 소수점 -2자리에서 반올림하는 최대 6자리 숫자( 1234.56 = 1200, 1234.99 = 1300 ) 
CREATE TABLE MEMBER(
    ID              VARCHAR2(50),
    PWD           VARCHAR2(50),
    NAME         VARCHAR2(50),
    GENDER      NCHAR(2),              -- 남성, 여성 NCHAR(2) 
    AGE            NUMBER(3),           -- 나의의 최대 수는 3자리 수 이기 때문 : EX 100살 or 120살 등등
    BIRTHDAY    VARCHAR2(10),       -- 1994-07-15
    PHONE        CHAR(13),              -- 010-1234-2345
    REGDATE      DATE
); 

-- Date 형식을 찾아볼수있는 NLS_DATABASE_PARAMITERS 테이블
SELECT * FROM NLS_DATABASE_PARAMETERS;

-- Date 형식

-- DATE          => 4712 BC ~ 9999 AD (EX:01-JAN-99)

-- TIMESTAMP => NLS_TIMESTAMP_FORM,AT 파라미터에 명시된 값을 따름

-- TIMESTAMP WITH TIME ZONE => NLS_TIMESTAMP_TZ_FORMAT :  파라미터 명시된 값을 따름

-- TIMESTAMP WITH LOCAL TIME ZONE => NLS_TIMESTAMP_FORMAT : 파라미터에 명시된 값을 따름
