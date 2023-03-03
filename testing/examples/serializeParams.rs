use fil_actor_miner::GetVestingFundsReturn;
use fvm_shared::clock::ChainEpoch;
use fvm_shared::econ::TokenAmount;
use fvm_ipld_encoding::to_vec;

fn main() {

    let vf = GetVestingFundsReturn {
        vesting_funds: vec![(ChainEpoch::default(), TokenAmount::default())]
    };

    println!("{}", hex::encode(to_vec(&vf).unwrap()))

}