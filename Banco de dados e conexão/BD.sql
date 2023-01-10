_________________________________________________
/*SERVE PARA ZERAR A TABELA QUANDO DER ERRO*/
drop table tipo_ajuda;
drop table donativo;
drop table cidade;
drop table estado;
drop table usuario;
drop table donativo;
drop table donatario;
drop table donatario_detalhes;
drop table doador_detalhes;
drop table doacao;
/*_________________________________________________________CRIACAO TABELAS__________________________________________________________*/
Create table tipo_ajuda(
codigo_ajuda INT PRIMARY KEY AUTO_INCREMENT,
necessidade varchar (50));

/*_________________________________________________________CRIACAO TABELAS__________________________________________________________*/
Create table donativo(
codigo_donativo INT PRIMARY KEY AUTO_INCREMENT,
donativo varchar (100),
ajuda int,FOREIGN KEY (ajuda)REFERENCES tipo_ajuda(codigo_ajuda));

/*_________________________________________________________CRIACAO TABELAS__________________________________________________________*/
Create table cidade(
codigo_cidade INT PRIMARY KEY AUTO_INCREMENT,
cidade varchar (50));

/*_________________________________________________________CRIACAO TABELAS__________________________________________________________*/
Create table estado(
codigo_estado INT PRIMARY KEY AUTO_INCREMENT,
estado varchar (2));

/*_________________________________________________________CRIACAO TABELAS__________________________________________________________*/
Create table usuario(
CPF INT PRIMARY KEY,
nome varchar (45),
data_nascimento date,
estado_u integer,FOREIGN KEY (estado_u) REFERENCES estado (codigo_estado),
cidade_u integer,FOREIGN KEY (cidade_u) REFERENCES cidade (codigo_cidade), 
endereco varchar (50),
numero integer,
complemento varchar (30),
telefone varchar (15),
email varchar (40),
senha varchar (20));

/*_________________________________________________________CRIACAO TABELAS__________________________________________________________*/
Create table donatario(
RA INT PRIMARY KEY AUTO_INCREMENT,
curso_d varchar (20),
semestre_d varchar (10),
user_d int,FOREIGN KEY (user_d) REFERENCES usuario (CPF));

/*_________________________________________________________CRIACAO TABELAS__________________________________________________________*/
Create table donatario_detalhes(
codigo_dode INT PRIMARY KEY AUTO_INCREMENT,
RA_do integer,FOREIGN KEY (RA_do) REFERENCES donatario (RA), 
data_solicitacao date,
donativo_de integer, FOREIGN KEY (donativo_de) REFERENCES donativo(codigo_donativo), 
quantidade integer,
apelacao varchar (180));

/*_________________________________________________________CRIACAO TABELAS__________________________________________________________*/
Create table doador_detalhes(
codigo_doade INT PRIMARY KEY AUTO_INCREMENT,
user_do int,FOREIGN KEY (user_do) REFERENCES usuario (CPF), 
data_postagem date,
donativo_do integer, FOREIGN KEY (donativo_do) REFERENCES donativo(codigo_donativo), 
quantidade integer,
condicao_produto varchar (180));

/*_________________________________________________________CRIACAO TABELAS__________________________________________________________*/
Create table doacao(
codigo_doacao INT PRIMARY KEY AUTO_INCREMENT,
doador int,FOREIGN KEY (doador) REFERENCES usuario (CPF), 
RA_do integer,FOREIGN KEY (RA_do) REFERENCES donatario (RA), 
data_doacao date,
donativo_doado integer, FOREIGN KEY (donativo_doado) REFERENCES doador_detalhes(donativo_do), 
quantidade integer);

/*_______________________________________________________ISERSAO DE DADOS______________________________________________________________*/
insert into tipo_ajuda (codigo_ajuda, necessidade) values (01,'alimento');
insert into tipo_ajuda (codigo_ajuda, necessidade) values (02,'finança');
insert into tipo_ajuda (codigo_ajuda, necessidade) values (03,'higiêne');
insert into tipo_ajuda (codigo_ajuda, necessidade) values (04,'móvel');
insert into tipo_ajuda (codigo_ajuda, necessidade) values (05,'objeto');
insert into tipo_ajuda (codigo_ajuda, necessidade) values (06,'vestuário');

/*_______________________________________________________ISERSAO DE DADOS______________________________________________________________*/
insert into donativo (codigo_donativo, donativo,ajuda) values (01,'cesta básica',01);
insert into donativo (codigo_donativo, donativo,ajuda) values (02,'mensalidade faculdade',02);
insert into donativo (codigo_donativo, donativo,ajuda) values (03,'materiais faculdade',02);
insert into donativo (codigo_donativo, donativo,ajuda) values (04,'cesta de higiêne feminina',03);
insert into donativo (codigo_donativo, donativo,ajuda) values (05,'cesta de higiêne masculina',03);
insert into donativo (codigo_donativo, donativo,ajuda) values (06,'armário solteiro',04);
insert into donativo (codigo_donativo, donativo,ajuda) values (07,'cama solteiro',04);
insert into donativo (codigo_donativo, donativo,ajuda) values (08,'intens de cozinha básico',05);
insert into donativo (codigo_donativo, donativo,ajuda) values (09,'calça jeans 34',06);
insert into donativo (codigo_donativo, donativo,ajuda) values (10,'blusão tamanho M',06);

/*_______________________________________________________ISERSAO DE DADOS______________________________________________________________*/
insert into cidade (codigo_cidade, cidade) values (01,'hortolandia');
insert into cidade (codigo_cidade, cidade) values (02,'campinas');
insert into cidade (codigo_cidade, cidade) values (03,'sumaré');

/*_______________________________________________________ISERSAO DE DADOS______________________________________________________________*/
insert into estado (codigo_estado, estado) values (01,'SP');

/*_______________________________________________________ISERSAO DE DADOS______________________________________________________________*/
insert into usuario (CPF,nome,data_nascimento,estado_u,cidade_u,endereco,numero,complemento,telefone,email,senha) values (11111111111,'Carolina Camilo',1996-02-27,01,01,'Avenida Santana',1740,'Condominio Residencial Feirenze-apt 11','19984001095','camillo374@gmail.com','adm123');
insert into usuario (CPF,nome,data_nascimento,estado_u,cidade_u,endereco,numero,complemento,telefone,email,senha) values (22222222222,'Gilmar William',1998-03-03,01,01,'Avenida Santana',1740,'Condominio Residencial Feirenze-apt 11','19981487804','gilmarwilliam.silva@gmail.com','adm456');
insert into usuario (CPF,nome,data_nascimento,estado_u,cidade_u,endereco,numero,complemento,telefone,email,senha) values (33333333333,'Leonam Moreira',1998-09-15,01,01,'Rua Turin',69,'Condominio Recanto dos Pássaros-apt 12','19987227385','leonanmoreira@gmail.com','adm789');

*______________________________________________________CONSULTA INNER JOIN_________________________________________________________*/
/*donativo recebe tipo_ajuda*/
select donativo.codigo_donativo, donativo.donativo, donativo.ajuda AS ajuda, tipo_ajuda.codigo_ajuda,tipo_ajuda.necessidade
from donativo, tipo_ajuda
where ajuda = codigo_ajuda;

*______________________________________________________CONSULTA INNER JOIN_________________________________________________________*/
/*cliente recebe cidade*/
select usuario.CPF, usuario.nome, usuario.data_nascimento, usuario.estado_u, usuario.cidade_u, usuario.endereco, usuario.numero, usuario.complemento AS cidade_u,cidade.codigo_cidade, cidade.cidade
from usuario, cidade
where cidade_u = cidade;

*______________________________________________________CONSULTA INNER JOIN_________________________________________________________*/
/*cliente recebe estado*/
select usuario.CPF, usuario.nome, usuario.data_nascimento, usuario.estado_u, usuario.cidade_u, usuario.endereco, usuario.numero, usuario.complemento AS estado_u, estado.codigo_estado, estado.estado
from usuario, estado
where estado_u = estado;

*______________________________________________________CONSULTA INNER JOIN_________________________________________________________*/
/*donatario recebe usuario*/
select donatario.RA, donatario.curso_d,donatario.semestre_d,donatario.user_d AS user_d, usuario.CPF, usuario.nome,usuario.data_nascimento  
from donatario,usuario
where user_d = CPF;

*______________________________________________________CONSULTA INNER JOIN_________________________________________________________*/
/*donatario_detalhes recebe donatario*/
select donatario_detalhes.codigo_dode, donatario_detalhes.RA_do, donatario_detalhes.data_solicitacao, donatario_detalhes.donativo_de, donatario_detalhes.quantidade, donatario_detalhes.apelacao AS RA_do, donatario.RA,  donatario.curso_d, donatario.semestre_d, donatario.user_d 
from donatario_detalhes,donatario
where RA_do = RA;

*______________________________________________________CONSULTA INNER JOIN_________________________________________________________*/
/*donatario_detalhes recebe donativo*/
select donatario_detalhes.codigo_dode, donatario_detalhes.RA_do, donatario_detalhes.data_solicitacao, donatario_detalhes.donativo_de, donatario_detalhes.quantidade, donatario_detalhes.apelacao AS donativo_de,  donativo.codigo_donativo, donativo.donativo, donativo.ajuda
from donatario_detalhes,donativo
where donativo_de = codigo_donativo;

*______________________________________________________CONSULTA INNER JOIN_________________________________________________________*/
/*doacao recebe doador*/
select doacao.codigo_doacao, doacao.doador, doacao.RA_do, doacao.data_doacao, doacao.donativo_doado AS doador, usuario.CPF, usuario.nome, usuario.data_nascimento
from doacao, usuario
where doador = CPF;

*______________________________________________________CONSULTA INNER JOIN_________________________________________________________*/
/*doacao recebe donatario*/
select doacao.codigo_doacao, doacao.doador, doacao.RA_do, doacao.data_doacao, doacao.donativo_doado AS RA_do, donatario.RA, donatario.curso_d,donatario.semestre_d,donatario.user_d 
from doacao,donatario
where RA_do = RA;

*______________________________________________________CONSULTA INNER JOIN_________________________________________________________*/
/*doacao recebe donativo*/
select doacao.codigo_doacao, doacao.doador, doacao.RA_do, doacao.data_doacao, doacao.donativo_doado AS donativo_doado, donativo.codigo_donativo, donativo.donativo, donativo.ajuda
from doacao, donativo
where donativo_doado = codigo_donativo;

/*______________________________________________________________TRIGGERS____________________________________________________________*/
CREATE PROCEDURE Data_Doacao()
RETURNS TRIGGER AS teste
begin 
	New.data_doacao = now();
    return new;
END;
teste language plpgsql;


create trigger T5
before insert
on doacao
FOR EACH ROW 
execute procedure Data_Doacao();

SELECT * FROM doacao ;

/*__________________*/

DELIMITER ;;
CREATE TRIGGER Data_Doacao BEFORE insert on `doacao` FOR EACH ROW
BEGIN
	SET NEW.data_doacao = NOW();

END;;
DELIMITER ;;



