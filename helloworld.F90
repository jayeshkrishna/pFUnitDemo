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

SUBROUTINE rank_hello(rank)
  USE mpi

  INTEGER, INTENT(IN) :: rank
  INTEGER :: sz
  INTEGER :: ierr

  call MPI_COMM_SIZE(MPI_COMM_WORLD, sz, ierr) 

  PRINT *, "Hello world from ", rank, " of ", sz, " processes"
END SUBROUTINE rank_hello

SUBROUTINE comm_hello(comm)
  USE mpi
  
  INTEGER, INTENT(IN) :: comm
  INTEGER :: sz, rank
  INTEGER :: ierr

  call MPI_COMM_SIZE(comm, sz, ierr) 
  call MPI_COMM_RANK(comm, rank, ierr)

  PRINT *, "Hello world from ", rank, " of ", sz, " processes"
END SUBROUTINE comm_hello

