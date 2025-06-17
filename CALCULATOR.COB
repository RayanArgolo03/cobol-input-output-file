       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG.
       AUTHOR. RAYAN ARGOLO
      ****************************************** 
       ENVIRONMENT DIVISION.
      ****************************************** 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO './CLIENTES.txt'
               ORGANIZATION IS SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS FS-CLIENTES.
           SELECT SAIDA ASSIGN TO './SAIDA.txt'
               ORGANIZATION IS SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS FS-CLIENTES.
      ****************************************** 
       DATA DIVISION.
      ****************************************** 
       FILE SECTION.
      ****************************************** 
       FD CLIENTES
           RECORDING IS F.
       01 CLIENTE.
           03 AGENCIA      PIC 9(04).
           03 NOME         PIC X(12).
      *        LAYOUT = 16 POSIÇÕES            *
       FD SAIDA
           RECORDING IS F.
       01 CLIENTE-SAIDA    PIC X(13).
      *        LAYOUT = 13 POSIÇÕES            *
      ****************************************** 
       WORKING-STORAGE SECTION.
       01 CNT-CLIENTES     PIC 9(02) USAGE COMP.
       01 FS-CLIENTES      PIC 9(02).
       01 FS-SAIDA-CLIENTES      PIC 9(02).
       01 EOF-CLIENTES     PIC X(01) VALUE 'N'.
      ****************************************** 
       PROCEDURE DIVISION.
            PERFORM 001-VALIDAR THRU 001-FIM.
            PERFORM 002-LER THRU 002-FIM.
            PERFORM 003-ENCERRAR THRU 004-FIM.
      ****************************************** 

       001-VALIDAR SECTION.
           DISPLAY 'EOF: ' EOF-CLIENTES.

           OPEN INPUT CLIENTES.
           OPEN OUTPUT SAIDA.

           IF FS-CLIENTES NOT EQUAL TO ZEROS
              OR FS-SAIDA-CLIENTES NOT EQUAL TO ZEROS
                 DISPLAY 'Erro ao abrir arquivo, código: ' FS-CLIENTES
                 PERFORM 003-ENCERRAR
                 GOBACK
           END-IF.

       001-FIM. 
           EXIT.
      ****************************************** 

       002-LER SECTION.
           PERFORM UNTIL EOF-CLIENTES EQUAL 'S'
               READ CLIENTES
                       AT END
                           MOVE 'S' TO EOF-CLIENTES
                       NOT AT END  
                           ADD 1 TO CNT-CLIENTES
                           PERFORM 003-ESCREVER
               END-READ
           END-PERFORM.

       002-FIM. 
           EXIT.
      ****************************************** 
       003-ESCREVER SECTION.
           STRING  
               NOME DELIMITED BY SIZE
               '+' DELIMITED BY SIZE
           INTO CLIENTE-SAIDA.

           WRITE CLIENTE-SAIDA.
           IF FS-SAIDA-CLIENTES NOT EQUAL ZEROS
               DISPLAY 'Writing error: ' FS-SAIDA-CLIENTES
               PERFORM 003-ENCERRAR
           END-IF.

       003-FIM.
           EXIT.
      ****************************************** 

       003-ENCERRAR SECTION.
           DISPLAY 'Registered customers: ' CNT-CLIENTES
           CLOSE CLIENTES.
           CLOSE SAIDA.
           STOP RUN.
       004-FIM. 
           EXIT.
      ****************************************** 
