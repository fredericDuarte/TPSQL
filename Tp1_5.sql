insert into  categories (CODE_CATEGORIE,NOM_CATEGORIE, DESCRIPTION) values ('9','fruits et légumes','tous les fuits et légumes');


insert into fournisseurs values ( '30', 'Grandma', '707 Oxford Rd.', 'Ann Arbor', '48104', 'Etats-Unis', '(313) 555-5735', '(313) 555-3349' );

update produits
set NO_FOURNISSEUR = '30'
where NO_FOURNISSEUR = '3';

delete from fournisseurs
where NO_FOURNISSEUR = '3';

/*   Créez une table pays avec 2 champs : code pays (4
caractères, clé primaire), nom pays (40 caractères
maximum)  */
create table Pays
(
  CODE CHAR(4) NOT NULL PRIMARY KEY,
  NOM CHAR(40) NOT NULL
);



/* Ajoutez une colonne courriel (75 caractères possibles) à la
table CLIENTS. Puis modifiez la pour passer à 60 caractères.
Pour finir, supprimez cette colonne. */
alter table clients
add courriel char(75);

alter table clients
modify courriel char(60);

alter table clients
drop courriel;


/* Créez une vue qui affiche le nom de la société, l’adresse, le
téléphone et la ville des clients qui habitent à Toulouse,
Strasbourg, Nantes ou Marseille. */
create view maVue
as select c.SOCIETE, c.ADRESSE, c.TELEPHONE, c.VILLE
from clients c
where c.VILLE in ( 'Toulouse','Strasbourg', 'Nantes','Marseille');

select * from maVue;


-- Afficher les commandes d'avant le 01/08/2017 qui ont une somme sup à 11000 et qui
-- contiennent des produits des fournisseurs français.(32 lignes)
select c.DATE_COMMANDE, sum(d.PRIX_UNITAIRE * d.QUANTITE)
from commandes c
join details_commandes d
on d.NO_COMMANDE = c.NO_COMMANDE	
join produits p
on p.REF_PRODUIT=d.REF_PRODUIT
join fournisseurs  f
on f.NO_FOURNISSEUR = p.NO_FOURNISSEUR
where c.DATE_COMMANDE < '2017-08-01' 
 and f.PAYS like 'France' 
group by  d.NO_COMMANDE
having sum(d.PRIX_UNITAIRE * d.QUANTITE) > 11000 ;

/*
 Afficher la liste des fournisseurs qui nous fournissent plus de 4 produits différents. (2
lignes) */

select f.SOCIETE, count(p.NO_FOURNISSEUR) as nombre
from produits p 
join fournisseurs f
on f.NO_FOURNISSEUR = p.NO_FOURNISSEUR
group by p.NO_FOURNISSEUR
having count(p.NO_FOURNISSEUR) > 4 ;


/*
 Afficher pour les clients brésiliens le montant total de commandes ainsi que le
pourcentage sur les ventes totales. (Afficher aussi les ventes totales) (1 ligne)

 1er commande =  10  * 1 = 10
 2eme commande =  5  * 2 = 10 
;
4*/-- concat( round( sum (d.PRIX_UNITAIRE * d.QUANTITE) * count(c.NO_COMMANDE) , "%") as Percent 

/*
select count(c.NO_COMMANDE) as Nombre , sum(d.PRIX_UNITAIRE * d.QUANTITE) as total,  cl.PAYS,
concat( round(  d.PRIX_UNITAIRE / vente.nbe * 100) , "%") as Percent 
from commandes c , 
(select sum(cde.PRIX_UNITAIRE * cde.QUANTITE) as nbe from details_commandes cde ) 
, clients ,cl on cl.CODE_CLIENT = c.CODE_CLIENT
inner join details_commandes d on 
where cl.PAYS like 'Brésil' and c.NO_COMMANDE = d.NO_COMMANDE
;
 */

/*
 Le nombre des commandes et la somme des frais de port pour chaque client et par
année et par mois. Il faut afficher uniquement les clients qui ont commandé plus de 3
fois dans le mois et dont leur frais de port dans le mois est supérieur à 1000€.(33
lignes)
 Tous les clients et les cumuls des quantités vendues pour les clients qui ont passé des
commandes. Afficher les enregistrements par ordre décroissant de cumul des
commandes. (89 lignes)
 Les localités des clients et le cumul des quantités vendues par localité. Afficher les
enregistrements par ordre décroissant de cumul des commandes. (69 lignes)

 Le nom, prénom, la fonction de tous les employés, la somme des frais de port et cumul
des ventes pour les employés qui ont passé des commandes. (9 lignes)
 Les sociétés clientes qui ont commandé le produit ‘Chai’ mais également qui ont
commandé plus de 25 produits. (14 lignes)



