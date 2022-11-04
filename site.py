from bottle import route, run, template
from datetime import datetime
from pony import orm
from entities import *
from datetime import date

@db_session
def fill_db():
    # On remplie la database de données :
    # cursus
    cbtsSIO1 = Cursus(nom_cursus="BTS SIO 1",annee=date.today())
    cbtsSIO2 = Cursus(nom_cursus="BTS SIO 2",annee=date.today())    
    
    # classes
    cla0 = Classe(numero="A0")
    cla1 = Classe(numero="A1")
    clb0 = Classe(numero="B0")
    clb1 = Classe(numero="B1")

    # les eleves
    eleve1 = Eleve(prenom="Mohammed",nom="Walou",cursus=cbtsSIO1)
    eleve1 = Eleve(prenom="Jean",nom="Test",cursus=cbtsSIO2)
    
    # matieres
    prog = Matiere(intitule="Programmation")
    anglais = Matiere(intitule="Anglais")
    francais = Matiere(intitule="Francais")
    maths = Matiere(intitule="Maths")

    # les profs
    charlie = Professeur(nom="Bethmaure",matieres=[prog])
    anglish = Professeur(nom="AngLish",matieres=[anglais])
    furanssu = Professeur(nom="Furanssu",matieres=[francais])
    tham = Professeur(nom="Thams",matieres=[maths])

@route('/')
def index():
    return template('template/index')

@route('/eleve/liste')
@db_session
def eleve_list():
    elvs = select(p for p in Eleve).order_by(Eleve.nom)
    return template('template/liste_eleve', eleves=elvs)

@route('/eleve/nom/<elenom>')
@db_session
def ficher_eleve(elenom):
    e = Eleve.get(nom=elenom)
    if e != None:
        return template('template/fiche_eleve', eleve=e)
    else:
        return template('template/fiche_eleve', eleve=None)

@route('/setupdb')
def setup_db():
    fill_db()
    return 'OK'

run(host='localhost', port=80)
