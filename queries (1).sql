create table SalesPeople(
    Snum int,
    Sname varchar(30),
    City varchar(30),
    Comm int,
    Primary key(Snum),
    Unique(Sname)
);

create table Customers(
    Cnum int,
    Cname varchar(30),
    City varchar(30) not null,
    Snum int,
    Primary key(Cnum),
    foreign key(Snum) references SalesPeople(Snum)
);

create table Orders(
    Onum int,
    Amt int,
    Odate varchar(30),
    Cnum int,
    Snum int,
    Primary key(Onum),
    foreign key(Cnum) references Customers(Cnum),
    foreign key(Snum) references SalesPeople(Snum)
);
insert into
    SalesPeople(Snum, Sname, City, Comm)
values
    (1001, 'Peel', 'London', 12);

insert into
    SalesPeople(Snum, Sname, City, Comm)
values
    (1002, 'Serres', 'Sanjose', 13);

insert into
    SalesPeople(Snum, Sname, City, Comm)
values
    (1004, 'Motika', 'London', 11);

insert into
    SalesPeople(Snum, Sname, City, Comm)
values
    (1007, 'Rifkin', 'Barcelona', 15);

insert into
    SalesPeople(Snum, Sname, City, Comm)
values
    (1003, 'Axelrod', 'Newyork', 10);
insert into
    Customers(Cnum, Cname, City, Snum)
values
    (2001, 'Hoffman', 'London', 1001);

insert into
    Customers(Cnum, Cname, City, Snum)
values
    (2002, 'Giovanni', 'Rome', 1003);

insert into
    Customers(Cnum, Cname, City, Snum)
values
    (2003, 'Liu', 'Sanjose', 1002);

insert into
    Customers(Cnum, Cname, City, Snum)
values
    (2004, 'Grass', 'Berlin', 1002);

insert into
    Customers(Cnum, Cname, City, Snum)
values
    (2006, 'Clemens', 'London', 1001);

insert into
    Customers(Cnum, Cname, City, Snum)
values
    (2008, 'Cisneros', 'Sanjose', 1007);

insert into
    Customers(Snum, Cname, City, Cnum)
values
    (1004, 'Pereira', 'Rome', 2007);
insert into
    Orders
values
    (3001, 18.69, '3-10-1990', 2008, 1007);

insert into
    Orders
values
    (3003, 767.19, '3-10-1990', 2001, 1001);

insert into
    Orders
values
    (3002, 1900.10, '3-10-1990', 2007, 1004);

insert into
    Orders
values
    (3005, 5160.45, '3-10-1990', 2003, 1002);

insert into
    Orders
values
    (3006, 1098.16, '3-10-1990', 2008, 1007);

insert into
    Orders
values
    (3009, 1713.23, '4-10-1990', 2002, 1003);

insert into
    Orders
values
    (3007, 75.75, '4-10-1990', 2004, 1002);

insert into
    Orders
values
    (3008, 4273.00, '5-10-1990', 2006, 1001);

insert into
    Orders
values
    (3010, 1309.95, '6-10-1990', 2004, 1002);

insert into
    Orders
values
    (3011, 9891.88, '6-10-1990', 2006, 1001);


select
    Count(*)
from
    SalesPeople
where
    Sname like 'a%'
    or Sname like 'A%';


select
    sp.Sname,
    o.Amt
from
    Orders as o
    inner join SalesPeople as sp on o.Snum = sp.Snum
where
    o.Amt > 2000;


select
    count(*)
from
    SalesPeople
where
    City = 'Newyork';


select
    City,
    count(*)
from
    SalesPeople
where
    city = 'London'
    or city = 'Paris'
group by
    City;


select
    sp.Sname,
    count(*),
    o.Odate
from
    SalesPeople as sp
    inner join Orders as o on sp.Snum = o.Snum
group by
    sp.Sname,
    o.Odate;