DROP DATABASE IF EXISTS eveniment;
CREATE DATABASE eveniment DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE eveniment;


create table user(
    idUser integer primary key not null AUTO_INCREMENT,
    name varchar(30) not null,
    password varchar(30) not null,
    email varchar(30) not null,
    isAdmin boolean not null,
    registration integer not null,
    ocupation varchar(20) not null,
    dtUpdate date not null
);

create table event(
    idEvent integer primary key not null AUTO_INCREMENT,
    name varchar (20) not null,
    cdConfirm varchar (20) not null,
    description varchar(200) not null,
    dtInit date not null,
    dtEnd date not null,
    dtUpdate date not null,
    image varchar (40) not null,
    idUs integer not null,
    foreign key (idUs) references user(idUser)
);
