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

# A Non PFUnit test - test_hello
add_executable(test_hello test_hello.F90)
target_link_libraries(test_hello helloworld)

include_directories($ENV{PFUNIT_INSTALL_PATH}/mod $ENV{PFUNIT_INSTALL_PATH}/include ${CMAKE_CURRENT_SOURCE_DIR})
link_directories($ENV{PFUNIT_INSTALL_PATH}/lib)
set(pfunit_srcs $ENV{PFUNIT_INSTALL_PATH}/include/driver.F90)

# The PFUnit test - pftest_hello
add_executable(pftest_hello ${pfunit_srcs} pftest_hello.F90)
target_link_libraries(pftest_hello helloworld pfunit)

add_test(pftest_hello ${MPIEXEC} ${MPIEXEC_NUMPROC_FLAG} 2 ./pftest_hello)
