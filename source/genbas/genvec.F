C     =================
      SUBROUTINE GENVEC
C     =================
      IMPLICIT REAL*8 (A-H, O-Z)
C
C     READ COEFFICIENTS FROM VECTORS
C
      INCLUDE 'paracom.inc'
C
      DIMENSION CCR(N17),CCI(N17),DR(N17),DI(N17)
C
      DO 600 IMO = 1, NMO
      JTP = MOS (IMO,2)
      KTP = MOS (IMO,3)
      LTP = MOS (IMO,4)
      IREC = MOS (IMO,1) 
      REWIND (2)
      DO 51 J=1,8
   51    READ (2,1300) CARD
   56 READ (2,1301) JSIMRP,NSPINOR,NBAS
      IF (IREC.GT.NSPINOR) THEN
	 DO 57 I=1,NSPINOR
	    READ (2,1300) CARD
	    READ (2,FORMAT) (RDUM,J=1,2*NBAS)
   57    CONTINUE
	 IREC=IREC-NSPINOR
	 GOTO 56
      ELSE
         DO 58 I=1,IREC-1
	    READ (2,1300) CARD
	    READ (2,FORMAT) (RDUM,J=1,2*NBAS)
   58    CONTINUE
      ENDIF
      READ (2,1300) CARD
      READ (2,FORMAT) (DR(I),DI(I),I=1,NBAS)
      DO 200 ITYP =1, NLARGE (JSIMRP)
      ITP = ITPCOF (JSIMRP,ITYP)
      IF (ITP.EQ.JTP) THEN
         KMO = NCONTR (1,ITP) + 1
         INDMO (KMO,ITP,1) = IMO
         NCONTR (1,ITP) = KMO
         NCO = NUMCOF (1,ITP)
         NDUM = INDCOF (JSIMRP,ITYP)
         NNDUM = NDUMCF (JSIMRP,ITYP)
         DO 201 J=1,NCO
	    CCR(J)=DR(NDUM+(J-1)*NNDUM+J)
   	    CCI(J)=DI(NDUM+(J-1)*NNDUM+J)
  201    CONTINUE
         CALL TRANSR (NCO,CCR,CCI)
         DO 100 J = 1, NCO
            CV (J,KMO,ITP,1) = CCR (J)
  100    CONTINUE
      ENDIF
  200 CONTINUE
      DO 400 ITYP = NLARGE (JSIMRP) + 1, NTYPES (JSIMRP)
      ITP = ITPCOF (JSIMRP,ITYP)
      IF (ITP.EQ.KTP.OR.ITP.EQ.LTP) THEN
         KMO = NCONTR (2,ITP) + 1
         INDMO (KMO,ITP,2) = IMO
         NCONTR (2,ITP) = KMO
         NCO = NUMCOF (2,ITP)
         NDUM = INDCOF (JSIMRP,ITYP)
         NNDUM = NDUMCF (JSIMRP,ITYP)
	 DO 401 J=1,NCO
	    CCR(J)=DR(NDUM+(J-1)*NNDUM+J)
	    CCI(J)=DI(NDUM+(J-1)*NNDUM+J)
  401    CONTINUE
          CALL TRANSR (NCO,CCR,CCI)
          DO 300 J = 1, NCO
          CV (J,KMO,ITP,2) = CCR (J)
  300     CONTINUE
      ENDIF
  400 CONTINUE
  600 CONTINUE
      RETURN
 1300 FORMAT(A)
 1301 FORMAT(I4,26X,2I4)
      END
