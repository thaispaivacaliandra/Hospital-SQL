create database Hospital;

use Hospital;

create table Paciente (
idPaciente int not null auto_increment,
nomePaciente varchar(80),
nascimento date,
endereço varchar(45),
telefone int,
email varchar(80),
cpf int,
convenio_idConvenio int,
primary key (idPaciente),
foreign key (convenio_idConvenio) references Convenio (convenio_idConvenio)
);
insert into Paciente (nomePaciente, nascimento, endereço, telefone, email, cpf)
values ('Emily Ferreira Alves', '02-03-1990', 'Rua José Claudino 564', 'EmilyFerreiraAlves@rhyta.com', '69769733970','2'),
('Isabela Araujo Dias', '03-03-1990', 'Rua Perequê 420', 'IsabelaAraujoDias@teleworm.us', '92498250050',''),
('Leonor Ribeiro Goncalves', '03-03-1990', 'Rua Tanazeiro', 'LeonorRibeiroGoncalves@armyspy.com', '69769733970',''),
('Fernanda Ribeiro Melo', '04-03-1990', 'Rua Seis 147', 'FernandaRibeiroMelo@rhyta.com', '64961845000','2'),
('Nicole Cardoso Castro', '05-03-1990', 'Rua Sílvio Bertoloto 1876', 'NicoleCardosoCastro@jourrapide.com', '33782597443',''),
('Antônio Lima Pereira', '06-03-1990', 'Rua Luanda 1446', 'AntonioLimaPereira@dayrep.com', '38516237206','3'),
('Pedro Alves Goncalves', '07-03-1990', 'Rua Miranda 1766', 'PedroAlvesGoncalves@jourrapide.com', '79232664844',''),
('Renan Azevedo Lima', '07-03-1990', 'Avenida Horácio Lafer', 'RenanAzevedoLima@teleworm.us', '22661320750',''),
('Bianca Rocha Castro', '08-03-1990', 'Claudino 64', 'BiancaRochaCastro@rhyta.com', '35877728865','1'),
('Thiago Araujo Costa', '09-03-1990', 'Rua Pedro Collere', 'ThiagoAraujoCosta@rhyta.com', '54570045898',''),
('Diogo Barros Pinto', '10-03-1990', 'Bem Querer', 'DiogoBarrosPinto@dayrep.com', '82441962892','4'),
('Leonor Alves Almeida', '11-03-1990', 'Viela Mombuca', 'LeonorAlvesAlmeida@dayrep.com', '67422088303',''),
('Isabella Fernandes Dias', '12-03-1990', 'Rua Alexandre', 'IsabellaFernandesDias@rhyta.com', '57937138084','2'),
('Vitoria Lima Ferreira', '13-03-1990', 'Rua Erasmo Figueiredo', 'VitoriaLimaFerreira@dayrep.com', '87095011265','4'),
('Livia Rodrigues Costa', '14-03-1990', 'Rua Antonieta Veloso', 'LiviaRodriguesCosta@armyspy.com', '49917808370','2');



create table Convenio(
idConvenio int not null auto_increment,
nomeConvenio varchar(90),
cnpjConvenio int,
tempodecarencia varchar(90),
primary key (idConvenio)
);
insert into Convenio (nomeConvenio, cnpjConvenio, tempodecarencia)
values ('saudemais', '15358748000138', '5meses'),
('saudetodos', '12348748000138', '4meses'),
('saudelg', '56781234000138', '6meses'),
('saude da mulher', '12341234000138', '3meses');

select * from hospital.convenio;

create table Medico(
idMedico int(9) not null auto_increment,
nomeMedico varchar(80),
crmMedico int(9),
estado varchar(45),
categoria varchar(45),
telefoneMedico int(9),
primary key (idMedico)
);
insert into Medico (nomeMedico, crmMedico, estado, categoria, telefoneMedico) values ('Anny Quintanilha',
'120935', 'rs', 'especialista', '(69)37525488'),
('Alisson Sacramento', '178105', 'mg', 'especialista', '(97)28101234'),
('Lívia Veloso', '17897', 'mg', 'especialista', '(61)12345488'),
('Gael Milheiro Lemes', '120935', 'rs', 'especialista', '61)37526789'),
('Gisela Espinosa', '34548', 'sp', 'generalista', '(61)37536489'),
('Nelson Anjos Palmeira', '344789', 'sp', 'especialista', '(61)37985488'),
('Ezequiel Pestana Henriques', '9756', 'rs', 'especialista', '(91)37523488'),
('Tito Carqueijeiro', '14777', 'rs', 'generalista', '(83)32728326'),
('Cristovão Xavier', '67432', 'rs', 'especialista', '(24)24489465'),
('Júlia Camarinho', '24654', 'df', 'generalista', '(61)26154776');



create table Especialidade (
idEspecialidade int(9) not null auto_increment,
nomeEspecialidade varchar(45),
primary key (idEspecialidade)
);
insert into Especialidade (nomeEspecialidade) value ('pediatra'),
('clínica geral'),
('dermatologista'),
('gastroenterologia'),
('oncologia'),
('ortopedista'),
('endocrinologista');



create table Consulta (
idConsulta int(9) not null auto_increment,
dataConsulta datetime,
valorConsulta decimal(9,2),
paciente_idPaciente int(9),
medico_idMedico int(9),
convenio_idConvenio int(9),
especialidade_idEspecialidade int(9),
PRIMARY KEY (idConsulta),
FOREIGN KEY (paciente_idPaciente) REFERENCES Paciente (idPaciente),
FOREIGN KEY (medico_idMedico) REFERENCES Medico (idMedico),
FOREIGN KEY (convenio_idConvenio) REFERENCES Convenio (idConvenio),
FOREIGN KEY (especialidade_idEspecialidade) REFERENCES Especialidade (idEspecialidade)
);
insert into Consulta (dataConsulta,valorConsulta,paciente_idPaciente,medico_idMedico,convenio_idConvenio,especialidade_idEspecialidade)
values ('01-01-2015', '1,99', '10', '1','4','5'),
('02-05-2016', '1,99', '3', '10','','4'),
('03-06-2017', '1,99', '5', '7','2','6'),
('04-07-2018', '1,99', '4', '4','','1'),
('05-08-2019', '1,99', '2', '2','1','5'),
('06-09-2020', '1,99', '7','5','','7'),
('07-10-2021', '1,99', '9', '7','2','6'),
('08-01-2015', '1,99', '2', '2','','3'),
('09-05-2016', '1,99', '3', '1','3','7'),
('10-06-2017', '1,99', '8', '3','3','5'),
('11-07-2018', '1,99', '9', '9','2','5'),
('12-08-2019', '1,99', '1', '10','4','4'),
('12-09-2020', '1,99', '3','5','','3'),
('14-10-2021', '1,99', '2', '3','3','1'),
('15-01-2015', '1,99', '7', '1','4','6'),
('16-05-2016', '1,99', '5', '10','','5'),
('17-06-2017', '1,99', '2', '1','2','2'),
('18-07-2018', '1,99', '3', '2','1','5'),
('19-08-2019', '1,99', '9', '2','1','6'),
('20-09-2020', '1,99', '4','5','3','2');


create table Receita(
idReceita int not null auto_increment,
medicamentos varchar(80),
horario_uso varchar(45),
consulta_id int (3),
primary key (idReceita),
foreign key (consulta_id) references Consulta (idConsulta)
);
insert into Receita (medicamento,horario_uso,consulta_id) values
('ibuprofeno','8h em 8h','1'),
('dipirona', '6h em 6h','2'),
('antibiotico', 'uma vez ao dia','2'),
('vitamina A a E', 'uma vez ao dia','1');

create table Internacao (
idInternecao int(9) not null auto_increment,
data_entrada datetime,
data_saida datetime,
procedimento varchar(45),
paciente_idPaciente int,
medico_idMedico int,
quarto_idQuarto int,
enfermeiro_idEnfermeiro int,
primary key (idInternacao),
foreign key (paciente_idPaciente) references Paciente (idPaciente),
foreign key (medico_idMedico) references Medico (idMedico),
foreign key (quarto_idQaurto) references Quarto (idQuarto),
foreign key (enfermeiro_idEnfermeiro) references Enfermeiro (idEnfermeiro)
);
insert into Internacao (data_entrada,data_saida,procedimento,paciente_idpaciente,medico_idmedico,quarto_idquarto,enfermeiro_idEnfermeiro)
values ('01-01-2015','03-01-2015','cirurgia geral', '1', '1', '1','3'),
('11-05-2016','13-05-2065','cirurgia geral', '1', '3', '1','4'),
('21-06-2017','24-06-2017','cirurgia geral', '5', '2', '1','5'),
('13-07-2018','16-07-2018','cirurgia geral', '2', '3', '2','3'),
('13-08-2019','16-08-2019','cirurgia geral', '2', '3', '2','4'),
('23-09-2020','26-09-2020','cirurgia geral', '3', '1', '3','5'),
('15-10-2021','18-10-2021','cirurgia geral', '4', '1', '3','1');



create table Quarto (
idQuarto int not null auto_increment,
numero_quarto int(9),
tipo_quarto_idtipo_quarto int(9),
primary key (idQuarto),
foreign key (tipo_quarto_idtipo_quarto) references Internacao (quarto_idQuarto)
);

create table Tipo_quarto (
idTipo_quarto int(9) not null auto_increment,
descricao varchar(45),
valor decimal (9,2),
primary key (idTipo_quarto)
);
insert into Tipo_quarto (descricao, valor) values
('apartamento', '500,00'),
('quarto duplo', '400,00'),
('enfermaria', '300,00');



create table Enfermeiro(
idEnfermeiro int(9) not null auto_increment,
nomeEnfermeiro varchar(80),
cpfEnfermeiro int(9),
cre int(9),
primary key (idEnfermeiro)
);
INSERT into Enfermeiro(nomeEnfermeiro,cpfEnfermeiro,cre)
values ('Otávio Rocha Oliveira', '85940213804', '13804'),
('Sophia Martins Souza', '46879330762', '62074'),
('Rafaela Lima Ferreira', '74889321020', '74820'),
('Vitoria Araujo Dias', '99977032513', '864104'),
('Giovanna Rodrigues Souza', '48608642105', '10520'),
('Samuel Araujo Carvalho', '72382833360', '86106'),
('Miguel Ferreira Barros', '48608107042', '86107'),
('Júlia Dias Ribeiro', '10808642042', '86108'),
('Felipe Sousa Castro', '48608642100', '86109'),
('Leonor Silva Cardoso', '48000642042', '86110');
