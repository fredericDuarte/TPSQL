select SOCIETE, PAYS 
from clients
where VILLE = "Toulouse";

select NOM, PRENOM, FONCTION 
from employes
where REND_COMPTE like "2";

select NOM, PRENOM, FONCTION 
from employes
where FONCTION not like "Représentant(e)";

select NOM, PRENOM, FONCTION 
from employes
where SALAIRE < 3500;

SELECT SOCIETE, VILLE , PAYS , FAX
FROM clients
WHERE FAX is null;

select NOM, PRENOM, FONCTION 
from employes
where REND_COMPTE is null;

