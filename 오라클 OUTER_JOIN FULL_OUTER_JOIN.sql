-- OUTER JOIN
-- LEFT/RIGHT 아웃터조인 ( OUTER JOIN )

-- 부모테이블을 기준으로 자식테이블의 모든 레코드(NULL포함)를 출력한다.
SELECT *
  FROM MEMBER MEM
LEFT OUTER JOIN NOTICE NTC
  ON MEM.ID = NTC.WRITER_ID;
-- 왼쪽에 있는 모든 OUTER를 포함 시키겠다. ( LEFT OUTER JOIN )
-- 오른쪽에 있는 OUTER를 포함 시키겠다. ( RIGHT OUTER JOIN )
-- 양쪽의 모든 OUTER를 포함 시키겠다. ( FULL OUTER JOIN )
    
    
-- LEFT OUTER JOIN : 왼쪽에 있는 OUTER들을 포함시키겠다.
-- 왼쪽에 있는 NOTICE는 모든 OUTER들은 포함 되지만,
-- 오른쪽에 있는 관계 없는 OUTER들은 삭제
SELECT *
  FROM NOTICE NTC
LEFT OUTER JOIN MEMBER MEM
    ON NTC.WRITER_ID = MEM.ID;
    
-- 다음 테이블을 RIGHT OUTER JOIN을 하면 총 레코드의 개수를 구해요
SELECT *
  FROM NOTICE NTC
RIGHT OUTER JOIN MEMBER MEM
    ON MEM.ID = NTC.WRITER_ID;
 -- > 9개   
    
-- 다음 테이블의 FULL OUTER JOIN을 하면 총 레코드 개수는 몇 개인가..?
-- FULL OUTER JOIN은 두 테이블의 모든 OUTER들을 포함하기 때문에
-- 양쪽 테이블 모두 기준이 되고, 참조 관계인 레코드 + 양쪽 테이블의 OUTER들을 더하면 된다.
SELECT *
  FROM MEMBER MEM
FULL OUTER JOIN NOTICE NTC
                     ON MEM.ID = NTC.WRITER_ID;