contract;

use std::context::call_frames::*;

abi CallFramesTest {
    fn get_second_param() -> u64;
}

impl CallFramesTest for Contract {
    fn get_second_param() -> u64 {
        second_param()
    }
}
