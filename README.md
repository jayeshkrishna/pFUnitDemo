Prerequisites
=============

The examples assume that you have the following installed in your system,

* An MPI library (e.g. MPICH)
* CMake (version  2.8 or above)
* pFUnit Unit testing framework

Configure
==========

Set the path to the PFUnit install directory by setting the "PFUNIT_INSTALL_PATH"
environment variable.

setenv PFUNIT_INSTALL_DIR <PATH_TO_PFUNIT_INSTALL_DIR>

Make sure the compilers are set to use the MPI wrapper compilers by setting
CC, CXX and FC environment variables.

setenv FC <PATH TO MPIF90>

To configure the application you need to run cmake with the appropriate arguments.
The command below configures the suite to build and install in the same directory
and the source.

cmake -LH . |& tee configure.log

Build and Install
=================

Use the make utility to build the library.

make |& tee make.log

Running the tests
=================

Use "make test" or "ctest" to run the tests,

make test |& tee test.log
ctest --verbose |& tee test.log
