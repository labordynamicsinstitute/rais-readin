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



******************************
**Options
******************************;
options obs=max fullstimer symbolgen mprint LRECL=600;

/*Below is a macro that reads the number of space-delimited words in a macro variable and stores the number as another new macro variable*/
%macro listcount(list,letter);
        %global &letter.;
        %let c=1;
                %do %until (%bquote(%scan(&list,&c))=);
                %let c=%eval(&c+1);
        %end;
        %let &letter.=%eval(&c-1);
%mend listcount;



%macro read_raw;
  /*count number of states and iterate over them*/
  %listcount(&statelist,numstate);
  %do s = 1 %to &numstate;
    %let state = %scan(&statelist,&s); /*picks state from the list*/
      proc import datafile="&trunk./clean/RAIS/&year./&state.&year..txt"          OUT=CLEAN.&state.&year. DBMS=dlm replace;
        delimiter=';';
      run;

      proc contents data=CLEAN.&state.&year.;
      run;

      proc print data=CLEAN.&state.&year.(obs=10);
      run;

      proc means data=CLEAN.&state.&year.;
        var _numeric_;
      run;

   %end;
%mend;

%let year = 2014;
%let statelist = AC AL AM AP CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO;
LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";
%read_raw;


%let year = 2013;
%let statelist = AC AL AM AP CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO;
LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";
%read_raw;

%let year = 2012;
%let statelist = AC AL AM AP CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO;
LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";
%read_raw;

%let year = 2011;
%let statelist = AC AL AM AP CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO;
LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";
%read_raw;

%let year = 2010;
%let statelist = AC AL AM AP CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO;
LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";
%read_raw;

%let year = 2009;
%let statelist = AC AL AM AP CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO;
LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";
%read_raw;

%let year = 2008;
%let statelist = AC AL AM AP CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO;
LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";
%read_raw;

%let year = 2007;
%let statelist = AC AL AM AP CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO;
LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";
%read_raw;

%let year = 2006;
%let statelist = AC AL AM AP CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO;
LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";
%read_raw;

%let year = 2005;
%let statelist = AC AL AM AP CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO;
LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";
%read_raw;

%let year = 2004;
%let statelist = AC AL AM AP CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO;
LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";
%read_raw;

%let year = 2003;
%let statelist = AC AL AM AP CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO;
LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";
%read_raw;

%let year = 2002;
%let statelist = AC AL AM AP CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO;
LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";
%read_raw;

%let year = 2001;
%let statelist = AC AL AM AP CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO;
LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";
%read_raw;

%let year = 2000;
%let statelist = AC AL AM AP CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO;
LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";
%read_raw;

%let year = 1999;
%let statelist = AC AL AM AP CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO;
LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";
%read_raw;

%let year = 1998;
%let statelist = AC AL AM AP CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO;
LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";
%read_raw;
