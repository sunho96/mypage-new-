--0827 상필 
--18. 커뮤니티 좋아요
create table communityLikey(
    memberNum number references member(memberNum),
    communityNum number references community(communityNum),
    primary key(memberNum,communityNum)
);

--19. 커뮤티니 댓글
create table communityComments(
    commentsNum number primary key,
    content varchar2(500) not null,
    ref number not null, --그룹
    re_step number not null, --그룹 내 순서
    regDate date not null,
    memberNum number references member(memberNum),
    communityNum number references community(communityNum)
);
  drop table background;
    drop table hashandback;
    drop table bgColor;
 alter table diary add(content varchar2(3000));
alter table diary add(bgcolor VARCHAR2(20));
--0918
    create table textbox(
    textboxNum NUMBER primary key,
    content VARCHAR2(2000)
    );  
    alter table objectPosition add(textboxNum number references textbox(textboxNum));
    alter table textbox add(fntSize number(5));
    alter table textbox add(fntColor varchar(20));
    alter table textbox add (fntWeight number(5));
    alter table objectPosition drop column font; 
    drop table font;
    --0919
     ALTER TABLE objectposition RENAME COLUMN textbox TO textboxNum;
    
    --0922
    alter table diaryCatagory drop column del;
    insert into diaryCatagory values(diaryCata_seq.nextval,'기타');
    alter table diary drop column content;
    alter table textbox MODIFY (fntsize varchar2(10));
	alter table textbox MODIFY (content varchar2(3000));
	alter table textbox MODIFY (fntcolor varchar2(20));
