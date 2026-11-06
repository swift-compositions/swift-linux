import Linux_Kernel_Thread
import Testing

enum `Linux.Thread Tests` {}

extension `Linux.Thread Tests` {
    @Suite
    struct Test {
        @Suite struct Unit {}
    }
}

extension `Linux.Thread Tests`.Test.Unit {
    @Test func `namespace exists`() {

        _ = Linux.Thread.self
    }
}
