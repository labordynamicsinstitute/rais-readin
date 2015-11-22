/*
import_RAIS.sas
Ian M. Schmutte

DESCRIPTION: File to read in raw RAIS data
*/

******************************
**Macro variable example
******************************;
/*data paths*/
%let trunk = /ssgprojects/project0002/RAIS/data;
%include "import_RAIS_macro.sas";


******************************
**Options
******************************;
options obs=max fullstimer symbolgen mprint LRECL=600;


%import_RAIS_macro(statelist= RS SC PR RJ MG ES BA SE AL PE PB RN CE MA PI TO PA AP AM RR RO MT MS GO DF AC SP ,year=2014);


