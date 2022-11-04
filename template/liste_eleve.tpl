<a href="/"><- Retour</a>

<h1>Liste des élèves : </h1>
<ul>
    % for e in eleves:
        <li><a href="/eleve/nom/{{ e.nom }}">{{ e.nom }} {{ e.prenom }}</a></li>
    % end
</ul>