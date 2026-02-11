!======================================================================!
module vars
!----------------------------------------------------------------------!
use params
!----------------------------------------------------------------------!
implicit none
!----------------------------------------------------------------------!
character (len = 200) :: filename
integer :: ksite, kyr_ce, kday, kt, ikyr
real, dimension (ndays) :: dlength ! hours
real :: lon, lat, tmp, pre, tswrf, dlwrf, spfh, pres, ugrd, vgrd
integer :: ic, ikbox, kyr_clm, iit
real :: TC_day
real :: TC
!----------------------------------------------------------------------!
real :: Rphen
real :: Rsum
!----------------------------------------------------------------------!
real :: Rf
!----------------------------------------------------------------------!
logical :: AWG
logical :: FG
real :: Fstar
integer, dimension (2023) :: AWG_s
integer, dimension (2023) :: FG_s
!----------------------------------------------------------------------!
real :: rwc
real :: sm_q
real :: pet
real :: aet
real :: dsm
real :: sm
real :: LE
real :: Delta
real :: Lv
real :: es
real :: As
real :: rho_kg
real :: D0
real :: ea
real :: ras
real :: zp0
real :: xh
real :: d
real :: z0
real :: u
real :: h
real :: gamma
real :: rss
real :: rr
real :: rhr
real :: fC
real :: raa
real :: rac
real :: rsc
!----------------------------------------------------------------------!
! Crown
!----------------------------------------------------------------------!
real :: Q_top
real :: Vcmax_T
real :: Jmax_T
real :: RT_air
real :: Jelec
real :: f0
real :: km
real :: pcp
real :: Kc
real :: Ko
real :: rho_mol
real :: gamma_m
real :: D_mol
real :: Ktot
real :: swp
real :: Ksoil
real :: ZCAP
real :: x_CAP
real :: x_CAP_J
real :: x_CAP_V
real :: w_CAP
real :: a_CAP
real :: ca_fmol
real :: gs_leaf_J
real :: gs_leaf_V
real :: ci
real :: co2_ppm (2023)
real :: LAI
real :: gs_crown
real :: Ag_crown
real :: Rd_crown
real :: Abot
!----------------------------------------------------------------------!
real :: fT
real :: fW
real :: drb
real :: NPP
!----------------------------------------------------------------------!
real :: larea, tarea
real :: GPP_ann
real :: NPP_ann
real :: GPP_ann_reg (2023)
real :: NPP_ann_reg (2023)
!----------------------------------------------------------------------!
end module vars
!======================================================================!
