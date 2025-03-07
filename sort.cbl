       IDENTIFICATION DIVISION.
       PROGRAM-ID. SORT-STUDENT-GRADES.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO 'INPUT.txt'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.txt'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT SORT-WORK ASSIGN TO 'SORT.txt'.

       DATA DIVISION.
       FILE SECTION.

       FD INPUT-FILE.
       01 INPUT-RECORD.
           05 STUDENT-LINE       PIC X(50).  *> Full line including tabs

       FD OUTPUT-FILE.
       01 OUTPUT-RECORD.
           05 OUT-STUDENT-NAME   PIC X(20).
           05 FILLER             PIC X(1) VALUE X'09'. *> Tab separator
           05 OUT-STUDENT-SURNAME PIC X(20).
           05 FILLER             PIC X(1) VALUE X'09'. *> Tab separator
           05 OUT-STUDENT-GRADE  PIC 9(3).

       SD SORT-WORK.
       01 SORT-RECORD.
           05 W-STUDENT-NAME     PIC X(20).
           05 W-STUDENT-SURNAME  PIC X(20).
           05 W-STUDENT-GRADE    PIC 9(3).

       WORKING-STORAGE SECTION.
       01 EOF-FLAG              PIC X VALUE 'N'.
           88 EOF               VALUE 'Y'.
           88 NOT-EOF           VALUE 'N'.

       01 WS-TEMP-STUDENT-NAME      PIC X(20).
       01 WS-TEMP-STUDENT-SURNAME   PIC X(20).
       01 WS-TEMP-STUDENT-GRADE     PIC 9(3).  *> Changed from X(2) to 9(2)

       PROCEDURE DIVISION.

       SORT-PROCEDURE.
           DISPLAY ">> STARTING SORT PROCEDURE".

           SORT SORT-WORK
               ON ASCENDING KEY W-STUDENT-GRADE
               INPUT PROCEDURE INPUT-PROC
               OUTPUT PROCEDURE OUTPUT-PROC.

           DISPLAY ">> SORT COMPLETED SUCCESSFULLY!".
           STOP RUN.

       INPUT-PROC.
           DISPLAY ">> READING INPUT FILE...".

           OPEN INPUT INPUT-FILE.

           PERFORM UNTIL EOF
               READ INPUT-FILE AT END MOVE 'Y' TO EOF-FLAG
               NOT AT END
                   *> Extract fields from tab-delimited input
                   UNSTRING STUDENT-LINE DELIMITED BY X'09'
                       INTO WS-TEMP-STUDENT-NAME
                            WS-TEMP-STUDENT-SURNAME
                            WS-TEMP-STUDENT-GRADE

                   *> Move to sort record
       MOVE FUNCTION TRIM(WS-TEMP-STUDENT-NAME) TO W-STUDENT-NAME
       MOVE FUNCTION TRIM(WS-TEMP-STUDENT-SURNAME) TO W-STUDENT-SURNAME
                   MOVE WS-TEMP-STUDENT-GRADE TO W-STUDENT-GRADE

                   DISPLAY "READ: " W-STUDENT-NAME " | "
                            W-STUDENT-SURNAME " | "
                            W-STUDENT-GRADE

                   RELEASE SORT-RECORD
                   DISPLAY "SORT-RECORD: " SORT-RECORD
                   DISPLAY "SORT-RECORD: " SORT-RECORD
                   DISPLAY "SORT-RECORD: " SORT-RECORD
               END-READ
           END-PERFORM.

           CLOSE INPUT-FILE.

       OUTPUT-PROC.
           DISPLAY ">> WRITING SORTED DATA TO OUTPUT FILE...".

           OPEN OUTPUT OUTPUT-FILE.

           MOVE 'N' TO EOF-FLAG.  *> Ensure flag is reset

           PERFORM UNTIL EOF
               RETURN SORT-WORK AT END
                   MOVE 'Y' TO EOF-FLAG
                   DISPLAY "RETURN: NO MORE RECORDS FOUND"
               NOT AT END
                   MOVE W-STUDENT-NAME TO OUT-STUDENT-NAME
                   MOVE W-STUDENT-SURNAME TO OUT-STUDENT-SURNAME
                   MOVE W-STUDENT-GRADE TO OUT-STUDENT-GRADE

                   DISPLAY "WRITING: " OUT-STUDENT-NAME " | "
                            OUT-STUDENT-SURNAME " | "
                            OUT-STUDENT-GRADE

                   WRITE OUTPUT-RECORD
               END-RETURN
           END-PERFORM.

           CLOSE OUTPUT-FILE.
           DISPLAY ">> OUTPUT FILE WRITTEN SUCCESSFULLY!".
