!======================================================================!
subroutine phen
!----------------------------------------------------------------------!
use params
use vars
!----------------------------------------------------------------------!
implicit none
!----------------------------------------------------------------------!
! Cambial phenology (delpierre16, SI).
! Oak AWG DOY 92 (2006-2014); depierre16.
!----------------------------------------------------------------------!
if ((kday >= t0) .and. (kday < 180) .and. (AWG == .false.)) then
  if (TC_day < Tb) then
    Rphen = zero
  else
    Rphen = TC_day - Tb
  end if
  Rsum = Rsum + Rphen
end if
if ((Rsum >= Rstar) .and. (AWG == .false.) .and. (kday < 180)) then
  AWG = .true.
  Rsum = zero
  AWG_s (kyr_ce) = kday
end if
! obs delpierre16
if (kday == 255)  AWG = .false.
!----------------------------------------------------------------------!
! Leaf phenology (nolte20, from blumel12, fitted to quercus in
! delpierre).
! Equation 23 of Blumel and Chmielewski, 2012.
! Oak budburst DOY 106 (2006-2014), delpierre16.
!----------------------------------------------------------------------!
if ((.not. FG) .and. (kday >= t1) .and. (kday < 180)) then
  Rf = max (zero, TC_day - TBF) * (dlength (kday) / 10.0) ** EXPO
  Fstar = Fstar + Rf
end if
!----------------------------------------------------------------------!
if ((Fstar >= Fstar_lim) .and. (FG == .false.) .and. (kday < 180)) then
  FG = .true.
  Fstar = zero
  FG_s (kyr_ce) = kday
  LAI = 6.0
  !write (*,*) kyr_ce,kday, 'FG'
end if
!----------------------------------------------------------------------!
! obs delpierre16, but LAI?
if (kday == 310) then
  FG = .false.
  LAI = 1.0
end if
!----------------------------------------------------------------------!
end subroutine phen
!======================================================================!
