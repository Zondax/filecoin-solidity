use cid::Cid;
use multihash::Code;
use fvm_shared::ActorID;
use fvm::state_tree::{ActorState, StateTree};
use fvm_ipld_blockstore::Blockstore;
use anyhow::{Context, Result};
use fvm_ipld_encoding::CborStore;

pub const DATA_CAP_ACTOR : ActorID = 7;
pub const STORAGE_POWER_ACTOR: ActorID = 4;
pub const STORAGE_MARKET_ACTOR: ActorID = 5;
pub const VERIFIED_REGISTRY_ACTOR : ActorID = 6;


pub fn set_datacap_actor(state_tree: &mut StateTree<impl Blockstore>, datacap_code_cid: Cid,) -> Result<()> {
    let datacap_state_cid = state_tree
        .store()
        .put_cbor(&[(); 0], Code::Blake2b256)
        .context("datacap actor")?;

    let datacap_actor_state = ActorState {
        code: datacap_code_cid,
        state: datacap_state_cid,
        sequence: 0,
        balance: Default::default(),
        delegated_address: None,
    };

    state_tree
        .set_actor(DATA_CAP_ACTOR, datacap_actor_state)
        .map_err(anyhow::Error::from)
        .context("datacap actor".to_owned())
}

pub fn set_storagepower_actor(
    state_tree: &mut StateTree<impl Blockstore>,
    storagepower_code_cid: Cid,
) -> Result<()> {

    let storagepower_state_cid = state_tree
        .store()
        .put_cbor(&[(); 0], Code::Blake2b256)
        .context("storagepower actor".to_owned())?;

    let storagepower_actor_state = ActorState {
        code: storagepower_code_cid,
        state: storagepower_state_cid,
        sequence: 0,
        balance: Default::default(),
        delegated_address: None,
    };

    state_tree
        .set_actor(STORAGE_POWER_ACTOR, storagepower_actor_state)
        .map_err(anyhow::Error::from)
        .context("storagepower actor".to_owned())
}

pub fn set_storagemarket_actor(state_tree: &mut StateTree<impl Blockstore>, storagemarket_code_cid: Cid,) -> Result<()> {
    let storagemarket_state_cid = state_tree
        .store()
        .put_cbor(&[(); 0], Code::Blake2b256)
        .context("storagemarket actor".to_owned())?;

    let storagemarket_actor_state = ActorState {
        code: storagemarket_code_cid,
        state: storagemarket_state_cid,
        sequence: 0,
        balance: Default::default(),
        delegated_address: None,
    };

    state_tree
        .set_actor(STORAGE_MARKET_ACTOR, storagemarket_actor_state)
        .map_err(anyhow::Error::from)
        .context("storagemarket actor".to_owned())
}

pub fn set_verifiedregistry_actor(state_tree: &mut StateTree<impl Blockstore>, verifiedregistry_code_cid: Cid,) -> Result<()> {
    let verifiedregistry_state_cid = state_tree
        .store()
        .put_cbor(&[(); 0], Code::Blake2b256)
        .context("verifiedregistry actor".to_owned())?;

    let verifiedregistry_actor_state = ActorState {
        code: verifiedregistry_code_cid,
        state: verifiedregistry_state_cid,
        sequence: 0,
        balance: Default::default(),
        delegated_address: None,
    };

    state_tree
        .set_actor(VERIFIED_REGISTRY_ACTOR, verifiedregistry_actor_state)
        .map_err(anyhow::Error::from)
        .context("verifiedregistry actor".to_owned())
}

pub fn set_reward_actor(state_tree: &mut StateTree<impl Blockstore>, reward_code_cid: Cid,) -> Result<()> {
    const REWARD_ACTOR_ID: ActorID = 2;

    let reward_state_cid = state_tree
        .store()
        .put_cbor(&[(); 0], Code::Blake2b256)
        .context("reward actor".to_owned())?;

    let reward_actor_state = ActorState {
        code: reward_code_cid,
        state: reward_state_cid,
        sequence: 0,
        balance: Default::default(),
        delegated_address: None,
    };

    state_tree
        .set_actor(REWARD_ACTOR_ID, reward_actor_state)
        .map_err(anyhow::Error::from)
        .context("reward actor".to_owned())
}
