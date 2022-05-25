      ******************************************************************
      * Author: KIA, JEREMY, FEBRY
      * Date: 24 MAY 2022
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. TABEL-PENJUALAN.
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       CONFIGURATION SECTION.
      *-----------------------
       INPUT-OUTPUT SECTION.
      *-----------------------
      *-----------------------
       FILE-CONTROL.
         SELECT Index-File
             ASSIGN TO "C:\MAYBANK\COBOL\GNU PROJECT\data\PENJUALAN.dat"
          ORGANIZATION IS LINE SEQUENTIAL
          ACCESS MODE IS SEQUENTIAL.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
       FD Index-File.
       01 Index-Record.
         05 XNAMA-VENDOR PIC X(20).
         05 XPENJUALAN PIC 9(7).
         05 XONGKIR PIC 9(7).
         05 XTIPS PIC 9(7).
         05 XDRIVER PIC X(20).
      *-----------------------
       WORKING-STORAGE SECTION.
       01 TBL-PENJUALAN.
         05 NAMA-VENDOR PIC X(20).
         05 PENJUALAN PIC 9(7).
         05 ONGKIR PIC 9(7).
         05 TIPS PIC 9(7).
         05 DRIVER PIC X(20).

         05 CALCULATED-PPN PIC 9(7).
         05 HARGA-JUAL PIC 9(7).
         05 MODAL PIC 9(7).

         05 TOTAL-PENJUALAN PIC 9(7).
         05 TOTAL-ONGKIR PIC 9(7).
         05 TOTAL-TIPS PIC 9(7).
         05 TOTAL-HARGA-JUAL PIC 9(7).
         05 TOTAL-MODAL PIC 9(7).
         05 TOTAL-RETURN-VALUE PIC 9(7).
       01 KONFIRMASI PIC X(1).
       01 INPUT-ANGKA PIC 9(1).
       01 WS-EOF PIC X VALUE "N".
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
           DISPLAY "PENJUALAN"
           DISPLAY " "
           DISPLAY "KETIK 1. UNTUK CREATE DATA"
           DISPLAY "KETIK 2. UNTUK READ DATA"
           ACCEPT INPUT-ANGKA

           IF INPUT-ANGKA = 1
                  PERFORM CREATE-DATA
           END-IF.

           IF INPUT-ANGKA = 2
                  PERFORM READ-INDEX-FILE
           ELSE
                 GO TO END-PROGRAM
           END-IF.

       CREATE-DATA.
           DISPLAY "NAMA VENDOR : " NO ADVANCING
           ACCEPT NAMA-VENDOR
           DISPLAY "HARGA PENJUALAN : " NO ADVANCING
           ACCEPT PENJUALAN
           DISPLAY "HARGA ONGKIR : " NO ADVANCING
           ACCEPT ONGKIR
           DISPLAY "BERI TIPS : " NO ADVANCING
           ACCEPT TIPS
           DISPLAY"NAMA DRIVER : " NO ADVANCING
           ACCEPT DRIVER

           ADD PENJUALAN TO TOTAL-PENJUALAN
           ADD TIPS TO TOTAL-TIPS
           ADD ONGKIR TO TOTAL-ONGKIR

           OPEN EXTEND Index-file

           MOVE TBL-PENJUALAN TO INDEX-RECORD
           WRITE INDEX-RECORD

           CLOSE Index-File

           GO TO ACC-KONFIRMASI.

       ACC-KONFIRMASI.
           DISPLAY "MASIH ADA INPUT? (Y/N) : " NO ADVANCING
           ACCEPT KONFIRMASI
           IF KONFIRMASI = "Y" OR KONFIRMASI = "y"
                  GO TO MAIN-PROCEDURE
           ELSE
                  DISPLAY "TOTAL PENJUALAN : " TOTAL-PENJUALAN
                  DISPLAY "TOTAL TIPS : " TOTAL-TIPS
                  DISPLAY "TOTAL ONGKIR : " TOTAL-ONGKIR
                  GO TO END-PROGRAM
           END-IF.

       PROC-READ.
           OPEN INPUT Index-file.
           READ Index-file
              AT END MOVE "Y" TO WS-EOF.
           PERFORM DISPLAY-DATA UNTIL WS-EOF EQUAL TO "Y".
           CLOSE Index-file.

       read-index-file.
           open INPUT index-file.
           perform until ws-eof = "Y"
             read index-file next
               at end
                  move "Y" to ws-EOF
                  go ACC-KONFIRMASI
               not at end
      *           display ws-eof no advancing
      *           display " : " no advancing
      *           display index-record
                 MOVE INDEX-RECORD TO TBL-PENJUALAN
                 DISPLAY PENJUALAN
             end-read
           end-perform.
       DISPLAY-DATA.
           IF WS-EOF EQUAL "N"
                  MOVE INDEX-RECORD TO TBL-PENJUALAN
                  DISPLAY INDEX-RECORD
                  CALL "SUB-CALC-PPN"
                  USING PENJUALAN, CALCULATED-PPN, HARGA-JUAL, MODAL
                  CANCEL "SUB-CALC-PPN"
                  ADD HARGA-JUAL TO TOTAL-HARGA-JUAL
                  ADD CALCULATED-PPN TO TOTAL-RETURN-VALUE
                  ADD MODAL TO TOTAL-MODAL
                  DISPLAY "TOTAL SELURUH PENJUALAN : " TOTAL-PENJUALAN
                  DISPLAY "TOTAL SELURUH TIPS : " TOTAL-TIPS
                  DISPLAY "TOTAL SELURUH ONGKIR : " TOTAL-ONGKIR
                  DISPLAY "TOTAL SELURUH HARGA-JUAL : " TOTAL-HARGA-JUAL
                  DISPLAY "TOTAL SELURUH CALCULATED-PPN : "
                                CALCULATED-PPN
                  DISPLAY "TOTAL SELURUH MODAL : " TOTAL-MODAL
           END-IF.
           READ INDEX-FILE
              AT END MOVE "Y" TO WS-EOF.

       END-PROGRAM.
              CLOSE INDEX-FILE
              STOP RUN.
      ** add other procedures here
       END PROGRAM TABEL-PENJUALAN.
