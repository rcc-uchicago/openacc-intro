SAXPY_CPU_OBJS=ticktock.o saxpy.o
SAXPY_CPU_TARGET=saxpy_cpu

SAXPY_ACC_OBJS=ticktock.o saxpy.o
SAXPY_ACC_TARGET=saxpy_acc

JACOBI_SER_OBJS=jacobi_serial.o
JACOBI_SER_TARGET=jacobi_serial

JACOBI_OMP_OBJS=jacobi_omp.o
JACOBI_OMP_TARGET=jacobi_omp

JACOBI_ACC_OBJS=jacobi_acc.o
JACOBI_ACC_TARGET=jacobi_acc

JACOBI_ACC_DATA_OBJS=jacobi_acc_data.o
JACOBI_ACC_DATA_TARGET=jacobi_acc_data

ALL_OBJS=$(JACOBI_SER_OBJS) $(JACOBI_ACC_OBJS) $(JACOBI_ACC_DATA_OBJS) $(JACOBI_OMP_OBJS)\
		 $(SAXPY_CPU_OBJS) $(SAXPY_ACC_OBJS)
ALL_TARGETS=$(JACOBI_SER_TARGET) $(JACOBI_ACC_TARGET) $(JACOBI_ACC_DATA_TARGET) $(JACOBI_OMP_TARGET)\
			$(SAXPY_CPU_TARGET) $(SAXPY_ACC_TARGET)

CC=pgcc
CCACCFLAGS=-acc -Minfo=accel


saxpy_acc: $(SAXPY_ACC_OBJS)
	$(CC) $(CCACCFLAGS) $(SAXPY_ACC_OBJS) -o $(SAXPY_ACC_TARGET)

saxpy_cpu: $(SAXPY_CPU_OBJS)
	$(CC) $(SAXPY_CPU_OBJS) -o $(SAXPY_CPU_TARGET)

jacobi_serial: $(JACOBI_SER_OBJS)
	$(CC) $(JACOBI_SER_OBJS) -o $(JACOBI_SER_TARGET)

jacobi_omp: jacobi_omp.c
	$(CC) -mp -Minfo=mp jacobi_omp.c -o $(JACOBI_OMP_TARGET)

jacobi_acc: $(JACOBI_ACC_OBJS)
	$(CC) $(CCACCFLAGS) $(JACOBI_ACC_OBJS) -o $(JACOBI_ACC_TARGET)

jacobi_acc_data: $(JACOBI_ACC_DATA_OBJS)
	$(CC) $(CCACCFLAGS) $(JACOBI_ACC_DATA_OBJS) -o $(JACOBI_ACC_DATA_TARGET)

%.o: %.c
ifeq ($(TARGET),CPU)
	$(CC) -c $< -o $@
else
	$(CC) $(CCACCFLAGS) -c $< -o $@
endif

clean:
	rm -f $(ALL_OBJS)
	rm -f $(ALL_TARGETS)

