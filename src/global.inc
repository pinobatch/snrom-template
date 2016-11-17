.ifndef GLOBAL_INC
.define GLOBAL_INC

; init.s
.global reset_handler

; main.s
.global OAM
.global main, nmi_handler, irq_handler
.globalzp cur_keys, new_keys, oam_used

; bg.s
.global draw_bg

; player.s
.global init_player, move_player

; pads.s
.global read_pads

; ppuclear.s
.global ppu_clear_nt, ppu_clear_oam, ppu_screen_on

; bankcall ids
.globalzp draw_player_sprite, load_chr_ram

.endif
