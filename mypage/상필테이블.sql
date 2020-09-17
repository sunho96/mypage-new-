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

alter table diary add(bgcolor VARCHAR2(20));