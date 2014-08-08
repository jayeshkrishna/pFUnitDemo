SUBROUTINE hello()
  USE mpi
  
  INTEGER sz, rank
  INTEGER ierr

!  call MPI_INIT(ierr)
  call MPI_COMM_SIZE(MPI_COMM_WORLD, sz, ierr) 
  call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)

  PRINT *, "Hello world from ", rank, " of ", sz, " processes"
!  call MPI_FINALIZE(ierr)
END SUBROUTINE hello
