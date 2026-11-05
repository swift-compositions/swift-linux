import Linux_Kernel_File
import POSIX_Kernel

#if os(Linux)

    extension POSIX.Kernel.File.Attributes {

        public typealias Extended = ISO_9945.Kernel.File.Attributes.Extended
    }
#endif
