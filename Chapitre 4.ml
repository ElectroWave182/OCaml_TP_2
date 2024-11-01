Exercice 1 :
------------

1)
fonction bool * bool -> bool

let et = fun

(a, b) ->
	a && b
;;

2)
fonction bool * bool -> bool

let ou = fun

(a, b) ->
	a || b
;;

3)
fonction bool * bool -> bool

let xou = fun

(a, b) ->
	not a && b || a && not b
;;


Exercice 2 :
------------

fonction int -> string

let entier = fun

0 ->
	"zero"

| 1 ->
	"un"

| n ->
	if n mod 2 = 0
	then "pair"
	else "impair"
;;

entier (0) ;; -> "zero"
entier (3) ;; -> "impair"


Exercice 3 :
------------

fonction float * float -> string

let point = fun

(0., 0.) ->
	"Origine"

| (_, 0.) ->
	"Axe des abscisses"

| (0., _) ->
	"Axe des ordonnées"

| (x, _) ->
	if x > 0
	then "Point du demi-plan x > 0"
	else "Point du demi-plan x < 0"
;;

point(0.,0.) ;; -> "Origine"
point(0.,3.) ;; -> "Axe des ordonnées"
point(2.,-3.) ;; -> "Point du demi-plan x > 0"


Exercice 4 :
------------

1)
fonction int * int * char -> int

let operation = fun

(a, b, `+`) ->
	a + b

| (a, b, `-`) ->
	a - b

| (a, b, `*`) ->
	a * b

| (a, 0, `/`) ->
	failwith "Division par zéro !"

| (a, b, `/`) ->
	a / b

| _ ->
	failwith "Ce n'est pas une opération connue..."
;;

operation (7, 3, `+`) ;; -> 10
operation (7, 3, `-`) ;; -> 4
operation (7, 0, `/`) ;; -> Erreur "division par zéro !"
operation (7, 0, `!`) ;; -> Erreur "Ce n'est pas une opération connue."


Exercice 5 :
------------

1)
fonction float * float -> float

let prixTTC = fun

(brut, taxe) ->
	brut *. (1. +. taxe /. 100.)
;;

prixTTC (200., 12.) ;; -> 224.

2)
fonction string -> float * float

let prix = fun

"pain" ->
	(1.05, 5.5)

| "conserve" ->
	(3.5, 7.)

| "disque" ->
	(12.3, 18.6)

| "bijou" ->
	(356., 33.)

| _ -> failwith "Article indisponible"
;;

3.1)
fonction float -> float

let arrDix = fun

x ->
	float_of_int (int_of_float (x *. 10.)) /. 10.
;;

3.2)
fonction string * int -> float

let sommeAPayer = fun

(nom, quantite) ->
	arrDix (prixTTC (prix (nom)) *. float_of_int (quantite))
;;

sommeAPayer ("pain", 3) ;; -> 3.3
sommeAPayer ("disque", 40) ;; -> 583.5
sommeAPayer ("bijou", 0) ;; -> 0.
sommeAPayer ("chaussure", 5) ;; -> Erreur "Article indisponible"


Exercice 6 :
------------

1)
fonction int * int * int * int -> int

let formule = fun

(j, m, p, s) ->
	j + (48 * m − 1) / 5 + p / 4 + p + s / 4 − 2 * s
;;

2)
fonction int -> int * int

let decoupe = fun

n ->
	(n / 100, n mod 100)
;;

decoupe (2014) ;; -> 20, 14
decoupe (0) ;; -> 0, 0

3)
fonction int * int -> int * int

let deuxMoisAvant = fun

(1, annee) ->
	(11, annee - 1)

| (2, annee) ->
	(12, annee - 1)

| (mois, annee) ->
	(mois - 2, annee)
;;

deuxMoisAvant (2, 2014) ;; -> 12, 2013
deuxMoisAvant (7, 2022) ;; -> 5, 2022

4)
fonction int -> string

let leJour = fun

0 ->
	"Dimanche"

| 1 ->
	"Lundi"

| 2 ->
	"Mardi"

| 3 ->
	"Mercredi"

| 4 ->
	"Jeudi"

| 5 ->
	"Vendredi"

| 6 ->
	"Samedi"
;;

leJour (2) ;; -> "Mardi"

5)
fonction int -> int

let modulo7 = fun

entier ->
    let reste = entier mod 7 in
        if entier < 0
        then reste + 7
        else reste
;;

modulo7 (20) ;; -> 6
modulo7 (-4) ;; -> 3

6)
fonction int * int * int -> string

let quelJour = fun
(jour, mois, annee) ->
    let (mois, annee) = deuxMoisAvant (mois, annee) in
        let (s, p) = decoupe (annee) in
            let k = formule (jour, mois, p, s) in
                leJour (modulo7 (k))
;;

quelJour (14, 7, 1789) ;; -> "Mardi"
quelJour (21, 9, 2022) ;; -> "Mercredi"
