#if os(Linux) || os(Android) || os(OpenBSD)

    public import Linux_Kernel_System_Standard

    extension POSIX.Kernel.Thread {

        public typealias ID = Linux.Kernel.Thread.ID
    }

#endif
