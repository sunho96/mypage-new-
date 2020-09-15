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
--0915 추가
 alter table OBJECTPOSITION add(pictureNum number references picture(pictureNum));
 
 insert into member values(member_seq.nextval,'admin@mypage.com','admin','관리자','관리자',010-0000-0000,sysdate,'n');
 select * from sticker;
  insert into sticker values(sticker_seq.nextval,'flower1.png', '꽃');
insert into sticker values(sticker_seq.nextval,'flower2.png', '꽃');
insert into sticker values(sticker_seq.nextval,'flower3.png', '꽃');
insert into sticker values(sticker_seq.nextval,'flower4.png', '꽃');
insert into sticker values(sticker_seq.nextval,'flower5.png', '꽃');

insert into sticker values(sticker_seq.nextval,'moon1.png', '달');
insert into sticker values(sticker_seq.nextval,'moon2.png', '달');
insert into sticker values(sticker_seq.nextval,'moon3.png', '달');

insert into sticker values(sticker_seq.nextval,'bambi1.png', '디즈니');
insert into sticker values(sticker_seq.nextval,'jasmin1.png', '디즈니');
insert into sticker values(sticker_seq.nextval,'lobstar1.png', '디즈니');
insert into sticker values(sticker_seq.nextval,'minimouse1.png', '디즈니');
insert into sticker values(sticker_seq.nextval,'minimouse2.png', '디즈니');
insert into sticker values(sticker_seq.nextval,'princess1.png', '디즈니');
insert into sticker values(sticker_seq.nextval,'princess2.png', '디즈니');
insert into sticker values(sticker_seq.nextval,'rabit1.png', '디즈니');
insert into sticker values(sticker_seq.nextval,'snowwhite1.png', '디즈니');
insert into sticker values(sticker_seq.nextval,'stitch1.png', '디즈니');
insert into sticker values(sticker_seq.nextval,'stitch2.png', '디즈니');
insert into sticker values(sticker_seq.nextval,'stitch3.png', '디즈니');


insert into sticker values(sticker_seq.nextval,'memo1.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo2.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo3.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo4.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo5.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo6.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo7.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo8.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo9.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo10.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo11.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo12.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo13.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo14.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo15.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo16.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo17.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo18.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo19.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo20.png', '떡메');

insert into sticker values(sticker_seq.nextval,'memo21.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo22.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo23.png', '떡메');
insert into sticker values(sticker_seq.nextval,'memo24.png', '떡메');

insert into sticker values(sticker_seq.nextval,'jedi1.png', '스타워즈');
insert into sticker values(sticker_seq.nextval,'jedi2.png', '스타워즈');


-- 스티커 폴더 (적용 x
insert into sticker values(sticker_seq.nextval,'01.png', '곰');
insert into sticker values(sticker_seq.nextval,'02.png', '곰');
insert into sticker values(sticker_seq.nextval,'03.png', '곰');
insert into sticker values(sticker_seq.nextval,'04.png', '곰');

insert into sticker values(sticker_seq.nextval,'a01.png', '영화');
insert into sticker values(sticker_seq.nextval,'a02.png', '나비');
insert into sticker values(sticker_seq.nextval,'a03.png', '스마일');
insert into sticker values(sticker_seq.nextval,'a04.png', '하트');
insert into sticker values(sticker_seq.nextval,'a05.png', '리본');
insert into sticker values(sticker_seq.nextval,'a06.png', '테이프');
insert into sticker values(sticker_seq.nextval,'a07.png', '테이프');
insert into sticker values(sticker_seq.nextval,'a08.png', '별');
insert into sticker values(sticker_seq.nextval,'a09.png', '하트');
insert into sticker values(sticker_seq.nextval,'a10.png', '무지개');
insert into sticker values(sticker_seq.nextval,'a11.png', '크레파스');

insert into sticker values(sticker_seq.nextval,'b01.png', '크레파스');
insert into sticker values(sticker_seq.nextval,'b02.png', '무지개');
insert into sticker values(sticker_seq.nextval,'b03.png', '나비');
insert into sticker values(sticker_seq.nextval,'b04.png', '와펜');
insert into sticker values(sticker_seq.nextval,'b05.png', '와펜');
insert into sticker values(sticker_seq.nextval,'b06.png', '토끼');
insert into sticker values(sticker_seq.nextval,'b07.png', '와펜');
insert into sticker values(sticker_seq.nextval,'b08.png', '테이프');

insert into sticker values(sticker_seq.nextval,'c01.png', '테이프');
insert into sticker values(sticker_seq.nextval,'c02.png', '테이프');
insert into sticker values(sticker_seq.nextval,'c03.png', '테이프');
insert into sticker values(sticker_seq.nextval,'c04.png', '테이프');
insert into sticker values(sticker_seq.nextval,'c05.png', '테이프');
insert into sticker values(sticker_seq.nextval,'c06.png', '테이프');
insert into sticker values(sticker_seq.nextval,'c07.png', '테이프');
insert into sticker values(sticker_seq.nextval,'c08.png', '테이프');
insert into sticker values(sticker_seq.nextval,'c09.png', '테이프');
insert into sticker values(sticker_seq.nextval,'c10.png', '테이프');

insert into sticker values(sticker_seq.nextval,'cupcake1.png', '케이크');
insert into sticker values(sticker_seq.nextval,'cupcake2.png', '케이크');
insert into sticker values(sticker_seq.nextval,'cupcake3.png', '케이크');
insert into sticker values(sticker_seq.nextval,'cupcake4.png', '케이크');

insert into sticker values(sticker_seq.nextval,'cupid1.png', '천사');

-- d01.png 부터 다시 만들기 메모 
