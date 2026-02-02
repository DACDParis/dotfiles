fn main() {
    for i in 1..100 {
        println!("{}", i);
        if i % 3 == 0 && i % 9 == 0 {
            println!("Parou!");
            break;
        }
    }

    let mut i = 0;
    while i <= 100 {
        println!("{}", i);
        if i == 10 {
            println!("Parou!");
            break;
        }
        i += 1;
    }

    i = 0;

    loop {
        println!("{}", i);
        if i == 10 {
            println!("Parou!");
            break;
        }
        i += 1;
    }
}
