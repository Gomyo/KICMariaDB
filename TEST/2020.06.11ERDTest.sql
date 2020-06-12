-- 점선은 Null이냐 아니냐의 문제!
create table customers (
    cno varchar(5) PRIMARY KEY,
    cname varchar(10),
    address varchar(50),
    email varchar(20),
    phone varchar(20)
);

create table orders (
    orderno varchar(10) PRIMARY KEY,
    orderdate varchar(8),
    address VARCHAR(50),
    phone varchar(20),
    status VARCHAR(5),
    cno varchar(5), -- FK
    CONSTRAINT orders_cno_fk FOREIGN KEY (cno) REFERENCES customers (cno)
);

create table products (
    pno varchar(5) PRIMARY KEY,
    pname varchar(20),
    cost int(8),
    stock int(5)
);

create table orderdetails
(
    orderno varchar(10),
    pno varchar(5),
    qty int(5),
    cost int(8),
    CONSTRAINT orderdetails_orderno_fk FOREIGN KEY (orderno) REFERENCES orders (orderno),
    CONSTRAINT orderdetails_pno_fk FOREIGN KEY (pno) REFERENCES products (pno),
    CONSTRAINT orderdetails_pk PRIMARY KEY(orderno, pno)
);