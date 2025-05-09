USE MASTER
go

IF EXISTS(SELECT 1 FROM SYSDATABASES WHERE NAME = 'anyges')
	DROP DATABASE anyges
go

CREATE DATABASE anyges;
go

USE anyges;
go

-- DROP DATABASE anyges

SET DATEFORMAT DMY;
go

-- Funcionario

CREATE TABLE tblFuncionario (
	ID_funcionario numeric(6) not null PRIMARY KEY identity(1,1),
	codigo_func varchar(15),
	senha_func varchar(15),
	cargo_func varchar(50)
);
CREATE INDEX xFuncionario ON tblFuncionario(ID_funcionario);
go

-- Associacao

CREATE TABLE tblAssociacao (
	ID_associacao numeric(6) not null PRIMARY KEY identity(1,1),
	nome_assoc varchar(75) not null,
	CNPJ_assoc varbinary(max) not null,
	contrato_assoc varbinary(max) not null,
	certidao_assoc varbinary(max) not null,
	inscricao_assoc varbinary(max) not null,
	alvara_assoc varbinary(max) not null,
	regularidade_assoc varbinary(max) not null,
	registro_assoc varbinary(max) not null,
	codigo_assoc varchar(15),
	senha_assoc varchar(15),
	email_assoc varchar(75),
	aprovada_assoc char(1) not null
);
CREATE INDEX xAssociacao ON tblAssociacao(ID_associacao);
go

-- Cupom

CREATE TABLE tblCupom (
	ID_cupom numeric(6) not null PRIMARY KEY identity(1,1),
	ID_associacao numeric(6) FOREIGN KEY REFERENCES tblAssociacao(ID_associacao) not null,
	nome_cupom char(25) not null,
	disponivel char(1) not null,
	valor numeric (8) not null,
	tipo char (25) not null,
	imagem varchar (50) not null,
	descricao_cupom char(75) not null,
	desconto numeric(2) not null,
	aprovado char(1) not null
);
CREATE INDEX xCupom ON tblCupom(ID_cupom);
go

-- Local Deposito

CREATE TABLE tblLocalDeposito (
	ID_local_deposito numeric(6) not null PRIMARY KEY identity(1,1),
	nome_depo varchar(75) not null,
	CNPJ_depo varbinary(max) not null,
	licenca_depo varbinary(max) not null,
	alvara_depo varbinary(max) not null,
	certificacao_depo varbinary(max) not null,
	comprovante_depo varbinary(max) not null,
	codigo_depo varchar(15),
	senha_depo varchar(15),
	email_depo varchar(75),
	aprovado_depo char(1) not null
);
CREATE INDEX xLocalDeposito ON tblLocalDeposito(ID_local_deposito);
go

-- Usu�rio

CREATE TABLE tblUsuario (
	ID_usuario numeric(6) not null PRIMARY KEY identity(1,1),
	nome_usuario varchar(50) not null,
	sobrenome_usuario varchar(50) not null,
	cpf varchar(14) not null,
	telefone_usuario varchar(18) not null,
	email_usuario varchar(100) not null,
	senha_usuario varchar(255) not null,
	dt_nascimento date not null,
	token_rec_senha varchar(64),
	dt_expiracao_token datetime,
	token_ativacao varchar(64)
);
CREATE INDEX xUsuario ON tblUsuario(ID_usuario);
go

-- Feedback

CREATE TABLE tblFeedback (
	ID_feedback numeric(6) not null PRIMARY KEY identity(1,1),
	assunto varchar(50) not null,
	nome varchar(75),
	email varchar(100) not null,
	cpf varchar(14) not null,
	telefone varchar(18) not null,
	anexo varbinary(max),
	descricao_feedback varchar(350) not null
);
CREATE INDEX xFeedback ON tblFeedback(ID_feedback);
go

-- Doacao

CREATE TABLE tblDoacao (
	ID_doacao numeric(6) not null PRIMARY KEY identity(1,1),
	ID_funcionario numeric(6) FOREIGN KEY REFERENCES tblFuncionario(ID_funcionario) not null,
	ID_usuario numeric(6) FOREIGN KEY REFERENCES tblUsuario(ID_usuario) not null,
	ID_local_deposito numeric(6) FOREIGN KEY REFERENCES tblLocalDeposito(ID_local_deposito) not null,
	dt_doacao datetime not null,
	pontuacao numeric(8) not null,
	peso numeric(6) not null,
	descricao_doacao varchar(75)
);
CREATE INDEX xDoacao ON tblDoacao(ID_doacao);
go

-- Pedido

CREATE TABLE tblPedido (
	ID_pedido numeric(6) not null PRIMARY KEY identity(1,1),
	ID_usuario numeric(6) FOREIGN KEY REFERENCES tblUsuario(ID_usuario) not null,
	dt_pedido datetime not null
);
CREATE INDEX xPedido ON tblPedido(ID_pedido);
go

-- Resgate

CREATE TABLE tblResgate (
	ID_resgate numeric(6) not null PRIMARY KEY identity(1,1),
	ID_cupom numeric(6) FOREIGN KEY REFERENCES tblCupom(ID_cupom) not null,
	ID_pedido numeric(6) FOREIGN KEY REFERENCES tblPedido(ID_pedido) not null,
	codigo_resgate char(8) not null,
	dt_expiracao date not null,
	utilizado char(1)
);
CREATE INDEX xResgate ON tblResgate(ID_resgate);
go

-- Associacao cupom

CREATE TABLE tblAssociacaoCupom (
	ID_associacao_cupom numeric(6) not null PRIMARY KEY identity(1,1),
	ID_associacao numeric (6) FOREIGN KEY REFERENCES tblAssociacao(ID_associacao) not null,
	ID_cupom numeric(6) FOREIGN KEY REFERENCES tblCupom(ID_cupom) not null,
	qtde_estoque int
);
CREATE INDEX xAssociaoCupom ON tblAssociacaoCupom(ID_associacao_cupom);
go

-- COMANDOS --

INSERT INTO tblLocalDeposito VALUES ('Deposito Vila Guilherme', 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 'depv1la', 'gu1', 'deposito@gmail.com', 'S');

INSERT INTO tblAssociacao VALUES ('Promofarma', 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 'pr0m0', 'f4rm4', 'promofarma@gmail.com', 's');
INSERT INTO tblAssociacao VALUES ('Unimed', 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 'un1', 'm3d', 'unimed@hotmail.com', 's');
INSERT INTO tblAssociacao VALUES ('Hospital Presidente', 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 'h0sp1tal', 'cl1n1c4', 'hc@outlook.com', 's');
INSERT INTO tblAssociacao VALUES ('Amil', 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 'am1l', 'am1l', 'amil@outlook.com', 's');
INSERT INTO tblAssociacao VALUES ('Hospital S�rio-Liban�s', 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 's1r1o', 'l1b4n3s', 'siriolib@hotmail.com', 's');
INSERT INTO tblAssociacao VALUES ('Drogasil', 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 'dr0ga', 's1l', 'drogasil@hotmail.com', 's');
INSERT INTO tblAssociacao VALUES ('Farmais', 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 'f4r', 'ma15', 'farmais@outlook.com', 's');
INSERT INTO tblAssociacao VALUES ('Ultrafarma', 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 0x4D65616E696E676C65737344617461, 'u1tra', 'f4rm4', 'ultrafarma@gmail.com', 's');
go

INSERT INTO tblCupom VALUES (1, 'Rivotril', 'S', 8000, 'medicamento', './src/imgs/cupons/rivotril.png', 'Suspens�o Oral', 15, 'S');
INSERT INTO tblCupom VALUES (2, 'Pediatra', 'S', 25000, 'consulta', './src/imgs/cupons/unimed.png', 'Ter�a-feira e Quinta-feira', 20, 'S');
INSERT INTO tblCupom VALUES (3, 'Psic�loga', 'S', 27000, 'consulta', './src/imgs/cupons/hp.jpg', 'Domingo � Quarta-feira', 17, 'S');
INSERT INTO tblCupom VALUES (1, 'Paracetamol 750mg', 'S', 13500, 'medicamento', './src/imgs/cupons/paracetamol.jpg', 'Comprimido Revestido', 35, 'S');
INSERT INTO tblCupom VALUES (4, 'Amil One 1000', 'S', 15000, 'consulta', './src/imgs/cupons/amil.jpg', 'Uma parcela do plano', 5, 'S');
INSERT INTO tblCupom VALUES (5, 'Gastroenterologista', 'S', 11000, 'consulta', './src/imgs/cupons/sirio.jpg', 'Quarta-feira e Sexta-feira', 7, 'S');
INSERT INTO tblCupom VALUES (1, 'Dove 72h 150ml', 'S', 10500, 'beleza/higiene', './src/imgs/cupons/dove.webp', 'Desodorante Aerosol', 20, 'S');
INSERT INTO tblCupom VALUES (1, 'Sabonete L�quido Infantil', 'S', 11000, 'beleza/higiene', './src/imgs/cupons/sabonete.png', 'Granado Tradicional', 12, 'S');
INSERT INTO tblCupom VALUES (1, 'Fralda Pampers XG', 'S', 9000, 'beleza/higiene', './src/imgs/cupons/fraldaPampers.webp', 'Confort Sec', 30, 'S');
INSERT INTO tblCupom VALUES (2, 'Ginecologista', 'S', 22000, 'consulta', './src/imgs/cupons/unimed.png', 'Sexta-feira', 9, 'S');
INSERT INTO tblCupom VALUES (6, 'Dermacit�', 'S', 7000, 'beleza/higiene', './src/imgs/cupons/cremeDemacita.webp', 'Creme para pernas 300ml', 10, 'S');
INSERT INTO tblCupom VALUES (6, 'Omegafor Plus', 'S', 15000, 'medicamento', './src/imgs/cupons/omegafor.webp', 'Suplemento alimentar', 15, 'S');
INSERT INTO tblCupom VALUES (6, 'Principia GL-01', 'S', 9500, 'beleza/higiene', './src/imgs/cupons/principiaGL01.webp', 'Gel de limpeza 350ml', 7, 'S');
INSERT INTO tblCupom VALUES (7, 'Acetilciste�na 600mg', 'S', 6000, 'medicamento', './src/imgs/cupons/acetilcisteina.webp', 'Granulado Sabor Laranja', 12, 'S');
INSERT INTO tblCupom VALUES (7, 'Cimegripe', 'S', 7500, 'medicamento', './src/imgs/cupons/cimegripe.webp', 'Suspens�o Oral', 6, 'S');
INSERT INTO tblCupom VALUES (7, 'Plenitud Plus G/XG', 'S', 5500, 'beleza/higiene', './src/imgs/cupons/plenitudPlus.webp', 'Roupa �ntima descart�vel', 15, 'S');
INSERT INTO tblCupom VALUES (4, 'Amil 400', 'S', 12500, 'consulta', './src/imgs/cupons/amil.jpg', 'Uma parcela do plano', 8, 'S');
INSERT INTO tblCupom VALUES (4, 'Amil 700', 'S', 13000, 'consulta', './src/imgs/cupons/amil.jpg', 'Uma parcela do plano', 9, 'S');
INSERT INTO tblCupom VALUES (3, 'Cardiologista', 'S', 24300, 'consulta', './src/imgs/cupons/hp.jpg', 'Segunda-feira', 13, 'S');
INSERT INTO tblCupom VALUES (3, 'Ortopedista', 'S', 22500, 'consulta', './src/imgs/cupons/hp.jpg', 'Domingo e Ter�a-feira', 20, 'S');
INSERT INTO tblCupom VALUES (5, 'Endocrinologista', 'S', 12500, 'consulta', './src/imgs/cupons/sirio.jpg', 'Quarta-feira', 7, 'S');
INSERT INTO tblCupom VALUES (5, 'Geriatra', 'S', 10700, 'consulta', './src/imgs/cupons/sirio.jpg', 'Segunda-feira � S�bado', 7, 'S');
INSERT INTO tblCupom VALUES (7, 'Melatonina Melyx', 'S', 9200, 'medicamento', './src/imgs/cupons/melatoninaMelyx.jpg', 'Comprimido mastig�vel 210mcg', 23, 'S');
INSERT INTO tblCupom VALUES (7, 'Leite de Magn�sia', 'S', 4500, 'medicamento', './src/imgs/cupons/leiteMagnesia.jpg', 'Phillips  120ml', 19, 'S');
INSERT INTO tblCupom VALUES (7, 'Sulfato Ferroso', 'S', 7200, 'medicamento', './src/imgs/cupons/sulfatoFerroso.jpg', 'Comprimido Sidney Oliveira', 11, 'S');
go


INSERT INTO tblUsuario VALUES ('Daniel', 'da Cruz', '33278744598', '(11) 76327-9809', 'daniel@hotmail.com', '$2y$10$7AuCvSI/Cg13KW1rD3CKC.dTxzg4oeLG5pevI.NBkUYNCjyi5qrOW', '18-12-1990', NULL, NULL, NULL); --senha: danteAl1gu1er3
INSERT INTO tblUsuario VALUES ('Luis', 'Almeida', '82957725909', '(13) 26121-9333', 'luis@gmail.com', '$2y$10$P7zHZL/9cY23W12ZBsnUQuo7kZcYDy6A00SCuRcI6E5PW/OAQp09u', '28-01-2000', NULL, NULL, NULL); --senha: 34L99Mnol00nacl
INSERT INTO tblUsuario VALUES ('Luigi', 'Pugh', '82911125231', '(23) 00112-9653', 'luigi.nascimento01@etec.sp.gov.br', '$2y$10$v3MIZtBqEOWEWwgm1cbYvO936VsmMtrHAkeAfOV6ZNRzpCLs3bH62', '30-04-1999', NULL, NULL, NULL); --senha: etecsaopaulo
go

INSERT INTO tblFuncionario VALUES ('prm1rwe', '111', 'gestor de dados');
INSERT INTO tblFuncionario VALUES ('nvweblo', '222', 'atendente centro deposito');
go

INSERT INTO tblDoacao VALUES (2, 1, 1, '17-12-2024', 100000, 450, '');
INSERT INTO tblDoacao VALUES (2, 2, 1, '23-12-2024', 12000, 10, '');
go

INSERT INTO tblPedido VALUES (1, '07-03-2025 16:00:21');
INSERT INTO tblPedido VALUES (1, '11-01-2025 21:23:00');

INSERT INTO tblResgate VALUES (1, 1, '9244e59d', '07-12-2025', 'N');
INSERT INTO tblResgate VALUES (2, 1, '0a51427e', '01-03-2026', 'N');
INSERT INTO tblResgate VALUES (2, 1, '4a4d2fcb', '12-07-2025', 'N');


SELECT * FROM tblFeedback
