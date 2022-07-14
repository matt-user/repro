use fuels::{prelude::*, tx::ContractId};

abigen!(
    CallFramesTestContract,
    "out/debug/repro-abi.json"
);

async fn get_call_frames_instance() -> (CallFramesTestContract, ContractId) {
    let wallet = launch_provider_and_get_wallet().await;
    let id = Contract::deploy(
        "out/debug/repro.bin",
        &wallet,
        TxParameters::default(),
        StorageConfiguration::with_storage_path(Some(
            "out/debug/repro-storage_slots.json".to_string(),
        )),
    )
    .await
    .unwrap();
    let instance = CallFramesTestContract::new(id.to_string(), wallet);

    (instance, id)
}

#[tokio::test]
async fn can_get_second_param() {
    let (instance, _id) = get_call_frames_instance().await;
    let expected_struct = TestStruct {
        value: 100,
    };
    let expected_b256 = [0; 32];
    let result = instance.dummy(expected_struct, expected_b256).call().await.unwrap();
    assert_eq!(result.value, (expected_struct, expected_b256));
}
