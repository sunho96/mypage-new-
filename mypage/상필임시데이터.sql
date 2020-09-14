--멤버
insert into member values (1,'a@a.a','123','윤에이','에이','010-1111-2222',sysdate,'n');
insert into member values (2,'b@b.b','123','윤비','화려한조명','010-2111-2222',sysdate,'n');
insert into member values (3,'b@c.c','123','윤씨','윤모씨','010-3111-2222',sysdate,'n');
insert into member values (4,'b@d.d','123','윤디','디','010-4111-2222',sysdate,'n');
insert into member values (5,'b@e.e','123','윤이','이','010-5111-2222',sysdate,'n');

--다이어리 카테고리
insert into diarycatagory values(1,'test','n');

--다이어리
insert into diary values (1,'제목1','내용1','2020-01-10','2020-01-10','n',1,1);
insert into diary values (2,'제목2','내용2','2020-01-11','2020-01-11','n',1,2);
insert into diary values (3,'제목3','내용3','2020-01-12','2020-01-12','n',1,3);
insert into diary values (4,'제목4','내용4','2020-01-13','2020-01-13','n',1,4);
insert into diary values (5,'제목5','내용5','2020-01-14','2020-01-14','n',1,5);
insert into diary values (6,'제목6','내용6','2020-01-15','2020-01-15','n',1,1);
insert into diary values (7,'제목7','내용7','2020-01-16','2020-01-16','n',1,1);
insert into diary values (8,'제목8','내용8','2020-01-17','2020-01-17','n',1,3);
insert into diary values (9,'제목9','내용9','2020-01-18','2020-01-18','n',1,1);
insert into diary values (10,'제목10','내용10','2020-02-10','2020-02-10','n',1,5);
insert into diary values (11,'제목11','내용11','2020-02-11','2020-02-25','n',1,5);
insert into diary values (12,'제목12','내용12','2020-02-12','2020-02-12','n',1,5);
insert into diary values (13,'제목13','내용13','2020-02-13','2020-02-13','n',1,4);
insert into diary values (14,'제목14','내용14','2020-02-14','2020-02-14','n',1,3);
insert into diary values (15,'제목15','내용15','2020-02-15','2020-02-15','n',1,2);
insert into diary values (16,'제목16','내용16','2020-02-16','2020-02-18','n',1,2);
insert into diary values (17,'제목17','내용17','2020-02-17','2020-02-17','n',1,4);
insert into diary values (18,'제목18','내용18','2020-02-18','2020-02-18','n',1,2);
insert into diary values (19,'제목19','내용19','2020-02-19','2020-02-19','n',1,1);
insert into diary values (20,'제목20','내용20','2020-03-10','2020-03-10','n',1,3);
insert into diary values (21,'제목21','내용21','2020-03-10','2020-03-10','n',1,1);

--커뮤니티
insert into community values (1,'2020-03-10',0,20);
insert into community values (2,'2020-03-10',0,21);
insert into community values (3,'2020-03-11',0,2);
insert into community values (4,'2020-03-12',0,5);
insert into community values (5,'2020-03-13',0,1);
insert into community values (6,'2020-03-14',0,4);
insert into community values (7,'2020-03-17',0,12);
insert into community values (8,'2020-03-18',0,7);
insert into community values (9,'2020-03-19',0,14);
insert into community values (10,'2020-03-19',0,15);
insert into community values (11,'2020-03-24',0,3);
insert into community values (12,'2020-03-25',0,19);
insert into community values (13,'2020-03-26',0,6);
insert into community values (14,'2020-03-27',0,8);
insert into community values (15,'2020-03-28',0,9);
insert into community values (16,'2020-04-01',0,10);
insert into community values (17,'2020-04-02',0,18);
insert into community values (18,'2020-04-05',0,11);
insert into community values (19,'2020-04-08',0,17);
insert into community values (20,'2020-04-08',0,16);
insert into community values (21,'2020-04-08',0,13);

--커뮤니티 좋아요
insert into communitylikey values(1,21);   
--커뮤니티 댓글
insert into communitycomments values(1,'zzzzzzzzzz',1,0,sysdate,1,21);
