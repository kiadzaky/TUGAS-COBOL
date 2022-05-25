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
       01 L-SALES PIC 9(7).
       01 L-CALCULATED-PPN PIC 9(7).
       01 L-HARGA-JUAL PIC 9(7).
       01 L-MODAL PIC 9(7).

      *-----------------------
       PROCEDURE DIVISION USING L-SALES, L-CALCULATED-PPN,
              L-HARGA-JUAL, L-MODAL.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
           COMPUTE HARGA-JUAL = L-SALES * 1.11
           MOVE HARGA-JUAL TO L-HARGA-JUAL

           COMPUTE MODAL = L-SALES / 1.11
           MOVE MODAL TO L-MODAL

           COMPUTE RETURN-VALUE = L-SALES - MODAL
           MOVE RETURN-VALUE TO L-CALCULATED-PPN

           GOBACK.
