       IDENTIFICATION          DIVISION.
       PROGRAM-ID. FIRSTPROGRAM.
       
       DATA                    DIVISION.
       WORKING-STORAGE         SECTION.
           01 USER.
               05  USERNAME    PIC A(5).
               05  AGE    PIC 9(2).

       PROCEDURE               DIVISION.
           DISPLAY "ENTER WITH YOU USERNAME (5 CHARACTERS):".
           ACCEPT USERNAME.
           DISPLAY "ENTER WITH YOU AGE (ONLY POSITIVE NUMBER):".
           ACCEPT AGE.
           DISPLAY "USER: " USERNAME. 
           DISPLAY "AGE: " AGE. 
           STOP RUN.                                                            