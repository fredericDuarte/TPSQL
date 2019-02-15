select NOM, PRENOM, FONCTION 
from employes
order by NOM desc;

SELECT SOCIETE, VILLE , PAYS 
FROM clients
order by PAYS;

SELECT SOCIETE, VILLE , PAYS 
FROM clients
order by PAYS,VILLE;

select NOM, PRENOM, SALAIRE
from employes
where SALAIRE between 2500 and 3500; 

select p.NOM_PRODUIT, f.SOCIETE, p.QUANTITE,p.CODE_CATEGORIE
from produits p
natural join fournisseurs f
where p.CODE_CATEGORIE NOT IN (1,3,5,7);

select p.NOM_PRODUIT, f.SOCIETE, p.QUANTITE,p.CODE_CATEGORIE,p.NO_FOURNISSEUR
from produits p
natural join fournisseurs f
natural join categories c
where ( ( f.NO_FOURNISSEUR between 1 and 3 ) or (c.CODE_CATEGORIE between 1 and 3 ))
and ( p.QUANTITE like '% boîtes%' or p.QUANTITE like '%cartons%');

select e.NOM, cl.PAYS, cl.CODE_CLIENT
from commandes c
inner join employes e
on c.NO_EMPLOYE = e.NO_EMPLOYE
inner join clients cl
on c.CODE_CLIENT = cl.CODE_CLIENT
where cl.VILLE like "Paris";

select p.NOM_PRODUIT, f.SOCIETE, c.CODE_CATEGORIE
from produits p
inner join fournisseurs f
on f.NO_FOURNISSEUR = p.NO_FOURNISSEUR
right outer join categories c
on c.CODE_CATEGORIE = p.CODE_CATEGORIE 
where c.CODE_CATEGORIE in (1,4,7);

select e.NOM , ( select j.NOM from employes j where e.REND_COMPTE = j.NO_EMPLOYE  ) as superieur
from employes e;
/* ou alternative  */
select e.NOM,  j.NOM as superieur
from employes e, employes j 
where e.REND_COMPTE = j.NO_EMPLOYE;

select sum(e.SALAIRE ) as Salaire , sum(e.COMMISSION) as Commision
from employes e ;

select format( avg(e.SALAIRE ),2) as Salaire , format(avg(e.COMMISSION),2) as Commision
from employes e ;

select max(e.SALAIRE ) as Salaire , min(e.COMMISSION) as Commision
from employes e ;

select sum(e.SALAIRE), e.FONCTION
from employes e 
group by e.FONCTION;

select d.NO_COMMANDE, count(d.REF_PRODUIT) as Reference_Produit
from details_commandes d
group by d.NO_COMMANDE
having count(d.REF_PRODUIT) > 5;

select p.NO_FOURNISSEUR, ifnull( sum(p.UNITES_STOCK),0 ) as Prix_Stock , ifnull( sum(p.UNITES_COMMANDEES), 0 ) as Prix_Commandé
from produits p
where p.NO_FOURNISSEUR between 3 and 6 
group by  p.NO_FOURNISSEUR;

select  e.NOM,  e.PRENOM , count(c.NO_COMMANDE) as Commande
from employes e
join commandes c
on c.NO_EMPLOYE = e.NO_EMPLOYE
group by e.NOM
having count(c.NO_COMMANDE) > 100;

select f.SOCIETE,  count(d.NO_COMMANDE) as Commande
from clients f
inner join commandes d
on d.CODE_CLIENT = f.CODE_CLIENT
group by f.SOCIETE
having count(d.NO_COMMANDE) > 30;

select SOCIETE, ADRESSE, VILLE
from clients
union
select SOCIETE, ADRESSE, VILLE
from fournisseurs;

select d.NO_COMMANDE , p.NO_FOURNISSEUR
from details_commandes d
join produits p
on p.REF_PRODUIT = d.REF_PRODUIT
where p.CODE_CATEGORIE = 1
and  p.NO_FOURNISSEUR = 1
and
exists (

select de.NO_COMMANDE , pe.NO_FOURNISSEUR
from details_commandes de
inner join produits pe
on pe.REF_PRODUIT = de.REF_PRODUIT
where pe.CODE_CATEGORIE = 2 
and  pe.NO_FOURNISSEUR = 2
and d.NO_COMMANDE = de.NO_COMMANDE 


)












