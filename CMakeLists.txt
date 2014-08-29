project(helloworld)
cmake_minimum_required(VERSION 2.8)
enable_language(Fortran)

enable_testing()
find_package(MPI)

# Library to test - helloworld
add_library(helloworld helloworld.F90)

add_custom_command(
  OUTPUT pftest_hello.F90
  COMMAND $ENV{PFUNIT_INSTALL_PATH}/bin/pFUnitParser.py ${CMAKE_CURRENT_SOURCE_DIR}/pftest_hello.pf pftest_hello.F90
)

add_custom_command(
  OUTPUT pftest_before_after.F90
  COMMAND $ENV{PFUNIT_INSTALL_PATH}/bin/pFUnitParser.py ${CMAKE_CURRENT_SOURCE_DIR}/pftest_before_after.pf pftest_before_after.F90
)

# A Non PFUnit test - test_hello
add_executable(test_hello test_hello.F90)
target_link_libraries(test_hello helloworld)

include_directories($ENV{PFUNIT_INSTALL_PATH}/mod $ENV{PFUNIT_INSTALL_PATH}/include ${CMAKE_CURRENT_SOURCE_DIR})
link_directories($ENV{PFUNIT_INSTALL_PATH}/lib)
set(pfunit_srcs $ENV{PFUNIT_INSTALL_PATH}/include/driver.F90)

# Build all PFUnit tests into a single GIANT executable - pftest_alltests
add_executable(pftest_alltests ${pfunit_srcs} pftest_hello.F90 pftest_before_after.F90)
target_link_libraries(pftest_alltests helloworld pfunit)

add_test(pftest_alltests ${MPIEXEC} ${MPIEXEC_NUMPROC_FLAG} 3 ./pftest_alltests)

# The PFUnit test - pftest_before_after
#add_executable(pftest_before_after ${pfunit_srcs} pftest_before_after.F90)
#target_link_libraries(pftest_before_after pfunit)

#add_test(pftest_before_after ${MPIEXEC} ${MPIEXEC_NUMPROC_FLAG} 3 ./pftest_before_after)
