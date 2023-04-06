-- 회원 중에서 '박'씨 성을 가진 사람을 조회
SELECT * FROM MEMBER WHERE NAME LIKE '박'||'%';

-- 이름에 w를 가진 사람의 데이터를 조회
SELECT * FROM MEMBER WHERE NAME LIKE '%'||'w'||'%';

-- 이름에 '박'씨 성을 가진 사람의 데이터를 조회
SELECT * FROM MEMBER WHERE NAME LIKE '박'||'_'||'_';

-- ID가 6자릿수를 가진 데이터를 조회 
SELECT * FROM MEMBER WHERE ID LIKE '______';

-- '박'씨 성을 제외한 모든 데이터 출력
SELECT * FROM MEMBER WHERE NAME NOT LIKE '박'||'%';

-- 회원 중에서 이름에 '오'자가 들어간 회원을 조회하시오
SELECT * FROM MEMBER WHERE NAME LIKE '%'||'오'||'%';