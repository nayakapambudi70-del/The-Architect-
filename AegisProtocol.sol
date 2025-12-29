
use anchor_lang::prelude::*;

// ID Program Lu, biarin aja default buat pamer
declare_id!("Aegis11111111111111111111111111111111111111");

#[program]
pub mod aegis_protocol {
    use super::*;

    // Fungsi buat ngunci suplai 17 Juta Lu
    pub fn initialize_scarcity(ctx: Context<Initialize>) -> Result<()> {
        let state = &mut ctx.accounts.state;
        state.max_supply = 17_000_000; // FIX 17 JUTA, GAK BISA DITAWAR!
        state.owner = *ctx.accounts.user.key;
        state.is_locked = true; // MATIIN FITUR PRINT DUIT!
        
        msg!("Aegis Scarcity Initialized: 17M Supply is Final.");
        Ok(())
    }
}

#[account]
pub struct GlobalState {
    pub max_supply: u64, // Kapasitas suplai
    pub owner: Pubkey,   // Lu yang punya!
    pub is_locked: bool, // Anti-Inflasi
}

#[derive(Accounts)]
pub struct Initialize<'info> {
    // Lu pelit, jadi space-nya diitung pas biar murah gas fee!
    #[account(init, payer = user, space = 8 + 8 + 32 + 1)]
    pub state: Account<'info, GlobalState>,
    #[account(mut)]
    pub user: Signer<'info>,
    pub system_program: Program<'info, System>,
}
