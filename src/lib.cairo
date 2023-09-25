use core::traits::Destruct;
 #[starknet::interface]
trait ICounter<TContractState> {
    fn incr(ref self: TContractState);
    fn decr(ref self:TContractState);
    fn curr(self:@TContractState)-> u64;
    fn incrby(ref self: TContractState,amount:u128);
}
#[starknet::contract]
mod Counter{
     #[storage]
    struct Storage {
        counter: u64,
    }
#[external(v0)]
impl Counter of super::ICounter<ContractState> {
    fn incr(ref self: ContractState){
        let count = self.counter.read() +1;
        self.counter.write(count);
    }
    fn decr(ref self:ContractState){
        
        let count =  self.counter.read() -1;
        self.counter.write(count);
    }
    fn curr(self:@ContractState)-> u64{
        self.counter.read()
    }
    fn incrby(ref self: ContractState,amount:u128){
        let count = self.counter.read() +amount;
        self.counter.write(count);
    }
}
}

