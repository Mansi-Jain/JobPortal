/*Individual Table*/
create table individual (id int primary key auto_increment,group_id int default 0,fname varchar(40) not null,lname varchar(40) default '',emailid varchar(50) not null unique,password varchar(50) not null);

/*Company Details Table*/
create table company (cid int primary key auto_increment,cname varchar(50) not null,emailid varchar(50) not null unique,password varchar(50) not null,address varchar(100) not null,city varchar(40) not null,country varchar(40) not null,phoneno varchar(15));

/*Company Offices Table*/
create table office (oid int primary key auto_increment,cid int,name varchar(50) default '',address varchar(100) not null,city varchar(40) not null,country varchar(40) not null,phoneno varchar(15),foreign key(cid) references company(cid) on delete cascade);

/*Job Offers Table*/
create table joboffer(jid int primary key auto_increment,cid int,post_name varchar(50) not null,job_desc varchar(300) not null,requirements varchar(40) not null,work_ex varchar(40) not null,salary varchar(15) not null,foreign key (cid) references company(cid) on delete cascade);

/*Job-Offices Relation Table*/
create table oppenings_at(job_id int,office_id int, foreign key(job_id) references joboffer(jid) on delete cascade,foreign key(office_id) references office(oid) on delete cascade);

/*Job-Individual Table (Application Table)*/
create table applications(job_id int,ind_id int, foreign key(job_id) references joboffer(jid) on delete cascade,foreign key(ind_id) references individual(id) on delete cascade);
