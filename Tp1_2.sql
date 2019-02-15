select NOM_PRODUIT, (PRIX_UNITAIRE * QUANTITE) as VALEUR_STOCK 
from produits
order by NOM_PRODUIT;

select NOM, PRENOM,  ( YEAR (CURDATE()) - YEAR(DATE_NAISSANCE)) as naissance,  ( YEAR (CURDATE()) - YEAR(DATE_EMBAUCHE)) as date_embauche
from employes;



select NOM ,  "gagne" as a_un , cast(SALAIRE as integer) * 12  as gain_annuel, "par an" as sur_12_mois  from employes;
