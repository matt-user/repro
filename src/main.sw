contract;

pub struct TestStruct {
    value: u64,
}

abi CallFramesTest {
    fn dummy(arg0: TestStruct, arg1: b256) -> (TestStruct, b256);
}

impl CallFramesTest for Contract {
    fn dummy(arg0: TestStruct, arg1: b256) -> (TestStruct, b256) {
        (arg0, arg1)
    }
}
