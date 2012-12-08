contest-7billionandme
=====================

Challenge : How many people will have the earth the dd/mm/yyyy at hh:mm based on the site 7Billion&Me website

* Use nodejs, express-node, ...
* http://localhost:8000 display the index.html page + a datepicker
* Every x seconds retrieves the population on http://www.7billionandme.org/services/population.php
* Compute the world population for the selected date  :
 - population (p1) at intial timestamp (t1)
 - population (p2) at current timestamp (t2)
 - population growth (g) --> (p2 - p1) / (t2 - t1) 
 - population for the asked date --> p1 + (pg * (t3-t1))

Fun links :

* https://www.google.be/publicdata/explore?ds=d5bncppjof8f9_&ctype=l&strail=false&bcs=d&nselm=h&met_y=sp_pop_grow&scale_y=lin&ind_y=false&rdim=region&ifdim=region&tdim=true&tstart=-286074000000&tend=1323298800000&hl=fr&dl=fr&ind=false&icfg
