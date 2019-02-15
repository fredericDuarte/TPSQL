select NOM, PRENOM, FONCTION 
from employes
order by NOM desc;

SELECT SOCIETE, VILLE , PAYS 
FROM clients
order by PAYS;

SELECT SOCIETE, VILLE , PAYS 
FROM clients
order by PAYS,VILLE;