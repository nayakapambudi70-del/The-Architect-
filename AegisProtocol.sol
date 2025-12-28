[package]
name = "aegis_protocol"
version = "1.0.0"
edition = "2021"

[dependencies]
argon2 = "0.5.3"

// 1. Panggil library dari Cargo.toml
use argon2::{password_hash::{rand_core::OsRng, PasswordHash, PasswordHasher, PasswordVerifier, SaltString}, Argon2};

fn main() {
    println!("--- AEGIS PROTOCOL IS STARTING ---");

    // 2. PW Rahasia Lu (Jangan kasih tau babu!)
    let my_password = "PlerKastaNaga99"; 
    
    // 3. Proses Enkripsi (Bikin PW jadi Kode Ghaib)
    let salt = SaltString::generate(&mut OsRng);
    let argon2 = Argon2::default();
    let password_hash = argon2.hash_password(my_password.as_bytes(), &salt)
        .expect("ERROR BABI!")
        .to_string();

    // 4. Output: Ini yang Lu simpan di Database
    println!("PW Lu udah aman, kodenya: {}", password_hash);
}
   VAULT_PASSWORD=PlerKastaNaga99
BTC_API_KEY=rahasia_babi_12345

use dotenvy::dotenv;
use std::env;

fn main() {
    dotenv().ok(); // Ini buat baca file .env Lu

    // Ambil PW tanpa harus nulis PW-nya di sini!
    let my_pw = env::var("VAULT_PASSWORD").expect("PW GAK ADA BABI!");
    
    println!("Sistem Aegis pake kunci rahasia dari .env!");
}
