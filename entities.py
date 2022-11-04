from datetime import date
from datetime import datetime
from pony.orm import *


db = Database()
db.bind(provider='mysql', host='localhost', user='root', passwd='test', db='ecole')

class Classe(db.Entity):
    id = PrimaryKey(int, auto=True)
    numero = Required(str)
    courss = Set('Cours')


class Eleve(db.Entity):
    id = PrimaryKey(int, auto=True)
    nom = Required(str)
    prenom = Required(str)
    cursus = Required('Cursus')
    courss = Set('Cours')


class Cursus(db.Entity):
    id = PrimaryKey(int, auto=True)
    nom_cursus = Required(str)
    annee = Required(date)
    eleves = Set(Eleve)


class Professeur(db.Entity):
    id = PrimaryKey(int, auto=True)
    nom = Required(str)
    matieres = Set('Matiere')
    courss = Set('Cours')


class Matiere(db.Entity):
    id = PrimaryKey(int, auto=True)
    intitule = Required(str)
    professeurs = Set(Professeur)


class Cours(db.Entity):
    numero = PrimaryKey(int, auto=True)
    professeur = Required(Professeur)
    date = Required(datetime)
    eleves = Set(Eleve)
    classe = Required(Classe)



db.generate_mapping()
