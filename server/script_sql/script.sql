 
DROP DATABASE IF EXISTS eveniment;
CREATE DATABASE eveniment DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE eveniment;

create table user(
    id integer primary key not null AUTO_INCREMENT,
    name varchar(99) not null,
    password varchar(200) not null,
    image LONG VARCHAR,
    email varchar(99) not null,
    isAdmin boolean,
    registration integer,
    ocupation varchar(20) not null,
    dtUpdate datetime
);

create table event(
    id integer primary key not null AUTO_INCREMENT,
    name varchar (99) not null,
    subscriptionLink varchar (150),
    description varchar(300) not null,
    dtInit datetime not null,
    dtEnd datetime not null,
    dtUpdate datetime not null,
    image LONG VARCHAR,
    idUs integer not null,
    foreign key (idUs) references user(id)
);

create table subscribe(
    id integer primary key not null AUTO_INCREMENT,
    idEvent integer not null,
    idUs integer not null,
    foreign key (idUs) references user(id),
    foreign key (idEvent) references event(id)
);

select EV.id, EV.name, EV.subscriptionLink, EV.description, EV.dtInit, EV.dtEnd, EV.dtUpdate, EV.image, EV.idUs, SUB.id as idSubscribe  from event as EV left join subscribe as SUB on EV.idUs=SUB.idUs and EV.id=SUB.idEvent;