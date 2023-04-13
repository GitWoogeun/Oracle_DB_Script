
-- INNER JOIN ( 내부 조인 )
-- ★★ 데이터의 무결성 ★★
-- 중복된 데이터 컬럼을 없애기 위해서 테이블 간의 조인을 한다.
-- 테이블들을 데이터를 베이스화 하는 방식으로 처리하자!


-- 조인의 종류 
-- INNER JOIN, OUTER JOIN, SELF JOIN, CROSS JOIN( Cartesian Product )

-- JOIN의 예

SELECT * FROM MEMBER;
SELECT * FROM NOTICE;

-- 부모테이블 MEMBER (회원의 ID), 자식 테이블 NOTICE ( 게시글 작성자 WRITER_ID )
-- 부모는 대부분 하나를 가지고 다 쪽이 자식이 된다.
-- 1 : 다의 관계
-- PK( ID ) => FK( WRITER_ID )
SELECT *
  FROM MEMBER MEM, NOTICE NTC
WHERE MEM.ID = NTC.WRITER_ID;

-- ANSI INNER JOIN 방법. 
-- 서로 관계가 없는(OUTER 레코드의) 데이터는 출력해주지 않는다
SELECT * 
  FROM MEMBER MEM
   JOIN NOTICE NTC
      ON MEM.ID = NTC.WRITER_ID; 
      

-- 양 쪽 테이블에서 참조관계가 되어 있는 데이터를 출력하는것 : INNER JOIN
-- 양 쪽 테이블중 주인공테이블의 반대쪽 테이블의 참조되지 않은것 까지 출력 하는것 : Outer JOIN

-- 참조키를 기준으로 일치하는 행만 조인
-- 각 테이블의 참조 관계가 없는 OUTER들은 사라지고 
-- 참조 관계가 있는 레코드만 출력된다.
SELECT *
  FROM MEMBER MEM
 INNER JOIN NOTICE NTC
            ON MEM.ID = NTC.WRITER_ID;