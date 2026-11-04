# swift-linux

Use this package when your code runs on Linux and needs what only Linux has, such as io_uring, epoll, futexes or `getrandom`, or the Linux variants of POSIX calls. Start from `Kernel`, which is `POSIX.Kernel` with the Linux additions, and `Linux`. Each kernel area is also its own product, so you can depend on one, such as `Linux Kernel IO Uring`. For code that must also build on other systems, use swift-kernel. For the plain POSIX layer, use swift-posix. For the system call declarations alone, use swift-linux-standard.

## Laws

- `ISO_9945.Kernel.IO.Uring.isSupported` is worked out once per process by setting up and closing a one-entry ring, so later calls give the same answer. Setting `IO_URING_DISABLED` to exactly `1` makes it false.
- `Random.fill(_:)` fills the whole buffer: it calls `getrandom` again after a short read and after an interruption. A call that returns no bytes is treated as a system error. An empty buffer returns at once.
- `ISO_9945.Kernel.File.Flush.data(_:)` syncs a file's data with `fdatasync` and retries when interrupted.
