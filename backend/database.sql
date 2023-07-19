CREATE TABLE `user` (
  id int(11) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name_user varchar(80) NOT NULL,
  password varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE history (
  id int(11) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  title_history varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO history (title_history) VALUES ("La perle rare");

CREATE TABLE choice (
  id int(11) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  user_id int UNSIGNED not null,
  CONSTRAINT fk_user_id
  FOREIGN KEY (user_id)
  REFERENCES user(id),
  history_id int UNSIGNED not null,
  CONSTRAINT fk_history_id
  FOREIGN KEY (history_id)
  REFERENCES history(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE chapter (
  id int(11) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  title varchar(255),
  chapter text,
  image varchar(255),
  is_first boolean
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO chapter (title, chapter, image, is_first) VALUES 
("Perdu", "Perdu :
Vous vous êtes égaré Aventurier, la perle recherchée n'est pas ici.
Il va vous falloir recommencer :/", "/assets/images/perdu.jpg", false),

("La Taverne" ,
"Valeureux Aventurier, 
A la taverne du village ou vous avez fait étape sur votre chemin.
Vous entendez parler d'un trésor local perdu, il s'agit d'une perle d'une grande rareté.
Qui d'après ce que l'on raconte, conférerait des pouvoirs extraordinaires à son détenteur.
Etes-vous prêt à vous lancer à sa recherche ? Par où commencer :", "/assets/images/la_taverne.jpg", true),

("Le Village", NULL, NULL, false),

("La Forêt", "La forêt :

Vous vous enfoncez au coeur de la forêt qui se densifie de plus en plus.
A un embranchement, vous pouvez aller soit vers :", "/assets/image/la_foret.jpg", false),

("Le Château", NULL, NULL, false),

("Le Lac", "Le Lac :

Après quelques heures de marche, vous arrivez au bord d'un immense lac d'un bleu azur.
Sur la plage, se trouvent des constructions en bois avec des personnes à proximités.
Il y a également quelques navires d'amarrer au ponton.
Où aller vous ?", "/assets/images/le_lac.jpg", false),

("La Cabane", NULL, NULL, false),

("Le Navire", "Le Navire :

Vous vous approchez du ponton, et vous apprêtez à monter à bord du plus gros des navires.
Lorsque l'on vous interpelle : `Moussaillon, cela peut être très dangereux, d'oser s'aventurer sur ce lac` 
Que faîte vous ?", "/assets/images/le_navire.jpg", false),

("On Descend", NULL, NULL, false),

("On Monte", "Monte :

Une fois monter à bord, le capitaine du navire vous présente une carte du lac. Et il fait des kilomètres et des kilomètres de diamètres.
Après avoir discuté avec celui-ci, il se trouve que ce lac contient beaucoup d'espèces différentes dont des huîtres géantes.
Quelle direction prenez-vous ?", "/assets/images/monte.jpg", false),

("Les Huîtres Géantes", NULL, NULL, false),

("Autre direction", "Autre direction , Le Kraken :

Une fois monter à bord du navire, vous vous dirigez vers le centre du lac, 
et l'eau commence à s'agiter et change de couleur pour devenir d'un bleu électrique.
Le navire ralenti, un tourbillon se forme, et voici qu'apparaît des tentacules. Vous êtes aux prises avec un Kraken.
", "/assets/images/le_kraken.jpg", false),

("Les Naïades", "Après un combat acharné, ou vous sortez vainqueur, apparaît des Naïades, ces déesses aquatiques protectrices de leur milieu 
`Vous avez fait preuve de beaucoup de courage lors de votre périple Aventurier pour vous récompenser, voici une perle d'une grande rareté, prenez en soin, elle pourrait vous servir.`
Serait-ce de cette fameuse perle, dont j'avais ouï dire à la taverne, il y a de cela plusieurs lunes ?.", "/assets/images/la_perle.png", false);

CREATE TABLE lead_to (
  id int(11) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name varchar(255),
  chapter_start_id int,
  chapter_end_id int,
  action boolean
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
