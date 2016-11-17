;
; Trivial CHR RAM loader for NES
; Copyright 2011 Damian Yerrick
;
; Copying and distribution of this file, with or without
; modification, are permitted in any medium without royalty provided
; the copyright notice and this notice are preserved in all source
; code copies.  This file is offered as-is, without any warranty.
;
.include "nes.inc"
.include "mmc1.inc"
.export load_chr_ram_far

.segment "BANK13"
template_chr:
  .incbin "obj/nes/bggfx.chr"
  .incbin "obj/nes/spritegfx.chr"

;;
; Loads 8192 bytes of uncompressed data into CHR RAM.
.proc load_chr_ram_far
srclo = 0
srchi = 1

  lda #<template_chr
  sta srclo
  lda #>template_chr
  sta srchi
  ldy #0
  sty PPUADDR  ; set starting location in CHR RAM to $0000
  sty PPUADDR
  ldx #>8192  ; X counts the remaining length of CHR in 256-byte units
loop:
  lda (srclo),y
  sta PPUDATA
  iny
  bne loop
  ; after every 256th byte we end up here
  inc srchi  ; move on to the next set of 256 bytes of CHR
  dex
  bne loop
  jmp bankrts
.endproc


