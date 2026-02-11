!======================================================================!
module params
!----------------------------------------------------------------------!
implicit none
!----------------------------------------------------------------------!
integer, parameter :: nsites = 295
integer, parameter :: nyrs   = 2023 - 1901 + 1
integer, parameter :: ndays  = 365
integer, parameter :: nkt    = 4
!----------------------------------------------------------------------!
real, parameter :: dt = 60.0 * 60.0 * 24.0 / float (nkt)
!----------------------------------------------------------------------!
real, parameter :: zero = 0.0
real, parameter :: one  = 1.0
real, parameter :: pi   = 3.14159
real, parameter :: eps  = 1.0e-8
real, parameter :: tf   = 273.15
real, parameter :: k    = 8.617e-5 ! eV K-1 ! Boltzmann contant
!----------------------------------------------------------------------!
real, parameter :: Mw = 18.015 ! g mol-1
real, parameter :: Ma = 28.97 ! g mol-1
! Molar gas constant (J mol-1 K-1)
real, parameter :: R = 8.314463
! Water vapour specific gas constant (J kg-1 K-1)
real, parameter :: Rv  = 1.0e3 * R / Mw  ! J kg-1 K-1
! Dry air specific gas constant (J kg-1 K-1)
real, parameter :: Ra  = 1.0e3 * R / Ma  ! J kg-1 K-1
real, parameter :: asw = 0.12   ! https://doi.org/10.1029/2020JD033582
real, parameter :: emm = 0.99   ! Google AI
real, parameter :: sb  = 5.67e-8 ! W m-2 K-4
real, parameter :: cp  = 1012.0! J kg-1 K-1
real, parameter :: karman = 0.40
!----------------------------------------------------------------------!
! Crown
!----------------------------------------------------------------------!
real, parameter :: MC = 12.011 ! g[C] mol[C]-1
real, parameter :: swp_max   = -1.1e-3 ! rawls et al., 92, loam REF
real, parameter :: bsoil     = 4.5    ! rawls et al., 92, loam REF
real, parameter :: Ksoil_sat    = 10**4 ! dewar21 (mol m-2 s-1 MPa-1)
real, parameter :: a_Ksoil      = 2.0 + 3.0 / bsoil !
real, parameter :: Kx           = 0.01 !0.01 dewar21; ! 3.0e-5 optimised
real, parameter :: lwp_crit     = -2.0 ! dewar18
real, parameter :: gmin        = 5.0e-3
real, parameter :: gmax        = 0.180
real, parameter :: KPh         = exp (0.00963 * (0.02 / 0.001) - 2.43)
real, parameter :: KPAR        = 0.65
real, parameter :: Oi           = 210.0e-3 ! mol mol-1
real, parameter :: Vcmax_top = 30.0e-6
real, parameter :: Jmax_top  = 2.1 * Vcmax_top
real, parameter :: Topt_J      = 31.0 ! For electron transport 25 looks better
real, parameter :: omega_J     = 18.0
!----------------------------------------------------------------------!
integer, parameter :: t0 = 56
! To fit delpierre16, DOY = 92
real, parameter :: tb    = 0.7 ! -1.0  in paper.
real, parameter :: Rstar = 260.0
!----------------------------------------------------------------------!
! Blumel and Chmielewski, 2012 M1 model, fitted to delpierre16.
! with DOY 106
integer, parameter :: t1 = 6
real, parameter :: TBF       = 3.1 ! 1.7 in original model
real, parameter :: EXPO      = 1.56
real, parameter :: Fstar_lim = 540.5
!----------------------------------------------------------------------!
real, parameter :: T0g = 283.15 ! friend22 (K)
real, parameter :: Eag = 0.374  ! friend22 (eV)
real, parameter :: swp_crit  = -1.1 !(-0.47 + (-0.66)) / 2.0
!----------------------------------------------------------------------!
real, parameter :: SM_MIN = 250.0
real, parameter :: SM_MAX = 1505.0
real, parameter :: b_RC   = 10.5
real, parameter :: b_AET  = 2.55
!----------------------------------------------------------------------!
end module params
!======================================================================!
