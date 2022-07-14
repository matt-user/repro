contract;

pub struct TestStruct {
    value0: u64,
    value1: bool,
}

abi CallFramesTest {
    fn get_second_param_multiple_params2(arg0: u64, arg1: TestStruct, arg2: b256) -> (u64, TestStruct, b256);
}

impl CallFramesTest for Contract {
    fn get_second_param_multiple_params2(arg0: u64, arg1: TestStruct, arg2: b256) -> (u64, TestStruct, b256) {
        (arg0, arg1, arg2)
    }
}
