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