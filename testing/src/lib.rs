use fvm::trace::ExecutionTrace;
use fvm_shared::bigint::Zero;
use prettytable::Table;
use fvm::trace::ExecutionEvent;
use fvm::gas::Gas;

#[macro_use]
extern crate prettytable;

pub mod helpers;
pub mod setup;


pub type GasResult = Vec<(String, i64)>;

pub fn create_gas_table(gas_result: GasResult) -> Table {
    let mut table = Table::new();
    table.add_row(row!["Function", "Gas"]);
    gas_result.iter().for_each(|(description, gas)| {
        table.add_row(row![description, gas]);
    });

    table
}

pub fn save_gas_table(table: &Table, actor_name: &str) {
    let file_name = format!("gas_results_{}.csv", actor_name);
    let path = std::path::Path::new(&file_name);
    let display = path.display();

    let out = match std::fs::File::create(&path) {
        Err(why) => panic!("couldn't create {}: {}", display, why),
        Ok(file) => file,
    };

    table.to_csv(out).expect("table cannot be written to csv");
}

pub fn parse_gas(exec_trace: ExecutionTrace) -> i64 {
    let mut depth = -1; // start at -1 because we have the on chain message gas and then the call to our solidity contract
    let mut gas_usage = Gas::new(0);

    for exec in exec_trace {
        let gas = match &exec {
            ExecutionEvent::GasCharge(gc) => gc.total(),
            ExecutionEvent::Call{..} => { depth += 1; Gas::zero() },
            ExecutionEvent::CallReturn(..) => { depth -= 1; Gas::zero() },
            _ => Gas::zero(),
        };

        if depth <= 0 {
            gas_usage += gas;
        }
    }

    return gas_usage.round_down();
}