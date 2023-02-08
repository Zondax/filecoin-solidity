#[macro_use]
extern crate prettytable;

pub mod helpers;
pub mod setup;

use prettytable::Table;

pub type GasResult = Vec<(String, i64)>;

pub fn create_gas_table(gas_result: GasResult) -> Table {
    let mut table = Table::new();
    table.add_row(row!["Function", "Gas"]);
    gas_result.iter().for_each(|(description, gas)| {
        table.add_row(row![description, gas]);
    });

    table
}