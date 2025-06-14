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
       77 OPERANDO-1 PIC S9(04) VALUE ZEROS.
       77 OPERANDO-2 PIC S9(04) VALUE ZEROS.
       77 RES-NUMERICO PIC S9(04) VALUE ZEROS.
       77 RES-FORMATADO PIC ZZZZ9 VALUE ZEROS.
       77 OPERADOR PIC X(01).
           88 ADICAO VALUE '+'.
           88 SUBTRACAO VALUE '-'.
           88 MULTIPLICACAO VALUE '*'.
           88 DIVISAO VALUE '/'.
      *****************************************************************
       PROCEDURE DIVISION.
      *****************************************************************
           PERFORM 001-RECEBER-VALORES.
           PERFORM 002-RECEBER-OPERACAO.
           PERFORM 003-CALCULAR. 
           PERFORM 004-IMPRIMIR-RESULTADO.
           STOP RUN.
      *****************************************************************
       001-RECEBER-VALORES SECTION.
           DISPLAY 'First number: '.
           ACCEPT OPERANDO-1 FROM CONSOLE.
           DISPLAY 'Second number: '.
           ACCEPT OPERANDO-2 FROM CONSOLE.
           DISPLAY '======== ======= ======='.
      *****************************************************************
       002-RECEBER-OPERACAO SECTION.
           DISPLAY 'Enter with operation: '
               ' "+" for sum, ' 
               ' "-"  for subtract, '
               ' "/" for divide or "*" for multiply'
           ACCEPT OPERADOR.
           DISPLAY '======== ======= ======='.
      *****************************************************************
       003-CALCULAR SECTION.
           EVALUATE TRUE
              WHEN ADICAO
                ADD OPERANDO-1, OPERANDO-2 GIVING RES-NUMERICO
              WHEN SUBTRACAO
                SUBTRACT OPERANDO-1 FROM OPERANDO-2 GIVING RES-NUMERICO
              WHEN MULTIPLICACAO
                MULTIPLY OPERANDO-1 BY OPERANDO-2 GIVING RES-NUMERICO
              WHEN DIVISAO
                DIVIDE OPERANDO-1 INTO OPERANDO-2 GIVING RES-NUMERICO
              WHEN OTHER
                DISPLAY 'Invalid operator, stopping the program...'
                STOP RUN
           END-EVALUATE.
           MOVE RES-NUMERICO TO RES-FORMATADO.
      *****************************************************************
       004-IMPRIMIR-RESULTADO SECTION.
           DISPLAY 'RESULT: ' RES-FORMATADO. 
                 

