F90 = mpif90 -I/usr/local/software/spack/spack-views/.rhel8-icelake-202110272/uxqqj4xcjrltatqgtuoi2hp46uabtzom/intel-oneapi-mpi-2021.4.0/intel-2021.4.0/kypfgtnfzspxoby7tqy7yt6ykejpwk5n/mpi/2021.4.0/

FFLAGS = -O2 -r8
LDFLAGS = -lnetcdff

SRC = \
	oak.f90 	\
	params.f90	\
	vars.f90	\
	dayl.f90	\
	phen.f90	\
	grow.f90	\
	hydro.f90	\
	crown.f90	\
	leaf.f90

OBJ = $(SRC:.f90=.o)

oak.exe : $(OBJ)
	$(F90) $(FFLAGS) -o oak.exe $(OBJ) $(LDFLAGS)

# Main routine
oak.o : params.o vars.o dayl.o phen.o grow.o hydro.o crown.o oak.f90
	$(F90) $(FFLAGS) -c oak.f90

# Subroutines
dayl.o : params.o vars.o dayl.f90
	$(F90) $(FFLAGS) -c dayl.f90

phen.o : params.o vars.o phen.f90
	$(F90) $(FFLAGS) -c phen.f90

grow.o : params.o vars.o grow.f90
	$(F90) $(FFLAGS) -c grow.f90

hydro.o : params.o vars.o hydro.f90
	$(F90) $(FFLAGS) -c hydro.f90

crown.o : params.o vars.o leaf.o crown.f90
	$(F90) $(FFLAGS) -c crown.f90

leaf.o : params.o vars.o leaf.f90
	$(F90) $(FFLAGS) -c leaf.f90

# Modules
params.o : params.f90
	$(F90) $(FFLAGS) -c params.f90

vars.o : vars.f90
	$(F90) $(FFLAGS) -c vars.f90
