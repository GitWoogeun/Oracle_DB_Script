
-- 게시글 중에서 작성자가 'newlec'인 게시글만 조회하시오
select * from notice where writer_id = 'newlec';

-- 게실글 중에서 조회수가 3이 넘는 글만 조회하시오
select * from notice where hit > 3;

-- 게시글 중에서 내용을 입력하지 않은 게시글만 조회하시오
select * from notice where content is null;