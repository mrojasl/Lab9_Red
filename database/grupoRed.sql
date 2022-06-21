SET FOREIGN_KEY_CHECKS=0;
Truncate table Humanos;
Truncate table TiposDeZombie;
Truncate table Virus;
Truncate table Variante;
Truncate table Superviviente;
Truncate table Objetos;
Truncate table Zombie;
Truncate table Efectividad;
Truncate table Inventario;
SET FOREIGN_KEY_CHECKS=1;

#TiposDeZombie#
insert into TiposDeZombie (nombre) values
("Demoledor"),("Rápido"),("Niño"),("Normal"),("Otro");

#Virus#
insert into Virus (nombre) values
("Covid5"),("Hanta"),("Ebola"),("Machupo"),("Bica");

#Variante#
insert into Variante (nombre,idVirus) values
("Omicron",1),("Alfa",1),("Beta",1),("Delta",1),("Gamma",1),
("Burga",2),("Lucho",2),("Lopez",2),("Roldan",2),("Adauto",2),("Rojas",2),("Ugaz",2),("Bautista",2),
("Sudan",3),("Zaire",3),("Bundibugyo",3),
("Corintio",4),("Tesalonicense",4),("Habacuc",4),("Miqueas",4),("Oseas",4),("Galata",4),
("Trica",5),("PrimeraCarta",5),("SegundaCarta",5),("Expulsado",5),("TrasladarTalento",5);

#Humanos#
insert into Humanos (idHumanos, nombre, apellido, estadoZ, sexo) values
("84924685437", 'Pierson', 'Tureville', 1, 'Masculino'),
("52738823569", 'Honoria', 'Hambribe', 0, 'Femenino'),
("68223839734", 'Denys', 'Glasspoole', 0, 'Otro'),
("25386728587", 'Lucais', 'Mobius', 0, 'Masculino'),
("44255976832", 'Tersina', 'Dobbison', 0, 'Masculino'),
("96884489986", 'Johnny', 'Manuelli', 1, 'Femenino'),
("22379685280", 'Dido', 'Armsby', 1, 'Otro'),
("43343464742", 'Wendye', 'Plessing', 1, 'Masculino'),
("26963689549", 'Katey', 'Gioani', 0, 'Otro'),
("55755356375", 'Morganne', 'Izac', 0, 'Masculino'),
("23972575355", 'Loren', 'Orht', 1, 'Otro'),
("72368334838", 'Querida', 'McConville', 0, 'Otro'),
("42482785558", 'Misty', 'Rizzini', 1, 'Masculino'),
("76379937799", 'Edita', 'Payze', 0, 'Otro'),
("74366865544", 'Nancie', 'Houtby', 0, 'Femenino'),
("74358658437", 'Xylia', 'Duester', 0, 'Otro'),
("64348493244", 'Patience', 'McVicar', 0, 'Masculino'),
("55949492923", 'Nickey', 'Bignell', 1, 'Femenino'),
("63347485386", 'Reeta', 'D''Ambrosi', 0, 'Otro'),
("58369739422", 'Dylan', 'Bennit', 0, 'Masculino'),
("56283583647", 'Osbourn', 'Rattenbury', 1, 'Otro'),
("63572349796", 'Farleigh', 'de Najera', 0, 'Femenino'),
("26374793832", 'Laverna', 'Trathen', 1, 'Masculino'),
("88523978782", 'Jacquetta', 'Dupoy', 1, 'Otro'),
("99462783892", 'Ingrid', 'Wallbank', 0, 'Femenino'),
("28692533998", 'Dick', 'Rowly', 1, 'Masculino'),
("74768779865", 'Katy', 'Gordon-Giles', 0, 'Masculino'),
("62863535924", 'Lettie', 'Pinnington', 0, 'Otro'),
("47947935262", 'Bill', 'Pagel', 1, 'Masculino'),
("89933765523", 'Erl', 'Young', 0, 'Masculino'),
("92379449733", 'Antonio', 'Garthshore', 1, 'Femenino'),
("69677436774", 'Collin', 'Oats', 1, 'Otro'),
("94642878777", 'Guido', 'Player', 1, 'Otro'),
("99834859239", 'Lena', 'Giany', 0, 'Otro'),
("63928452229", 'Vonny', 'Lamasna', 1, 'Masculino'),
("66634779599", 'Deina', 'Butchers', 1, 'Masculino'),
("38259789676", 'Gordan', 'Fawke', 0, 'Otro'),
("69286262388", 'Thomas', 'Neighbour', 1, 'Femenino'),
("77257337684", 'Nadya', 'Benoist', 1, 'Otro'),
("95932394268", 'Joellen', 'Hyland', 1, 'Otro'),
("98665777546", 'Timotheus', 'Mohan', 0, 'Otro'),
("82368682786", 'John', 'Bostick', 1, 'Masculino'),
("82898556782", 'Osbourn', 'O''Fallon', 1, 'Otro'),
("66224487636", 'Burty', 'Lineen', 0, 'Masculino'),
("42227969488", 'Giffer', 'Beekman', 0, 'Masculino'),
("67476442727", 'Edi', 'Peacher', 1, 'Otro'),
("86232698272", 'Sherlocke', 'Empson', 0, 'Masculino'),
("79837643947", 'Templeton', 'Colson', 1, 'Masculino'),
("62399444986", 'Margot', 'Jeske', 0, 'Otro'),
("36675845958", 'Welby', 'Budden', 1, 'Otro'),
("58446648263", 'Fanechka', 'Junifer', 1, 'Otro'),
("24739294542", 'Batsheva', 'Marler', 1, 'Masculino'),
("49453547669", 'Alyss', 'Beer', 1, 'Otro'),
("26982777724", 'Trev', 'Tomik', 1, 'Otro'),
("36222322447", 'Roseline', 'Ferber', 0, 'Otro'),
("23527985769", 'Calypso', 'Rebeiro', 0, 'Femenino'),
("58388536423", 'Rafaellle', 'Baptie', 0, 'Femenino'),
("49745873358", 'Delcina', 'Gabitis', 1, 'Otro'),
("22284294663", 'Hildagarde', 'Janz', 0, 'Femenino'),
("56853694294", 'Andre', 'Mussettini', 1, 'Masculino'),
("66372925362", 'Kaiser', 'Griffin', 1, 'Otro'),
("86466955384", 'Neely', 'Colliford', 1, 'Femenino'),
("25866763834", 'Caryl', 'Levin', 1, 'Femenino'),
("95923954866", 'Gilburt', 'Bristowe', 1, 'Masculino'),
("49898582824", 'Dall', 'Cardenas', 0, 'Femenino'),
("62942735724", 'Carlynn', 'Aglione', 0, 'Otro'),
("85336977237", 'Gustave', 'Richfield', 1, 'Otro'),
("73997237232", 'Becki', 'Gavagan', 1, 'Otro'),
("86665387646", 'Perry', 'Mathes', 0, 'Femenino'),
("99477446373", 'Tait', 'Burdess', 1, 'Masculino'),
("84467388345", 'Angeline', 'Trevarthen', 1, 'Masculino'),
("87389594245", 'Branden', 'Antic', 0, 'Masculino'),
("47956784468", 'Cal', 'O''Lynn', 0, 'Femenino'),
("29828699697", 'Erv', 'Fillary', 0, 'Femenino'),
("99735449326", 'Sindee', 'Itschakov', 1, 'Otro'),
("74876256272", 'Birdie', 'Frude', 1, 'Masculino'),
("75252387624", 'Susana', 'Ilyinski', 0, 'Masculino'),
("36239852975", 'Coleen', 'Kiossel', 1, 'Otro'),
("73363255845", 'Rhea', 'Grigs', 0, 'Otro'),
("76364964436", 'Lesley', 'Rockwill', 0, 'Masculino'),
("35857643738", 'Goldie', 'McAvey', 1, 'Femenino'),
("28356679285", 'Darb', 'Cissell', 1, 'Femenino'),
("69296696429", 'Mitzi', 'Willatt', 1, 'Masculino'),
("26225296922", 'Lauralee', 'Jochens', 1, 'Femenino'),
("39453956969", 'Garvin', 'Loughren', 1, 'Masculino'),
("53783442832", 'Emerson', 'Aves', 0, 'Masculino'),
("62434664378", 'Shayna', 'Patifield', 1, 'Masculino'),
("32337875575", 'Reg', 'Greaterex', 0, 'Otro'),
("42688586254", 'Byrann', 'Seaward', 0, 'Masculino'),
("85298663945", 'Tyne', 'Channing', 0, 'Femenino'),
("33276585553", 'Vassili', 'Frensche', 1, 'Masculino'),
("73385839745", 'Con', 'Langabeer', 1, 'Otro'),
("67722348489", 'Lorry', 'Stradling', 1, 'Femenino'),
("68633922345", 'Alexander', 'Whitchurch', 0, 'Masculino'),
("83976475555", 'Bendicty', 'Martensen', 1, 'Femenino'),
("67464274875", 'Chantal', 'Corck', 0, 'Otro'),
("22669537645", 'Raynor', 'Le Huquet', 0, 'Otro'),
("74485799575", 'Winny', 'Brewse', 0, 'Otro'),
("33886878845", 'Birk', 'Trowell', 1, 'Femenino'),
("86464324645", 'Rosamond', 'Parkman', 0, 'Otro');

#Superviviente#
insert into superviviente (idHumanos, peso, fuerza) values 
('22284294663', 138, 31),
('22669537645', 109, 97),
('23527985769', 60, 112),
('25386728587', 114, 22),
('26963689549', 122, 47),
('29828699697', 115, 38),
('32337875575', 58, 82),
('36222322447', 107, 122),
('38259789676', 70, 96),
('42227969488', 113, 90),
('42688586254', 67, 99),
('44255976832', 107, 23),
('47956784468', 132, 131),
('49898582824', 76, 131),
('52738823569', 120, 119),
('53783442832', 76, 129),
('55755356375', 113, 61),
('58369739422', 138, 14),
('58388536423', 119, 131),
('62399444986', 129, 19),
('62863535924', 106, 22),
('62942735724', 115, 23),
('63347485386', 129, 88),
('63572349796', 91, 123),
('64348493244', 96, 63),
('66224487636', 107, 22),
('67464274875', 72, 41),
('68223839734', 108, 89),
('68633922345', 68, 53),
('72368334838', 71, 138),
('73363255845', 115, 108),
('74358658437', 67, 133),
('74366865544', 126, 55),
('74485799575', 56, 10),
('74768779865', 57, 91),
('75252387624', 58, 30),
('76364964436', 98, 86),
('76379937799', 70, 59),
('85298663945', 92, 60),
('86232698272', 128, 92),
('86464324645', 119, 66),
('86665387646', 72, 119),
('87389594245', 57, 23),
('89933765523', 72, 135),
('98665777546', 100, 49),
('99462783892', 88, 111),
('99834859239', 56, 89);
update superviviente set idPareja=22284294663 where idHumanos=32337875575;
update superviviente set idPareja=32337875575 where idHumanos=22284294663;
update superviviente set idPareja=63572349796 where idHumanos=87389594245;
update superviviente set idPareja=87389594245 where idHumanos=63572349796;
update superviviente set idPareja=98665777546 where idHumanos=99462783892;
update superviviente set idPareja=99462783892 where idHumanos=98665777546;
update superviviente set idPareja=42227969488 where idHumanos=38259789676;
update superviviente set idPareja=38259789676 where idHumanos=42227969488;
update superviviente set idPareja=58369739422 where idHumanos=58388536423;
update superviviente set idPareja=58388536423 where idHumanos=58369739422;


#Objetos#
insert into Objetos (nombre,masa,vacuna) values
("Botella de agua",0.5,0),
("Pistola Glock",0.75,0),
("Balas de pistola",0.216,0),
("Rifle de asalto",2.97,0),
("Hacha",2.5,0),
("Biblia",0.4,0),
("Calculadora",0.1,0),
("Relantizador3000",0.2,1),
("Pfizer2020",0.1,1),
("Aromas de chamán",0.008,1),
("Balas de rifle",0.180,0),
("Martillo",2.2,0),
("Camuflaje",1.2,0);



#Inventario#
insert into Inventario (idHumanos,idObjetos,cantidad) values
("22284294663",1,1),("22669537645",1,1),
("23527985769",1,2),("25386728587",1,1),
("26963689549",1,1),("29828699697",1,2),
("32337875575",1,2),("36222322447",1,1),
("38259789676",1,1),("42227969488",1,1),
("42688586254",1,1),("44255976832",1,2),
("47956784468",1,2),("49898582824",1,1),
("52738823569",1,1),("53783442832",1,1),
("55755356375",1,1),("58369739422",1,2),
("44255976832",2,1),("47956784468",2,1),
("49898582824",2,1),("52738823569",2,1),
("53783442832",2,1),("55755356375",2,1),
("58369739422",2,1),("58388536423",2,1),
("62399444986",2,1),("62863535924",2,1),
("62863535924",3,30),("62399444986",3,30),
("58369739422",3,30),("55755356375",3,30),
("58388536423",3,30),("53783442832",3,30),
("52738823569",3,30),("49898582824",3,30),
("47956784468",3,30),("44255976832",3,30),
("99834859239",1,1),("99462783892",1,1),
("98665777546",1,1),("89933765523",1,1),
("87389594245",1,1),("86665387646",1,1),
("86464324645",1,1),("86232698272",1,1),
("85298663945",1,1),("76379937799",1,1),
("76364964436",1,1),("75252387624",1,1),
("74768779865",1,1),("74485799575",1,1),
("74366865544",10,1),("73363255845",10,1),
("68633922345",10,1),("62863535924",10,1),
("52738823569",10,1),("36222322447",10,1),
("32337875575",9,1),("68223839734",9,1),
("74485799575",9,1),("87389594245",9,1),
("52738823569",4,1),("52738823569",11,30);



#SELECT * FROM lab9_zombies.superviviente;

#Zombie#
insert into zombie (idHumanos, idVariante, idTipoZombie, numeroVictimas,fechaDeInfeccion) values
('22379685280', 22, 4, 11, '2022-03-28 15:45:30'),
('23972575355', 10, 1, 14, '2022-03-20 23:00:39'),
('24739294542', 9, 1, 11, '2022-03-25 03:46:14'),
('25866763834', 19, 3, 7, '2022-02-10 15:19:42'),
('26225296922', 6, 1, 12, '2022-04-18 04:57:11'),
('26374793832', 20, 5, 14, '2022-01-19 02:22:48'),
('26982777724', 16, 3, 0, '2022-01-26 17:11:22'),
('28356679285', 7, 1, 3, '2022-05-12 00:06:46'),
('28692533998', 19, 1, 6, '2022-05-08 11:52:58'),
('33276585553', 1, 3, 13, '2022-03-08 11:53:00'),
('33886878845', 7, 2, 10, '2022-01-29 03:30:30'),
('35857643738', 2, 1, 12, '2022-04-03 06:29:09'),
('36239852975', 10, 3, 7, '2022-04-09 02:03:33'),
('36675845958', 15, 1, 3, '2022-03-31 03:42:09'),
('39453956969', 18, 2, 3, '2022-03-08 01:10:07'),
('42482785558', 21, 5, 9, '2022-05-13 23:13:56'),
('43343464742', 23, 5, 8, '2022-05-21 17:09:45'),
('47947935262', 12, 3, 13, '2022-03-16 08:27:32'),
('49453547669', 19, 5, 6, '2022-01-09 23:25:13'),
('49745873358', 17, 4, 1, '2022-02-19 07:00:16'),
('55949492923', 10, 2, 13, '2022-06-19 07:56:17'),
('56283583647', 8, 3, 10, '2022-03-11 11:51:31'),
('56853694294', 8, 3, 8, '2022-05-01 15:14:01'),
('58446648263', 21, 3, 13, '2022-04-06 19:46:36'),
('62434664378', 14, 5, 7, '2022-02-20 17:14:58'),
('63928452229', 10, 4, 7, '2022-05-18 17:35:06'),
('66372925362', 18, 1, 12, '2022-01-07 22:21:04'),
('66634779599', 11, 5, 0, '2022-06-17 03:42:58'),
('67476442727', 14, 2, 9, '2022-06-05 19:46:22'),
('67722348489', 15, 2, 1, '2022-06-08 14:05:03'),
('69286262388', 9, 1, 1, '2022-02-02 18:08:17'),
('69296696429', 27, 1, 0, '2022-04-22 08:52:44'),
('69677436774', 11, 4, 11, '2022-01-11 23:36:56'),
('73385839745', 2, 3, 8, '2022-01-19 01:40:01'),
('73997237232', 11, 1, 10, '2022-03-06 14:43:46'),
('74876256272', 19, 2, 13, '2022-01-08 08:20:19'),
('77257337684', 23, 1, 7, '2022-03-15 03:06:54'),
('79837643947', 2, 2, 2, '2022-01-25 10:54:14'),
('82368682786', 27, 1, 12, '2022-02-23 07:42:57'),
('82898556782', 27, 2, 11, '2022-03-09 20:27:19'),
('83976475555', 23, 5, 2, '2022-06-06 11:50:24'),
('84467388345', 12, 3, 12, '2022-05-11 00:34:42'),
('84924685437', 7, 3, 7, '2022-03-19 15:11:08'),
('85336977237', 13, 2, 10, '2022-06-07 15:44:18'),
('86466955384', 11, 1, 0, '2022-04-26 10:12:09'),
('88523978782', 13, 2, 3, '2022-02-09 07:29:39'),
('92379449733', 19, 1, 11, '2022-05-30 06:47:51'),
('94642878777', 24, 3, 3, '2022-05-30 17:58:53'),
('95923954866', 16, 2, 1, '2022-03-21 19:53:18'),
('95932394268', 15, 2, 13, '2022-01-08 05:52:48'),
('96884489986', 10, 3, 3, '2022-02-05 15:30:21'),
('99477446373', 7, 1, 0, '2022-01-25 19:55:34'),
('99735449326', 3, 5, 8, '2022-03-01 02:13:59');


#Efectividad#
insert into efectividad (idTiposDeZombie,idObjetos,porcentaje) values
(2,8,85.3),(4,9,94.7),(5,10,43.0);

