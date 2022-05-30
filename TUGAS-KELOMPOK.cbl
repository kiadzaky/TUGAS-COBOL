      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. TUGAS-KELOMPOK.
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       CONFIGURATION SECTION.
      *-----------------------
       INPUT-OUTPUT SECTION.
      *-----------------------
       FILE-CONTROL.
         SELECT PENJUALAN-File
             ASSIGN TO
             "C:\MAYBANK\COBOL\GNU PROJECT\data\FOOD-DELIVERY.dat"
          ORGANIZATION IS LINE SEQUENTIAL
          FILE STATUS FSTAT
          ACCESS MODE IS SEQUENTIAL.
      *------------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
       FD PENJUALAN-File.
       01 PENJUALAN-Record.
         05 XNAMA-VENDOR PIC X(20).
         05 XPENJUALAN PIC 9(7).
         05 XONGKIR PIC 9(7).
         05 XTIPS PIC 9(7).
         05 XDRIVER PIC X(20).
       01 SPASI-RECORD PIC X(10).
      *-----------------------
       WORKING-STORAGE SECTION.
       01 FSTAT PIC 99.
       01 WS-COMMAND PIC XX.
       01 TBL-PENJUALAN.
         05 NAMA-VENDOR PIC X(20).
         05 PENJUALAN PIC 9(7).
         05 ONGKIR PIC 9(7).
         05 TIPS PIC 9(7).
         05 DRIVER PIC X(20).
       01 WS-SPASI PIC XX VALUE SPACE.
       01 WS-EOF PIC X.
       01 WS-CALCULATED-PPN PIC 9(7).
       01 WS-TOTAL-PENJUALAN PIC 9(7).
       01 WS-TOTAL-ONGKIR PIC 9(7).
       01 WS-TOTAL-TIPS PIC 9(7).
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
      **
      * The main procedure of the program
      **
       CHECK-IF-FILE-EXIST.
           OPEN INPUT PENJUALAN-File.
           IF FSTAT = "35"
             DISPLAY "FILE NOT EXIST"
             CLOSE PENJUALAN-File
             OPEN OUTPUT PENJUALAN-File
             DISPLAY "FILE CREATED"
             CLOSE PENJUALAN-File
           ELSE
             DISPLAY "File sudah ada"
           END-IF
           CLOSE PENJUALAN-File.

       PROCEDURE-START.
              DISPLAY "CREATE (C) / READ (R) / ANYTPE QUIT ?"
                     NO ADVANCING
              ACCEPT WS-COMMAND
              IF WS-COMMAND = "C" OR WS-COMMAND = "c"
                     PERFORM CREATE-DATA
              END-IF.
              IF WS-COMMAND = "R" OR WS-COMMAND = "r"
                     PERFORM READ-DATA
              ELSE
                     STOP RUN
              END-IF.

           STOP RUN.
      ** add other procedures here

       READ-DATA.
              OPEN INPUT PENJUALAN-File.
              DISPLAY "MENAMPILKAN DATA"
              DISPLAY " "
              DISPLAY "NAMA VENDOR         " NO ADVANCING
              DISPLAY "PENJUALAN    " NO ADVANCING
              DISPLAY "ONGKIR        "NO ADVANCING
              DISPLAY "TIPS      "NO ADVANCING
              DISPLAY "DRIVER             " NO ADVANCING
              DISPLAY "RETURN VALUE   "
              DISPLAY "-----------------------------------------------",
              "----------------------------------------------"
              PERFORM UNTIL WS-EOF = "Y"
                    READ PENJUALAN-File NEXT
                      AT END
                         MOVE "Y" TO WS-EOF
                      NOT AT END
                      MOVE PENJUALAN-Record TO TBL-PENJUALAN
                     CALL "SUB-TUGAS-KELOMPOK"
                            USING PENJUALAN, WS-CALCULATED-PPN

                            ADD PENJUALAN TO WS-TOTAL-PENJUALAN
                            ADD ONGKIR TO WS-TOTAL-ONGKIR
                            ADD TIPS TO WS-TOTAL-TIPS

                            DISPLAY NAMA-VENDOR NO ADVANCING
                            DISPLAY PENJUALAN, "     " NO ADVANCING
                            DISPLAY ONGKIR, "     " NO ADVANCING
                            DISPLAY TIPS, "     " NO ADVANCING
                            DISPLAY DRIVER, "     " NO ADVANCING
                            DISPLAY WS-CALCULATED-PPN
              DISPLAY "-----------------------------------------------",
              "----------------------------------------------"
                     CANCEL "SUB-TUGAS-KELOMPOK"
                    END-READ
              END-PERFORM
              DISPLAY "TOTAL PENJUALAN : "WS-TOTAL-PENJUALAN
              DISPLAY "TOTAL ONGKIR : "WS-TOTAL-ONGKIR
              DISPLAY "TOTAL TIPS : "WS-TOTAL-TIPS
              CLOSE PENJUALAN-File
              GO PROCEDURE-START
              .

       CREATE-DATA.
              DISPLAY "INPUT DATA"
              DISPLAY " "
              DISPLAY "NAMA VENDOR : "  NO ADVANCING
              ACCEPT NAMA-VENDOR
              DISPLAY "PENJUALAN : " NO ADVANCING
              ACCEPT PENJUALAN
              DISPLAY "ONGKIR : " NO ADVANCING
              ACCEPT ONGKIR
              DISPLAY "TIPS : " NO ADVANCING
              ACCEPT TIPS
              DISPLAY "NAMA DRIVER : " NO ADVANCING
              ACCEPT DRIVER

              PERFORM WRITE-DATA
           .
       KONFIRMASI-KELANJUTAN.
              DISPLAY "APAKAH LANJUT UNTUK INPUT DATA? (Y/N)"
                     NO ADVANCING
              ACCEPT WS-COMMAND
              IF WS-COMMAND = "Y"
                     GO CREATE-DATA
              ELSE
                     GO PROCEDURE-START
              END-IF.
           .
       WRITE-DATA.
              OPEN EXTEND PENJUALAN-File.
              WRITE PENJUALAN-Record FROM TBL-PENJUALAN.
              CLOSE PENJUALAN-File.
              GO KONFIRMASI-KELANJUTAN
           .
       END PROGRAM TUGAS-KELOMPOK.
