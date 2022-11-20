proc import file="/home/u61557789/EmergencyMed/DrugDeath.xlsx"
    out=work.EM
    dbms=xlsx;
run;

data work.EM;
set work.EM;
if State = "Massachusetts" then States = "MA";
else DELETE;
run;

title "Overdose Over The Years";
proc sgplot data=work.em;
    series x=Year y=CrudeRate;
run;