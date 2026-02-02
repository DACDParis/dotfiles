fn main() {
    let valor = 100.0;
    let icms = calcula_icms(valor);
    let iss = calcula_iss(valor);
    escreve_icms(icms);
    escreve_iss(iss);
}

fn calcula_icms(valor: f32) -> f32 {
    valor * 0.01
}

fn calcula_iss(valor: f32) -> f32 {
    valor * 0.10
}

fn escreve_icms(icms: f32) {
    println!("Icms: {}", icms);
}

fn escreve_iss(iss: f32) { 
    println!("Iss: {}", iss);
}
