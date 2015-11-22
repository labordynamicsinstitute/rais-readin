/*
import_RAIS_template.sas
Ian M. Schmutte

DESCRIPTION: Example of a file to read in raw RAIS data
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


%import_RAIS_macro(statelist=AC,year=2014);
%import_RAIS_macro(statelist=AC SP,year=2014);

