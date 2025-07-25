-- registration_date를 기준으로 오름차순 정렬합니다.
SELECT 
    USERNAME,
    REGISTRATION_DATE
FROM USERS
ORDER BY REGISTRATION_DATE DESC
;

-- creation_date를 기준으로 내림차순 정렬합니다.
SELECT
    post_id,
    user_id,
    content,
    creation_date
FROM
    POSTS
ORDER BY
    creation_date DESC;

-- 1차: post_type 오름차순, 2차: creation_date 내림차순으로 정렬
SELECT
    post_id,
    post_type,
    creation_date
FROM
    POSTS
ORDER BY
    post_type ASC,      -- 1차 정렬 기준 (ASC는 생략 가능)
    creation_date DESC; -- 2차 정렬 기준

SELECT
    post_id,
    post_type,
    creation_date
FROM
    POSTS
ORDER BY
    post_type ASC, creation_date DESC; -- 이렇게도 가능

-- 별칭으로도 정렬 가능
SELECT 
    USERNAME AS UNAME,
    REGISTRATION_DATE
FROM USERS
ORDER BY UNAME DESC
;

-- 순서으로도 정렬 가능
SELECT 
    USERNAME AS UNAME, -- 1번
    REGISTRATION.DATE -- 2번
FROM USERS
ORDER BY 1
;

-- 5강에서 배운 GROUP BY를 활용해 사용자별 게시물 수를 구하고,
-- 그 결과(별명: post_count)를 기준으로 내림차순 정렬합니다.
SELECT
    user_id,
    COUNT(*) AS post_count
FROM
    POSTS
GROUP BY
    user_id
--  ORDER BY COUNT(*) DESC;  
ORDER BY
    post_count DESC, USER_ID DESC
;

SELECT
    username,             -- 1번째 컬럼
    email,                -- 2번째 컬럼
    registration_date     -- 3번째 컬럼
FROM
    USERS
ORDER BY
    3 DESC; -- SELECT 절의 3번째 컬럼인 registration_date를 기준으로 내림차순 정렬


-- user_id가 1이면 1순위, 나머지는 2순위로 정렬 우선순위를 부여하고,
-- 같은 순위 내에서는 creation_date를 기준으로 내림차순 정렬합니다.
SELECT
    post_id,
    user_id,
    content,
    creation_date
FROM
    POSTS
ORDER BY
    CASE
        WHEN user_id = 21 THEN 1 -- user_id가 1이면 1순위
        ELSE 2                   -- 나머지는 2순위
    END, -- 1차 정렬 기준: CASE 표현식
    creation_date DESC; -- 2차 정렬 기준: 작성일



