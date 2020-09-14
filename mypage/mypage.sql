select * from notice;
select * from diary;
delete from diary;
insert into diary values(diary_seq.nextval,'test','test',sysdate,sysdate,'n',1,1);
select * from diary where memberNum=1 and diaryCataNum=1;
drop sequence diary_seq;
delete from diary;
insert into diary values()
create sequence member_seq start with 1 increment by 1 nocycle nocache;
create sequence notice_seq start with 1 increment by 1 nocycle nocache;
create sequence diary_seq start with 1 increment by 1 nocycle nocache;
create sequence diaryCata_seq start with 1 increment by 1 nocycle nocache;
create sequence sticker_seq start with 1 increment by 1 nocycle nocache;
select* from member;
-- 01. 회원 
create table member(
  memberNum number primary key,
  email varchar2(40),
  password VARCHAR2(20),
  name varchar2(40),
  nickName varchar2(100),
  tel VARCHAR2(15),
  regDate date,
  del VARCHAR2(2)
 );
 
 select * from member;
 
 --02.계좌
 
 create table account(
  accountNum number primary key,
  total number,
  bank varchar2(30),
  memberNum number,
  constraint memberFK FOREIGN KEY (memberNum) REFERENCES MEMBER(memberNum)
);

-- 03.가계부 
create table accountBook(
  abookNum number primary key,
  dealType varchar2(10),
  amount number,
  accounts varchar2(50),
  category varchar2(30),
  regDate date,
  memo varchar2(100),
  accountNum number,
 constraint accountFK FOREIGN KEY (accountNum) REFERENCES account(accountNum)
);

-- 04. 다이어리 카테고리 
create table diarycatagory(
diaryCataNum number primary key,
name VARCHAR2(50)
);
insert into DIARYCATAGORY values(diaryCata_seq.nextval,'음식');
--  05. 다이어리

create table diary(
  diaryNum number primary key,
  subject varchar2(150),
  content VARCHAR2(4000), 
  -- 데이터 형 길어서 5000 ->4000으로 줄였음
  regDate date,
  updateDate date,
  del VARCHAR2(2),
  diaryCataNum number,
  memberNum number,
constraint diarycatagoryFK1 FOREIGN KEY (diaryCataNum) REFERENCES diarycatagory(diaryCataNum),
constraint memberFK2 FOREIGN KEY (memberNum) REFERENCES  member(memberNum)
);

-- 06. 커뮤니티 
create table community(
communityNum number primary key, 
shareDate date,
diaryNum number,
constraint diaryFK FOREIGN KEY (diaryNum) REFERENCES  diary(diaryNum)
);

-- 07. 해시 태그 
create table hashtag(
hashName varchar2(50) primary key
);

-- 08. 해시-커뮤니티
create table hashAndComm(
communityNum number,
hashName VARCHAR2(50),
constraint communityNumFK FOREIGN KEY (communityNum) REFERENCES  community(communityNum),
CONSTRAINT hashNameFK FOREIGN key (hashName) REFERENCES hashtag(hashName)
);

-- 09. 폰트 
create table font(
font number primary key,
name VARCHAR2(50),
color VARCHAR2(20),
fontsize number -- font -> fontsize로 변경 
); 

--10. 스티커 
create table sticker(
stickerNum number primary key,
name varchar2(50),
groupName VARCHAR2(50)
);

--11. 오브젝트 위치값
create table objectPosition(
objectPosNum number primary key,
width number,
height number,
x number,
y number,
rotation number,
diaryNum number,
stickerNum number,
font number,
CONSTRAINT diaryNumFK FOREIGN key (diaryNum) REFERENCES diary(diaryNum),
CONSTRAINT stickerNumFK FOREIGN key (stickerNum) REFERENCES sticker(stickerNum),
CONSTRAINT fontFK FOREIGN KEY (font) REFERENCES font(font)
);


 --12. 해시/스티커
create table hashAndSti(
stickerNum number, 
hashName varchar2(50),
CONSTRAINT stickerNumFK1 FOREIGN KEY (stickerNum) REFERENCES sticker(stickerNum),
CONSTRAINT hashNameFK2 FOREIGN KEY (hashName) REFERENCES hashtag(hashName)
); 

 -- 13. 배경
CREATE table background(
backgroundNum number primary key,
name VARCHAR2(150),
groupName VARCHAR2(50)
);

--14. 해시배경
create table hashAndBack(
backgroundNum number ,
hashName VARCHAR2(50),
CONSTRAINT backgroundNumFK FOREIGN KEY (backgroundNum) REFERENCES background(backgroundNum),
CONSTRAINT hashNameFK1 FOREIGN KEY (hashName) REFERENCES hashtag(hashName)
);


--15.공지  
create table notice(
  noticeNum NUMBER primary key,
  subject varchar2(150),
  content varchar2(1000),
  regDate Date
);

--16.사진
create table picture(
  pictureNum number primary key,
  name varchar2(150),
  width number,
  height number,
  x number,
  y number,
  rotation number
);

--추가
insert into diary values(diary_seq.nextval,'test','test',sysdate,sysdate,'n',1,1);
alter table diaryCatagory add(del char(2));
insert into member values(member_seq.nextval,'admin','admin','관리자','관리자','010-1111-1111',sysdate,'n');

--17. 멤버카테고리
create table memAndCata(
memberNum number ,
diaryCataNum number,
CONSTRAINT memAndCataFK1 FOREIGN KEY (memberNum) REFERENCES member(memberNum),
CONSTRAINT memAndCataFK2 FOREIGN KEY (diaryCataNum) REFERENCES diaryCatagory(diaryCataNum),
CONSTRAINT memAndCataPk primary key (memberNum,diaryCataNum)
);

--0914 추가
alter table diary drop column content;