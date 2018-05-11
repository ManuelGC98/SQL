/*CREATE TABLE PERSONA (
PER_COD number(8) not null,
PER_DOC varchar2(25),
PER_NOM varchar(255),
PER_FNA DATE,
primary key (PER_COD));*/


update persona set per_fna = '01/01/2018' where per_cod <= 1000
update persona set per_fna = '01/01/2017' where per_cod <= 2000 and per_cod >1000;
update persona set per_fna = '01/01/2016' where per_cod <= 3000 and per_cod >2000;
update persona set per_fna = '01/01/2015' where per_cod <= 4000 and per_cod >3000;
update persona set per_fna = '01/01/2014' where per_cod <= 5000 and per_cod >4000;
update persona set per_fna = '01/01/2013' where per_cod <= 6000 and per_cod >5000;
update persona set per_fna = '01/01/2012' where per_cod <= 7000 and per_cod >6000;
update persona set per_fna = '01/01/2011' where per_cod <= 8000 and per_cod >7000;
update persona set per_fna = '01/01/2010' where per_cod <= 9000 and per_cod >8000;
update persona set per_fna = '01/01/2009' where per_cod <= 10000 and per_cod >9000;
update persona set per_fna = '01/01/2008' where per_cod >10000;


select distinct per_fna from persona;

select * from persona order by per_fna asc;
