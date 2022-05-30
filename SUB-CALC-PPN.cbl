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

       01 MODAL PIC 9(7).
       01 HARGA-JUAL PIC 9(7).
       01 RETURN-VALUE PIC 9(7).

       LINKAGE SECTION.
             01 L-SALES PIC s9(7).
             01  L-CALCULATED-PPN PIC s9(7) VALUE 0.
             01  L-HARGA-JUAL PIC s9(7).
             01  L-MODAL  PIC s9(7).

      *-----------------------
       PROCEDURE DIVISION USING L-SALES, L-CALCULATED-PPN.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
           DISPLAY L-SALES
           COMPUTE L-CALCULATED-PPN = L-SALES - 1
           GOBACK.
