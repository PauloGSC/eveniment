 
DROP DATABASE IF EXISTS eveniment;
CREATE DATABASE eveniment DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE eveniment;

create table users(
    id integer primary key not null AUTO_INCREMENT,
    name varchar(99) not null,
    password varchar(200) not null,
    image LONG VARCHAR,
    email varchar(99) not null,
    isAdmin boolean,
    registration integer,
    ocupation varchar(20) not null,
    createdAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

create table events (
    id integer primary key not null AUTO_INCREMENT,
    name varchar (99) not null,
    subscriptionLink varchar (150),
    description varchar(300) not null,
    dtInit datetime not null,
    dtEnd datetime not null,
    createdAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    image LONG VARCHAR,
    idUser integer not null,
    foreign key (idUser) references user(id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

create table subscribes (
    id integer primary key not null AUTO_INCREMENT,
    idEvent integer not null,
    idUser integer not null,
    createdAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    foreign key (idUser) references user(id),
    foreign key (idEvent) references event(id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;