-- 문제 1. 전체 활동 로그 만들기
-- FOLLOWS 테이블에서 팔로우를 한 사람(follower_id)과 활동일(creation_date), LIKES 테이블에서 '좋아요'를 누른 사람(user_id)과 활동일을 조회하여, 모든 활동 기록이 담긴 하나의 '전체 활동 로그'를 만들어주세요. 모든 기록이 보여야 하므로 중복은 신경 쓰지 않습니다. (UNION ALL 사용)
-- 컬럼의 의미를 통일하기 위해 별칭(Alias)을 사용하고, 어떤 활동인지 구분하는 컬럼을 추가
SELECT follower_id AS user_id, creation_date, 'FOLLOW' AS activity_type 
FROM FOLLOWS
UNION ALL
SELECT user_id, creation_date, 'LIKE' AS activity_type 
FROM LIKES;

-- 문제 2. 특정 게시물 관련 유저 찾기
-- 2번 게시물에 '좋아요'를 누른 사용자(LIKES) 또는 2번 게시물에 '댓글'을 단 사용자(COMMENTS)의 user_id 목록을 중복 없이 조회해주세요. (UNION 사용)
SELECT user_id FROM LIKES WHERE post_id = 2
UNION
SELECT user_id FROM COMMENTS WHERE post_id = 2;

-- 문제 3. 진정한 인싸 찾기
-- 우리 인스타그램에서 다른 사람을 팔로우 한 적도 있고, 다른 사람에게 팔로우를 받은 적도 있는'인싸' 사용자의 user_id를 찾아보세요. (FOLLOWS 테이블과 INTERSECT 사용)
-- 팔로우를 한 사용자 목록
SELECT follower_id FROM FOLLOWS
INTERSECT
-- 팔로우를 받은 사용자 목록
SELECT following_id FROM FOLLOWS;

-- 문제 4. 게시물만 올리는 작가님
-- 게시물(POSTS)은 작성했지만, 댓글(COMMENTS)은 한 번도 작성한 적 없는 사용자의 user_id를 찾아보세요. (MINUS 사용)
-- 게시물을 작성한 사용자 목록
SELECT user_id FROM POSTS
MINUS
-- 댓글을 작성한 사용자 목록
SELECT user_id FROM COMMENTS;

-- 문제 5. 인기 게시물의 조건
-- '좋아요'도 받고, '댓글'도 달린 게시물들의 post_id 목록을 조회해보세요. (INTERSECT 사용)
-- '좋아요'를 받은 게시물 목록
SELECT post_id FROM LIKES
INTERSECT
-- '댓글'이 달린 게시물 목록
SELECT post_id FROM COMMENTS;