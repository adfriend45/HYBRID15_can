program pear
implicit none
character(len=200)::filename
real :: lon, lat, NPP (2023)
real :: TRW_ulf(2015), rnpp
integer :: kyr_ce, kyr_ulf, ksite, iksite, ikyr_ce
filename='ulf_TRW.txt'
open(10,file=trim(filename),status='unknown')
do kyr_ce = 1700, 2015
  read (10,*) kyr_ulf, TRW_ulf(kyr_ce)
end do
close(10)
filename='output_ann_sites.txt'
open(10,file=trim(filename),status='unknown')
filename='pears.txt'
open(20,file=trim(filename),status='unknown')
do ksite = 1, 295
  do kyr_ce = 1901, 2023
    read (10,*) iksite, ikyr_ce, lon, lat, NPP(kyr_ce)
  end do
  call pearson (NPP(1901:2015),TRW_ulf(1901:2015),115,rnpp)
  write (*,*) ksite, 'rpearsons = ', rnpp
  write (20,'(i5,3f12.3)') ksite, lon, lat, rnpp
end do
close(10)
close (20)
end program pear

!======================================================================!
subroutine pearson (x,y,n,r)
implicit none
integer, intent(in) :: n
real, intent(in) :: x(n)
real, intent(in) :: y(n)
real, intent(out) :: r
real :: sum_x, mean_x, ss_dev_x, sd_x, z_x
real :: sum_y, mean_y, ss_dev_y, sd_y, z_y
real :: szxzy
integer :: kyr
!----------------------------------------------------------------------!
sum_x = sum (x)
mean_x = sum_x / float (n)
ss_dev_x = 0.0
do kyr = 1, n
  ss_dev_x = ss_dev_x + (x (kyr) - mean_x) ** 2
end do
sd_x = (ss_dev_x / float (n - 1)) ** 0.5
!----------------------------------------------------------------------!
sum_y = sum (y)
mean_y = sum_y / float (n)
ss_dev_y = 0.0
do kyr = 1, n
  ss_dev_y = ss_dev_y + (y (kyr) - mean_y) ** 2
end do
sd_y = (ss_dev_y / float (n - 1)) ** 0.5
!----------------------------------------------------------------------!
szxzy = 0.0
do kyr = 1, n
  z_x = (x (kyr) - mean_x) / sd_x
  z_y = (y (kyr) - mean_y) / sd_y
  szxzy = szxzy + z_x * z_y
end do
!----------------------------------------------------------------------!
r = szxzy / float (n - 1)
!----------------------------------------------------------------------!
end subroutine pearson
!======================================================================!
