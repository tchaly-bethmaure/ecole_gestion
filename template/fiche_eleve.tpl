<a href="/eleve/liste"><- Retour liste élèves</a>
% if eleve != None:
    <h1>{{ eleve.nom }}</h1>
    {{ eleve.prenom }}<br/>
    {{ eleve.cursus.nom_cursus}} ({{ eleve.cursus.annee}})<br/>
% else:
    Aucun élève trouvé.
% end