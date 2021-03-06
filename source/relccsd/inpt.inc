C
C VERSION : $Revision: 1.3 $
C DATE    : $Date: 2001/09/20 07:15:53 $
C FILE    : inpt.inc
C SOURCE  : $Source: /home/tc/visscher/sources/Molfdir/Molfdir/source/relccsd/inpt.inc,v $
C
      PARAMETER (MAXOP=15,MAXFR=25)
      COMMON/CCINTR/INTERFACE
      CHARACTER*10 INTERFACE
      COMMON/CCFLAG/DEBUG,TIMING,BREIT,DOSORT,DOENER,DOFOPR,DOSOPR,
     &       DOEXC,DOFSPC
      LOGICAL DEBUG,TIMING,BREIT,DOSORT,DOENER,DOFOPR,DOSOPR,DOEXC,
     &        DOFSPC
      COMMON/CCPRIN/IPRNT
      COMMON/CCOCC/NELEC(16),NFROZ(16)
C-----For the DIRAC interface
      COMMON/CCDIR/NQUNIT
C-----For the MOLFDIR interface
      COMMON/CCMLF/MWORD
C-----For the integral sorting module
      COMMON/CCSORL/USEOE,NORECMP
      LOGICAL USEOE,NORECMP
C-----For the energy module
      COMMON/CCENEI/NTOLCC,MXDIMCC,MXITCC
      COMMON/CCENEL/DOMP2,DOCCSD,DOCCSDT
      LOGICAL DOMP2,DOCCSD,DOCCSDT
C-----For the gradient module
      COMMON/CCGRAL/DOMP2G,DOCCSDG,DOCCSDTG
      LOGICAL DOMP2G,DOCCSDG,DOCCSDTG
      COMMON/CCGRAI/NFOPER,NTOLGR,MXDIMGR,MXITGR
      COMMON/CCGRAC/NAMEF(MAXOP)
      CHARACTER*8 NAMEE
C-----For the Hessian module
      COMMON/CCRPAI/NAOPER,NBOPER,NFREQ,NTOLRP,MXDIMRP,MXITRP
      COMMON/CCRPAR/EFREQ(MAXFR)
      REAL*8 EFREQ
      COMMON/CCRPAC/NAMEA(MAXOP),NAMEB(MAXOP)
      CHARACTER*8 NAMEA,NAMEB
C-----For the excitation energy module
      COMMON/CCEXCI/NEXC(16),NEOPER,NTOLEX,MXDIMEX,MXITEX
      COMMON/CCEXCC/NAMEE(MAXOP)
C-----For the Fock space module
      COMMON/CCFSPI/FSSECT(6),NINACT(16),NACT(16),
     &              NTOLFS,MXDIMFS,MXITFS
