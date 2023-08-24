
.macpack nes2header
nes2chr  $20000
nes2mapper 1
nes2prg  $20000
nes2bram $2000
nes2mirror 'H'
nes2tv 'N'
nes2end "HEADER"

.segment "HEADER" :size $10 :fill $00 :out
.segment "PRG0"   :bank $00 :size $4000 :mem $8000 :fill $00 :out
.segment "PRG1"   :bank $01 :size $4000 :mem $8000 :fill $00 :out
.segment "PRG2"   :bank $02 :size $4000 :mem $8000 :fill $00 :out
.segment "PRG3"   :bank $03 :size $4000 :mem $8000 :fill $00 :out
.segment "PRG4"   :bank $04 :size $4000 :mem $8000 :fill $00 :out
.segment "PRG5"   :bank $05 :size $4000 :mem $8000 :fill $00 :out
.segment "PRG6"   :bank $06 :size $4000 :mem $8000 :fill $00 :out
.segment "PRG7"   :bank $07 :size $4000 - 6 :mem $c000 :fill $00 :out
; todo figure out overlay segments
.segment "VECTORS" :off $2000a :size 6 :fill 0 :out
; .segment "VECTORS" :overlay "PRG7" :size $06 :off $fffa
.segment "CHR"    :size $20000 :off $20010 :fill $00 :out

; .macpack nes2header
; nes2chr  $20000

.segment "CHR"
.incbin "../Zelda 2 - The Adventure of Link (U).nes", $20010, $20000
