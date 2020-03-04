/* δημιουργία 2 εφημερίδων */
INSERT INTO newspaper VALUES('prasini','Daily','dpg7000');
INSERT INTO newspaper VALUES('gauros','Daily','marinakis');
/* εισαγωγή των υπαλλήλων  στους κατάλληλους πίνακες, πρώτα στον πίνακα employee , υστέρα στη εξειδίκευση του και τέλος στην εφημερίδα που εργάζεται */
INSERT INTO employee VALUES('melina13@gmail.com','2007-05-25','melina','mamali',1000);
INSERT INTO journalist VALUES('melina13@gmail.com',10,'makenta fuge apo tin omada xthes ......');
INSERT INTO Works VALUES('melina13@gmail.com','prasini');

INSERT INTO employee VALUES('xalvas125@gmail.com','2010-06-24','makis','xalvas',1000);
INSERT INTO journalist VALUES('xalvas125@gmail.com',5,'proin sundesmiths sth thira 7');
INSERT INTO Works VALUES('xalvas125@gmail.com','gauros');

INSERT INTO employee VALUES('xatgate1@gmail.com','2011-04-16','taxiarchis','pythonas',600);
INSERT INTO Administrator VALUES('xatgate1@gmail.com','Logistics','verginas',3,'athens');
INSERT INTO Works VALUES('xatgate1@gmail.com','prasini');

INSERT INTO employee VALUES('meetingstoapla@gmail.com','2005-03-29','kostas','pan',900);
INSERT INTO Administrator VALUES('meetingstoapla@gmail.com','Secretary','spetson',7,'athens');
INSERT INTO Works VALUES('meetingstoapla@gmail.com','gauros');

INSERT INTO employee VALUES('nikosman@dydns.com','2006-09-25','nikos','moumos',3000);
INSERT INTO Publisher VALUES('nikosman@dydns.com');
INSERT INTO Works VALUES('nikosman@dydns.com','prasini');

INSERT INTO Employee VALUES('tito24@gmail.com','2012-04-15','tito','papadopoulos',2500);
INSERT INTO Publisher VALUES('tito24@gmail.com');
INSERT INTO Works VALUES('tito24@gmail.com','gauros');

INSERT INTO Employee VALUES('gerasimos1@gmail.com','2008-10-20','gerasimos','tsarouxhs',1500);
INSERT INTO Journalist VALUES('gerasimos1@gmail.com',10,'poly ergatikos ...');
INSERT INTO ChiefEditor VALUES('gerasimos1@gmail.com');
INSERT INTO Works VALUES('gerasimos1@gmail.com','gauros');

INSERT INTO employee VALUES('mikegapla@gmail.com','2010-06-01','mike','gapla',1500);
INSERT INTO Journalist VALUES('mikegapla@gmail.com',5,'lexriths karaflokorakas ....');
INSERT INTO ChiefEditor VALUES('mikegapla@gmail.com');
INSERT INTO Works VALUES('mikegapla@gmail.com','prasini');

/* δημιουργία κατηγοριών */
INSERT INTO Categories VALUES(2534,'Podosfairo','to podosfairo einai athlima.... ',NULL);
INSERT INTO Categories VALUES(8714,'Premier League','to aggliko podosfairo einai to kalytero ...',2534);
INSERT INTO Categories VALUES(2311,'Basket','to dhmofilestero amerikaniko athlima',NULL);

/* υποβολή άρθρων, έλεγχος και εισαγωγή στον πίνακα article */
INSERT INTO article VALUES('c:\melina\article\feugei100ekopouggouras','PAEI KINA 100EK O POUGGOURAS','tromero deal o proedros...',3,1,2534);
INSERT INTO article VALUES('c:\mikegapla\article\erxetaioson','fernei son o alfzos','olo ekplhkseis o prezi....',2,2,8714);
/*  submit  */
INSERT INTO Submit VALUES('melina13@gmail.com','c:\melina\article\feugei100ekopouggouras','2020-02-29');
INSERT INTO Submit VALUES('mikegapla@gmail.com','c:\mikegapla\article\erxetaioson','2020-02-29');

INSERT INTO checks VALUES('mikegapla@gmail.com','c:\melina\article\feugei100ekopouggouras','teleio arthro','accepted','2020-05-27');
INSERT INTO checks VALUES('mikegapla@gmail.com','c:\mikegapla\article\erxetaioson','kalo to arthro ','accepted','2020-06-28');

/* εισαγωγή keywords */
INSERT INTO keywords VALUES('Podosfairo','c:\melina\article\feugei100ekopouggouras');
INSERT INTO keywords VALUES('PAO','c:\melina\article\feugei100ekopouggouras');
INSERT INTO keywords VALUES('Podosfairo','c:\mikegapla\article\erxetaioson');
INSERT INTO keywords VALUES('totenham','c:\mikegapla\article\erxetaioson');

/* εισαγωγή φωτογραφιών */
INSERT INTO Photographies VALUES('c:\melina\article\feugei100ekopouggouras','c:\melina\photos\pouggouras1');
INSERT INTO Photographies VALUES('c:\melina\article\feugei100ekopouggouras','c:\melina\photos\pouggouras2');
INSERT INTO Photographies VALUES('c:\mikegapla\article\erxetaioson','c:\kaplakos\photos\totenhamson');

/* εισαγωγή αριθμών τηλ. στους administrator */
INSERT INTO Telephones VALUES(2109544318,'xatgate1@gmail.com');
INSERT INTO Telephones VALUES(6945673125,'xatgate1@gmail.com');
INSERT INTO Telephones VALUES(2107531219,'meetingstoapla@gmail.com');

/* δημιουργια accepted άρθρων */
INSERT INTO ACCEPTEDArticle VALUES('c:\melina\article\feugei100ekopouggouras','2020-05-27','nikosman@dydns.com');
INSERT INTO ACCEPTEDArticle VALUES('c:\mikegapla\article\erxetaioson','2020-06-29','nikosman@dydns.com');
/* δημιουργία φύλλων */
INSERT INTO Leaflet VALUES(24,'prasini',30,1000,300,'2020-03-1','nikosman@dydns.com');
INSERT INTO Leaflet VALUES(15,'gauros',25,2500,1000,'2020-03-1','tito24@gmail.com');
