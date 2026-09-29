DROP DATABASE IF EXISTS amparo_taxi;
CREATE DATABASE amparo_taxi;
USE amparo_taxi;
CREATE TABLE motorista(
    id int(11) primary key not null auto_increment,
    nome varchar(100) not null,
    cpf varchar(15) not null unique,
    cnh varchar(20) not null unique,
    celular varchar(15) not null unique,
    email varchar(100) not null unique,
    obs text,
    status enum('ATIVO', 'INATIVO')
);
CREATE TABLE veiculo(
    placa varchar(10) primary key not null,
    modelo varchar(20) not null,
    marca varchar(20) not null,
    cor varchar(20) not null,
    ano int(11) not null,
    motorista_id int (11) not null
);
CREATE TABLE viagem(
    id int(11) primary key not null auto_increment,
    passageiro_id int(11) not null,
    placa varchar(10) not null,
    valor decimal(10,2) not null,
    origem varchar(50) not null,
    hora_partida datetime not null,
    destino varchar(50) not null,
    hora_chegada datetime,
    avaliacao_motorista int(11),
    avaliacao_passageiro int (11)
);
CREATE TABLE passageiro(
id int primary key not null auto_increment,
    nome varchar(100) not null,
    cpf varchar(15) not null,
    celular varchar(15) not null,
    email varchar(100) not null,
    obs text,
    status enum('ATIVO', 'BANIDO')
);


alter table motorista add constraint fk_dirije foreign key (motorista_id) references motorista(id);
alter table viagem add constraint fk_utiliza foreign key (placa) references veiculo(placa);
alter table viagem add constraint fk_viaja foreign key (passageiro_id) references passageiro(id);


describe motorista;
describe veiculo;
describe viagem;
describe passageiro;
show tables;