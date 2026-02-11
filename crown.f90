!======================================================================!
subroutine crown
!----------------------------------------------------------------------!
use params
use vars
!----------------------------------------------------------------------!
implicit none
!----------------------------------------------------------------------!
real :: Vcmax_l, Jmax_l, Q_l, Rd_leaf_l
real :: gs_leaf_a, gs_leaf_ab, gs_leaf_b
real :: Ag_leaf_a, Ag_leaf_ab, Ag_leaf_b
real :: Rd_leaf_a, Rd_leaf_ab, Rd_leaf_b
real :: scale
!----------------------------------------------------------------------!
Q_top = 2.2e-6 * tswrf
rho_mol = pres / (R * tmp)
RT_air  = R * tmp
pcp     = exp (19.02 - 37830.0 / RT_air) / 1.0e6 !bernacchi01 mol mol-1
Jmax_T  = exp (-(((TC - Topt_J) / omega_J) ** 2))
Vcmax_T = exp (26.35 - 65330.0 / RT_air) !bernacchi01
Kc      = exp (38.05 - 79430.0 / RT_air) / 1.0e6 !bernacchi01 mol mol-1
Ko      = exp (20.30 - 36380.0 / RT_air) / 1.0e3 !bernacchi01 mol mol-1
!----------------------------------------------------------------------!
! Tetens equation, Google AI; closish to jones new table (Pa)
!----------------------------------------------------------------------!
es = 611.2 * exp ((17.67 * TC) / (TC + 243.5))
!----------------------------------------------------------------------!
! Vapour pressure, Google AI (Pa)
!----------------------------------------------------------------------!
ea = (0.622 * spfh * pres) / (one - 0.378 * spfh)
!----------------------------------------------------------------------!
! Vapour pressure deficit (Pa)
!----------------------------------------------------------------------!
D0 = es - ea
!----------------------------------------------------------------------!
! Atmospheric water vapour pressure deficit (mol mol-1)
!----------------------------------------------------------------------!
D_mol = D0 / pres
!----------------------------------------------------------------------!
rwc = (sm - SM_MIN) / (SM_MAX - SM_MIN)
!----------------------------------------------------------------------!
swp = swp_max * (one / (rwc ** bsoil)) ! friend95
!----------------------------------------------------------------------!
Vcmax_l = Vcmax_T * Vcmax_top
Jmax_l = Jmax_T * Jmax_top
Q_l = Q_top
!----------------------------------------------------------------------!
call leaf (Vcmax_l, Jmax_l, Q_l, Rd_leaf_l, gs_leaf_a, Ag_leaf_a, &
           Rd_leaf_a)
!----------------------------------------------------------------------!
scale = exp (-KPh * LAI / 2.0)
Vcmax_l = scale * Vcmax_T * Vcmax_top
Jmax_l = scale * Jmax_T * Jmax_top
Q_l = exp (-KPAR * LAI / 2.0) * Q_top
!----------------------------------------------------------------------!
call leaf (Vcmax_l, Jmax_l, Q_l, Rd_leaf_l, gs_leaf_ab, Ag_leaf_ab, &
           Rd_leaf_ab)
!----------------------------------------------------------------------!
scale = exp (-KPh * LAI)
Vcmax_l = scale * Vcmax_T * Vcmax_top
Jmax_l = scale * Jmax_T * Jmax_top
Q_l = exp (-KPAR * LAI) * Q_top
!----------------------------------------------------------------------!
call leaf (Vcmax_l, Jmax_l, Q_l, Rd_leaf_l, gs_leaf_b, Ag_leaf_b, &
           Rd_leaf_b)
!----------------------------------------------------------------------!
gs_crown = (LAI / 6.0) * (gs_leaf_a + 4.0 * gs_leaf_ab + gs_leaf_b)
Ag_crown = (LAI / 6.0) * (Ag_leaf_a + 4.0 * Ag_leaf_ab + Ag_leaf_b)
Rd_crown = (LAI / 6.0) * (Rd_leaf_a + 4.0 * Rd_leaf_ab + Rd_leaf_b)
!----------------------------------------------------------------------!
if (Q_top > zero) Abot = Ag_leaf_b
!----------------------------------------------------------------------!
end subroutine crown
!======================================================================!
