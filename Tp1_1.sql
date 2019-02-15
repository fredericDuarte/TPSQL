select * from categories;
select a.NOM_PRODUIT, b.NOM_CATEGORIE  from produits a, categories b 
where b.CODE_CATEGORIE = a.CODE_CATEGORIE 
group by a.NOM_PRODUIT;
select NOM, PRENOM, DATE_NAISSANCE, ifnull(COMMISSION,0.00) as commission, FONCTION  from employes;
select FONCTION from employes group by FONCTION;
select PAYS from clients group by PAYS order by PAYS;
select a.VILLE from clients a, commandes b 
WHERE a.CODE_CLIENT = b.CODE_CLIENT 
group by VILLE; 
