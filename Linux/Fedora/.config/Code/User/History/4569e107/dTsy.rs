use std::io; 
fn main() {
    println!("Hello, world!");
    let mut input= String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let int_input: i64 = input.trim().parse().unwrap();
    println!("{}", int_input + 2);
  }
