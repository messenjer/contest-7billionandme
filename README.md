contest-7billionandme
=====================

Challenge : How many people will have the earth the dd/mm/yyyy at hh:mm based on the site 7Billion&Me website

* http://localhost:8000 Affiche une page html avec un datepicker
* Toutes les x secondes cette page va rechercher la population sur http://www.7billionandme.org/services/population.php
* On calcule la population modiale pour la date sélectionnée :
 - population (p1) au timestamp initial (t1)
 - population (p2) au timestamp actuel (t2)
 - croissance de la population (c1) --> (p2 - p1) / (t2 - t1) 
 - population (p3) pour la date donnée (t3) --> p1 + (c1 * (t3-t1))

Average exponential rate of growth of the population over a given period.  It is calculated as ln(Pt/P0)/t where t is the length of the period. It is expressed as a percentage.

Fun links :

* https://www.google.be/publicdata/explore?ds=d5bncppjof8f9_&ctype=l&strail=false&bcs=d&nselm=h&met_y=sp_pop_grow&scale_y=lin&ind_y=false&rdim=region&ifdim=region&tdim=true&tstart=-286074000000&tend=1323298800000&hl=fr&dl=fr&ind=false&icfg

