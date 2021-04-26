module photochem_wrk
  implicit none
  public
  integer, private, parameter :: real_kind = kind(1.0d0)
  ! this module contains stuff that changes 
  ! over the course of a single integration. This includes
  ! initial conditions to non-linear solves, that must be preserved 
  ! from one iteration to the next.
  
  ! this includes ANYTHING that gets written to during the course of an integration
  ! or anything that SHOULD get written to that i haven't fixed.
  
  ! needed in read_atmosphere.f90
  real*8, allocatable, dimension(:,:) :: aersol ! aersol parameter
  real*8, allocatable, dimension(:,:) :: wfall ! aersol parameter
  real*8, allocatable, dimension(:,:) :: rpar ! aersol parameter
  
  ! needed in xsections and photo
  real*8, allocatable, dimension(:,:) :: SIGNO
  
  ! needed in Aercon.f90
  real*8, allocatable, dimension(:) :: FSULF
  real*8, allocatable, dimension(:) :: H2SO4S
  real*8, allocatable, dimension(:) :: S8S
  
  ! needed in photo.f90
  real*8, allocatable, dimension(:,:,:) :: QEXTT, W0T, GFT
  
  ! needed in dochem.f90
  real*8, allocatable, dimension(:,:) :: SL
  
  ! needed in rates.f90
  real*8, allocatable, dimension(:,:) :: A ! reaction rate coefficients
  
  ! needed in rainout.f90
  real*8, allocatable, dimension(:,:) :: H
  real*8, allocatable, dimension(:,:) :: RAINGC
  real*8, allocatable, dimension(:) :: RAIN
  real*8, allocatable, dimension(:,:) :: XSAVE
  real*8 alpharain, co2aq, h2cog0, hh2co
  real*8 hplus, hso2, so2g0, so4_2
  
  
  ! needed in ltning.f90
  real*8 :: ZAPNO,ZAPO2,PRONOP,ZAPCO,ZAPH2,ZAPO
  
  ! needed in Difco.f90
  real*8, allocatable, dimension(:) :: HSCALE
  real*8, allocatable, dimension(:) :: tauedd
  real*8, allocatable, dimension(:) :: DK
  real*8, allocatable, dimension(:) :: H_ATM, BHN2, BH2N2
  real*8, allocatable, dimension(:,:) :: SCALE_H
  
  ! needed in setup.f90
  real*8, allocatable, dimension(:,:) :: DD,DL,DU,ADL,ADU,ADD
  
  ! needed in integrate.f90
  real*8, allocatable, dimension(:,:) :: yp
  real*8, allocatable, dimension(:,:) :: yl
  
  ! cvode
  real*8 :: time_prev = -1.d0 ! for printing time
  integer :: cvode_stepper = 0
  
  
end module