%macro import_RAIS_macro(statelist=,year=);
  /*count number of states and iterate over them*/
  %do s = 1 %to %sysfunc(countw(&statelist));
    %let state = %scan(&statelist,&s); /*picks state from the list*/
      options VALIDVARNAME=ANY;
 LIBNAME CLEAN      "&trunk./clean/RAIS/&year.";

   data CLEAN.&state.&year.;
   infile "&trunk./clean/RAIS/&year./&state.&year..txt"  delimiter = ';' MISSOVER DSD lrecl=32767 
   informat "Bairros SP"N $4. ;
   informat "Bairros Fortaleza"N $4. ;
   informat "Bairros RJ"N $4. ;
   informat "Causa Afastamento 1"N best32. ;
   informat "Causa Afastamento 2"N best32. ;
   informat "Causa Afastamento 3"N best32. ;
   informat "Motivo Desligamento"N best32. ;
   informat "CBO Ocupa��o 2002"N best32. ;
   informat "CNAE 2.0 Classe"N best32. ;
   informat "CNAE 95 Classe"N best32. ;
   informat "Distritos SP"N $9. ;
   informat "V�nculo Ativo 31/12"N best32. ;
   informat "Faixa Et�ria"N best32. ;
   informat "Faixa Hora Contrat"N best32. ;
   informat "Faixa Remun Dezem (SM)"N best32. ;
   informat "Faixa Remun M�dia (SM)"N best32. ;
   informat "Faixa Tempo Emprego"N best32. ;
   informat "Escolaridade ap�s 2005"N best32. ;
   informat "Qtd Hora Contr"N best32. ;
   informat Idade best32. ;
   informat "Ind CEI Vinculado"N best32. ;
   informat "Ind Simples"N best32. ;
   informat "M�s Admiss�o"N best32. ;
   informat "M�s Desligamento"N best32. ;
   informat "Mun Trab"N best32. ;
   informat "Munic�pio"N best32. ;
   informat Nacionalidade best32. ;
   informat "Natureza Jur�dica"N best32. ;
   informat "Ind Portador Defic"N best32. ;
   informat "Qtd Dias Afastamento"N best32. ;
   informat "Ra�a Cor"N best32. ;
   informat "Regi�es Adm DF"N best32. ;
   informat "Vl Remun Dezembro Nom"N comma32. ;
   informat "Vl Remun Dezembro (SM)"N comma32. ;
   informat "Vl Remun M�dia Nom"N comma32. ;
   informat "Vl Remun M�dia (SM)"N comma32. ;
   informat "CNAE 2.0 Subclasse"N best32. ;
   informat "Sexo Trabalhador"N best32. ;
   informat "Tamanho Estabelecimento"N best32. ;
   informat "Tempo Emprego"N comma32. ;
   informat "Tipo Admiss�o"N best32. ;
   informat "Tipo Estab"N best32. ;
   informat "Tipo Estab"N $4. ;
   informat "Tipo Defic"N best32. ;
   informat "Tipo V�nculo"N best32. ;
 
   input "Bairros SP"N $ 
    "Bairros Fortaleza"N $ 
    "Bairros RJ"N $ 
    "Causa Afastamento 1"N 
    "Causa Afastamento 2"N 
    "Causa Afastamento 3"N 
    "Motivo Desligamento"N 
    "CBO Ocupa��o 2002"N 
    "CNAE 2.0 Classe"N 
    "CNAE 95 Classe"N 
    "Distritos SP"N $ 
    "V�nculo Ativo 31/12"N 
    "Faixa Et�ria"N 
    "Faixa Hora Contrat"N 
    "Faixa Remun Dezem (SM)"N 
    "Faixa Remun M�dia (SM)"N 
    "Faixa Tempo Emprego"N 
    "Escolaridade ap�s 2005"N 
    "Qtd Hora Contr"N 
    Idade 
    "Ind CEI Vinculado"N 
    "Ind Simples"N 
    "M�s Admiss�o"N 
    "M�s Desligamento"N 
    "Mun Trab"N 
    "Munic�pio"N 
    Nacionalidade 
    "Natureza Jur�dica"N 
    "Ind Portador Defic"N 
    "Qtd Dias Afastamento"N 
    "Ra�a Cor"N 
    "Regi�es Adm DF"N 
    "Vl Remun Dezembro Nom"N 
    "Vl Remun Dezembro (SM)"N 
    "Vl Remun M�dia Nom"N 
    "Vl Remun M�dia (SM)"N 
    "CNAE 2.0 Subclasse"N 
    "Sexo Trabalhador"N 
    "Tamanho Estabelecimento"N 
    "Tempo Emprego"N 
    "Tipo Admiss�o"N 
    "Tipo Estab"N 
    "Tipo Estab"N $ 
    "Tipo Defic"N 
    "Tipo V�nculo"N ;
   if _ERROR_ then call symputx('_EFIERR_',1);
   run;
    ;
   proc contents data=CLEAN.&state.&year.;
   run;
   proc print data=CLEAN.&state.&year.(obs=10);
   run;
   proc means data=CLEAN.&state.&year.;
   var _numeric_;
   run;
%end; /* end loop */
%mend;
