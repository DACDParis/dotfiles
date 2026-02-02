fn main() {
fn quanto_e_um_mais_dois() -> u8 {
    3
}

fn escreve_hello_world_dez_vezes() {
    for i in 0..10 {
        println!("Hello World!");
    }
}
}
fn retorno_implicito() -> bool {
    true
}

fn retorno_explicito() -> u8 {
    if 10 > 1 {
        return 200; //a palavra return encerra a função e retorna o valor
    }
    1 //retorno implicito na mesma função
}
