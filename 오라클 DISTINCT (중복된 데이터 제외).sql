SELECT * FROM MEMBER;

-- DISTINCT의 경우 : 중복된 데이터값을 제외할때 사용한다.
-- 하지만 DISTINCT는 2개 이상의 컬럼을 호출할때는 쓰지 않는것이 좋다.
-- 이유 : NAME 컬럼에 중복된 이름이을 제외하기 위해 DISTINCT를 사용했지만,
--         AGE 컬럼의 데이터값이 다른 경우 
--         DISTINCT NAME을 했어도 AGE컬럼의 값이 다르기 때문에 이름이 제외되지는 않는다.
--         그렇기 때문에 DISTINCT를 사용할 때는 하나의 컬럼의 중복된 데이터를 제외할때를 제외하곤
--         사용하지 않는 편이 좋다.
SELECT DISTINCT AGE, NAME
 FROM MEMBER;