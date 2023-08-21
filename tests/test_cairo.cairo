use array::ArrayTrait;
use result::ResultTrait;
use option::OptionTrait;
use traits::TryInto;
use starknet::ContractAddress;
use starknet::Felt252TryIntoContractAddress;
use debug::PrintTrait;
use snforge_std::{declare, PreparedContract, deploy};

use counter::ICounterDispatcher;
use counter::ICounterDispatcherTrait;

fn deploy_contract(name: felt252) -> ContractAddress {
    let class_hash = declare(name);
    let prepared = PreparedContract {
        class_hash, constructor_calldata: @ArrayTrait::new()
    };
    deploy(prepared).unwrap()
}
#[test]
fn test_increment() {
    let contract_address = deploy_contract('Counter');

    let dispatcher = ICounterDispatcher { contract_address };
    dispatcher.incr();
    let current_count =  dispatcher.curr();
    current_count.print();
    assert(current_count ==1, 'failed adding count')
}
#[test]
fn test_decrement() {
    let contract_address = deploy_contract('Counter');

    let dispatcher = ICounterDispatcher { contract_address };
    //incrementing one  times
    dispatcher.incr();

    dispatcher.decr();
    let current_count = dispatcher.curr();
    current_count.print();
    assert(current_count ==  0, 'failed to decrement')
    }