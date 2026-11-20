public import Linux_Kernel_Descriptor
public import Linux_Kernel_Event
public import Linux_Kernel_File
public import Linux_Kernel_Futex
public import Linux_Kernel_IO
public import Linux_Kernel_IO_Uring
public import Linux_Kernel_Memory
public import Linux_Kernel_Pipe
public import Linux_Kernel_Random
public import Linux_Kernel_Socket
public import Linux_Kernel_System
public import Linux_Kernel_Thread
public import POSIX_Kernel

public typealias Kernel = POSIX.Kernel

public typealias Linux = Linux_Kernel_System_Standard.Linux

#if os(Linux)

    public import Linux_Kernel_IO_Uring_Standard
    extension POSIX.Kernel.IO {
        public typealias Uring = Linux.Kernel.IO.Uring
    }
#endif
