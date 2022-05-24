      ******************************************************************
      * Author:
      * Date:
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
      *   RECORD KEY is XNAMA-VENDOR
      *   ACCESS DYNAMIC
      *   ORGANIZATION INDEXED.
          ORGANIZATION IS LINE SEQUENTIAL.
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
         05 PPN PIC 9(7).
         05 ONGKIR PIC 9(7).
         05 TIPS PIC 9(7).
         05 DRIVER PIC X(20).
         05 TOTAL-PENJUALAN PIC 9(7).
         05 TOTAL-PPN PIC 9(7).
         05 TOTAL-ONGKIR PIC 9(7).
         05 TOTAL-TIPS PIC 9(7).
       01 KONFIRMASI PIC X(1).
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
           DISPLAY "PENJUALAN"
           DISPLAY " "

           open EXTEND Index-file.
           PERFORM CREATE-DATA thru ACC-KONFIRMASI
                  UNTIL NAMA-VENDOR = "STOP"
           CLOSE Index-File.
       CREATE-DATA.
           DISPLAY "NAMA VENDOR : " NO ADVANCING
           ACCEPT NAMA-VENDOR.
       ACC-PENJUALAN.
           DISPLAY "HARGA PENJUALAN : " NO ADVANCING
           ACCEPT PENJUALAN.
      *    HITUNG PPN
           COMPUTE PPN = PENJUALAN * 0.11.
      *       HARGA SUDAH PPN
           COMPUTE PENJUALAN = PPN + PENJUALAN.
       ACC-ONGKIR.
           DISPLAY "HARGA ONGKIR : " NO ADVANCING
           ACCEPT ONGKIR.
       ACC-TIPS.
           DISPLAY "BERI TIPS : " NO ADVANCING
           ACCEPT TIPS.
       ACC-DRIVER.
           DISPLAY"NAMA DRIVER : " NO ADVANCING
           ACCEPT DRIVER.
       WRITE-REC.
           ADD PENJUALAN TO TOTAL-PENJUALAN
           ADD PPN TO TOTAL-PPN
           ADD TIPS TO TOTAL-TIPS
           ADD ONGKIR TO TOTAL-ONGKIR
           MOVE TBL-PENJUALAN TO INDEX-RECORD
              WRITE INDEX-RECORD.
       ACC-KONFIRMASI.
           DISPLAY "MASIH ADA INPUT? (Y/N) : " NO ADVANCING
           ACCEPT KONFIRMASI.
           IF KONFIRMASI = "Y" OR KONFIRMASI = "y"
                  GO TO CREATE-DATA
           ELSE
                  CLOSE INDEX-FILE

           DISPLAY TBL-PENJUALAN
           DISPLAY "TOTAL PENJUALAN : " TOTAL-PENJUALAN
           DISPLAY "TOTAL PPN : " TOTAL-PPN
           DISPLAY "TOTAL TIPS : " TOTAL-TIPS
           DISPLAY "TOTAL ONGKIR : " TOTAL-ONGKIR.


           STOP RUN.
      ** add other procedures here
       END PROGRAM TABEL-PENJUALAN.
