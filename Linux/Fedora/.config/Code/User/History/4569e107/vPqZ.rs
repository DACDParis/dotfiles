use std::io;

fn main() {
    println!("Hello, world!");
    let mut input = String::new();
    std::io::stdin().read_line(&mut input).expect("Failed to read line");
    let int_int: i64 = input.trim().parse().unwrap();
    print!("{}", int_input + 2);
    
}
