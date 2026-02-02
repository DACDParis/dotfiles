fn main() {

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
