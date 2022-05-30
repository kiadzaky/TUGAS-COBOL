      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. SUB-TUGAS-KELOMPOK.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       WORKING-STORAGE SECTION.
      *----------------------
       LINKAGE SECTION.
       01 L-PENJUALAN PIC 9(7).
       01 CALCULATED-PPN PIC 9(7).
      *-----------------------
       PROCEDURE DIVISION USING L-PENJUALAN, CALCULATED-PPN.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
        *>   MOVE ZEROES TO CALCULATED-PPN
            COMPUTE CALCULATED-PPN = L-PENJUALAN - (L-PENJUALAN / 1.11)
            GOBACK.
      ** add other procedures here
       END PROGRAM SUB-TUGAS-KELOMPOK.
