      PROGRAM DIRECT

      IMPLICIT REAL*8 (A-H, O-Z)

      EXTERNAL DIRDAT
C
C     ====================================================================
C     DIRECT RELATIVISTIC RAS CI PROGRAM
C
C     FIRST VERSION WRITTEN IN JULY 1991 BY LUUK VISSCHER
C     Large revisions in July 1995 by Bert de Jong
C
C     COMMON BLOCKS :
C
C     ABEL    :   MULTIPLICATION TABLE OF ABELIAN SUBGROUP
C     CHR     :   CHARACTER VARIABLES (REPR. NAMES)
C     CMTRIX  :   CI-MATRIX IN THE BASIS OF THE EXPANSION VECTORS
C     CONTROL :   NUMBER OF ITERATIONS, SELECTED VECTORS, ETC.
C     CRITERS :   CONVERGENCE CRITERIA
C     DELSP   :   REORDERING INFORMATION NECESSARY TO DELETE VIRTUALS
C     DGELM   :   DIAGONAL ELEMENTS OF THE LARGE CI-MATRIX
C     EIVALS  :   EIGEN VALUES, RESIDUES, DAVIDSON CORRECTION
C     FNAMES  :   FILE NAMES
C     FNUMBS  :   FILE NUMBERS
C     GMAT    :   G MATRIX ELEMENTS
C     RAS     :   NUMBER OF ORBITALS, ELECTRONS IN THE RAS SUBSPACES
C     RECIND  :   ADDRESSES OF STORED 1-ELECTRON EXCITATIONS
C     SHUF(I) :   WORKSPACE TO REORDER 2-EL. INTEGRALS (*)
C     TIMING  :   TIMING INFORMATION
C     TWOE    :   TWO ELECTRON INTEGRALS
C     VECTOR  :   EXPANSION VECTORS, SIGMA VECTORS (*)
C     VWEIGHT :   VERTEX WEIGHTS
C     IPOINT  :   POINTERS OF THE MAIN MEMORY BLOCK
C
C     BLOCK DATA :
C
C     DIRDAT  :   INITIALIZES FILES NAMES AND NUMBERS
C
C     SUBROUTINES AND FUNCTIONS :
C
C     DIRECT  :   MAIN PROGRAM
C     SETUP   :   GETS NECESSARY DATA TO SET UP CI SPACE
C     DRIVER  :   CONTROLS DIAGONALISATION PROCEDURE
C     ORBSIN  :   READS ORBITAL INFORMATION
C     USERIN  :   READS USER INPUT
C     SHUFFLE :   REORDERING 2-ELECTRON INTEGRALS
C     MAKEGM  :   MAKES GMATRIX
C     VERTEX  :   CALCULATES VERTEX WEIGHTS
C     DETIND  :   CALCULATES ADRESS OF A BIT REPRESENTATION
C     DIAGELM :   CALCULATES DIAGONAL ELEMENTS OF THE LARGE CI-MATRIX
C     TRIAL   :   READS TRIAL CI VECTORS
C     REAVEC  :   READS CI ROOTS FROM PREVIOUS RUN (RESTART)
C     EXPAND  :   CALCULATES SIGMA VECTOR
C     CALIDS  :   CALCULATE ADRESSES OF INTERACTING DETERMINANTS
C     MAKIDS  :   STORE 1-ELECTRON EXCITATIONS
C     GETIDS  :   GET ADRESSES OF INTERACTING DETERMINANTS
C     TWOLIN  :   READS (PART OF) 2-ELECTRON INTEGRALS
C     INPROD  :   INNER PRODUCT OF TWO VECTORS
C     DIAG    :   DIAGONALISATION OF THE CI MATRIX
C     SELECV  :   SELECT THE APPROPRIATE VECTOR
C     WRIVEC  :   WRITE SELECTED ROOTS TO FILE
C     INITVEC :   INITIALISES TEMPORARY FILE FOR EXPANSION VECTORS
C     PUTVEC  :   GETS EXPANSION VECTOR FROM (TEMPORARY) FILE
C     GETVEC  :   GETS EXPANSION VECTOR FROM (TEMPORARY) FILE
C     RESIDUE :   CALCULATES RESIDUAL VECTOR
C     CRITER  :   CHECKS WHETHER CONVERGENCE OR MAXITER IS REACHED
C     DENSMT  :   CALCULATES DENSITY MATRIX
C     PRECOND :   PRECONDITIONS SELECTED RESIDUAL VECTOR
C     ORTHN   :   SCHMIDT ORTHONORMALIZATION OF THE SELECTED VECTORS
C     USEROUT :   FINAL OUTPUT
C     LEADING :   PRINT DETERMINANTS WITH COEFFICIENT HIGHER THEN COMIN
C     ZZERO   :   INITIALIZES A VECTOR TO ZERO
C     NOVERI  :   CALCULATES N OVER I
C
C     FILES :
C
C      7 (MRCONEE)  : 1-ELECTRON INTEGRALS
C      8 (MDCINT)   : 2-ELECTRON COULOMB INTEGRALS
C      9 (MDBINT)   : 2-ELECTRON BREIT INTEGRALS 
C     10 (MRCTRIV)  : TRIAL VECTORS
C     11 (MRCFINV)  : FINAL VECTORS
C     12 (MRCEXCS)  : COUPLING COEFFICIENTS (TEMPORARY FILE)
C     13 (MRCVECS)  : EXPANSION VECTORS (TEMPORARY FILE)
C     14 (MRCTWOE)  : SORTED TWO-ELECTRON INTEGRALS (TEMPORARY FILE)
C
C     =======================================================================
C
      INCLUDE 'files.inc'
C
      CALL SETUP
      CALL DRIVER
      CALL USEROUT
C
C     Clean up : Throw away Scratch Files 
C
      CLOSE (MRCEXCS,STATUS='DELETE')
      CLOSE (MRCVECS,STATUS='DELETE')
      CLOSE (MRCTWOE,STATUS='DELETE')
      open (83,file='Intermediate_results',form='FORMATTED')
      CLOSE (83,STATUS='DELETE')
      open (88,file='Progress_Dirrci',form='formatted')
      CLOSE (88,STATUS='DELETE')
C
      END
