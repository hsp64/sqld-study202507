
-- 문제 1. 춘식이의 매니저는 누구?
-- SELF JOIN을 사용하여, username이 'choonsik'인 사용자의 매니저 이름을 찾아주세요.
SELECT m.username AS "매니저 이름"
FROM USERS e
INNER JOIN USERS m ON e.manager_id = m.user_id
WHERE e.username = 'choonsik';



-- 문제 2. 프로필 있는 사용자만 골라내기
-- USERS 테이블과 USER_PROFILES 테이블을 user_id를 기준으로 조인하려고 합니다. ON 절 대신 USING절을 사용하여, 프로필이 있는 사용자들의 username과 full_name을 조회해주세요. (올바른 별칭 사용법을 지켜주세요!)
SELECT user_id, u.username, p.full_name
FROM USERS u
INNER JOIN USER_PROFILES p USING (user_id);



-- 문제 3. (심화) 매니저의 매니저 찾기
-- SELF JOIN을 두 번 사용해서, 'little_apeach'의 매니저('apeach')의 매니저('ryan') 이름을 찾아보세요.
SELECT m2.username AS "매니저의 매니저"
FROM USERS e -- 직원(little_apeach)
INNER JOIN USERS m1 ON e.manager_id = m1.user_id -- 1차 조인: 매니저(apeach) 찾기
INNER JOIN USERS m2 ON m1.manager_id = m2.user_id -- 2차 조인: 매니저의 매니저(ryan) 찾기
WHERE e.username = 'little_apeach';

