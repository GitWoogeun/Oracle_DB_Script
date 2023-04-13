--┌──────────────────────────────
--│ Oracle TRC 파일 생성 방법 및 SQL Plan 결과 출력 생성 방법
--└──────────────────────────────

-- SQL문 실행 시간 측정
SET TIMING ON;

-- SQLTrace 활성화
ALTER SESSION SET SQL_TRACE =TRUE;

-- SQL 명령문 실행
SELECT * FROM MEMBER;

-- SQL Trace 비활성화
ALTER SESSION SET SQL_TRACE = FALSE;

-- SQL Trace 파일 생성 확인
-- SQL 추적파일 수집 : 데이터베이스 서버의 USER_DUMP_DEST 디렉토리에 저장
-- SQL 추적파일 경로 : C:\APP\RNB\PRODUCT\18.0.0\DBHOMEXE\RDBMS\TRACE
SELECT VALUE FROM V$PARAMETER WHERE NAME = 'user_dump_dest';

-- Trace 파일 읽기
-- 아래 명령어는 SqlDeveloper가 아닌 PowerShell or linux환경에서 명령어를 실행해야한다. 
-- 경로 : C:\APP\RNB\PRODUCT\18.0.0\DBHOMEXE\RDBMS\TRACE 
-- trace 경로로 이동한 후 Input 파일명을 입력하고 실행하면 출력결과를 txt파일로 받을수있다.
-- tkprof 분석할(Trace파일명.trc) output.txt "explain=user/pw@dbname sys=no waits=yes sort=prsela,exeela,fchela"

Linux 명령어 :
tkprof input_file.trc output_file.txt "explain=NEWLEC/root sys=no waits=yes sort=prsela,exeela,fchela"


Trace file: xe_dbrm_13100.trc
Sort options: prsela  exeela  fchela  
********************************************************************************
count    = number of times OCI procedure was executed
cpu      = cpu time in seconds executing 
elapsed  = elapsed time in seconds executing
disk     = number of physical reads of buffers from disk
query    = number of buffers gotten for consistent read
current  = number of buffers gotten in current mode (usually for update)
rows     = number of rows processed by the fetch or execute call
    0  statements EXPLAINed in this session.
********************************************************************************
Trace file: xe_dbrm_13100.trc
Trace file compatibility: 12.2.0.0
Sort options: prsela  exeela  fchela  
       0  session in tracefile.
       0  user  SQL statements in trace file.
       0  internal SQL statements in trace file.
       0  SQL statements in trace file.
       0  unique SQL statements in trace file.
     164  lines in trace file.
       0  elapsed seconds in trace file.

-- 위 내용은 보는 방법 :
OCI 프로시저가 실행된 횟수, 
CPU 및 경과 시간,
디스크에서 버퍼의 물리적인 읽기 횟수,
일관된 읽기를 위해 가져온 버퍼의 수, 
현재 모드에서 가져온 버퍼의 수 등과 같은 실행 통계 정보를 제공,
세션, 사용자 SQL 문, 
내부 SQL 문, 
실행된 SQL 문, 
고유한 SQL 문 수 등에 대한 정보를 제공한다. 
이 파일을 분석하여 데이터베이스의 성능 이슈를 해결할 수 있다. 
위 TRACE 파일은 prsela, exeela, fchela와 같은 정렬 옵션을 사용하여 분석