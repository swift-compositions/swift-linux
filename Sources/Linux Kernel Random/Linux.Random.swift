#if os(Linux)

    extension Linux {

        public typealias Random = Random::Random
    }

    extension Random {

        /// Fills the buffer, resuming `getrandom(2)` after short reads and signal interruptions.
        public static func fill(
            _ buffer: UnsafeMutableRawBufferPointer
        ) throws(Error) {
            guard let base = buffer.baseAddress else { return }
            var filled = 0
            while filled < buffer.count {
                let remaining = unsafe UnsafeMutableRawBufferPointer(
                    start: base.advanced(by: filled),
                    count: buffer.count - filled
                )
                let written: Int
                do {
                    written = try unsafe Linux.Kernel.Random.getrandom(remaining)
                } catch {
                    switch error {
                    case .interrupted: continue
                    case .entropyNotReady: throw .entropyNotReady
                    case .systemError(let code): throw .systemError(code)
                    }
                }
                guard written > 0 else { throw .systemError(0) }
                filled += written
            }
        }
    }

#endif
