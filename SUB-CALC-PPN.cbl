      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. SUB-CALC-PPN.
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       CONFIGURATION SECTION.
      *-----------------------
       INPUT-OUTPUT SECTION.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
      *-----------------------
       WORKING-STORAGE SECTION.

       LINKAGE SECTION.
       01 SALES PIC 9(7).
       01 CALCULATED-PPN PIC 9(7).
       01 MODAL PIC 9(7).
       01 HARGA-JUAL PIC 9(7).
       01 RETURN-VALUE PIC 9(7).
      *-----------------------
       PROCEDURE DIVISION USING SALES, CALCULATED-PPN.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
           COMPUTE HARGA-JUAL = SALES * 1.11
           COMPUTE MODAL = SALES / 1.11
           COMPUTE RETURN-VALUE = SALES - MODAL.
           GOBACK.
      ** add other procedures here
       END PROGRAM SUB-CALC-PPN.
