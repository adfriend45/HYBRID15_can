program clm
implicit none
character(len=200) :: filename
real :: lon, lat
real :: tmp, pre, tswrf, dlwrf, spfh, pres, ugrd, vgrd
real :: tmin_mo (12,3), tmp_mo (12,3), ppt_mo (12,3)
integer :: ksite, kyr, ic, ikbox, kday, kt, ikyr, it, kmo
integer, dimension (12) :: nday = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
integer :: nd (12), tkyr
tkyr = 1957
nd (1) = nday (1)
do kmo = 2, 12
  nd (kmo) = nd (kmo-1) + nday (kmo)
end do
filename = '/rds/user/adf10/rds-mb425-geogscratch/adf10/FORCINGS/ulf/&
           &clm_ulf_reg2_reorder.txt'
open (10, file = trim (filename), status = 'old')
open (20, file='clm.txt',status='unknown')
do ksite = 1, 295
  read (10,*) ic, ikbox, lon, lat
  backspace (10)
  write (*,*) ksite, lon, lat
  tmin_mo = 100.0
  tmp_mo = 0.0
  ppt_mo = 0.0
  do kyr = 1901, 2023
    kmo = 1
    do kday = 1, 365
      do kt = 1, 4
        read (10,*) ic, ikbox, lon, lat, ikyr, it, &
                    tmp, pre, tswrf, dlwrf, spfh, pres, ugrd, vgrd
! high: 1932, 1969, 1946
! low : 1957, 2011, 2014
        if (kyr == (tkyr-1)) then
          if ((tmp-273.15) < tmin_mo (kmo,1)) tmin_mo (kmo,1) = tmp - 273.15
          tmp_mo (kmo,1) = tmp_mo (kmo,1) + tmp - 273.15
          ppt_mo (kmo,1) = ppt_mo (kmo,1) + pre * float (6*60*60)
        end if
        if (kyr == tkyr) then
          if ((tmp-273.15) < tmin_mo (kmo,2)) tmin_mo (kmo,2) = tmp - 273.15
          tmp_mo (kmo,2) = tmp_mo (kmo,2) + tmp - 273.15
          ppt_mo (kmo,2) = ppt_mo (kmo,2) + pre * float (6*60*60)
        end if
        !if (kyr < 1931) then
          if ((tmp-273.15) < tmin_mo (kmo,3)) tmin_mo (kmo,3) = tmp - 273.15
          tmp_mo (kmo,3) = tmp_mo (kmo,3) + tmp - 273.15
          ppt_mo (kmo,3) = ppt_mo (kmo,3) + pre * float (6*60*60)
        !end if
      end do ! kt
      if (kday == nd (kmo)) kmo = kmo + 1
    end do ! kday
    !write (*,*) kyr, tmp_mo (1,1) / float (4 * nday (kmo)), &
    !                 tmp_mo (1,2) / float (4 * nday (kmo) * (kyr-1901+1))
  end do ! kyr
  if ((lon == 6.75) .and. (lat == 48.25)) then
    kyr = 2023
    do kmo = 1, 12
      write (20,'(i5,9f12.4)') kmo, tmin_mo (kmo,3), &
                   tmin_mo (kmo,1), &
                   tmin_mo (kmo,2), tmp_mo (kmo,3) / float (4 * nday (kmo) * (kyr-1901+1)), &
                   tmp_mo (kmo,1) / float (4 * nday (kmo)), &
                   tmp_mo (kmo,2) / float (4 * nday (kmo)), ppt_mo (kmo,3) / float (kyr-1901+1), &
                   ppt_mo (kmo,1), ppt_mo (kmo,2)
    end do
    close (20)
    stop
  end if
end do ! ksite
close (10)
end program clm
