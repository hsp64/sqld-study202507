-- 문제 1. 피카츄의 모든 것
SELECT *
FROM USERS
WHERE USERNAME = 'pikachu'
;

-- 문제 2. 2023년의 추억
SELECT *
FROM POSTS
WHERE CREATION_DATE BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD')
                        AND TO_DATE('2023-12-31', 'YYYY-MM-DD')
;

-- 문제 3. 카카오프렌즈 총출동!
SELECT USERNAME, EMAIL
FROM USERS
WHERE USER_ID IN (1, 2, 3, 4, 5, 6, 7)
;

-- 문제 4. #먹스타그램' 게시물 검색
SELECT POST_ID, CONTENT
FROM POSTS
WHERE CONTENT LIKE '%#먹스타그램%'
;

-- 문제 5. 라이언의 사진첩
SELECT *
FROM POSTS
WHERE USER_ID IN ('1') AND POST_TYPE LIKE '%photo%'
;

-- 문제 6. 산리오 친구들은 빼고!
SELECT *
FROM USERS
WHERE USER_ID NOT BETWEEN 9
                    AND 20
;
SELECT *
FROM USERS
WHERE USER_ID < 9 OR
      USER_ID > 20
;