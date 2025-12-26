// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AegisProtocol {
    // 1. Identitas Koin Lu
    string public name = "AEGIS";
    string public symbol = "AEGIS";
    uint8 public decimals = 18; // Standard kasta naga

    // 2. INI KUNCINYA! Lu setting angka 17 Juta.
    // Angka 18 di belakang itu biar koinnya bisa dipecah (desimal).
    uint256 public constant MAX_SUPPLY = 17000000 * 10**18; 
    
    // Variabel buat nyatet berapa koin yang beredar
    uint256 public totalSupply;

    // Catatan siapa punya berapa koin
    mapping(address => uint256) public balanceOf;

    // 3. TOMBOL CETAK CUMA JALAN SEKALI PAS LAUNCHING
    constructor() {
        totalSupply = MAX_SUPPLY;
        // Semua 17 Juta koin masuk ke dompet LU (Foundernya)
        balanceOf[msg.sender] = MAX_SUPPLY;
        
        // Gak ada fungsi "MINT" atau "CETAK" lagi di bawah sini.
        // Jadi koin ini LIMITED kasta naga!
    }

    // Fungsi buat kirim-kirim koin (Biar bisa dipake trading)
    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value, "Duit Lu gak cukup, Pler!");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        return true;
    }
}
