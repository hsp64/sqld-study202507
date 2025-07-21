-- 문제 1. 모든 해시태그 목록 조회하기
SELECT TAG_ID, TAG_NAME
FROM HASHTAGS
;

-- 문제 2. 게시물의 내용과 작성일만 확인하기
SELECT CONTENT, CREATION_DATE
FROM POSTS
;

-- 문제 3. '좋아요'를 누른 사용자는 누구누구?
SELECT DISTINCT user_id
FROM LIKES
;

-- 문제 4. 사용자 ㅍ프로필에 이름표 달아주기
SELECT FULL_NAME AS "전체 이름", BIO AS "자기소개"
FROM USER_PROFILES
;

-- 문제5. 나만의 댓글 알림 만들기
SELECT '[' || USER_ID || ']님이 [' || COMMENT_TEXT || '] 라고 댓글을 남겼습니다.' AS "댓글 알림"
FROM COMMENTS
;
