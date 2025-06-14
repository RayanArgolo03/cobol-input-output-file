      *****************************************************************
      *            AUTHOR = Rayan                                     *
      *****************************************************************
       IDENTIFICATION DIVISION.
      *****************************************************************
       PROGRAM-ID. NEW-PROGRAM.
       AUTHOR. Rayan Argolo.
      *****************************************************************
       ENVIRONMENT DIVISION.
      *****************************************************************
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *****************************************************************
       DATA DIVISION.
      *****************************************************************
       WORKING-STORAGE SECTION.
      *****************************************************************
       01 PESSOA.
           03 PRIMEIRO-NOME PIC X(10) VALUE SPACES.  
           03 DATA-NASCIMENTO.
               05 DIA PIC 9(02) VALUE ZEROS.    
               05 MES PIC 9(02) VALUE ZEROS.    
               05 ANO PIC 9(04) VALUE ZEROS.    
           03 SALARIO-NUMERICO PIC 9(06)V99 VALUE ZEROS.
           03 SALARIO-FORMATADO PIC $ZZZZ,99 VALUE ZEROS.
           03 SEXO PIC X(01).
               88 MASCULINO VALUE 'M'.
               88 FEMININO VALUE 'F'.
           03 GENERO PIC X(10) VALUE SPACES.
      *****************************************************************
       PROCEDURE DIVISION.
      *****************************************************************
           PERFORM 001-RECEBER-VALORES. 
           PERFORM 002-DEFINIR-GENERO.     
           PERFORM 003-IMPRIMIR-VALORES.
           STOP RUN.
      *****************************************************************
       001-RECEBER-VALORES SECTION.
           DISPLAY 'First name: '.
           ACCEPT PRIMEIRO-NOME FROM CONSOLE.
           DISPLAY 'Birth date: '.
           ACCEPT DATA-NASCIMENTO FROM CONSOLE.
           DISPLAY 'Salary: '.
           ACCEPT SALARIO-NUMERICO FROM CONSOLE.
           MOVE SALARIO-NUMERICO TO SALARIO-FORMATADO.
           DISPLAY 'Sex: (M for male F for female)'
           ACCEPT SEXO FROM CONSOLE.
      *****************************************************************
       002-DEFINIR-GENERO SECTION.
           IF MASCULINO MOVE 'Male' TO GENERO
           ELSE MOVE 'Female' TO GENERO
           END-IF.
      *****************************************************************
       003-IMPRIMIR-VALORES SECTION.
           DISPLAY 
               'Person: ' PRIMEIRO-NOME ' - ' 
               GENERO ' - '
               DIA '/' MES '/' ANO  ' - '
               SALARIO-FORMATADO.
           
                 

