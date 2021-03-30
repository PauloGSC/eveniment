 
DROP DATABASE IF EXISTS eveniment;
CREATE DATABASE eveniment DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE eveniment;

create table user(
    idUser integer primary key not null AUTO_INCREMENT,
    name varchar(99) not null,
    password varchar(200) not null,
    image longblob,
    email varchar(99) not null,
    isAdmin boolean,
    registration integer,
    ocupation varchar(20) not null,
    dtUpdate datetime
);

create table event(
    idEvent integer primary key not null AUTO_INCREMENT,
    name varchar (99) not null,
    subscriptionLink varchar (150),
    description varchar(300) not null,
    dtInit datetime not null,
    dtEnd datetime not null,
    dtUpdate datetime not null,
    image longblob not null,
    idUs integer not null,
    foreign key (idUs) references user(idUser)
);