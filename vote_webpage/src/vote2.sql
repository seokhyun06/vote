drop table tbl_vote_202005;
create table tbl_vote_202005(
			v_jumin char(13) primary key,
			v_name varchar2(20),
			m_no char(1),
			v_time char(4),
			v_area char(20),
			v_confirm char(1)
							);
							
insert into TBL_VOTE_202005 values('99010110001', '김유권', '1', '0930', '제1투표장', 'N');
insert into TBL_VOTE_202005 values('89010120002', '이유권', '2', '0930', '제1투표장', 'N');
insert into TBL_VOTE_202005 values('69010110003', '박유권', '3', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('59010120004', '홍유권', '4', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('79010110005', '조유권', '5', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('89010120006', '최유권', '1', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('59010110007', '지유권', '1', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('49010120008', '장유권', '3', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('79010110009', '정유권', '3', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('89010120010', '강유권', '4', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('99010110011', '신유권', '5', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('79010120012', '오유권', '1', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('69010110013', '현유권', '4', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('89010110014', '왕유권', '2', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('99010110015', '유유권', '3', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('79010110016', '한유권', '2', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('89010110017', '문유권', '4', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('99010110018', '양유권', '2', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('99010110019', '구유권', '4', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('79010110020', '황유권', '5', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('69010110021', '배유권', '3', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('79010110022', '전유권', '3', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('99010110023', '고유권', '1', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('59010110024', '권유권', '3', '1330', '제2투표장', 'Y');

select * from TBL_VOTE_202005;
select * from tbl_member_202005;
select * from tbl_party_202005;


create table tbl_member_202005(
			m_no char(1) primary key,
			m_name varchar2(20),
			p_code char(2),
			p_school char(1),
			m_jumin char(13),
			m_city varchar2(20)

							);
							
insert into tbl_member_202005 values('1', '김후보', 'P1', '1', '6603011999991', '수선화동'); 
insert into tbl_member_202005 values('2', '이후보', 'P2', '3', '5503011999992', '민들래동'); 
insert into tbl_member_202005 values('3', '박후보', 'P3', '2', '7703011999993', '나팔꽃동'); 
insert into tbl_member_202005 values('4', '조후보', 'P4', '2', '8803011999994', '진달래동'); 
insert into tbl_member_202005 values('5', '최후보', 'P5', '3', '9903011999995', '개나리동'); 

create table tbl_party_202005 (
            p_code char(2) primary key,
            p_name varchar2(20),
            p_indate date,
            p_reader varchar2(20),
            p_tel1 char(3),
            p_tel2 char(4),
            p_tel3 char(4)
							);

insert into tbl_party_202005 values('P1', 'A정당', '2010-01-01', '위대표', '02', '1111', '0001');
insert into tbl_party_202005 values('P2', 'B정당', '2010-02-01', '명대표', '02', '1111', '0002');
insert into tbl_party_202005 values('P3', 'C정당', '2010-03-01', '기대표', '02', '1111', '0003');
insert into tbl_party_202005 values('P4', 'D정당', '2010-04-01', '옥대표', '02', '1111', '0004');
insert into tbl_party_202005 values('P5', 'E정당', '2010-05-01', '임대표', '02', '1111', '0005');


select m.m_no, m.m_name, p.p_name, 
case m.p_school when '1' then '고졸' when '2' then '학사' when '3' then '석사' else '박사' end as p_school, 
substr(m_jumin, 1, 6) || '-' || substr(m_jumin, 7, 13), m.m_city, p_tel1 || '-' || p_tel2 || '-' ||p_tel3
from TBL_MEMBER_202005 m, TBL_PARTY_202005 p 
where m.p_code = p.p_code;

성명, 생년월일, 나이, 성별, 후보번호, 투표시간, 유권자확인

select v_name, '19' || substr(v_jumin, 1, 2) || '년' || substr(v_jumin, 3, 2) || '월' || substr(v_jumin, 5, 2) || '일생' as birth, 
trunc(months_between(sysdate, to_date(substr('19' || v_jumin, 1, 8), 'yyyymmdd')) /12) as age,
case substr(v_jumin, 7, 1) when '1' then '남자' else '여자' end as v_gender, m_no, substr(v_time, 1,2)||':'||substr(v_time, 3,2) as v_time,
case v_confirm when 'Y' then '확인' else '미확인' end as v_confirm
from tbl_vote_202005
where v_area = '제1투표장'


select m.m_no, m.m_name, count(v.v_confirm) as v_confirm
from tbl_vote_202005 v, tbl_member_202005 m
where v.m_no = m.m_no and v.v_confirm = 'Y'
group by m.m_no, m.m_name
order by v_confirm desc;

