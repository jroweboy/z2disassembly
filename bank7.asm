bank7_PowerON_code                                                             ;
lda      #$00                          ; 0x1c010 $C000 A9 00                   ; A = 00
sta      $2001                         ; 0x1c012 $C002 8D 01 20                ;
sta      $2000                         ; 0x1c015 $C005 8D 00 20                ;
lda      #$05                          ; 0x1c018 $C008 A9 05                   ;;A = #$05 0000_0101
jsr      LFFCC                         ; 0x1c01a $C00A 20 CC FF                ; Load Bank 5
jsr      LA6A0                         ; 0x1c01d $C00D 20 A0 A6                ;
LC010                                                                          ;
lda      $0736                         ; 0x1c020 $C010 AD 36 07                ; Game Mode
cmp      #$08                          ; 0x1c023 $C013 C9 08                   ;
beq      LC01B                         ; 0x1c025 $C015 F0 04                   ;
cmp      #$14                          ; 0x1c027 $C017 C9 14                   ;
bne      LC010                         ; 0x1c029 $C019 D0 F5                   ;
LC01B                                                                          ;
lda      $076C                         ; 0x1c02b $C01B AD 6C 07                ;; (00=restart from zelda's castle with 3 lives,  01=no routine, 02=die, 03=wake up zelda, 04=roll credits, 06=show the lives then restart the scene)
cmp      #$01                          ; 0x1c02e $C01E C9 01                   ;
bne      LC010                         ; 0x1c030 $C020 D0 EE                   ;
lda      #$40                          ; 0x1c032 $C022 A9 40                   ;;A = #$40 0100_0000
sta      $0100                         ; 0x1c034 $C024 8D 00 01                ;
jsr      bank7_code13                  ; 0x1c037 $C027 20 CB C4                ;
lda      #$C0                          ; 0x1c03a $C02A A9 C0                   ;;A = #$c0 1100_0000
sta      $0100                         ; 0x1c03c $C02C 8D 00 01                ;
jmp      LC010                         ; 0x1c03f $C02F 4C 10 C0                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
lda      #$06                          ; 0x1c042 $C032 A9 06                   ; A = 06
jsr      LFFCC                         ; 0x1c044 $C034 20 CC FF                ;
jsr      Tables_for_Game_Over_screen_text; 0x1c047 $C037 20 00 80              ;
jmp      LC388                         ; 0x1c04a $C03A 4C 88 C3                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_PPU_Adresses_according_to_725_as_index                                   ;
.word    L0302                         ; 0x1c04d $C03D 02 03                   ;; Used when writing text to screen
.word    L0363                         ; 0x1c04f $C03F 63 03                   ;
.word    L03A4                         ; 0x1c051 $C041 A4 03                   ;
.word    bank7_Table_for_some_Palettes ; 0x1c053 $C043 BD D0                   ;Some Palettes
.word    L696C                         ; 0x1c055 $C045 6C 69                   ;
.word    bank0_Return_of_Ganon_screen_Palettes; 0x1c057 $C047 C9 80            ;Game Over Palettes
.word    Some_Palettes_Data_related_to_Falling_Animation; 0x1c059 $C049 36 A8  ;Some Palettes
.word    bank7_Tables_for_some_PPU_Command_Data; 0x1c05b $C04B D1 D0           ;Some PPU Commands			;status bar text at top of screen ATTACK MAGIC LIFE ETC			;1C05B	is D1D0 ($D0D1)
.word    bank7_Continue_Save_Screen_Tile_Mappings; 0x1c05d $C04D CB FD         ;
.word    Tables_for_Game_Over_screen_text; 0x1c05f $C04F 00 80                 ;Game Over PPU Macros
.word    bank7_Table_for_Overworld_Palettes; 0x1c061 $C051 58 C4               ;Overworld Palettes
.word    bank7_PPU_Macros_for_Hidden_Palace; 0x1c063 $C053 6A DF               ;
.word    bank7_table9                  ; 0x1c065 $C055 49 C4                   ;
.word    bank7_table10                 ; 0x1c067 $C057 7C C4                   ;
.word    LC490                         ; 0x1c069 $C059 90 C4                   ;
.word    LDCD3                         ; 0x1c06b $C05B D3 DC                   ;
; ---------------------------------------------------------------------------- ;
bank7_table0                                                                   ;
.byt    $00,$61,$A2                    ; 0x1c06d $C05D 00 61 A2                ;Memory Addresses Offsets (from 301) for PPU Macro Commands ?
; ---------------------------------------------------------------------------- ;
bank7_code1                                                                    ;
pha                                    ; 0x1c070 $C060 48                      ;
txa                                    ; 0x1c071 $C061 8A                      ;
pha                                    ; 0x1c072 $C062 48                      ;
tya                                    ; 0x1c073 $C063 98                      ;
pha                                    ; 0x1c074 $C064 48                      ;
lda      #$06                          ; 0x1c075 $C065 A9 06                   ; A = 06
jsr      LFFCC                         ; 0x1c077 $C067 20 CC FF                ; Load Bank 6
jsr      L9000                         ; 0x1c07a $C06A 20 00 90                ; Play Sounds
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1c07d $C06D 20 C9 FF                ; Load Bank X at 0x8000 (X = $0769)
pla                                    ; 0x1c080 $C070 68                      ;
tay                                    ; 0x1c081 $C071 A8                      ;
pla                                    ; 0x1c082 $C072 68                      ;
tax                                    ; 0x1c083 $C073 AA                      ;
pla                                    ; 0x1c084 $C074 68                      ;
plp                                    ; 0x1c085 $C075 28                      ;
rti                                    ; 0x1c086 $C076 40                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC077                                                                          ;
plp                                    ; 0x1c087 $C077 28                      ;
jmp      LA610                         ; 0x1c088 $C078 4C 10 A6                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_NMI_Entry_Point                                                          ;
php                                    ; 0x1c08b $C07B 08                      ;
bit      $0100                         ; 0x1c08c $C07C 2C 00 01                ;
bpl      bank7_code1                   ; 0x1c08f $C07F 10 DF                   ; Switch to Bank 6, Play Sounds
bvc      LC077                         ; 0x1c091 $C081 50 F4                   ;
plp                                    ; 0x1c093 $C083 28                      ;
pha                                    ; 0x1c094 $C084 48                      ;
lda      $FF                           ; 0x1c095 $C085 A5 FF                   ;; Sprite Bank ?
and      #$7C                          ; 0x1c097 $C087 29 7C                   ; keep bits .xxx xx..
ora      $0747                         ; 0x1c099 $C089 0D 47 07                ;
sta      $FF                           ; 0x1c09c $C08C 85 FF                   ;; Sprite Bank ?
sta      $2000                         ; 0x1c09e $C08E 8D 00 20                ; PPU Control Register 1
lda      $0727                         ; 0x1c0a1 $C091 AD 27 07                ;
beq      LC096                         ; 0x1c0a4 $C094 F0 00                   ; useless branching
LC096                                                                          ;
ldy      #$00                          ; 0x1c0a6 $C096 A0 00                   ; Y = 00
lda      $FE                           ; 0x1c0a8 $C098 A5 FE                   ;;does interesting effects when changed, perhaps involves palette? 
and      #$E0                          ; 0x1c0aa $C09A 29 E0                   ; keep bits xxx. ....
ldy      $0726                         ; 0x1c0ac $C09C AC 26 07                ;;?which is the black transition screen when loading a battle scene.  It hides the loading gfx.; Dialog Box Drawing Flag (00-01) Toggles while a dialog box is being drawn.
bne      LC0A8                         ; 0x1c0af $C09F D0 07                   ;
lda      $FE                           ; 0x1c0b1 $C0A1 A5 FE                   ;;does interesting effects when changed, perhaps involves palette? 
ora      #$18                          ; 0x1c0b3 $C0A3 09 18                   ; set bits  ...x x...
ora      $0768                         ; 0x1c0b5 $C0A5 0D 68 07                ;;makes weird ppu effect
LC0A8                                                                          ;
sta      $FE                           ; 0x1c0b8 $C0A8 85 FE                   ;;does interesting effects when changed, perhaps involves palette? 
and      #$E1                          ; 0x1c0ba $C0AA 29 E1                   ; keep bits xxx. ...x
sta      $2001                         ; 0x1c0bc $C0AC 8D 01 20                ; PPU Control Register 2
ldx      $2002                         ; 0x1c0bf $C0AF AE 02 20                ; PPU Status Register
lda      #$00                          ; 0x1c0c2 $C0B2 A9 00                   ; A = 00
sta      $2005                         ; 0x1c0c4 $C0B4 8D 05 20                ; Screen Scroll Offsets
sta      $2005                         ; 0x1c0c7 $C0B7 8D 05 20                ;
sta      $2003                         ; 0x1c0ca $C0BA 8D 03 20                ; Sprite Memory Address
lda      #$02                          ; 0x1c0cd $C0BD A9 02                   ; A = 02
sta      $4014                         ; 0x1c0cf $C0BF 8D 14 40                ; DMA Sprite Memory ($100 * 02)
lda      $07AE                         ; 0x1c0d2 $C0C2 AD AE 07                ;
beq      LC0CA                         ; 0x1c0d5 $C0C5 F0 03                   ;
jsr      bank7_code52                  ; 0x1c0d7 $C0C7 20 82 FD                ; related to palette loading (side view)
LC0CA                                                                          ;
lda      $0725                         ; 0x1c0da $C0CA AD 25 07                ;; PPU Macro Selector	
asl                                    ; 0x1c0dd $C0CD 0A                      ;
tax                                    ; 0x1c0de $C0CE AA                      ;
lda      bank7_PPU_Adresses_according_to_725_as_index,x; 0x1c0df $C0CF BD 3D C0; refer to table at $1C03D
sta      $00                           ; 0x1c0e2 $C0D2 85 00                   ;
lda      bank7_PPU_Adresses_according_to_725_as_index+$01,x; 0x1c0e4 $C0D4 BD 3E C0; refer to table at $1C03D
sta      $01                           ; 0x1c0e7 $C0D7 85 01                   ;
jsr      LD2EC                         ; 0x1c0e9 $C0D9 20 EC D2                ;
lda      #$3F                          ; 0x1c0ec $C0DC A9 3F                   ; A = 3F
sta      $2006                         ; 0x1c0ee $C0DE 8D 06 20                ; PPU Memory Address
ldy      #$00                          ; 0x1c0f1 $C0E1 A0 00                   ; Y = 00
sty      $2006                         ; 0x1c0f3 $C0E3 8C 06 20                ; PPU Memory Address
sty      $2006                         ; 0x1c0f6 $C0E6 8C 06 20                ; PPU Memory Address
sty      $2006                         ; 0x1c0f9 $C0E9 8C 06 20                ; PPU Memory Address
lda      $0768                         ; 0x1c0fc $C0EC AD 68 07                ;;makes weird ppu effect
bne      LC103                         ; 0x1c0ff $C0EF D0 12                   ;
lda      $FF                           ; 0x1c101 $C0F1 A5 FF                   ;; Sprite Bank ?
sta      $2000                         ; 0x1c103 $C0F3 8D 00 20                ; PPU Control Register 1
ldx      $2002                         ; 0x1c106 $C0F6 AE 02 20                ; PPU Status Register
lda      $FD                           ; 0x1c109 $C0F9 A5 FD                   ;
sta      $2005                         ; 0x1c10b $C0FB 8D 05 20                ; Screen Scroll Offsets
lda      $FC                           ; 0x1c10e $C0FE A5 FC                   ;
sta      $2005                         ; 0x1c110 $C100 8D 05 20                ; Screen Scroll Offsets
LC103                                                                          ;
lda      $FE                           ; 0x1c113 $C103 A5 FE                   ;;does interesting effects when changed, perhaps involves palette? 
sta      $2001                         ; 0x1c115 $C105 8D 01 20                ; PPU Control Register 2
ldx      $0725                         ; 0x1c118 $C108 AE 25 07                ;; PPU Macro Selector	
beq      LC11C                         ; 0x1c11b $C10B F0 0F                   ;
iny                                    ; 0x1c11d $C10D C8                      ;
cpx      #$01                          ; 0x1c11e $C10E E0 01                   ;
beq      LC119                         ; 0x1c120 $C110 F0 07                   ;
iny                                    ; 0x1c122 $C112 C8                      ;
lda      #$00                          ; 0x1c123 $C113 A9 00                   ; A = 00
cpx      #$02                          ; 0x1c125 $C115 E0 02                   ;
bne      LC12C                         ; 0x1c127 $C117 D0 13                   ;
LC119                                                                          ;
dec      $0725                         ; 0x1c129 $C119 CE 25 07                ;; PPU Macro Selector	
LC11C                                                                          ;
ldx      bank7_table0,y                ; 0x1c12c $C11C BE 5D C0                ;
lda      #$00                          ; 0x1c12f $C11F A9 00                   ; A = 00
sta      $0301,x                       ; 0x1c131 $C121 9D 01 03                ;
lda      #$FF                          ; 0x1c134 $C124 A9 FF                   ; A = FF
sta      L0302,x                       ; 0x1c136 $C126 9D 02 03                ;
lda      $0725                         ; 0x1c139 $C129 AD 25 07                ;; PPU Macro Selector	
LC12C                                                                          ;
sta      $0725                         ; 0x1c13c $C12C 8D 25 07                ;; PPU Macro Selector	
jsr      bank7_related_to_sound        ; 0x1c13f $C12F 20 C1 C1                ; related to sound
lda      $F7                           ; 0x1c142 $C132 A5 F7                   ; Controller 1 Buttons Held
sta      $0744                         ; 0x1c144 $C134 8D 44 07                ;; Controller 1 Input; Controller 1 Buttons Held
jsr      bank7_Controllers_Input       ; 0x1c147 $C137 20 46 D3                ; Controllers Input
lda      $DE                           ; 0x1c14a $C13A A5 DE                   ;;prevent movement/actions, occur when a chat is occuring; Spell Spell modifier (1 = Spell spell active) (and more)	;set to 1 to prevent moving, 0 to allow??
beq      LC146                         ; 0x1c14c $C13C F0 08                   ;
lda      $0763                         ; 0x1c14e $C13E AD 63 07                ;; Counter for Big Door in Hidden Kasuto
ora      $0764                         ; 0x1c151 $C141 0D 64 07                ;; Counter for Big Door in Hidden Kasuto
bne      LC14E                         ; 0x1c154 $C144 D0 08                   ;
LC146                                                                          ;
lda      $0729                         ; 0x1c156 $C146 AD 29 07                ;
beq      LC14E                         ; 0x1c159 $C149 F0 03                   ;
jsr      bank7_related_to_Pause_Pane_routine; 0x1c15b $C14B 20 CD C1           ; related to Pause Pane routine
LC14E                                                                          ;
lda      $074C                         ; 0x1c15e $C14E AD 4C 07                ;; Dialog Type (00 - None, 01 - Level Up, 02 - Talking); * related to Raft Animation * (and other events, like spell learning)
beq      LC164                         ; 0x1c161 $C151 F0 11                   ;
cmp      #$02                          ; 0x1c163 $C153 C9 02                   ;
bcc      LC1A8                         ; 0x1c165 $C155 90 51                   ;
lda      $0524                         ; 0x1c167 $C157 AD 24 05                ; Routine Index
cmp      #$03                          ; 0x1c16a $C15A C9 03                   ;
bcc      LC169                         ; 0x1c16c $C15C 90 0B                   ;
cmp      #$07                          ; 0x1c16e $C15E C9 07                   ;
bcs      LC169                         ; 0x1c170 $C160 B0 07                   ;
bcc      LC1A8                         ; 0x1c172 $C162 90 44                   ;
LC164                                                                          ;
lda      $0524                         ; 0x1c174 $C164 AD 24 05                ; Routine Index
bne      LC1A8                         ; 0x1c177 $C167 D0 3F                   ;
LC169                                                                          ;
ldx      #$0C                          ; 0x1c179 $C169 A2 0C                   ; X = 0C
dec      $0500                         ; 0x1c17b $C16B CE 00 05                ;; Timer frequency		;?Invincibility after stun counter (counts down, nonzero = invincible)
bpl      LC177                         ; 0x1c17e $C16E 10 07                   ;
lda      #$14                          ; 0x1c180 $C170 A9 14                   ; A = 14
sta      $0500                         ; 0x1c182 $C172 8D 00 05                ;; Timer frequency		;?Invincibility after stun counter (counts down, nonzero = invincible)
ldx      #$18                          ; 0x1c185 $C175 A2 18                   ; X = 18
LC177                                                                          ;
lda      $0501,x                       ; 0x1c187 $C177 BD 01 05                ;
beq      LC17F                         ; 0x1c18a $C17A F0 03                   ;
dec      $0501,x                       ; 0x1c18c $C17C DE 01 05                ; decrease all 5xx timers (if > 0)
LC17F                                                                          ;
dex                                    ; 0x1c18f $C17F CA                      ;
bpl      LC177                         ; 0x1c190 $C180 10 F5                   ;
inc       !$12                         ; 0x1c192 $C182 EE 12 00                ;
ldx      #$00                          ; 0x1c195 $C185 A2 00                   ; X = 00
ldy      #$09                          ; 0x1c197 $C187 A0 09                   ; Y = 09
lda      $051A                         ; 0x1c199 $C189 AD 1A 05                ;
and      #$02                          ; 0x1c19c $C18C 29 02                   ; keep bits .... ..x.
sta      $00                           ; 0x1c19e $C18E 85 00                   ;
lda      $051B                         ; 0x1c1a0 $C190 AD 1B 05                ;
and      #$02                          ; 0x1c1a3 $C193 29 02                   ; keep bits .... ..x.
eor      $00                           ; 0x1c1a5 $C195 45 00                   ;
clc                                    ; 0x1c1a7 $C197 18                      ;
beq      LC19B                         ; 0x1c1a8 $C198 F0 01                   ;
sec                                    ; 0x1c1aa $C19A 38                      ;
LC19B                                                                          ;
ror      $051A,x                       ; 0x1c1ab $C19B 7E 1A 05                ;
inx                                    ; 0x1c1ae $C19E E8                      ;
dey                                    ; 0x1c1af $C19F 88                      ;
bne      LC19B                         ; 0x1c1b0 $C1A0 D0 F9                   ;
jsr      bank7_Remove_All_Sprites_except_Sprite0; 0x1c1b2 $C1A2 20 50 D2       ; Remove All Sprites, except Sprite 0
jsr      LC2CA                         ; 0x1c1b5 $C1A5 20 CA C2                ;
LC1A8                                                                          ;
lda      $2002                         ; 0x1c1b8 $C1A8 AD 02 20                ; PPU Status Register
lda      $FF                           ; 0x1c1bb $C1AB A5 FF                   ;; Sprite Bank ?
ora      #$80                          ; 0x1c1bd $C1AD 09 80                   ; set bits  x... ....
sta      $FF                           ; 0x1c1bf $C1AF 85 FF                   ;; Sprite Bank ?
sta      $2000                         ; 0x1c1c1 $C1B1 8D 00 20                ; PPU Status Register
pla                                    ; 0x1c1c4 $C1B4 68                      ;
rti                                    ; 0x1c1c5 $C1B5 40                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_code2                                                                    ;
lda      $07AB                         ; 0x1c1c6 $C1B6 AD AB 07                ;
clc                                    ; 0x1c1c9 $C1B9 18                      ;
adc      #$D8                          ; 0x1c1ca $C1BA 69 D8                   ;
sta      $07AB                         ; 0x1c1cc $C1BC 8D AB 07                ;
bcc      LC1CC                         ; 0x1c1cf $C1BF 90 0B                   ;
bank7_related_to_sound                                                         ;
lda      #$06                          ; 0x1c1d1 $C1C1 A9 06                   ; A = 06
jsr      LFFCC                         ; 0x1c1d3 $C1C3 20 CC FF                ; bank switch routine
jsr      L9000                         ; 0x1c1d6 $C1C6 20 00 90                ;
jmp      bank7_Load_Bank_0_at_0x8000   ; 0x1c1d9 $C1C9 4C C5 FF                ; Load Bank 0
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC1CC                                                                          ;
rts                                    ; 0x1c1dc $C1CC 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_related_to_Pause_Pane_routine                                            ;
jsr      bank7_Load_Bank_0_at_0x8000   ; 0x1c1dd $C1CD 20 C5 FF                ; Load Bank 0
lda      $0736                         ; 0x1c1e0 $C1D0 AD 36 07                ; Game Mode
cmp      #$0B                          ; 0x1c1e3 $C1D3 C9 0B                   ; 0B = sidescroll mode
bne      LC220                         ; 0x1c1e5 $C1D5 D0 49                   ;
jsr      LC1DD                         ; 0x1c1e7 $C1D7 20 DD C1                ;
jmp      bank7_Load_Bank_769_at_0x8000 ; 0x1c1ea $C1DA 4C C9 FF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC1DD                                                                          ;
jsr      bank7_FUNCTION_CONVERT_706_and_707_to_Rx5plusW; 0x1c1ed $C1DD 20 30 CF; Region Code * 5 + World Code
cmp      #$01                          ; 0x1c1f0 $C1E0 C9 01                   ;
bne      LC206                         ; 0x1c1f2 $C1E2 D0 22                   ;
lda      $056B                         ; 0x1c1f4 $C1E4 AD 6B 05                ; Town Code
cmp      #$02                          ; 0x1c1f7 $C1E7 C9 02                   ;
bne      LC206                         ; 0x1c1f9 $C1E9 D0 1B                   ;
lda      $0561                         ; 0x1c1fb $C1EB AD 61 05                ; Area Code
cmp      #$06                          ; 0x1c1fe $C1EE C9 06                   ;
bne      LC206                         ; 0x1c200 $C1F0 D0 14                   ;
lda      $3B                           ; 0x1c202 $C1F2 A5 3B                   ; Link's X Position (high byte)
cmp      #$02                          ; 0x1c204 $C1F4 C9 02                   ;
bcc      LC206                         ; 0x1c206 $C1F6 90 0E                   ;
lda      $0796                         ; 0x1c208 $C1F8 AD 96 07                ; Down/Up Techs (and other things)
lsr                                    ; 0x1c20b $C1FB 4A                      ;
bcc      LC206                         ; 0x1c20c $C1FC 90 08                   ;
lda      #$01                          ; 0x1c20e $C1FE A9 01                   ; A = 01
sta      $0524                         ; 0x1c210 $C200 8D 24 05                ; Routine Index
jmp      bank0_unknown39               ; 0x1c213 $C203 4C AB A7                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC206                                                                          ;
lda      $0524                         ; 0x1c216 $C206 AD 24 05                ; Routine Index
beq      LC218                         ; 0x1c219 $C209 F0 0D                   ;
lda      $074C                         ; 0x1c21b $C20B AD 4C 07                ;; Dialog Type (00 - None, 01 - Level Up, 02 - Talking); * related to Raft Animation * (and other events, like spell learning)
cmp      #$02                          ; 0x1c21e $C20E C9 02                   ;
bcs      LC218                         ; 0x1c220 $C210 B0 06                   ;
jsr      bank7_Remove_All_Sprites_except_Sprite0; 0x1c222 $C212 20 50 D2       ; Remove All Sprites, except Sprite 0
jsr      Hub_Update_Routine            ; 0x1c225 $C215 20 8D 96                ;
LC218                                                                          ;
lda      $074C                         ; 0x1c228 $C218 AD 4C 07                ;; Dialog Type (00 - None, 01 - Level Up, 02 - Talking); * related to Raft Animation * (and other events, like spell learning)
bne      bank7_code3                   ; 0x1c22b $C21B D0 16                   ;
jmp      bank0_unknown28               ; 0x1c22d $C21D 4C 91 9D                ;jump from bank 7 to bank 0 for controller input, but this only occurs for side scroll mode
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC220                                                                          ;
lda      $0524                         ; 0x1c230 $C220 AD 24 05                ; Routine Index
ldy      $0567                         ; 0x1c233 $C223 AC 67 05                ; Related to Flute in Overworld
bne      LC23A                         ; 0x1c236 $C226 D0 12                   ;
jsr      bank7_PullAddrFromTableFollowingThisJSR_withIndexOfA_then_JMP; 0x1c238 $C228 20 85 D3;
bank7_pointer_table0                                                           ;
.word    LA256                         ; 0x1c23b $C22B 56 A2                   ;
.word    LA30F                         ; 0x1c23d $C22D 0F A3                   ;
.word    bank0_Manual_Save_Game_Routine_UP_AND_A; 0x1c23f $C22F 9C A1          ;
.word    LA334                         ; 0x1c241 $C231 34 A3                   ;
; ---------------------------------------------------------------------------- ;
bank7_code3                                                                    ;
cmp      #$02                          ; 0x1c243 $C233 C9 02                   ;
bcs      bank7_pointer_table1+$08      ; 0x1c245 $C235 B0 0E                   ;
jmp      bank0_unknown27               ; 0x1c247 $C237 4C 54 9D                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC23A                                                                          ;
jsr      bank7_PullAddrFromTableFollowingThisJSR_withIndexOfA_then_JMP; 0x1c24a $C23A 20 85 D3;
bank7_pointer_table1                                                           ;
.word    LA199                         ; 0x1c24d $C23D 99 A1                   ;
.word    LA315                         ; 0x1c24f $C23F 15 A3                   ;
.word    LA329                         ; 0x1c251 $C241 29 A3                   ;
.word    LA338                         ; 0x1c253 $C243 38 A3                   ;
.word    L05C9                         ; 0x1c255 $C245 C9 05                   ;
.word    LD7B0                         ; 0x1c257 $C247 B0 D7                   ;
; ---------------------------------------------------------------------------- ;
bank7_code4                                                                    ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1c259 $C249 20 C9 FF                ; Load Bank $0769
jmp      LB082                         ; 0x1c25c $C24C 4C 82 B0                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC24F                                                                          ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1c25f $C24F 20 C9 FF                ; Load Bank $0769
jsr      LC258                         ; 0x1c262 $C252 20 58 C2                ;
jmp      bank7_Load_Bank_0_at_0x8000   ; 0x1c265 $C255 4C C5 FF                ; Load Bank 0
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC258                                                                          ;
lda      (L000E),y                     ; 0x1c268 $C258 B1 0E                   ;
sta      $053E,x                       ; 0x1c26a $C25A 9D 3E 05                ;; Tiles for Dialog Box Rows
iny                                    ; 0x1c26d $C25D C8                      ;
lda      (L000E),y                     ; 0x1c26e $C25E B1 0E                   ;
sta      $054C,x                       ; 0x1c270 $C260 9D 4C 05                ;; Tiles for Dialog Box Rows
inx                                    ; 0x1c273 $C263 E8                      ;
rts                                    ; 0x1c274 $C264 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Pointer_table_for_Item_Presence                                          ;
.word    L0600                         ; 0x1c275 $C265 00 06                   ;West Hyrule
.word    L0660                         ; 0x1c277 $C267 60 06                   ;Towns in West Hyrule
.word    L0660                         ; 0x1c279 $C269 60 06                   ;
.word    L0680                         ; 0x1c27b $C26B 80 06                   ;Palace 1 / Palace 2
.word    L06A0                         ; 0x1c27d $C26D A0 06                   ;Palace 3
.word    L0620                         ; 0x1c27f $C26F 20 06                   ;Death Mountain / Maze Island
.word    L0660                         ; 0x1c281 $C271 60 06                   ;
.word    L0660                         ; 0x1c283 $C273 60 06                   ;
.word    L0680                         ; 0x1c285 $C275 80 06                   ;
.word    L06A0                         ; 0x1c287 $C277 A0 06                   ;Palace 4
.word    L0640                         ; 0x1c289 $C279 40 06                   ;East Hyrule
.word    L0660                         ; 0x1c28b $C27B 60 06                   ;
.word    L0660                         ; 0x1c28d $C27D 60 06                   ;Towns in East Hyrule
.word    L0680                         ; 0x1c28f $C27F 80 06                   ;Palace 5
.word    L06A0                         ; 0x1c291 $C281 A0 06                   ;Palace 6
.word    L06C0                         ; 0x1c293 $C283 C0 06                   ;Palace 7
; ---------------------------------------------------------------------------- ;
bank7_Tables_for_Various_Bitmasks1                                             ;
.byt    $F7,$FB,$FD,$FE                ; 0x1c295 $C285 F7 FB FD FE             ;
LC289                                                                          ;
.byt    $7F,$BF,$DF,$EF                ; 0x1c299 $C289 7F BF DF EF             ;
LC28D                                                                          ;
.byt    $08,$04,$02,$01                ; 0x1c29d $C28D 08 04 02 01             ;
LC291                                                                          ;
.byt    $80,$40,$20,$10                ; 0x1c2a1 $C291 80 40 20 10             ;
; ---------------------------------------------------------------------------- ;
Set_Item_RAM_bit_to_0__Bits_0_3                                                ;
jsr      LC2B3                         ; 0x1c2a5 $C295 20 B3 C2                ;
bcc      Set_Item_RAM_bit_to_0__Bits_4_7; 0x1c2a8 $C298 90 06                  ;
and      bank7_Tables_for_Various_Bitmasks1,x; 0x1c2aa $C29A 3D 85 C2          ;
sta      ($00),y                       ; 0x1c2ad $C29D 91 00                   ;
rts                                    ; 0x1c2af $C29F 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
Set_Item_RAM_bit_to_0__Bits_4_7                                                ;
and      LC289,x                       ; 0x1c2b0 $C2A0 3D 89 C2                ;
sta      ($00),y                       ; 0x1c2b3 $C2A3 91 00                   ;
rts                                    ; 0x1c2b5 $C2A5 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC2A6                                                                          ;
jsr      LC2B3                         ; 0x1c2b6 $C2A6 20 B3 C2                ;
bcc      LC2AF                         ; 0x1c2b9 $C2A9 90 04                   ;
and      LC28D,x                       ; 0x1c2bb $C2AB 3D 8D C2                ;
rts                                    ; 0x1c2be $C2AE 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC2AF                                                                          ;
and      LC291,x                       ; 0x1c2bf $C2AF 3D 91 C2                ;
rts                                    ; 0x1c2c2 $C2B2 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC2B3                                                                          ;
jsr      bank7_FUNCTION_CONVERT_706_and_707_to_Rx5plusW; 0x1c2c3 $C2B3 20 30 CF; Region Code * 5 + World Code
asl                                    ; 0x1c2c6 $C2B6 0A                      ;
tay                                    ; 0x1c2c7 $C2B7 A8                      ;
lda      bank7_Pointer_table_for_Item_Presence,y; 0x1c2c8 $C2B8 B9 65 C2       ;
sta      $00                           ; 0x1c2cb $C2BB 85 00                   ;
lda      bank7_Pointer_table_for_Item_Presence+$01,y; 0x1c2cd $C2BD B9 66 C2   ;
sta      $01                           ; 0x1c2d0 $C2C0 85 01                   ;
lda      $0561                         ; 0x1c2d2 $C2C2 AD 61 05                ; Area Code
lsr                                    ; 0x1c2d5 $C2C5 4A                      ; 4 bits per Area for Items
tay                                    ; 0x1c2d6 $C2C6 A8                      ;
lda      ($00),y                       ; 0x1c2d7 $C2C7 B1 00                   ;
rts                                    ; 0x1c2d9 $C2C9 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC2CA                                                                          ;
ldy      #$00                          ; 0x1c2da $C2CA A0 00                   ; Y = 00
sty      $0727                         ; 0x1c2dc $C2CC 8C 27 07                ;
sty      $0729                         ; 0x1c2df $C2CF 8C 29 07                ;
jsr      LD174                         ; 0x1c2e2 $C2D2 20 74 D1                ;
jsr      bank7_PullAddrFromTableFollowingThisJSR_withIndexOfA_then_JMP; 0x1c2e5 $C2D5 20 85 D3;
bank7_pointer_table2                                                           ;
.word    LC34F                         ; 0x1c2e8 $C2D8 4F C3                   ;
.word    bank7_code5                   ; 0x1c2ea $C2DA E6 C2                   ;
.word    bank7_code6                   ; 0x1c2ec $C2DC 1E C3                   ;
.word    LCB27                         ; 0x1c2ee $C2DE 27 CB                   ;
.word    LC364                         ; 0x1c2f0 $C2E0 64 C3                   ;
.word    LC38D                         ; 0x1c2f2 $C2E2 8D C3                   ;
.word    LC410                         ; 0x1c2f4 $C2E4 10 C4                   ;
; ---------------------------------------------------------------------------- ;
bank7_code5                                                                    ;
jsr      LD168                         ; 0x1c2f6 $C2E6 20 68 D1                ;
jsr      bank7_PullAddrFromTableFollowingThisJSR_withIndexOfA_then_JMP; 0x1c2f9 $C2E9 20 85 D3;
bank7_pointer_table__game_mode                                                 ;
;Probably Bank 0 for addresses in the 8000-BFFF range                          ;
.word    bank7_code18                  ; 0x1c2fc $C2EC 40 CD                   ; 00	Load ROM bank, Overworld data, enemy data, etc.  
.word    bank7_go_outside              ; 0x1c2fe $C2EE B3 CC                   ; 01	Overworld Out of Area ?
.word    Initialization_stuff          ; 0x1c300 $C2F0 49 81                   ; 02	Overworld Init
.word    overworld4                    ; 0x1c302 $C2F2 F3 87                   ; 03	Overworld Load Map Tiles
.word    LC72D                         ; 0x1c304 $C2F4 2D C7                   ; 04	Set $0726 to 0 and Increment Game Mode
.word    overworld3                    ; 0x1c306 $C2F6 58 85                   ; 05	Overworld Main
.word    bank7_code17                  ; 0x1c308 $C2F8 35 CB                   ; 06	Load Side View Area
.word    bank7_code12                  ; 0x1c30a $C2FA A4 C4                   ; 07	Set Routine Index to 0 and Increment Game Mode
.word    LC6EE                         ; 0x1c30c $C2FC EE C6                   ; 08	RTS
.word    LCF3C                         ; 0x1c30e $C2FE 3C CF                   ; 09	Side View Area Drawing Init
.word    LC62F                         ; 0x1c310 $C300 2F C6                   ; 0A	Switch Graphics Bank, Load Bank 0, Side View Init
.word    bank7_check_if_link_died_0494__linkdeath; 0x1c312 $C302 CC D3         ; 0B	Side View Main
.word    LC68A                         ; 0x1c314 $C304 8A C6                   ; 0C	Fall in Hole Init
.word    LA82A                         ; 0x1c316 $C306 2A A8                   ; 0D	Fall in Hole Tile Setup
.word    bank7_Related_to_Link_falling ; 0x1c318 $C308 EF C6                   ; 0E	Fall in Hole Setup
.word    L8FB7                         ; 0x1c31a $C30A B7 8F                   ; 0F	Fall in Hole Main
.word    bank7_take_side_exit          ; 0x1c31c $C30C 4C CF                   ; 10
.word    bank7_code9                   ; 0x1c31e $C30E 97 C3                   ; 11
.word    LC63E                         ; 0x1c320 $C310 3E C6                   ; 12	Increment Game Mode and execute Game Mode 0C
.word    bank7_take_elevator_exit      ; 0x1c322 $C312 44 C6                   ; 13
.word    LC6EE                         ; 0x1c324 $C314 EE C6                   ; 14	RTS
.word    LC70C                         ; 0x1c326 $C316 0C C7                   ; 15
.word    bank7_take_door_exit          ; 0x1c328 $C318 FC CF                   ; 16	Enter Door in Town
.word    bank0_unknown2                ; 0x1c32a $C31A B1 81                   ; 17	Raft Travel Init
.word    bank0_unknown4                ; 0x1c32c $C31C 07 82                   ; 18	Raft Travel
; ---------------------------------------------------------------------------- ;
bank7_code6                                                                    ;
jsr      LD168                         ; 0x1c32e $C31E 20 68 D1                ;
jsr      bank7_PullAddrFromTableFollowingThisJSR_withIndexOfA_then_JMP; 0x1c331 $C321 20 85 D3;
bank7_pointer_table4                                                           ;
.word    LC722                         ; 0x1c334 $C324 22 C7                   ;
.word    LD042                         ; 0x1c336 $C326 42 D0                   ;
.word    flashing_effect__length__when_link_dies; 0x1c338 $C328 1A C7          ;
.word    LC9EE                         ; 0x1c33a $C32A EE C9                   ;
.word    LCA1B                         ; 0x1c33c $C32C 1B CA                   ;
.word    LC722                         ; 0x1c33e $C32E 22 C7                   ;
.word    LD04D                         ; 0x1c340 $C330 4D D0                   ;
.word    LC72D                         ; 0x1c342 $C332 2D C7                   ;
.word    LCF05                         ; 0x1c344 $C334 05 CF                   ; Increment Game Mode by 1
.word    LCA85                         ; 0x1c346 $C336 85 CA                   ;
.word    bank7_code53                  ; 0x1c348 $C338 76 FE                   ;
.word    bank7_code7                   ; 0x1c34a $C33A 3C C3                   ;
; ---------------------------------------------------------------------------- ;
bank7_code7                                                                    ;
lda      #$05                          ; 0x1c34c $C33C A9 05                   ; A = 05
jsr      LFFCC                         ; 0x1c34e $C33E 20 CC FF                ;
jsr      bank7_chr_bank_switch__load_A ; 0x1c351 $C341 20 B1 FF                ;
lda      #$80                          ; 0x1c354 $C344 A9 80                   ; A = 80
sta      $0100                         ; 0x1c356 $C346 8D 00 01                ;
lda      #$00                          ; 0x1c359 $C349 A9 00                   ; A = 00
sta      $076C                         ; 0x1c35b $C34B 8D 6C 07                ;; (00=restart from zelda's castle with 3 lives,  01=no routine, 02=die, 03=wake up zelda, 04=roll credits, 06=show the lives then restart the scene)
rts                                    ; 0x1c35e $C34E 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC34F                                                                          ;
jsr      bank7_Load_Bank_0_at_0x8000   ; 0x1c35f $C34F 20 C5 FF                ;
jsr      LD293                         ; 0x1c362 $C352 20 93 D2                ;
jsr      startup_init_begin_game       ; 0x1c365 $C355 20 08 AA                ;
bank7_Reset_Number_of_Lives__to_3_                                             ;
lda      #$03                          ; 0x1c368 $C358 A9 03                   ; A = 03
sta      $0700                         ; 0x1c36a $C35A 8D 00 07                ; Current number of lives
inc      $0760                         ; 0x1c36d $C35D EE 60 07                ;
LC360                                                                          ;
inc      $076C                         ; 0x1c370 $C360 EE 6C 07                ;; (00=restart from zelda's castle with 3 lives,  01=no routine, 02=die, 03=wake up zelda, 04=roll credits, 06=show the lives then restart the scene)
rts                                    ; 0x1c373 $C363 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC364                                                                          ;
jsr      LD168                         ; 0x1c374 $C364 20 68 D1                ;
jsr      bank7_PullAddrFromTableFollowingThisJSR_withIndexOfA_then_JMP; 0x1c377 $C367 20 85 D3;
bank7_pointer_table5                                                           ;
.word    bank7_code8                   ; 0x1c37a $C36A 76 C3                   ;
.word    bank7_code13                  ; 0x1c37c $C36C CB C4                   ;
.word    LCF3C                         ; 0x1c37e $C36E 3C CF                   ;
.word    LC37C                         ; 0x1c380 $C370 7C C3                   ;
.word    LC62F                         ; 0x1c382 $C372 2F C6                   ;
.word    LC382                         ; 0x1c384 $C374 82 C3                   ;
; ---------------------------------------------------------------------------- ;
bank7_code8                                                                    ;
jsr      LC388                         ; 0x1c386 $C376 20 88 C3                ;
jmp      L8B50                         ; 0x1c389 $C379 4C 50 8B                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC37C                                                                          ;
jsr      LC388                         ; 0x1c38c $C37C 20 88 C3                ;
jmp      L8B69                         ; 0x1c38f $C37F 4C 69 8B                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC382                                                                          ;
jsr      LC388                         ; 0x1c392 $C382 20 88 C3                ;
jmp      L8BBF                         ; 0x1c395 $C385 4C BF 8B                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC388                                                                          ;
lda      #$05                          ; 0x1c398 $C388 A9 05                   ; A = 05
jmp      LFFCC                         ; 0x1c39a $C38A 4C CC FF                ; Switch to Bank 5
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC38D                                                                          ;
jsr      LD168                         ; 0x1c39d $C38D 20 68 D1                ;
jsr      bank7_PullAddrFromTableFollowingThisJSR_withIndexOfA_then_JMP; 0x1c3a0 $C390 20 85 D3;
bank7_pointer_table6                                                           ;
.word    LCD19                         ; 0x1c3a3 $C393 19 CD                   ;
.word    bank7_code7                   ; 0x1c3a5 $C395 3C C3                   ;
; ---------------------------------------------------------------------------- ;
bank7_code9                                                                    ;
jsr      LD15C                         ; 0x1c3a7 $C397 20 5C D1                ;
jsr      bank7_PullAddrFromTableFollowingThisJSR_withIndexOfA_then_JMP; 0x1c3aa $C39A 20 85 D3;
; Pointer table for "Ready..." Screen Routines (4 * 2 = 8 bytes)               ;
; Uses Routine Index $0738                                                     ;
bank7_pointer_table7                                                           ;
.word    bank7_code10                  ; 0x1c3ad $C39D A5 C3                   ;
.word    bank7_Load_Lives_Remaining_Screen; 0x1c3af $C39F B5 C3                ;
.word    LC3E6                         ; 0x1c3b1 $C3A1 E6 C3                   ;
.word    LC3ED                         ; 0x1c3b3 $C3A3 ED C3                   ;
; ---------------------------------------------------------------------------- ;
bank7_code10                                                                   ;
lda      #$0C                          ; 0x1c3b5 $C3A5 A9 0C                   ; A = 0C
sta      $0725                         ; 0x1c3b7 $C3A7 8D 25 07                ;; PPU Macro Selector	
lda      #$00                          ; 0x1c3ba $C3AA A9 00                   ; A = 00
sta      $0760                         ; 0x1c3bc $C3AC 8D 60 07                ;
inc      $0726                         ; 0x1c3bf $C3AF EE 26 07                ;;?which is the black transition screen when loading a battle scene.  It hides the loading gfx.; Dialog Box Drawing Flag (00-01) Toggles while a dialog box is being drawn.
jmp      LC3E2                         ; 0x1c3c2 $C3B2 4C E2 C3                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Load_Lives_Remaining_Screen                                              ;
lda      $076E                         ; 0x1c3c5 $C3B5 AD 6E 07                ; Graphics bank to use
jsr      bank7_chr_bank_switch__load_A ; 0x1c3c8 $C3B8 20 B1 FF                ;
jsr      bank7_Erase_Name_Tables_0and1__set_scroll_to_0_0; 0x1c3cb $C3BB 20 66 D2;
ldy      #$13                          ; 0x1c3ce $C3BE A0 13                   ; Y = 13
LC3C0                                                                          ;
lda      $6958,y                       ; 0x1c3d0 $C3C0 B9 58 69                ;
sta      L0302,y                       ; 0x1c3d3 $C3C3 99 02 03                ;
dey                                    ; 0x1c3d6 $C3C6 88                      ;
bpl      LC3C0                         ; 0x1c3d7 $C3C7 10 F7                   ;
ldy      #$07                          ; 0x1c3d9 $C3C9 A0 07                   ; Y = 07
LC3CB                                                                          ;
lda      $07A1,y                       ; 0x1c3db $C3CB B9 A1 07                ;
sta      $0305,y                       ; 0x1c3de $C3CE 99 05 03                ;
dey                                    ; 0x1c3e1 $C3D1 88                      ;
bpl      LC3CB                         ; 0x1c3e2 $C3D2 10 F7                   ;
lda      $0700                         ; 0x1c3e4 $C3D4 AD 00 07                ; Current number of lives
clc                                    ; 0x1c3e7 $C3D7 18                      ;
adc      #$D0                          ; 0x1c3e8 $C3D8 69 D0                   ;
sta      $0314                         ; 0x1c3ea $C3DA 8D 14 03                ;
lda      #$70                          ; 0x1c3ed $C3DD A9 70                   ; A = 70
sta      $0501                         ; 0x1c3ef $C3DF 8D 01 05                ; delay for screen showing up
LC3E2                                                                          ;
inc      $0738                         ; 0x1c3f2 $C3E2 EE 38 07                ;
rts                                    ; 0x1c3f5 $C3E5 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC3E6                                                                          ;
lda      #$00                          ; 0x1c3f6 $C3E6 A9 00                   ; A = 00
sta      $0726                         ; 0x1c3f8 $C3E8 8D 26 07                ;;?which is the black transition screen when loading a battle scene.  It hides the loading gfx.; Dialog Box Drawing Flag (00-01) Toggles while a dialog box is being drawn.
beq      LC3E2                         ; 0x1c3fb $C3EB F0 F5                   ;
LC3ED                                                                          ;
lda      $0501                         ; 0x1c3fd $C3ED AD 01 05                ;; Timer
bne      LC3F5                         ; 0x1c400 $C3F0 D0 03                   ;while timer continues, display screen, otherwise increment game mode to resume gameplay
inc      $0736                         ; 0x1c402 $C3F2 EE 36 07                ;; Game Mode ; screen intro type
LC3F5                                                                          ;
lda      #$50                          ; 0x1c405 $C3F5 A9 50                   ; A = 50
sta      $29                           ; 0x1c407 $C3F7 85 29                   ; Link's Y Position (on "Get Ready" screen)
lda      #$78                          ; 0x1c409 $C3F9 A9 78                   ; A = 78
sta      $CC                           ; 0x1c40b $C3FB 85 CC                   ; Link's X Position on Screen
lda      #$03                          ; 0x1c40d $C3FD A9 03                   ; A = 03
sta      $80                           ; 0x1c40f $C3FF 85 80                   ; Current Animation Frame for Link
lsr                                    ; 0x1c411 $C401 4A                      ;
sta      $9F                           ; 0x1c412 $C402 85 9F                   ; Direction arrow pressed (1 = right, 2 = left)
lsr                                    ; 0x1c414 $C404 4A                      ;
sta      $C8                           ; 0x1c415 $C405 85 C8                   ;; go outside: set $c8 to 3
sta      $13                           ; 0x1c417 $C407 85 13                   ;; Fairy state (0 = Not in Fairy state)	faery, flip from 8=faery,0=link (set $076F to 0, then set $13 to 0)	setting 76F to ff, changes 76F to 3B which prevents changing $13 from 8 to 0
sta      $11                           ; 0x1c419 $C409 85 11                   ;
sta      $90                           ; 0x1c41b $C40B 85 90                   ;
jmp      LEC02                         ; 0x1c41d $C40D 4C 02 EC                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC410                                                                          ;
jsr      LD15C                         ; 0x1c420 $C410 20 5C D1                ;
jsr      bank7_PullAddrFromTableFollowingThisJSR_withIndexOfA_then_JMP; 0x1c423 $C413 20 85 D3;
bank7_pointer_table8                                                           ;
.word    bank7_code10                  ; 0x1c426 $C416 A5 C3                   ;
.word    bank7_Load_Lives_Remaining_Screen; 0x1c428 $C418 B5 C3                ;
.word    LC3E6                         ; 0x1c42a $C41A E6 C3                   ;
.word    bank7_code11                  ; 0x1c42c $C41C 1E C4                   ;
; ---------------------------------------------------------------------------- ;
bank7_code11                                                                   ;
lda      $0501                         ; 0x1c42e $C41E AD 01 05                ;; Timer
bne      LC446                         ; 0x1c431 $C421 D0 23                   ;
lda      #$02                          ; 0x1c433 $C423 A9 02                   ; A = 02
ldy      $0707                         ; 0x1c435 $C425 AC 07 07                ; Current World
beq      LC435                         ; 0x1c438 $C428 F0 0B                   ;
cpy      #$03                          ; 0x1c43a $C42A C0 03                   ;
bcs      LC436                         ; 0x1c43c $C42C B0 08                   ;
ldy      $056B                         ; 0x1c43e $C42E AC 6B 05                ;; Town Code	;used by wise man to pick magic to give?
cpy      #$07                          ; 0x1c441 $C431 C0 07                   ;
bne      LC436                         ; 0x1c443 $C433 D0 01                   ;
LC435                                                                          ;
asl                                    ; 0x1c445 $C435 0A                      ;
LC436                                                                          ;
sta      $075F                         ; 0x1c446 $C436 8D 5F 07                ;;at bank0: 0D64: AD 5F07	LDA $075F	then 	STA $EB		; Music Channel	; something to do with music
lda      #$01                          ; 0x1c449 $C439 A9 01                   ; A = 01
sta      $076C                         ; 0x1c44b $C43B 8D 6C 07                ;; (00=restart from zelda's castle with 3 lives,  01=no routine, 02=die, 03=wake up zelda, 04=roll credits, 06=show the lives then restart the scene)
sta      $076D                         ; 0x1c44e $C43E 8D 6D 07                ;
lda      #$07                          ; 0x1c451 $C441 A9 07                   ; A = 07
sta      $0736                         ; 0x1c453 $C443 8D 36 07                ; Game Mode
LC446                                                                          ;
jmp      LC3F5                         ; 0x1c456 $C446 4C F5 C3                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_table9                                                                   ;
.byt    $3F,$00,$04,$0F,$30,$12,$16    ; 0x1c459 $C449 3F 00 04 0F 30 12 16    ;PPU Address 3F00, transfer 4 bytes
                                                                               ;
.byt    $3F,$10,$04,$0F,$18,$36,$2A    ; 0x1c460 $C450 3F 10 04 0F 18 36 2A    ;PPU Address 3F10, transfer 4 bytes
                                                                               ;
.byt    $FF                            ; 0x1c467 $C457 FF                      ;
bank7_Table_for_Overworld_Palettes                                             ;
.byt    $3F,$00,$20                    ; 0x1c468 $C458 3F 00 20                ;PPU Address 3F00, transfer 20 bytes
                                                                               ;
.byt    $0F,$30,$29,$19                ; 0x1c46b $C45B 0F 30 29 19             ;Overworld Palette Code 0
                                                                               ;
.byt    $0F,$30,$28,$17                ; 0x1c46f $C45F 0F 30 28 17             ;Overworld Palette Code 1
                                                                               ;
.byt    $0F,$30,$28,$00                ; 0x1c473 $C463 0F 30 28 00             ;Overworld Palette Code 2
                                                                               ;
.byt    $0F,$30,$36,$21                ; 0x1c477 $C467 0F 30 36 21             ;Overworld Palette Code 3
                                                                               ;
.byt    $0F,$18,$36,$2A                ; 0x1c47b $C46B 0F 18 36 2A             ;Overworld Sprites Code 0 (black color of tiles + left border)
                                                                               ;
.byt    $0F,$0F,$0F,$0F                ; 0x1c47f $C46F 0F 0F 0F 0F             ;Overworld Sprites Code 1 (right border of the screen)
                                                                               ;
.byt    $0F,$30,$16,$0F                ; 0x1c483 $C473 0F 30 16 0F             ;Overworld Sprites Code 2 (Demons)
                                                                               ;
.byt    $0F,$16,$27,$30                ; 0x1c487 $C477 0F 16 27 30             ;Overworld Sprites Code 3 (Fairy)                               
                                                                               ;
.byt    $FF                            ; 0x1c48b $C47B FF                      ;
bank7_table10                                                                  ;
.byt    $3F,$00,$10                    ; 0x1c48c $C47C 3F 00 10                ;PPU Address 3F00, transfer 10 bytes	Maybe for Last Boss, Link's Shadow ?
                                                                               ;
.byt    $14,$30,$12,$16,$14,$0F,$0F,$0F; 0x1c48f $C47F 14 30 12 16 14 0F 0F 0F ;
.byt    $14,$0F,$0F,$0F,$14,$0F,$0F,$0F; 0x1c497 $C487 14 0F 0F 0F 14 0F 0F 0F ;
.byt    $FF                            ; 0x1c49f $C48F FF                      ;
LC490                                                                          ;
.byt    $3F,$00,$10,$0F,$30,$12,$16,$0F; 0x1c4a0 $C490 3F 00 10 0F 30 12 16 0F ;
.byt    $07,$27,$37,$0F,$07,$16,$30,$0F; 0x1c4a8 $C498 07 27 37 0F 07 16 30 0F ;
.byt    $3C,$1C,$0C,$FF                ; 0x1c4b0 $C4A0 3C 1C 0C FF             ;
; ---------------------------------------------------------------------------- ;
bank7_code12                                                                   ;
jmp      LC722                         ; 0x1c4b4 $C4A4 4C 22 C7                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Extra_Background_Layers__Bushes__Grass__etc                              ;
.byt    $40,$83,$84,$4C,$40,$40,$40,$40; 0x1c4b7 $C4A7 40 83 84 4C 40 40 40 40 ;Layer Tile Codes (8 bytes)
LC4AF                                                                          ;
.byt    $00,$90,$A0,$20,$00,$00,$00,$00; 0x1c4bf $C4AF 00 90 A0 20 00 00 00 00 ;Layer Row Heights (8 bytes)
LC4B7                                                                          ;
.byt    $01,$03,$03,$04,$04,$05        ; 0x1c4c7 $C4B7 01 03 03 04 04 05       ;Table related to Bank Switch (6 bytes)
LC4BD                                                                          ;
.byt    $00,$00,$00,$00,$02,$00        ; 0x1c4cd $C4BD 00 00 00 00 02 00       ;Area and Enemy Pointer Offsets (6 bytes)
; ---------------------------------------------------------------------------- ;
bank7_Pointer_table_for_Area_and_Enemy_Pointers                                ;
.word    L8523                         ; 0x1c4d3 $C4C3 23 85                   ;West Hyrule - Area Pointers
.word    LA000                         ; 0x1c4d5 $C4C5 00 A0                   ;Death Mountain - Area Pointers
.word    L85A1                         ; 0x1c4d7 $C4C7 A1 85                   ;West Hyrule - Enemy Pointers
.word    LA07E                         ; 0x1c4d9 $C4C9 7E A0                   ;Death Moutain - Enemy Pointers
; ---------------------------------------------------------------------------- ;
bank7_code13                                                                   ;
lda      #$30                          ; 0x1c4db $C4CB A9 30                   ; A = 30
sta      $2000                         ; 0x1c4dd $C4CD 8D 00 20                ;
lda      #$0E                          ; 0x1c4e0 $C4D0 A9 0E                   ; A = 0E
jsr      bank7_Config_Register         ; 0x1c4e2 $C4D2 20 9D FF                ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1c4e5 $C4D5 20 C9 FF                ;
lda      $FF                           ; 0x1c4e8 $C4D8 A5 FF                   ;; Sprite Bank ?
sta      $2000                         ; 0x1c4ea $C4DA 8D 00 20                ;
jsr      bank7_Set_Memory_200_4FF_and_00_DF_to_Zero; 0x1c4ed $C4DD 20 9C D2    ; Set Memory 200-4FF and 00-DF to Zero
sta       !$FD                         ; 0x1c4f0 $C4E0 8D FD 00                ;
sta      $0747                         ; 0x1c4f3 $C4E3 8D 47 07                ;
sta      $072A                         ; 0x1c4f6 $C4E6 8D 2A 07                ; Scrolling Offset High Byte
sta      $072B                         ; 0x1c4f9 $C4E9 8D 2B 07                ;
sta      $0732                         ; 0x1c4fc $C4EC 8D 32 07                ;
sta      $0734                         ; 0x1c4ff $C4EF 8D 34 07                ;
sta      $0733                         ; 0x1c502 $C4F2 8D 33 07                ;
sta      $0735                         ; 0x1c505 $C4F5 8D 35 07                ;
sta      $0763                         ; 0x1c508 $C4F8 8D 63 07                ; Counter for Big Door in Hidden Kasuto
sta      $0764                         ; 0x1c50b $C4FB 8D 64 07                ; Counter for Big Door in Hidden Kasuto
;Get Area Data Pointer Address (00-01)                                         ;
;And Enemy Data Pointer Address (02-03)                                        ;
ldy      $0707                         ; 0x1c50e $C4FE AC 07 07                ; Current World
bne      LC50C                         ; 0x1c511 $C501 D0 09                   ;
lda      $0706                         ; 0x1c513 $C503 AD 06 07                ; Current Region
cmp      #$01                          ; 0x1c516 $C506 C9 01                   ;
bne      LC50C                         ; 0x1c518 $C508 D0 02                   ;
ldy      #$04                          ; 0x1c51a $C50A A0 04                   ; Y = 04
LC50C                                                                          ;
lda      LC4BD,y                       ; 0x1c51c $C50C B9 BD C4                ;
tay                                    ; 0x1c51f $C50F A8                      ;
lda      bank7_Pointer_table_for_Area_and_Enemy_Pointers,y; 0x1c520 $C510 B9 C3 C4;
sta      $00                           ; 0x1c523 $C513 85 00                   ;
lda      bank7_Pointer_table_for_Area_and_Enemy_Pointers+$01,y; 0x1c525 $C515 B9 C4 C4;
sta      $01                           ; 0x1c528 $C518 85 01                   ;
lda      bank7_Pointer_table_for_Area_and_Enemy_Pointers+$01+$03,y; 0x1c52a $C51A B9 C7 C4;
sta      $02                           ; 0x1c52d $C51D 85 02                   ;
lda      bank7_Pointer_table_for_Area_and_Enemy_Pointers+$01+$03+$01,y; 0x1c52f $C51F B9 C8 C4;
sta      $03                           ; 0x1c532 $C522 85 03                   ;
;Get Area Data Address (D4-D5)                                                 ;
;And Enemy Data Address (D6-D7)                                                ;
lda      $0561                         ; 0x1c534 $C524 AD 61 05                ; Area Code
asl                                    ; 0x1c537 $C527 0A                      ;
tay                                    ; 0x1c538 $C528 A8                      ;
lda      ($00),y                       ; 0x1c539 $C529 B1 00                   ;
sta      $D4                           ; 0x1c53b $C52B 85 D4                   ;
lda      ($02),y                       ; 0x1c53d $C52D B1 02                   ;
sta      $D6                           ; 0x1c53f $C52F 85 D6                   ;
iny                                    ; 0x1c541 $C531 C8                      ;
lda      ($00),y                       ; 0x1c542 $C532 B1 00                   ;
sta      $D5                           ; 0x1c544 $C534 85 D5                   ;
lda      ($02),y                       ; 0x1c546 $C536 B1 02                   ;
sta      $D7                           ; 0x1c548 $C538 85 D7                   ;
lda      $075A                         ; 0x1c54a $C53A AD 5A 07                ;
pha                                    ; 0x1c54d $C53D 48                      ;
cmp      #$02                          ; 0x1c54e $C53E C9 02                   ;
bcc      LC551                         ; 0x1c550 $C540 90 0F                   ;
;If $75A >= 2, advance Enemy Data Address to next area		                       ;007
;Probably related to Demon hit on the Overworld                                ;
ldy      #$00                          ; 0x1c552 $C542 A0 00                   ; Y = 00
lda      $D6                           ; 0x1c554 $C544 A5 D6                   ;
clc                                    ; 0x1c556 $C546 18                      ;
adc      ($D6),y                       ; 0x1c557 $C547 71 D6                   ;
sta      $D6                           ; 0x1c559 $C549 85 D6                   ;
lda      $D7                           ; 0x1c55b $C54B A5 D7                   ;
adc      #$00                          ; 0x1c55d $C54D 69 00                   ;
sta      $D7                           ; 0x1c55f $C54F 85 D7                   ;
LC551                                                                          ;
pla                                    ; 0x1c561 $C551 68                      ;
beq      bank7_Initial_Fill_of_Background_Tiles__Side_View; 0x1c562 $C552 F0 14;
;If $75A == 1, do the following...                                             ;
ldy      #$01                          ; 0x1c564 $C554 A0 01                   ; Y = 01
LC556                                                                          ;
tya                                    ; 0x1c566 $C556 98                      ;
ldy      #$00                          ; 0x1c567 $C557 A0 00                   ; Y = 00
cmp      ($D6),y                       ; 0x1c569 $C559 D1 D6                   ;
bcs      bank7_Initial_Fill_of_Background_Tiles__Side_View; 0x1c56b $C55B B0 0B;
tay                                    ; 0x1c56d $C55D A8                      ;
lda      ($D6),y                       ; 0x1c56e $C55E B1 D6                   ;
and      #$7F                          ; 0x1c570 $C560 29 7F                   ; keep bits .xxx xxxx
sta      ($D6),y                       ; 0x1c572 $C562 91 D6                   ;
iny                                    ; 0x1c574 $C564 C8                      ;
iny                                    ; 0x1c575 $C565 C8                      ;
bne      LC556                         ; 0x1c576 $C566 D0 EE                   ;
bank7_Initial_Fill_of_Background_Tiles__Side_View                              ;
;If Ground Type (Header Byte 2 & 0x70) is 0, use Tile Code 42                  ;
;Else use Tile Code 40                                                         ;
ldx      #$40                          ; 0x1c578 $C568 A2 40                   ; X = 40
ldy      #$02                          ; 0x1c57a $C56A A0 02                   ; Y = 02
lda      ($D4),y                       ; 0x1c57c $C56C B1 D4                   ; Area Header Byte 2
and      #$70                          ; 0x1c57e $C56E 29 70                   ; keep bits .xxx ....
bne      LC574                         ; 0x1c580 $C570 D0 02                   ;
ldx      #$42                          ; 0x1c582 $C572 A2 42                   ; X = 42
LC574                                                                          ;
ldy      #$D0                          ; 0x1c584 $C574 A0 D0                   ; Y = D0
sty      $00                           ; 0x1c586 $C576 84 00                   ;
txa                                    ; 0x1c588 $C578 8A                      ;
LC579                                                                          ;
ldy      $00                           ; 0x1c589 $C579 A4 00                   ;
sta      $5FFF,y                       ; 0x1c58b $C57B 99 FF 5F                ;
sta      $60CF,y                       ; 0x1c58e $C57E 99 CF 60                ;
sta      $619F,y                       ; 0x1c591 $C581 99 9F 61                ;
sta      $626F,y                       ; 0x1c594 $C584 99 6F 62                ;
dec      $00                           ; 0x1c597 $C587 C6 00                   ;
bne      LC579                         ; 0x1c599 $C589 D0 EE                   ;
ldy      #$03                          ; 0x1c59b $C58B A0 03                   ; Y = 03
lda      ($D4),y                       ; 0x1c59d $C58D B1 D4                   ; Area Header Byte 3; Area Header Byte 3
sta      $07AF                         ; 0x1c59f $C58F 8D AF 07                ;
lda      #$00                          ; 0x1c5a2 $C592 A9 00                   ; A = 00
sta      $072F                         ; 0x1c5a4 $C594 8D 2F 07                ; Area Data Reading Offset
sta      $010A                         ; 0x1c5a7 $C597 8D 0A 01                ;
ldy      #$03                          ; 0x1c5aa $C59A A0 03                   ; Y = 03
lda      ($D4),y                       ; 0x1c5ac $C59C B1 D4                   ; Area Header Byte 3; Area Header Byte 3
and      #$07                          ; 0x1c5ae $C59E 29 07                   ; keep bits .... .xxx (BG Map)
beq      LC5C2                         ; 0x1c5b0 $C5A0 F0 20                   ;
;If Background Map Code > 0, get pointer and process Map Data                  ;
asl                                    ; 0x1c5b2 $C5A2 0A                      ;
tax                                    ; 0x1c5b3 $C5A3 AA                      ;
dex                                    ; 0x1c5b4 $C5A4 CA                      ;
dex                                    ; 0x1c5b5 $C5A5 CA                      ;
lda      $D4                           ; 0x1c5b6 $C5A6 A5 D4                   ;
pha                                    ; 0x1c5b8 $C5A8 48                      ;
lda      $D5                           ; 0x1c5b9 $C5A9 A5 D5                   ;
pha                                    ; 0x1c5bb $C5AB 48                      ;
lda      Tables_for_Game_Over_screen_text,x; 0x1c5bc $C5AC BD 00 80            ; Background Map Data Pointer Byte 1
sta      $D4                           ; 0x1c5bf $C5AF 85 D4                   ;
lda      L8001,x                       ; 0x1c5c1 $C5B1 BD 01 80                ; Background Map Data Pointer Byte 1
sta      $D5                           ; 0x1c5c4 $C5B4 85 D5                   ;
jsr      bank7_process_map_data        ; 0x1c5c6 $C5B6 20 55 C7                ; Process Map Data
jsr      LC89D                         ; 0x1c5c9 $C5B9 20 9D C8                ;this jsr function call draws the map data, nop nop nop it out for header-commands-only drawing of the map data
pla                                    ; 0x1c5cc $C5BC 68                      ;
sta      $D5                           ; 0x1c5cd $C5BD 85 D5                   ;
pla                                    ; 0x1c5cf $C5BF 68                      ;
sta      $D4                           ; 0x1c5d0 $C5C0 85 D4                   ;
LC5C2                                                                          ;
jsr      bank7_process_map_data        ; 0x1c5d2 $C5C2 20 55 C7                ; Process Map Data
;Extra Layer                                                                   ;
ldy      #$01                          ; 0x1c5d5 $C5C5 A0 01                   ; Y = 01
lda      ($D4),y                       ; 0x1c5d7 $C5C7 B1 D4                   ; Area Data Byte 1; Area Data Byte 1
and      #$1C                          ; 0x1c5d9 $C5C9 29 1C                   ; keep bits ...x xx.. (Layers bits)
lsr                                    ; 0x1c5db $C5CB 4A                      ;
lsr                                    ; 0x1c5dc $C5CC 4A                      ;
tax                                    ; 0x1c5dd $C5CD AA                      ;
dey                                    ; 0x1c5de $C5CE 88                      ;
sty      $0717                         ; 0x1c5df $C5CF 8C 17 07                ; Screen Number for Objects (0-3)
lda      LC4AF,x                       ; 0x1c5e2 $C5D2 BD AF C4                ;
sta      $010A                         ; 0x1c5e5 $C5D5 8D 0A 01                ;
beq      LC5F9                         ; 0x1c5e8 $C5D8 F0 1F                   ;
LC5DA                                                                          ;
jsr      bank7_Set_Ram_Addy_for_Object__0E_0F; 0x1c5ea $C5DA 20 47 C9          ; Set RAM Address for Object (0E-0F)
ldy      $010A                         ; 0x1c5ed $C5DD AC 0A 01                ;
LC5E0                                                                          ;
lda      $00                           ; 0x1c5f0 $C5E0 A5 00                   ;
lda      bank7_Extra_Background_Layers__Bushes__Grass__etc,x; 0x1c5f2 $C5E2 BD A7 C4;
sta      (L000E),y                     ; 0x1c5f5 $C5E5 91 0E                   ;
lda      $00                           ; 0x1c5f7 $C5E7 A5 00                   ;
iny                                    ; 0x1c5f9 $C5E9 C8                      ;
tya                                    ; 0x1c5fa $C5EA 98                      ;
and      #$0F                          ; 0x1c5fb $C5EB 29 0F                   ; keep bits .... xxxx
bne      LC5E0                         ; 0x1c5fd $C5ED D0 F1                   ;
inc      $0717                         ; 0x1c5ff $C5EF EE 17 07                ; Screen Number for Objects (0-3)
lda      $0717                         ; 0x1c602 $C5F2 AD 17 07                ;; Screen Number for Objects (0-3)
cmp      #$04                          ; 0x1c605 $C5F5 C9 04                   ;
bne      LC5DA                         ; 0x1c607 $C5F7 D0 E1                   ;
LC5F9                                                                          ;
jsr      LC89D                         ; 0x1c609 $C5F9 20 9D C8                ;
lda      #$03                          ; 0x1c60c $C5FC A9 03                   ; A = 03
sta      $071B                         ; 0x1c60e $C5FE 8D 1B 07                ;
lsr                                    ; 0x1c611 $C601 4A                      ;
sta      $071F                         ; 0x1c612 $C602 8D 1F 07                ;; ???
sta      $0720                         ; 0x1c615 $C605 8D 20 07                ;
lsr                                    ; 0x1c618 $C608 4A                      ;
sta      $071C                         ; 0x1c619 $C609 8D 1C 07                ;
sta      $0721                         ; 0x1c61c $C60C 8D 21 07                ;
sta      $0740                         ; 0x1c61f $C60F 8D 40 07                ;
ldy      $075C                         ; 0x1c622 $C612 AC 5C 07                ; Position code when entering area (0-3)
lda      #$0F                          ; 0x1c625 $C615 A9 0F                   ; A = 0F
sta      $0722                         ; 0x1c627 $C617 8D 22 07                ;
lda      $697B,y                       ; 0x1c62a $C61A B9 7B 69                ;
sta      $0732                         ; 0x1c62d $C61D 8D 32 07                ;
sta      $0733                         ; 0x1c630 $C620 8D 33 07                ;
lda      $6982,y                       ; 0x1c633 $C623 B9 82 69                ;
sta      $0734                         ; 0x1c636 $C626 8D 34 07                ;
sta      $0735                         ; 0x1c639 $C629 8D 35 07                ;
jmp      LC722                         ; 0x1c63c $C62C 4C 22 C7                ;this jump is the last chance to change sidescreen tile data(?), when we jump to $C62C we are done processing map data
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC62F                                                                          ;
lda      $076E                         ; 0x1c63f $C62F AD 6E 07                ; Graphics bank to use
jsr      bank7_chr_bank_switch__load_A ; 0x1c642 $C632 20 B1 FF                ;
jsr      bank7_Load_Bank_0_at_0x8000   ; 0x1c645 $C635 20 C5 FF                ;
jmp      Side_View_Initialization_when_entering_a_Key_Area; 0x1c648 $C638 4C E1 8C;
                                                                               ;
; ---------------------------------------------------------------------------- ;
jmp      bank7_Load_Bank_769_at_0x8000 ; 0x1c64b $C63B 4C C9 FF                ; Load Bank $0769
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC63E                                                                          ;
inc      $0736                         ; 0x1c64e $C63E EE 36 07                ; Game Mode
jmp      LC68A                         ; 0x1c651 $C641 4C 8A C6                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_take_elevator_exit                                                       ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1c654 $C644 20 C9 FF                ; Load Bank $0769
lda      $0561                         ; 0x1c657 $C647 AD 61 05                ; Area Code
asl                                    ; 0x1c65a $C64A 0A                      ;
asl                                    ; 0x1c65b $C64B 0A                      ;
adc      #$01                          ; 0x1c65c $C64C 69 01                   ;
ldy      $0743                         ; 0x1c65e $C64E AC 43 07                ; Up/Down Buttons Held
cpy      #$08                          ; 0x1c661 $C651 C0 08                   ; Check for Up
bne      LC657                         ; 0x1c663 $C653 D0 02                   ;
adc      #$00                          ; 0x1c665 $C655 69 00                   ;
LC657                                                                          ;
tay                                    ; 0x1c667 $C657 A8                      ;
lda      $6AFC,y                       ; 0x1c668 $C658 B9 FC 6A                ;
lsr                                    ; 0x1c66b $C65B 4A                      ;
lsr                                    ; 0x1c66c $C65C 4A                      ;
sta      $0561                         ; 0x1c66d $C65D 8D 61 05                ; Area Code
lda      $6AFC,y                       ; 0x1c670 $C660 B9 FC 6A                ; Area Room Connectivity
and      #$03                          ; 0x1c673 $C663 29 03                   ; keep bits .... ..xx
sta      $3B                           ; 0x1c675 $C665 85 3B                   ; Link's X Position (high byte)
sta      $072A                         ; 0x1c677 $C667 8D 2A 07                ; Scrolling Offset High Byte
clc                                    ; 0x1c67a $C66A 18                      ;
adc      #$01                          ; 0x1c67b $C66B 69 01                   ;
sta      $0733                         ; 0x1c67d $C66D 8D 33 07                ;
sec                                    ; 0x1c680 $C670 38                      ;
sbc      #$02                          ; 0x1c681 $C671 E9 02                   ;
cmp      #$FF                          ; 0x1c683 $C673 C9 FF                   ;
bne      LC679                         ; 0x1c685 $C675 D0 02                   ;
lda      #$03                          ; 0x1c687 $C677 A9 03                   ; A = 03
LC679                                                                          ;
sta      $0732                         ; 0x1c689 $C679 8D 32 07                ;
LC67C                                                                          ;
ldx      #$04                          ; 0x1c68c $C67C A2 04                   ; X = 04
stx      $075C                         ; 0x1c68e $C67E 8E 5C 07                ; Position code when entering area (0-3)
jsr      LC690                         ; 0x1c691 $C681 20 90 C6                ;
inc      $0705                         ; 0x1c694 $C684 EE 05 07                ;; Related to how Link entered the room (walking, falling, elevator...)
jmp      LC722                         ; 0x1c697 $C687 4C 22 C7                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC68A                                                                          ;
jsr      bank7_Load_Bank_0_at_0x8000   ; 0x1c69a $C68A 20 C5 FF                ;
jmp      LC67C                         ; 0x1c69d $C68D 4C 7C C6                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC690                                                                          ;
lda      $FD                           ; 0x1c6a0 $C690 A5 FD                   ;
and      #$F0                          ; 0x1c6a2 $C692 29 F0                   ; keep bits xxxx ....
sta      $69B3,x                       ; 0x1c6a4 $C694 9D B3 69                ;
lda      $071F                         ; 0x1c6a7 $C697 AD 1F 07                ;; ???
sta      $69BA,x                       ; 0x1c6aa $C69A 9D BA 69                ;This is where healer glitch writes 69C4 at 1, triggering scroll lock 	X=A
lda      $072C                         ; 0x1c6ad $C69D AD 2C 07                ; Scrolling Offset Low Byte
and      #$F0                          ; 0x1c6b0 $C6A0 29 F0                   ; keep bits xxxx ....
sta      $69AC,x                       ; 0x1c6b2 $C6A2 9D AC 69                ;
pha                                    ; 0x1c6b5 $C6A5 48                      ;
sec                                    ; 0x1c6b6 $C6A6 38                      ;
sbc      #$60                          ; 0x1c6b7 $C6A7 E9 60                   ;
php                                    ; 0x1c6b9 $C6A9 08                      ;
ora      #$10                          ; 0x1c6ba $C6AA 09 10                   ; set  bits ...x ....
lsr                                    ; 0x1c6bc $C6AC 4A                      ;
lsr                                    ; 0x1c6bd $C6AD 4A                      ;
lsr                                    ; 0x1c6be $C6AE 4A                      ;
lsr                                    ; 0x1c6bf $C6AF 4A                      ;
sta      $6997,x                       ; 0x1c6c0 $C6B0 9D 97 69                ;
and      #$0E                          ; 0x1c6c3 $C6B3 29 0E                   ; keep bits .... xxx.
sta      $6982,x                       ; 0x1c6c5 $C6B5 9D 82 69                ;
lda      $072A                         ; 0x1c6c8 $C6B8 AD 2A 07                ; Scrolling Offset High Byte
sta      $69A5,x                       ; 0x1c6cb $C6BB 9D A5 69                ;
plp                                    ; 0x1c6ce $C6BE 28                      ;
sbc      #$00                          ; 0x1c6cf $C6BF E9 00                   ;
and      #$03                          ; 0x1c6d1 $C6C1 29 03                   ; keep bits .... ..xx
sta      $6989,x                       ; 0x1c6d3 $C6C3 9D 89 69                ;
sta      $697B,x                       ; 0x1c6d6 $C6C6 9D 7B 69                ;
pla                                    ; 0x1c6d9 $C6C9 68                      ;
clc                                    ; 0x1c6da $C6CA 18                      ;
adc      #$60                          ; 0x1c6db $C6CB 69 60                   ;
php                                    ; 0x1c6dd $C6CD 08                      ;
and      #$E0                          ; 0x1c6de $C6CE 29 E0                   ; keep bits xxx. ....
lsr                                    ; 0x1c6e0 $C6D0 4A                      ;
lsr                                    ; 0x1c6e1 $C6D1 4A                      ;
lsr                                    ; 0x1c6e2 $C6D2 4A                      ;
lsr                                    ; 0x1c6e3 $C6D3 4A                      ;
sta      $699E,x                       ; 0x1c6e4 $C6D4 9D 9E 69                ;
lda      $072A                         ; 0x1c6e7 $C6D7 AD 2A 07                ; Scrolling Offset High Byte
plp                                    ; 0x1c6ea $C6DA 28                      ;
adc      #$01                          ; 0x1c6eb $C6DB 69 01                   ;
and      #$03                          ; 0x1c6ed $C6DD 29 03                   ; keep bits .... ..xx
sta      $6990,x                       ; 0x1c6ef $C6DF 9D 90 69                ;
lda      $3B                           ; 0x1c6f2 $C6E2 A5 3B                   ; Link's X Position (high byte)
sta      $05CC,x                       ; 0x1c6f4 $C6E4 9D CC 05                ;
lda      $4D                           ; 0x1c6f7 $C6E7 A5 4D                   ; Link's X Position (low byte)
and      #$F0                          ; 0x1c6f9 $C6E9 29 F0                   ; keep bits xxxx ....
sta      $05D3,x                       ; 0x1c6fb $C6EB 9D D3 05                ;
LC6EE                                                                          ;
rts                                    ; 0x1c6fe $C6EE 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Related_to_Link_falling                                                  ;
inc      $0704                         ; 0x1c6ff $C6EF EE 04 07                ;; 0=start bottom of screen, 1=start at top of screen ; elevator
lda      #$01                          ; 0x1c702 $C6F2 A9 01                   ; A = 01
sta      $19                           ; 0x1c704 $C6F4 85 19                   ;;fall_or_invisible (0=invisible, 1=normal, 2~FF=fall in hole); Position Code for Fairy Cursor (Selection Screen)	(and) ;draw link's sprite =yes/no
lda      #$10                          ; 0x1c706 $C6F6 A9 10                   ; A = 10
sta      $29                           ; 0x1c708 $C6F8 85 29                   ; Link's Y Position
lda      #$02                          ; 0x1c70a $C6FA A9 02                   ; A = 02
ldy      $0707                         ; 0x1c70c $C6FC AC 07 07                ; Current World
bne      LC702                         ; 0x1c70f $C6FF D0 01                   ;
asl                                    ; 0x1c711 $C701 0A                      ;
LC702                                                                          ;
sta      $075F                         ; 0x1c712 $C702 8D 5F 07                ;;at bank0: 0D64: AD 5F07	LDA $075F	then 	STA $EB		; Music Channel	; something to do with music
lda      #$01                          ; 0x1c715 $C705 A9 01                   ; A = 01 (sound of Link falling)
sta      $EE                           ; 0x1c717 $C707 85 EE                   ; Sound Effects Type 3
jmp      LC72D                         ; 0x1c719 $C709 4C 2D C7                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC70C                                                                          ;
lda      $071F                         ; 0x1c71c $C70C AD 1F 07                ;; ???
sta      $0720                         ; 0x1c71f $C70F 8D 20 07                ;
lda      #$09                          ; 0x1c722 $C712 A9 09                   ; A = 09
sta      $0736                         ; 0x1c724 $C714 8D 36 07                ; Game Mode
jmp      bank7_code33                  ; 0x1c727 $C717 4C 30 E0                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
flashing_effect__length__when_link_dies                                        ;
lda      #$07                          ; 0x1c72a $C71A A9 07                   ; A = 07
sta      $050E                         ; 0x1c72c $C71C 8D 0E 05                ;
jmp      LC72D                         ; 0x1c72f $C71F 4C 2D C7                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC722                                                                          ;
lda      #$00                          ; 0x1c732 $C722 A9 00                   ; A = 00
sta      $073D                         ; 0x1c734 $C724 8D 3D 07                ; Routine Index
inc      $0726                         ; 0x1c737 $C727 EE 26 07                ;;?which is the black transition screen when loading a battle scene.  It hides the loading gfx.; Dialog Box Drawing Flag (00-01) Toggles while a dialog box is being drawn.
jmp      LCF05                         ; 0x1c73a $C72A 4C 05 CF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC72D                                                                          ;
lda      #$00                          ; 0x1c73d $C72D A9 00                   ; A = 00
sta      $0726                         ; 0x1c73f $C72F 8D 26 07                ;;?which is the black transition screen when loading a battle scene.  It hides the loading gfx.; Dialog Box Drawing Flag (00-01) Toggles while a dialog box is being drawn.
jmp      LCF05                         ; 0x1c742 $C732 4C 05 CF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_table_Masks_for_Floor_Ceiling_Tile_Mappings                              ;
.byt    $C1,$83,$C1,$87,$C1,$8F,$C1,$9F; 0x1c745 $C735 C1 83 C1 87 C1 8F C1 9F ;
.byt    $C1,$BF,$C1,$7F,$C3,$FF,$C7,$FF; 0x1c74d $C73D C1 BF C1 7F C3 FF C7 FF ;
.byt    $E0,$03,$F0,$03,$F8,$03,$FC,$03; 0x1c755 $C745 E0 03 F0 03 F8 03 FC 03 ;
.byt    $FE,$83,$FF,$C3,$FF,$E3,$FF,$FF; 0x1c75d $C74D FE 83 FF C3 FF E3 FF FF ;
; ---------------------------------------------------------------------------- ;
bank7_process_map_data                                                         ;
lda      #$00                          ; 0x1c765 $C755 A9 00                   ; A = 00
sta      $010A                         ; 0x1c767 $C757 8D 0A 01                ;
sta      $010B                         ; 0x1c76a $C75A 8D 0B 01                ;
sta      $0717                         ; 0x1c76d $C75D 8D 17 07                ; Screen Number for Objects (0-3)
ldy      #$02                          ; 0x1c770 $C760 A0 02                   ; Y = 02
lda      ($D4),y                       ; 0x1c772 $C762 B1 D4                   ; HEADER byte 2
and      #$0F                          ; 0x1c774 $C764 29 0F                   ; keep bits .... xxxx (Initial CF Code)
sta      $0731                         ; 0x1c776 $C766 8D 31 07                ; Level Object Type and Size
lda      ($D4),y                       ; 0x1c779 $C769 B1 D4                   ; HEADER byte 2
and      #$80                          ; 0x1c77b $C76B 29 80                   ; keep bits x... ....
sta      $0486                         ; 0x1c77d $C76D 8D 86 04                ; Level "No Ceiling" flag
lda      ($D4),y                       ; 0x1c780 $C770 B1 D4                   ; HEADER byte 2
and      #$70                          ; 0x1c782 $C772 29 70                   ; keep bits .xxx ....
lsr                                    ; 0x1c784 $C774 4A                      ;
lsr                                    ; 0x1c785 $C775 4A                      ;
lsr                                    ; 0x1c786 $C776 4A                      ;
lsr                                    ; 0x1c787 $C777 4A                      ;
sta      $010C                         ; 0x1c788 $C778 8D 0C 01                ; Area Ground Type (0-7)
lda      #$04                          ; 0x1c78b $C77B A9 04                   ; A = 04
sta      $072F                         ; 0x1c78d $C77D 8D 2F 07                ; Area Data Reading Offset
jsr      bank7_Set_Addy_for_Area_Layer_Tiles__using_10C; 0x1c790 $C780 20 19 C8; Set Address for Area Layer Tiles (using 10C)
ldy      #$00                          ; 0x1c793 $C783 A0 00                   ; Y = 00
lda      ($D4),y                       ; 0x1c795 $C785 B1 D4                   ; HEADER byte 0 	SIZE
sta      $072E                         ; 0x1c797 $C787 8D 2E 07                ; Area Data Length
LC78A                                                                          ;
ldy      $072F                         ; 0x1c79a $C78A AC 2F 07                ; Area Data Reading Offset
keep_loading_the_map_data                                                      ;
lda      ($D4),y                       ; 0x1c79d $C78D B1 D4                   ;map data first byte/cmd ?
sta      $0730                         ; 0x1c79f $C78F 8D 30 07                ; Position of Object Placement
jsr      LC95C                         ; 0x1c7a2 $C792 20 5C C9                ;
LC795                                                                          ;
lda      $010B                         ; 0x1c7a5 $C795 AD 0B 01                ;
lsr                                    ; 0x1c7a8 $C798 4A                      ;
lsr                                    ; 0x1c7a9 $C799 4A                      ;
lsr                                    ; 0x1c7aa $C79A 4A                      ;
lsr                                    ; 0x1c7ab $C79B 4A                      ;
sta      $0717                         ; 0x1c7ac $C79C 8D 17 07                ; Screen Number for Objects (0-3)
jsr      bank7_Set_Ram_Addy_for_Object__0E_0F; 0x1c7af $C79F 20 47 C9          ;
lda      $010A                         ; 0x1c7b2 $C7A2 AD 0A 01                ;
cmp      $010B                         ; 0x1c7b5 $C7A5 CD 0B 01                ;
beq      LC7C6                         ; 0x1c7b8 $C7A8 F0 1C                   ;
bpl      LC7F0                         ; 0x1c7ba $C7AA 10 44                   ;
iny                                    ; 0x1c7bc $C7AC C8                      ;
lda      ($D4),y                       ; 0x1c7bd $C7AD B1 D4                   ;
cmp      #$0F                          ; 0x1c7bf $C7AF C9 0F                   ;
bne      LC7B4                         ; 0x1c7c1 $C7B1 D0 01                   ;
iny                                    ; 0x1c7c3 $C7B3 C8                      ;
LC7B4                                                                          ;
iny                                    ; 0x1c7c4 $C7B4 C8                      ;
cpy      $072E                         ; 0x1c7c5 $C7B5 CC 2E 07                ; Area Data Length
bcc      keep_loading_the_map_data     ; 0x1c7c8 $C7B8 90 D3                   ;
dey                                    ; 0x1c7ca $C7BA 88                      ;
lda      ($D4),y                       ; 0x1c7cb $C7BB B1 D4                   ;
cmp      #$0F                          ; 0x1c7cd $C7BD C9 0F                   ;
bne      LC7C2                         ; 0x1c7cf $C7BF D0 01                   ;
dey                                    ; 0x1c7d1 $C7C1 88                      ;
LC7C2                                                                          ;
dey                                    ; 0x1c7d2 $C7C2 88                      ;
jmp      LC7F0                         ; 0x1c7d3 $C7C3 4C F0 C7                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC7C6                                                                          ;
lda      $0730                         ; 0x1c7d6 $C7C6 AD 30 07                ; Position of Object Placement
and      #$F0                          ; 0x1c7d9 $C7C9 29 F0                   ; keep bits xxxx ....
cmp      #$D0                          ; 0x1c7db $C7CB C9 D0                   ;
bne      LC7E2                         ; 0x1c7dd $C7CD D0 13                   ;
;Change Default Ceiling/Floor                                                  ;
iny                                    ; 0x1c7df $C7CF C8                      ;
lda      ($D4),y                       ; 0x1c7e0 $C7D0 B1 D4                   ;
pha                                    ; 0x1c7e2 $C7D2 48                      ;
and      #$0F                          ; 0x1c7e3 $C7D3 29 0F                   ; keep bits .... xxxx
sta      $0731                         ; 0x1c7e5 $C7D5 8D 31 07                ; Level Object Type and Size
pla                                    ; 0x1c7e8 $C7D8 68                      ;
and      #$80                          ; 0x1c7e9 $C7D9 29 80                   ; keep bits x... ....
sta      $0486                         ; 0x1c7eb $C7DB 8D 86 04                ; Area "No Ceiling" flag
iny                                    ; 0x1c7ee $C7DE C8                      ;
jmp      LC7F0                         ; 0x1c7ef $C7DF 4C F0 C7                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC7E2                                                                          ;
cpy      $072E                         ; 0x1c7f2 $C7E2 CC 2E 07                ; Area Data Length
bcs      LC7F0                         ; 0x1c7f5 $C7E5 B0 09                   ;
iny                                    ; 0x1c7f7 $C7E7 C8                      ;
lda      ($D4),y                       ; 0x1c7f8 $C7E8 B1 D4                   ;map data second byte/cmd param? 
cmp      #$0F                          ; 0x1c7fa $C7EA C9 0F                   ;
bne      LC7EF                         ; 0x1c7fc $C7EC D0 01                   ;
iny                                    ; 0x1c7fe $C7EE C8                      ;
LC7EF                                                                          ;
iny                                    ; 0x1c7ff $C7EF C8                      ;
LC7F0                                                                          ;
sty      $072F                         ; 0x1c800 $C7F0 8C 2F 07                ; Area Data Reading Offset
lda      $010B                         ; 0x1c803 $C7F3 AD 0B 01                ;
and      #$0F                          ; 0x1c806 $C7F6 29 0F                   ; keep bits .... xxxx
sta      $0A                           ; 0x1c808 $C7F8 85 0A                   ;
jsr      bank7_code14                  ; 0x1c80a $C7FA 20 2B C8                ;
inc      $010B                         ; 0x1c80d $C7FD EE 0B 01                ;
lda      $010B                         ; 0x1c810 $C800 AD 0B 01                ;
cmp      #$40                          ; 0x1c813 $C803 C9 40                   ;
beq      LC818                         ; 0x1c815 $C805 F0 11                   ;
lda      $010A                         ; 0x1c817 $C807 AD 0A 01                ;
cmp      $010B                         ; 0x1c81a $C80A CD 0B 01                ;
bpl      LC812                         ; 0x1c81d $C80D 10 03                   ;
jmp      LC78A                         ; 0x1c81f $C80F 4C 8A C7                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC812                                                                          ;
ldy      $072F                         ; 0x1c822 $C812 AC 2F 07                ; Area Data Reading Offset
jmp      LC795                         ; 0x1c825 $C815 4C 95 C7                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC818                                                                          ;
rts                                    ; 0x1c828 $C818 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Set_Addy_for_Area_Layer_Tiles__using_10C                                 ;
lda      $0707                         ; 0x1c829 $C819 AD 07 07                ; Current World
jsr      bank7_PullAddrFromTableFollowingThisJSR_withIndexOfA_then_JMP; 0x1c82c $C81C 20 85 D3;
bank7_pointer_table9                                                           ;
.word    L81A3                         ; 0x1c82f $C81F A3 81                   ; World 0 - Bank 1 and 2
.word    L8647                         ; 0x1c831 $C821 47 86                   ; World 1 - Bank 3
.word    L8647                         ; 0x1c833 $C823 47 86                   ; World 2 - Bank 3
.word    L8167                         ; 0x1c835 $C825 67 81                   ; World 3 - Bank 4
.word    L8167                         ; 0x1c837 $C827 67 81                   ; World 4 - Bank 4
.word    L817B                         ; 0x1c839 $C829 7B 81                   ; World 5 - Bank 5
; ---------------------------------------------------------------------------- ;
bank7_code14                                                                   ;
;$0A = Memory Offset of the tile to process                                    ;
lda      $0731                         ; 0x1c83b $C82B AD 31 07                ; Level Object Type and Size
asl                                    ; 0x1c83e $C82E 0A                      ;
tay                                    ; 0x1c83f $C82F A8                      ;
ldx      #$05                          ; 0x1c840 $C830 A2 05                   ; X = 05
lda      $0486                         ; 0x1c842 $C832 AD 86 04                ; Area "No Ceiling" flag
beq      LC844                         ; 0x1c845 $C835 F0 0D                   ;
;If No Ceiling flag == 1, start at Row 2                                       ;
lda      $0A                           ; 0x1c847 $C837 A5 0A                   ;
ora      #$20                          ; 0x1c849 $C839 09 20                   ; set  bits ..x. ....
sta      $0A                           ; 0x1c84b $C83B 85 0A                   ;
lda      #$38                          ; 0x1c84d $C83D A9 38                   ; A = 38
ldx      #$03                          ; 0x1c84f $C83F A2 03                   ; X = 03
jmp      LC846                         ; 0x1c851 $C841 4C 46 C8                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC844                                                                          ;
lda      #$E0                          ; 0x1c854 $C844 A9 E0                   ; A = E0
LC846                                                                          ;
sta      $010E                         ; 0x1c856 $C846 8D 0E 01                ;
stx      $010F                         ; 0x1c859 $C849 8E 0F 01                ;
LC84C                                                                          ;
sty      $08                           ; 0x1c85c $C84C 84 08                   ;
ldx      $010F                         ; 0x1c85e $C84E AE 0F 01                ;
lda      bank7_table_Masks_for_Floor_Ceiling_Tile_Mappings,y; 0x1c861 $C851 B9 35 C7;
and      $010E                         ; 0x1c864 $C854 2D 0E 01                ;
cpx      #$00                          ; 0x1c867 $C857 E0 00                   ;
beq      LC85F                         ; 0x1c869 $C859 F0 04                   ;
LC85B                                                                          ;
lsr                                    ; 0x1c86b $C85B 4A                      ;
dex                                    ; 0x1c86c $C85C CA                      ;
bne      LC85B                         ; 0x1c86d $C85D D0 FC                   ;
LC85F                                                                          ;
tay                                    ; 0x1c86f $C85F A8                      ;
lda      ($0C),y                       ; 0x1c870 $C860 B1 0C                   ;
sta      $0B                           ; 0x1c872 $C862 85 0B                   ;
ldy      $0A                           ; 0x1c874 $C864 A4 0A                   ;
cmp      #$40                          ; 0x1c876 $C866 C9 40                   ; 40 = Background for All Except Type 0
beq      LC878                         ; 0x1c878 $C868 F0 0E                   ;
cmp      #$42                          ; 0x1c87a $C86A C9 42                   ; 42 = Background for Grotto (Type 0)
bne      LC874                         ; 0x1c87c $C86C D0 06                   ;
lda      (L000E),y                     ; 0x1c87e $C86E B1 0E                   ;
cmp      #$40                          ; 0x1c880 $C870 C9 40                   ;
bne      LC878                         ; 0x1c882 $C872 D0 04                   ;
LC874                                                                          ;
lda      $0B                           ; 0x1c884 $C874 A5 0B                   ;
sta      (L000E),y                     ; 0x1c886 $C876 91 0E                   ;
LC878                                                                          ;
tya                                    ; 0x1c888 $C878 98                      ;
clc                                    ; 0x1c889 $C879 18                      ;
adc      #$10                          ; 0x1c88a $C87A 69 10                   ;
sta      $0A                           ; 0x1c88c $C87C 85 0A                   ;
ldy      $08                           ; 0x1c88e $C87E A4 08                   ;
lsr      $010E                         ; 0x1c890 $C880 4E 0E 01                ;
dec      $010F                         ; 0x1c893 $C883 CE 0F 01                ;
bpl      LC84C                         ; 0x1c896 $C886 10 C4                   ;
ldx      #$05                          ; 0x1c898 $C888 A2 05                   ; X = 05
iny                                    ; 0x1c89a $C88A C8                      ;
tya                                    ; 0x1c89b $C88B 98                      ;
and      #$01                          ; 0x1c89c $C88C 29 01                   ; keep bits .... ...x
bne      LC844                         ; 0x1c89e $C88E D0 B4                   ;
ldy      $0A                           ; 0x1c8a0 $C890 A4 0A                   ;
lda      $010D                         ; 0x1c8a2 $C892 AD 0D 01                ;; Area Bottom Row Tile Code
sta      (L000E),y                     ; 0x1c8a5 $C895 91 0E                   ;
tya                                    ; 0x1c8a7 $C897 98                      ;
and      #$0F                          ; 0x1c8a8 $C898 29 0F                   ; keep bits .... xxxx
sta      $0A                           ; 0x1c8aa $C89A 85 0A                   ;
rts                                    ; 0x1c8ac $C89C 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC89D                                                                          ;
lda      #$00                          ; 0x1c8ad $C89D A9 00                   ; A = 00
sta      $0717                         ; 0x1c8af $C89F 8D 17 07                ; Screen Number for Objects (0-3)
sta      $010A                         ; 0x1c8b2 $C8A2 8D 0A 01                ;
sta      $0757                         ; 0x1c8b5 $C8A5 8D 57 07                ; Elevator Generated by Objects Construction
sta      $0758                         ; 0x1c8b8 $C8A8 8D 58 07                ; Locked Door Generated by Objects Construction
tay                                    ; 0x1c8bb $C8AB A8                      ;
lda      ($D4),y                       ; 0x1c8bc $C8AC B1 D4                   ; HEADER byte 0 ; get byte 0 of Area Data
sta      $072E                         ; 0x1c8be $C8AE 8D 2E 07                ; Area Data Length
iny                                    ; 0x1c8c1 $C8B1 C8                      ;
lda      ($D4),y                       ; 0x1c8c2 $C8B2 B1 D4                   ; HEADER byte 1; get byte 1 of Area Data
and      #$60                          ; 0x1c8c4 $C8B4 29 60                   ; keep bits .xx. .... (Area Width)
lsr                                    ; 0x1c8c6 $C8B6 4A                      ;
lsr                                    ; 0x1c8c7 $C8B7 4A                      ;
lsr                                    ; 0x1c8c8 $C8B8 4A                      ;
lsr                                    ; 0x1c8c9 $C8B9 4A                      ;
lsr                                    ; 0x1c8ca $C8BA 4A                      ;
sta      $D1                           ; 0x1c8cb $C8BB 85 D1                   ; Area Width
lda      #$04                          ; 0x1c8cd $C8BD A9 04                   ; A = 04
sta      $072F                         ; 0x1c8cf $C8BF 8D 2F 07                ; Area Data Reading Offset
ldy      $072F                         ; 0x1c8d2 $C8C2 AC 2F 07                ;rts here to only do the header's draw commands(?) <---i dont  think so, check 0x1c5c9 
LC8C5                                                                          ;
lda      ($D4),y                       ; 0x1c8d5 $C8C5 B1 D4                   ; first byte of MAPDATA data
sta      $0730                         ; 0x1c8d7 $C8C7 8D 30 07                ; Position of Object Placement
jsr      bank7_Check_for_Skip_Object__E0_; 0x1c8da $C8CA 20 88 C9              ;
iny                                    ; 0x1c8dd $C8CD C8                      ;
lda      ($D4),y                       ; 0x1c8de $C8CE B1 D4                   ;
sta      $0731                         ; 0x1c8e0 $C8D0 8D 31 07                ; Level Object Type and Size
iny                                    ; 0x1c8e3 $C8D3 C8                      ;
sty      $072F                         ; 0x1c8e4 $C8D4 8C 2F 07                ; Area Data Reading Offset
jsr      LC95F                         ; 0x1c8e7 $C8D7 20 5F C9                ;
lda      $0730                         ; 0x1c8ea $C8DA AD 30 07                ; Position of Object Placement
and      #$F0                          ; 0x1c8ed $C8DD 29 F0                   ; keep bits xxxx ....
cmp      #$D0                          ; 0x1c8ef $C8DF C9 D0                   ;
bne      LC8E9                         ; 0x1c8f1 $C8E1 D0 06                   ;
cpy      $072E                         ; 0x1c8f3 $C8E3 CC 2E 07                ; Area Data Length
bne      LC8C5                         ; 0x1c8f6 $C8E6 D0 DD                   ;
rts                                    ; 0x1c8f8 $C8E8 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC8E9                                                                          ;
lda      $0731                         ; 0x1c8f9 $C8E9 AD 31 07                ; Level Object Type and Size
and      #$F0                          ; 0x1c8fc $C8EC 29 F0                   ; keep bits xxxx ....
beq      LC8F6                         ; 0x1c8fe $C8EE F0 06                   ;
jsr      LC912                         ; 0x1c900 $C8F0 20 12 C9                ;
jmp      LC909                         ; 0x1c903 $C8F3 4C 09 C9                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC8F6                                                                          ;
lda      $0731                         ; 0x1c906 $C8F6 AD 31 07                ; Level Object Type and Size
cmp      #$0F                          ; 0x1c909 $C8F9 C9 0F                   ; 0F = Collectable Object
bne      LC906                         ; 0x1c90b $C8FB D0 09                   ;
jsr      LC9A5                         ; 0x1c90d $C8FD 20 A5 C9                ;
inc      $072F                         ; 0x1c910 $C900 EE 2F 07                ; Area Data Reading Offset
jmp      LC909                         ; 0x1c913 $C903 4C 09 C9                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC906                                                                          ;
jsr      bank7_Set_Address_for_Small_Object; 0x1c916 $C906 20 27 C9            ; Set Address for Background Object
LC909                                                                          ;
ldy      $072F                         ; 0x1c919 $C909 AC 2F 07                ; Area Data Reading Offset
cpy      $072E                         ; 0x1c91c $C90C CC 2E 07                ; Area Data Length
bne      LC8C5                         ; 0x1c91f $C90F D0 B4                   ;
rts                                    ; 0x1c921 $C911 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC912                                                                          ;
ldx      $0731                         ; 0x1c922 $C912 AE 31 07                ; Level Object Type and Size
lda      $0707                         ; 0x1c925 $C915 AD 07 07                ; Current World
jsr      bank7_PullAddrFromTableFollowingThisJSR_withIndexOfA_then_JMP; 0x1c928 $C918 20 85 D3; Set Object Construction Address
bank7_Pointer_table_for_Objects_Construction_Address                           ;
.word    L80EE                         ; 0x1c92b $C91B EE 80                   ;Overworld Areas (WH DM EH MI)
.word    L9B86                         ; 0x1c92d $C91D 86 9B                   ;Towns in West Hyrule
.word    L9B86                         ; 0x1c92f $C91F 86 9B                   ;Towns in East Hyrule
.word    L80EE                         ; 0x1c931 $C921 EE 80                   ;Palaces Type A
.word    L80EE                         ; 0x1c933 $C923 EE 80                   ;Palaces Type B
.word    L80EE                         ; 0x1c935 $C925 EE 80                   ;Great Palace                  
; ---------------------------------------------------------------------------- ;
bank7_Set_Address_for_Small_Object                                             ;
ldx      $0731                         ; 0x1c937 $C927 AE 31 07                ; Level Object Type and Size
lda      $0707                         ; 0x1c93a $C92A AD 07 07                ; Current World
jsr      bank7_PullAddrFromTableFollowingThisJSR_withIndexOfA_then_JMP; 0x1c93d $C92D 20 85 D3; Set Object Construction Address
bank7_Pointer_table_for_Small_Objects_Construction_Address                     ;
.word    L812F                         ; 0x1c940 $C930 2F 81                   ;Overworld Areas (WH DM EH MI)
.word    LevelUp_Pane__BlankLine_SecondHalfOnly; 0x1c942 $C932 CB 9B           ;Towns in West Hyrule
.word    LevelUp_Pane__BlankLine_SecondHalfOnly; 0x1c944 $C934 CB 9B           ;Towns in East Hyrule
.word    L812F                         ; 0x1c946 $C936 2F 81                   ;Palaces Type A
.word    L812F                         ; 0x1c948 $C938 2F 81                   ;Palaces Type B
.word    L812F                         ; 0x1c94a $C93A 2F 81                   ;Great Palace
bank7_Pointer_table_for_location_of_the_4_screens_in_RAM                       ;
.word    LD000                         ; 0x1c94c $C93C 00 D0                   ;
.word    L70A0                         ; 0x1c94e $C93E A0 70                   ;
.word    L6060                         ; 0x1c950 $C940 60 60                   ;
.word    L6261                         ; 0x1c952 $C942 61 62                   ;
; ---------------------------------------------------------------------------- ;
bank7_Set_RAM_Address_for_Object0E0F                                           ;
ldy      $0730                         ; 0x1c954 $C944 AC 30 07                ; Position of Object Placement
bank7_Set_Ram_Addy_for_Object__0E_0F                                           ;
tya                                    ; 0x1c957 $C947 98                      ;
pha                                    ; 0x1c958 $C948 48                      ;
lda      $0717                         ; 0x1c959 $C949 AD 17 07                ; Screen Number for Objects (0-3)
and      #$03                          ; 0x1c95c $C94C 29 03                   ; keep bits .... ..xx
tay                                    ; 0x1c95e $C94E A8                      ;
lda      bank7_Pointer_table_for_location_of_the_4_screens_in_RAM,y; 0x1c95f $C94F B9 3C C9;
sta      L000E                         ; 0x1c962 $C952 85 0E                   ;
lda      bank7_Pointer_table_for_location_of_the_4_screens_in_RAM+$04,y; 0x1c964 $C954 B9 40 C9;
sta      $0F                           ; 0x1c967 $C957 85 0F                   ;
pla                                    ; 0x1c969 $C959 68                      ;
tay                                    ; 0x1c96a $C95A A8                      ;
rts                                    ; 0x1c96b $C95B 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC95C                                                                          ;
jsr      bank7_Check_for_Skip_Object__E0_; 0x1c96c $C95C 20 88 C9              ; Check for Skip Object (E0)
LC95F                                                                          ;
lda      $0730                         ; 0x1c96f $C95F AD 30 07                ; Position of Object Placement
and      #$0F                          ; 0x1c972 $C962 29 0F                   ; keep bits .... xxxx
clc                                    ; 0x1c974 $C964 18                      ;
adc      $010A                         ; 0x1c975 $C965 6D 0A 01                ;
sta      $010A                         ; 0x1c978 $C968 8D 0A 01                ;
and      #$0F                          ; 0x1c97b $C96B 29 0F                   ; keep bits .... xxxx
pha                                    ; 0x1c97d $C96D 48                      ;
lda      $0730                         ; 0x1c97e $C96E AD 30 07                ; Position of Object Placement
and      #$F0                          ; 0x1c981 $C971 29 F0                   ; keep bits xxxx ....
sta      $0730                         ; 0x1c983 $C973 8D 30 07                ;; Position of Object Placement
pla                                    ; 0x1c986 $C976 68                      ;
ora      $0730                         ; 0x1c987 $C977 0D 30 07                ; Position of Object Placement
sta      $0730                         ; 0x1c98a $C97A 8D 30 07                ;; Position of Object Placement
lda      $010A                         ; 0x1c98d $C97D AD 0A 01                ;
lsr                                    ; 0x1c990 $C980 4A                      ;
lsr                                    ; 0x1c991 $C981 4A                      ;
lsr                                    ; 0x1c992 $C982 4A                      ;
lsr                                    ; 0x1c993 $C983 4A                      ;
sta      $0717                         ; 0x1c994 $C984 8D 17 07                ; Screen Number for Objects (0-3)
rts                                    ; 0x1c997 $C987 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Check_for_Skip_Object__E0_                                               ;
lda      $0730                         ; 0x1c998 $C988 AD 30 07                ; Position of Object Placement
and      #$F0                          ; 0x1c99b $C98B 29 F0                   ; keep bits xxxx ....
cmp      #$E0                          ; 0x1c99d $C98D C9 E0                   ;
bne      LC9A4                         ; 0x1c99f $C98F D0 13                   ;
lda      $0730                         ; 0x1c9a1 $C991 AD 30 07                ; Position of Object Placement
and      #$03                          ; 0x1c9a4 $C994 29 03                   ; keep bits .... ..xx
asl                                    ; 0x1c9a6 $C996 0A                      ;
asl                                    ; 0x1c9a7 $C997 0A                      ;
asl                                    ; 0x1c9a8 $C998 0A                      ;
asl                                    ; 0x1c9a9 $C999 0A                      ;
sta      $010A                         ; 0x1c9aa $C99A 8D 0A 01                ;
iny                                    ; 0x1c9ad $C99D C8                      ;
iny                                    ; 0x1c9ae $C99E C8                      ;
lda      ($D4),y                       ; 0x1c9af $C99F B1 D4                   ;
sta      $0730                         ; 0x1c9b1 $C9A1 8D 30 07                ; Position of Object Placement
LC9A4                                                                          ;
rts                                    ; 0x1c9b4 $C9A4 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LC9A5                                                                          ;
ldx      #$05                          ; 0x1c9b5 $C9A5 A2 05                   ; X = 05
LC9A7                                                                          ;
lda      $B6,x                         ; 0x1c9b7 $C9A7 B5 B6                   ; Generated Enemy Slot
beq      LC9AF                         ; 0x1c9b9 $C9A9 F0 04                   ;
dex                                    ; 0x1c9bb $C9AB CA                      ;
bpl      LC9A7                         ; 0x1c9bc $C9AC 10 F9                   ;
inx                                    ; 0x1c9be $C9AE E8                      ;
LC9AF                                                                          ;
stx      $10                           ; 0x1c9bf $C9AF 86 10                   ;; used as monster x register ;draw boss hp bar
lda      $0717                         ; 0x1c9c1 $C9B1 AD 17 07                ; Screen Number for Objects (0-3)
sta      $3C,x                         ; 0x1c9c4 $C9B4 95 3C                   ; Enemy X position (high byte)
tax                                    ; 0x1c9c6 $C9B6 AA                      ;
jsr      LC2A6                         ; 0x1c9c7 $C9B7 20 A6 C2                ;
ldx      $10                           ; 0x1c9ca $C9BA A6 10                   ;; used as monster x register ;draw boss hp bar
cmp      #$00                          ; 0x1c9cc $C9BC C9 00                   ;
beq      LC9E9                         ; 0x1c9ce $C9BE F0 29                   ;
ror      $BC,x                         ; 0x1c9d0 $C9C0 76 BC                   ;; Generated Enemy Y Position ?
lda      $0730                         ; 0x1c9d2 $C9C2 AD 30 07                ; Position of Object Placement
pha                                    ; 0x1c9d5 $C9C5 48                      ;
asl                                    ; 0x1c9d6 $C9C6 0A                      ;
asl                                    ; 0x1c9d7 $C9C7 0A                      ;
asl                                    ; 0x1c9d8 $C9C8 0A                      ;
asl                                    ; 0x1c9d9 $C9C9 0A                      ;
clc                                    ; 0x1c9da $C9CA 18                      ;
adc      #$03                          ; 0x1c9db $C9CB 69 03                   ;
sta      $4E,x                         ; 0x1c9dd $C9CD 95 4E                   ; Enemy X position (low byte)
pla                                    ; 0x1c9df $C9CF 68                      ;
and      #$F0                          ; 0x1c9e0 $C9D0 29 F0                   ; keep bits xxxx ....
clc                                    ; 0x1c9e2 $C9D2 18                      ;
adc      #$20                          ; 0x1c9e3 $C9D3 69 20                   ;
sta      $2A,x                         ; 0x1c9e5 $C9D5 95 2A                   ; Enemy Y Position
lda      #$01                          ; 0x1c9e7 $C9D7 A9 01                   ; A = 01
sta      $1A,x                         ; 0x1c9e9 $C9D9 95 1A                   ;
sta      $B6,x                         ; 0x1c9eb $C9DB 95 B6                   ; Generated Enemy Slot
sta      $A1,x                         ; 0x1c9ed $C9DD 95 A1                   ; Enemy Code
sta      $057E,x                       ; 0x1c9ef $C9DF 9D 7E 05                ; Enemy Y Velocity
ldy      $072F                         ; 0x1c9f2 $C9E2 AC 2F 07                ; Area Data Reading Offset
lda      ($D4),y                       ; 0x1c9f5 $C9E5 B1 D4                   ;
sta      $AF,x                         ; 0x1c9f7 $C9E7 95 AF                   ; Item Code
LC9E9                                                                          ;
rts                                    ; 0x1c9f9 $C9E9 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_table11                                                                  ;
.byt    $12,$16,$2A,$16                ; 0x1c9fa $C9EA 12 16 2A 16             ;
LC9EE                                                                          ;
.byt    $20,$C5,$FF                    ; 0x1c9fe $C9EE 20 C5 FF                ;
; ---------------------------------------------------------------------------- ;
bank7_code15                                                                   ;
lda      #$0A                          ; 0x1ca01 $C9F1 A9 0A                   ; A = 0A
sta      $80                           ; 0x1ca03 $C9F3 85 80                   ; Current Animation Frame for Link (OW and SS)
jsr      bank7_Links_Display_Routine   ; 0x1ca05 $C9F5 20 F0 EB                ;
lda      $12                           ; 0x1ca08 $C9F8 A5 12                   ;; Frame Counter (ascending)
and      #$03                          ; 0x1ca0a $C9FA 29 03                   ; keep bits .... ..xx
tax                                    ; 0x1ca0c $C9FC AA                      ;
lda      bank7_table11,x               ; 0x1ca0d $C9FD BD EA C9                ;
sta      $696F                         ; 0x1ca10 $CA00 8D 6F 69                ;
lda      $050E                         ; 0x1ca13 $CA03 AD 0E 05                ;
bne      LCA15                         ; 0x1ca16 $CA06 D0 0D                   ;
lda      #$0F                          ; 0x1ca18 $CA08 A9 0F                   ; A = 0F
sta      $696F                         ; 0x1ca1a $CA0A 8D 6F 69                ;
lda      #$10                          ; 0x1ca1d $CA0D A9 10                   ; A = 10
jsr      bank7_chr_bank_switch__load_A ; 0x1ca1f $CA0F 20 B1 FF                ;
inc      $0736                         ; 0x1ca22 $CA12 EE 36 07                ; Game Mode
LCA15                                                                          ;
lda      #$04                          ; 0x1ca25 $CA15 A9 04                   ; A = 04
LCA17                                                                          ;
sta      $0725                         ; 0x1ca27 $CA17 8D 25 07                ;; PPU Macro Selector	
rts                                    ; 0x1ca2a $CA1A 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCA1B                                                                          ;
jsr      bank7_JmpToRoutine_at_Index_073D_in_Table_Address_from_the_top_of_the_Stack_The_Pointer_Table_immediately_follows_the_JSR_to_D382; 0x1ca2b $CA1B 20 82 D3;
bank7_pointer_table11                                                          ;
.word    bank0_unknown1                ; 0x1ca2e $CA1E 40 81                   ;
.word    bank7_code16                  ; 0x1ca30 $CA20 24 CA                   ;
.word    LCA72                         ; 0x1ca32 $CA22 72 CA                   ;
; ---------------------------------------------------------------------------- ;
bank7_code16                                                                   ;
ldx      #$01                          ; 0x1ca34 $CA24 A2 01                   ; X = 01
LCA26                                                                          ;
jsr      LCB18_fill_hp_or_mp_to_full__provide_x_register__maybe; 0x1ca36 $CA26 20 18 CB;
dex                                    ; 0x1ca39 $CA29 CA                      ;
bpl      LCA26                         ; 0x1ca3a $CA2A 10 FA                   ;
lda      #$00                          ; 0x1ca3c $CA2C A9 00                   ; A = 00
sta      $074C                         ; 0x1ca3e $CA2E 8D 4C 07                ;; Dialog Type (00 - None, 01 - Level Up, 02 - Talking); * related to Raft Animation * (and other events, like spell learning)
sta      $0524                         ; 0x1ca41 $CA31 8D 24 05                ; Routine Index
sta      $0525                         ; 0x1ca44 $CA34 8D 25 05                ; Routine Delay
sta      $DE                           ; 0x1ca47 $CA37 85 DE                   ;;prevent movement/actions, occur when a chat is occuring; Spell Spell modifier (1 = Spell spell active) (and more)	;set to 1 to prevent moving, 0 to allow??
sta      $048D                         ; 0x1ca49 $CA39 8D 8D 04                ; Related to Link's flicker after being hit ?
ldy      #$05                          ; 0x1ca4c $CA3C A0 05                   ; Y = 05
LCA3E                                                                          ;
sta      $05C3,y                       ; 0x1ca4e $CA3E 99 C3 05                ;
dey                                    ; 0x1ca51 $CA41 88                      ;
bpl      LCA3E                         ; 0x1ca52 $CA42 10 FA                   ;
dec      $0700                         ; 0x1ca54 $CA44 CE 00 07                ; Current number of lives
bne      LCA6C                         ; 0x1ca57 $CA47 D0 23                   ;
;Game Over                                                                     ;
lda      #$02                          ; 0x1ca59 $CA49 A9 02                   ; A = 02
sta      $E9                           ; 0x1ca5b $CA4B 85 E9                   ;
lda      #$F0                          ; 0x1ca5d $CA4D A9 F0                   ; A = F0 (delay to show Ganon's Return)
sta      $0501                         ; 0x1ca5f $CA4F 8D 01 05                ;; Timer
inc      $0726                         ; 0x1ca62 $CA52 EE 26 07                ;;?which is the black transition screen when loading a battle scene.  It hides the loading gfx.; Dialog Box Drawing Flag (00-01) Toggles while a dialog box is being drawn.
inc      $073D                         ; 0x1ca65 $CA55 EE 3D 07                ;; Routine Index
lda      #$09                          ; 0x1ca68 $CA58 A9 09                   ; A = 09
jsr      LCA17                         ; 0x1ca6a $CA5A 20 17 CA                ;
lda      #$00                          ; 0x1ca6d $CA5D A9 00                   ; A = 00
sta      $0775                         ; 0x1ca6f $CA5F 8D 75 07                ; Current Experience (high byte)
sta      $0776                         ; 0x1ca72 $CA62 8D 76 07                ; Current Experience (low byte)
sta      $0756                         ; 0x1ca75 $CA65 8D 56 07                ; Experience to be added (low byte)
sta      $0755                         ; 0x1ca78 $CA68 8D 55 07                ; Experience to be added (high byte)
rts                                    ; 0x1ca7b $CA6B 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCA6C                                                                          ;
lda      #$06                          ; 0x1ca7c $CA6C A9 06                   ; A = 06
sta      $076C                         ; 0x1ca7e $CA6E 8D 6C 07                ;; (00=restart from zelda's castle with 3 lives,  01=no routine, 02=die, 03=wake up zelda, 04=roll credits, 06=show the lives then restart the scene)
LCA71                                                                          ;
rts                                    ; 0x1ca81 $CA71 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCA72                                                                          ;
lda      #$00                          ; 0x1ca82 $CA72 A9 00                   ; A = 00
sta      $0726                         ; 0x1ca84 $CA74 8D 26 07                ;;?which is the black transition screen when loading a battle scene.  It hides the loading gfx.; Dialog Box Drawing Flag (00-01) Toggles while a dialog box is being drawn.
lda      $F7                           ; 0x1ca87 $CA77 A5 F7                   ; Controller 1 Buttons Held
and      #$10                          ; 0x1ca89 $CA79 29 10                   ; keep bits ...x .... (Start button)
bne      LCA82                         ; 0x1ca8b $CA7B D0 05                   ;
lda      $0501                         ; 0x1ca8d $CA7D AD 01 05                ;; Timer
bne      LCA71                         ; 0x1ca90 $CA80 D0 EF                   ;
LCA82                                                                          ;
jmp      LCF05                         ; 0x1ca92 $CA82 4C 05 CF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCA85                                                                          ;
lda      $F7                           ; 0x1ca95 $CA85 A5 F7                   ; Controller 1 Buttons Held
and      #$30                          ; 0x1ca97 $CA87 29 30                   ; keep bits ..xx .... (Start/Select buttons)
asl                                    ; 0x1ca99 $CA89 0A                      ;
asl                                    ; 0x1ca9a $CA8A 0A                      ;
sta      $00                           ; 0x1ca9b $CA8B 85 00                   ;
lda      $0744                         ; 0x1ca9d $CA8D AD 44 07                ; Controller 1 Buttons Held
and      #$30                          ; 0x1caa0 $CA90 29 30                   ; keep bits ..xx ....
asl                                    ; 0x1caa2 $CA92 0A                      ;
asl                                    ; 0x1caa3 $CA93 0A                      ;
cmp      $00                           ; 0x1caa4 $CA94 C5 00                   ;
beq      LCAF6                         ; 0x1caa6 $CA96 F0 5E                   ;
bit      $00                           ; 0x1caa8 $CA98 24 00                   ;
bvc      LCAF7_gameoverscreen_select_button_pressed; 0x1caaa $CA9A 50 5B       ;
;Implies Start button pressed                                                  ;
lda      $079F                         ; 0x1caac $CA9C AD 9F 07                ; Number of Continues used
cmp      #$FF                          ; 0x1caaf $CA9F C9 FF                   ;
beq      LCAA6                         ; 0x1cab1 $CAA1 F0 03                   ;
inc      $079F                         ; 0x1cab3 $CAA3 EE 9F 07                ; Number of Continues + 1
;Reset Memory Ranges                                                           ;
LCAA6                                                                          ;
ldx      #$0F                          ; 0x1cab6 $CAA6 A2 0F                   ; X = 0F
lda      #$00                          ; 0x1cab8 $CAA8 A9 00                   ; A = 00
LCAAA                                                                          ;
sta      $E0,x                         ; 0x1caba $CAAA 95 E0                   ;
dex                                    ; 0x1cabc $CAAC CA                      ;
bpl      LCAAA                         ; 0x1cabd $CAAD 10 FB                   ;
ldy      #$C0                          ; 0x1cabf $CAAF A0 C0                   ; Y = C0
LCAB1                                                                          ;
sta      $0700,y                       ; 0x1cac1 $CAB1 99 00 07                ;
iny                                    ; 0x1cac4 $CAB4 C8                      ;
bne      LCAB1                         ; 0x1cac5 $CAB5 D0 FA                   ;
lda      $0488                         ; 0x1cac7 $CAB7 AD 88 04                ;
beq      LCAC4                         ; 0x1caca $CABA F0 08                   ;
lda      #$40                          ; 0x1cacc $CABC A9 40                   ; A = 40
sta      $07B0                         ; 0x1cace $CABE 8D B0 07                ;;timer used on GameOverScreen for flashing "SAVE" red and white
jmp      LCF05                         ; 0x1cad1 $CAC1 4C 05 CF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCAC4                                                                          ;
sta      $0775                         ; 0x1cad4 $CAC4 8D 75 07                ; Current Experience (high byte)
sta      $0776                         ; 0x1cad7 $CAC7 8D 76 07                ; Current Experience (low byte)
sta      $0756                         ; 0x1cada $CACA 8D 56 07                ; Experience to be added (low byte)
sta      $0755                         ; 0x1cadd $CACD 8D 55 07                ; Experience to be added (high byte)
jsr      bank7_FUNCTION_CONVERT_706_and_707_to_Rx5plusW; 0x1cae0 $CAD0 20 30 CF; Region Code * 5 + World Code
cmp      #$0F                          ; 0x1cae3 $CAD3 C9 0F                   ; Check if in Great Palace
beq      bank7_restore_in_grand_palace_restore_restart_in_gp; 0x1cae5 $CAD5 F0 07;
lda      #$00                          ; 0x1cae7 $CAD7 A9 00                   ; A = 00
ldy      #$01                          ; 0x1cae9 $CAD9 A0 01                   ; Y = 01
jmp      LCAF0                         ; 0x1caeb $CADB 4C F0 CA                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_restore_in_grand_palace_restore_restart_in_gp                            ;
jsr      bank7_Reset_Number_of_Lives__to_3_; 0x1caee $CADE 20 58 C3            ; Reset Number of Lives (to 3)
lda      #$00                          ; 0x1caf1 $CAE1 A9 00                   ; A = 00
sta      $0561                         ; 0x1caf3 $CAE3 8D 61 05                ; Area Code
sta      $0701                         ; 0x1caf6 $CAE6 8D 01 07                ; Facing direction when entering area
sta      $075C                         ; 0x1caf9 $CAE9 8D 5C 07                ; Position code when entering area (0-3)
lda      #$01                          ; 0x1cafc $CAEC A9 01                   ; A = 01 (if 0, restart in North Castle)
ldy      #$02                          ; 0x1cafe $CAEE A0 02                   ; Y = 02
LCAF0                                                                          ;
sta      $076C                         ; 0x1cb00 $CAF0 8D 6C 07                ;; (00=restart from zelda's castle with 3 lives,  01=no routine, 02=die, 03=wake up zelda, 04=roll credits, 06=show the lives then restart the scene)
sty      $075F                         ; 0x1cb03 $CAF3 8C 5F 07                ;;at bank0: 0D64: AD 5F07	LDA $075F	then 	STA $EB		; Music Channel	; something to do with music
LCAF6                                                                          ;
rts                                    ; 0x1cb06 $CAF6 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCAF7_gameoverscreen_select_button_pressed                                     ;
bpl      LCAF6                         ; 0x1cb07 $CAF7 10 FD                   ;
lda      #$10                          ; 0x1cb09 $CAF9 A9 10                   ; A = 10
sta      $EF                           ; 0x1cb0b $CAFB 85 EF                   ; Sound Effects Type 4
ldy      #$06                          ; 0x1cb0d $CAFD A0 06                   ; Y = 06
LCAFF                                                                          ;
lda      $6974,y                       ; 0x1cb0f $CAFF B9 74 69                ;
sta      L0302,y                       ; 0x1cb12 $CB02 99 02 03                ;
dey                                    ; 0x1cb15 $CB05 88                      ;
bpl      LCAFF                         ; 0x1cb16 $CB06 10 F7                   ;
lda      $0488                         ; 0x1cb18 $CB08 AD 88 04                ;
eor      #$01                          ; 0x1cb1b $CB0B 49 01                   ; flip bits .... ...x
sta      $0488                         ; 0x1cb1d $CB0D 8D 88 04                ;
asl                                    ; 0x1cb20 $CB10 0A                      ;
tay                                    ; 0x1cb21 $CB11 A8                      ;
lda      #$FA                          ; 0x1cb22 $CB12 A9 FA                   ; A = FA
sta      $0305,y                       ; 0x1cb24 $CB14 99 05 03                ;
rts                                    ; 0x1cb27 $CB17 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCB18_fill_hp_or_mp_to_full__provide_x_register__maybe                         ;
;Magic Containers to Magic Units in Meter                                      ;
;Heart Containers to Life Units in Meter                                       ;
;                                                                              ;
;X = 0 -> Magic                                                                ;
;X = 1 -> Life                                                                 ;
;                                                                              ;
;Units Left = Number of Containers * 20 - 1                                    ;
lda      $0783,x                       ; 0x1cb28 $CB18 BD 83 07                ; Current number of Magic/Heart Containers
asl                                    ; 0x1cb2b $CB1B 0A                      ;
asl                                    ; 0x1cb2c $CB1C 0A                      ;
asl                                    ; 0x1cb2d $CB1D 0A                      ;
asl                                    ; 0x1cb2e $CB1E 0A                      ;
asl                                    ; 0x1cb2f $CB1F 0A                      ;
sec                                    ; 0x1cb30 $CB20 38                      ;
sbc      #$01                          ; 0x1cb31 $CB21 E9 01                   ;
sta      $0773,x                       ; 0x1cb33 $CB23 9D 73 07                ; Current Magic/Life left in meter
rts                                    ; 0x1cb36 $CB26 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCB27                                                                          ;
lda      #$0E                          ; 0x1cb37 $CB27 A9 0E                   ; A = 0E
sta      $076E                         ; 0x1cb39 $CB29 8D 6E 07                ; Graphics bank to use
jsr      LC388                         ; 0x1cb3c $CB2C 20 88 C3                ;
jmp      LC360                         ; 0x1cb3f $CB2F 4C 60 C3                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Height_of_frontier_between_North_and_South                               ;
;3C	Region 0	West Hyrule                                                       ;
;4B	Region 1	Death Mountain, Maze Island                                       ;
;4C	Region 2	East Hyrule                                                       ;
.byt    $3C,$4B,$4C                    ; 0x1cb42 $CB32 3C 4B 4C                ;
; ---------------------------------------------------------------------------- ;
bank7_code17                                                                   ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1cb45 $CB35 20 C9 FF                ; Load Bank in $0769
ldy      $0748                         ; 0x1cb48 $CB38 AC 48 07                ;; area location index (the index of the spot on the overworld that pulled you into the sideview)	; Overworld Area out of Side View
cpy      #$FF                          ; 0x1cb4b $CB3B C0 FF                   ;
bne      LCB42                         ; 0x1cb4d $CB3D D0 03                   ;
jmp      bank7_Determine_the_Random_Battle_according_to_Links_position_in_OW; 0x1cb4f $CB3F 4C 0F CC;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCB42                                                                          ;
lda      $0706                         ; 0x1cb52 $CB42 AD 06 07                ; Current Region
bne      LCB4B                         ; 0x1cb55 $CB45 D0 04                   ;
cpy      #$00                          ; 0x1cb57 $CB47 C0 00                   ;
beq      LCB59                         ; 0x1cb59 $CB49 F0 0E                   ;
;On exit, appear at the location of area index minus this value (0-3)          ;
LCB4B                                                                          ;
lda      $07AC                         ; 0x1cb5b $CB4B AD AC 07                ;
ora      $07AA                         ; 0x1cb5e $CB4E 0D AA 07                ;
ora      $07AD                         ; 0x1cb61 $CB51 0D AD 07                ;; * related to Raft Animation *
bne      LCB59                         ; 0x1cb64 $CB54 D0 03                   ;
jsr      bank7_Mute_music_when_loading_between_areas; 0x1cb66 $CB56 20 3D D0   ; Mute Music
LCB59                                                                          ;
lda      $6A3F,y                       ; 0x1cb69 $CB59 B9 3F 6A                ; Area Byte 1 (X Position)
and      #$C0                          ; 0x1cb6c $CB5C 29 C0                   ; keep bits xx.. ....
asl                                    ; 0x1cb6e $CB5E 0A                      ;
rol                                    ; 0x1cb6f $CB5F 2A                      ;
rol                                    ; 0x1cb70 $CB60 2A                      ;
sta      $00                           ; 0x1cb71 $CB61 85 00                   ;
tya                                    ; 0x1cb73 $CB63 98                      ;
sec                                    ; 0x1cb74 $CB64 38                      ;
sbc      $00                           ; 0x1cb75 $CB65 E5 00                   ;
sta      $0748                         ; 0x1cb77 $CB67 8D 48 07                ; Overworld Area out of Side View
lda      $6A00,y                       ; 0x1cb7a $CB6A B9 00 6A                ; Area Byte 0 (Y Position)
asl                                    ; 0x1cb7d $CB6D 0A                      ;
bcc      LCBB8                         ; 0x1cb7e $CB6E 90 48                   ;
lda      #$00                          ; 0x1cb80 $CB70 A9 00                   ; A = 00
sta      $07DB                         ; 0x1cb82 $CB72 8D DB 07                ;; Something for Palaces ?
jsr      bank7_Get_Area_Code__Enter_Code_and_Direction; 0x1cb85 $CB75 20 97 CC ; Get Area Code, Enter Code and Direction
lda      $0748                         ; 0x1cb88 $CB78 AD 48 07                ; Overworld Area out of Side View
sec                                    ; 0x1cb8b $CB7B 38                      ;
sbc      #$2C                          ; 0x1cb8c $CB7C E9 2C                   ;
lsr                                    ; 0x1cb8e $CB7E 4A                      ;
sta      $056B                         ; 0x1cb8f $CB7F 8D 6B 05                ; Town Code
;$056B = ($0748 - #$2C) / 2 (no remainder)                                     ;
lda      $0748                         ; 0x1cb92 $CB82 AD 48 07                ;; area location index (the index of the spot on the overworld that pulled you into the sideview)	; Overworld Area out of Side View
sec                                    ; 0x1cb95 $CB85 38                      ;
sbc      #$34                          ; 0x1cb96 $CB86 E9 34                   ;
sta      $056C                         ; 0x1cb98 $CB88 8D 6C 05                ; Palace Code
;$056C = $0748 - #$34                                                          ;
lda      $0706                         ; 0x1cb9b $CB8B AD 06 07                ; Current Region
sta      $070A                         ; 0x1cb9e $CB8E 8D 0A 07                ;; Previous Region ?
lda      $6ABD,y                       ; 0x1cba1 $CB91 B9 BD 6A                ; Area Byte 3 (World Number)
pha                                    ; 0x1cba4 $CB94 48                      ;
and      #$03                          ; 0x1cba5 $CB95 29 03                   ; keep bits .... ..xx
sta      $0706                         ; 0x1cba7 $CB97 8D 06 07                ; Current Region
beq      LCBA5                         ; 0x1cbaa $CB9A F0 09                   ;
;If Region != 0, Town Code + 4                                                 ;
lda      $056B                         ; 0x1cbac $CB9C AD 6B 05                ; Town Code
clc                                    ; 0x1cbaf $CB9F 18                      ;
adc      #$04                          ; 0x1cbb0 $CBA0 69 04                   ;
sta      $056B                         ; 0x1cbb2 $CBA2 8D 6B 05                ;; Town Code	;used by wise man to pick magic to give?
LCBA5                                                                          ;
pla                                    ; 0x1cbb5 $CBA5 68                      ;
lsr                                    ; 0x1cbb6 $CBA6 4A                      ;
lsr                                    ; 0x1cbb7 $CBA7 4A                      ;
and      #$07                          ; 0x1cbb8 $CBA8 29 07                   ; keep bits .... .xxx
sta      $0707                         ; 0x1cbba $CBAA 8D 07 07                ; Current World
bne      LCBB2                         ; 0x1cbbd $CBAD D0 03                   ;
inc      $0709                         ; 0x1cbbf $CBAF EE 09 07                ;; used for going outside??
LCBB2                                                                          ;
lda      #$00                          ; 0x1cbc2 $CBB2 A9 00                   ; A = 00
sta      $0736                         ; 0x1cbc4 $CBB4 8D 36 07                ; Game Mode
rts                                    ; 0x1cbc7 $CBB7 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCBB8                                                                          ;
lda      $0706                         ; 0x1cbc8 $CBB8 AD 06 07                ; Current Region
ora      $0707                         ; 0x1cbcb $CBBB 0D 07 07                ; Current World
ora      $0748                         ; 0x1cbce $CBBE 0D 48 07                ;; area location index (the index of the spot on the overworld that pulled you into the sideview)	; Overworld Area out of Side View
beq      LCBCD                         ; 0x1cbd1 $CBC1 F0 0A                   ;
lda      $07AC                         ; 0x1cbd3 $CBC3 AD AC 07                ;
bne      LCBCD                         ; 0x1cbd6 $CBC6 D0 05                   ;
lda      #$04                          ; 0x1cbd8 $CBC8 A9 04                   ; A = 04
sta      $075F                         ; 0x1cbda $CBCA 8D 5F 07                ;;at bank0: 0D64: AD 5F07	LDA $075F	then 	STA $EB		; Music Channel	; something to do with music
LCBCD                                                                          ;
jsr      bank7_Get_Area_Code__Enter_Code_and_Direction; 0x1cbdd $CBCD 20 97 CC ;
;Related to the side Link enters from in a pass-through area                   ;
lda      $6ABD,y                       ; 0x1cbe0 $CBD0 B9 BD 6A                ; Area Byte 3 (World Number)
and      #$60                          ; 0x1cbe3 $CBD3 29 60                   ; keep bits .xx. ....
beq      LCBF2                         ; 0x1cbe5 $CBD5 F0 1B                   ;
and      #$20                          ; 0x1cbe7 $CBD7 29 20                   ; keep bits ..x. ....
bne      LCBF8                         ; 0x1cbe9 $CBD9 D0 1D                   ;
lda      $0562                         ; 0x1cbeb $CBDB AD 62 05                ; Link's facing direction in OW
cmp      #$04                          ; 0x1cbee $CBDE C9 04                   ; check if Link is facing left or right
bcc      LCBE4                         ; 0x1cbf0 $CBE0 90 02                   ;
lsr                                    ; 0x1cbf2 $CBE2 4A                      ;
lsr                                    ; 0x1cbf3 $CBE3 4A                      ;
LCBE4                                                                          ;
and      #$01                          ; 0x1cbf4 $CBE4 29 01                   ; keep bits .... ...x
eor      #$01                          ; 0x1cbf6 $CBE6 49 01                   ; flip bits .... ...x
sta      $0701                         ; 0x1cbf8 $CBE8 8D 01 07                ; Facing direction when entering area
beq      LCBEF                         ; 0x1cbfb $CBEB F0 02                   ;
lda      #$03                          ; 0x1cbfd $CBED A9 03                   ; A = 03
LCBEF                                                                          ;
sta      $075C                         ; 0x1cbff $CBEF 8D 5C 07                ; Position code when entering area (0-3)
LCBF2                                                                          ;
inc      $0736                         ; 0x1cc02 $CBF2 EE 36 07                ; Game Mode
jmp      LCC40                         ; 0x1cc05 $CBF5 4C 40 CC                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCBF8                                                                          ;
lda      #$01                          ; 0x1cc08 $CBF8 A9 01                   ; A = 01
sta      $0701                         ; 0x1cc0a $CBFA 8D 01 07                ; Facing direction when entering area
lda      $075F                         ; 0x1cc0d $CBFD AD 5F 07                ;;at bank0: 0D64: AD 5F07	LDA $075F	then 	STA $EB		; Music Channel	; something to do with music
cmp      #$01                          ; 0x1cc10 $CC00 C9 01                   ;
bne      LCBF2                         ; 0x1cc12 $CC02 D0 EE                   ;
sta      $075C                         ; 0x1cc14 $CC04 8D 5C 07                ;;start this map page		; start this many 'pages' into the scene	0	1	2	3		;4 = middle?	; Position code when entering area (0-3) (can be 4)
jsr      LCC50                         ; 0x1cc17 $CC07 20 50 CC                ;
lda      #$11                          ; 0x1cc1a $CC0A A9 11                   ; A = 11
jmp      LCC85                         ; 0x1cc1c $CC0C 4C 85 CC                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Determine_the_Random_Battle_according_to_Links_position_in_OW            ;
ldy      $0706                         ; 0x1cc1f $CC0F AC 06 07                ; Current Region
lda      $73                           ; 0x1cc22 $CC12 A5 73                   ; Y Position on OW (square unit)
cmp      bank7_Height_of_frontier_between_North_and_South,y; 0x1cc24 $CC14 D9 32 CB; Height of frontier between North and South
lda      #$00                          ; 0x1cc27 $CC17 A9 00                   ; A = 00
rol                                    ; 0x1cc29 $CC19 2A                      ;
sta      $00                           ; 0x1cc2a $CC1A 85 00                   ;
lda      $0563                         ; 0x1cc2c $CC1C AD 63 05                ; Type of terrain Link is facing in OW
sec                                    ; 0x1cc2f $CC1F 38                      ;
sbc      #$04                          ; 0x1cc30 $CC20 E9 04                   ;
asl                                    ; 0x1cc32 $CC22 0A                      ;
adc      $00                           ; 0x1cc33 $CC23 65 00                   ;
tay                                    ; 0x1cc35 $CC25 A8                      ;
lda      L8409,y                       ; 0x1cc36 $CC26 B9 09 84                ;
ldy      #$3E                          ; 0x1cc39 $CC29 A0 3E                   ; Y = 3E
sta      $6A7E,y                       ; 0x1cc3b $CC2B 99 7E 6A                ; Area Byte 2 (Map Number)
lda      $73                           ; 0x1cc3e $CC2E A5 73                   ;; Overworld Y; Y Position on OW (square unit)
sta      $6A00,y                       ; 0x1cc40 $CC30 99 00 6A                ; Area Byte 0 (Y Position)
lda      $74                           ; 0x1cc43 $CC33 A5 74                   ;; Overworld X; X Position on OW (square unit)
sta      $6A3F,y                       ; 0x1cc45 $CC35 99 3F 6A                ; Area Byte 1 (X Position)
jsr      LCB59                         ; 0x1cc48 $CC38 20 59 CB                ;
lda      #$00                          ; 0x1cc4b $CC3B A9 00                   ; A = 00
sta      $075F                         ; 0x1cc4d $CC3D 8D 5F 07                ;;at bank0: 0D64: AD 5F07	LDA $075F	then 	STA $EB		; Music Channel	; something to do with music
LCC40                                                                          ;
lda      $6ABD,y                       ; 0x1cc50 $CC40 B9 BD 6A                ; Area Byte 3 (World Number)
and      #$20                          ; 0x1cc53 $CC43 29 20                   ; keep bits ..x. .... (enter from right)
bne      LCC89                         ; 0x1cc55 $CC45 D0 42                   ;
lda      $075C                         ; 0x1cc57 $CC47 AD 5C 07                ; Position code when entering area
beq      LCC89                         ; 0x1cc5a $CC4A F0 3D                   ;
cmp      #$03                          ; 0x1cc5c $CC4C C9 03                   ;
beq      LCC89                         ; 0x1cc5e $CC4E F0 39                   ;
LCC50                                                                          ;
and      #$01                          ; 0x1cc60 $CC50 29 01                   ; keep bits .... ...x
sta      $0701                         ; 0x1cc62 $CC52 8D 01 07                ; Facing direction when entering area
lda      #$70                          ; 0x1cc65 $CC55 A9 70                   ; A = 70
sta      $4D                           ; 0x1cc67 $CC57 85 4D                   ; Link's X Position (low byte)
ldx      #$0B                          ; 0x1cc69 $CC59 A2 0B                   ; X = 0B
stx      $0734                         ; 0x1cc6b $CC5B 8E 34 07                ;
ldx      #$06                          ; 0x1cc6e $CC5E A2 06                   ; X = 06
stx      $0735                         ; 0x1cc70 $CC60 8E 35 07                ;
ldx      #$00                          ; 0x1cc73 $CC63 A2 00                   ; X = 00
stx      $FD                           ; 0x1cc75 $CC65 86 FD                   ;
stx      $072C                         ; 0x1cc77 $CC67 8E 2C 07                ; Scrolling Offset Low Byte
ldx      $075C                         ; 0x1cc7a $CC6A AE 5C 07                ;;start this map page		; start this many 'pages' into the scene	0	1	2	3		;4 = middle?	; Position code when entering area (0-3) (can be 4)
stx      $3B                           ; 0x1cc7d $CC6D 86 3B                   ; Link's X Position (high byte)
stx      $072A                         ; 0x1cc7f $CC6F 8E 2A 07                ; Scrolling Offset High Byte
dex                                    ; 0x1cc82 $CC72 CA                      ;
stx      $0732                         ; 0x1cc83 $CC73 8E 32 07                ;
inx                                    ; 0x1cc86 $CC76 E8                      ;
inx                                    ; 0x1cc87 $CC77 E8                      ;
stx      $0733                         ; 0x1cc88 $CC78 8E 33 07                ;
lda      $6ABD,y                       ; 0x1cc8b $CC7B B9 BD 6A                ; Area Byte 3 (World Number)
asl                                    ; 0x1cc8e $CC7E 0A                      ;
lda      #$12                          ; 0x1cc8f $CC7F A9 12                   ; A = 12
bcc      LCC85                         ; 0x1cc91 $CC81 90 02                   ;
lda      #$0C                          ; 0x1cc93 $CC83 A9 0C                   ; A = 0C
LCC85                                                                          ;
sta      $0736                         ; 0x1cc95 $CC85 8D 36 07                ; Game Mode
LCC88                                                                          ;
rts                                    ; 0x1cc98 $CC88 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCC89                                                                          ;
lda      $6ABD,y                       ; 0x1cc99 $CC89 B9 BD 6A                ; Area Byte 3 (World Number)
asl                                    ; 0x1cc9c $CC8C 0A                      ;
bcc      LCC88                         ; 0x1cc9d $CC8D 90 F9                   ;
lda      #$01                          ; 0x1cc9f $CC8F A9 01                   ; A = 01
sta      $075C                         ; 0x1cca1 $CC91 8D 5C 07                ;;start this map page		; start this many 'pages' into the scene	0	1	2	3		;4 = middle?	; Position code when entering area (0-3) (can be 4)
jmp      LCC50                         ; 0x1cca4 $CC94 4C 50 CC                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Get_Area_Code__Enter_Code_and_Direction                                  ;
lda      $6A7E,y                       ; 0x1cca7 $CC97 B9 7E 6A                ; Area Byte 2 (Map Number)
pha                                    ; 0x1ccaa $CC9A 48                      ;
and      #$3F                          ; 0x1ccab $CC9B 29 3F                   ; keep bits ..xx xxxx
sta      $0561                         ; 0x1ccad $CC9D 8D 61 05                ; Area Code
pla                                    ; 0x1ccb0 $CCA0 68                      ;
asl                                    ; 0x1ccb1 $CCA1 0A                      ;
rol                                    ; 0x1ccb2 $CCA2 2A                      ;
rol                                    ; 0x1ccb3 $CCA3 2A                      ;
and      #$03                          ; 0x1ccb4 $CCA4 29 03                   ; keep bits .... ..xx
sta      $075C                         ; 0x1ccb6 $CCA6 8D 5C 07                ; Position code when entering area
and      #$01                          ; 0x1ccb9 $CCA9 29 01                   ; keep bits .... ...x
sta      $0701                         ; 0x1ccbb $CCAB 8D 01 07                ; Facing direction when entering area
rts                                    ; 0x1ccbe $CCAE 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCCAF                                                                          ;
lda      #$66                          ; 0x1ccbf $CCAF A9 66                   ; A = 66
bne      LCCCC                         ; 0x1ccc1 $CCB1 D0 19                   ;
bank7_go_outside                                                               ;
lda      #$00                          ; 0x1ccc3 $CCB3 A9 00                   ; A = 00
sta      $0709                         ; 0x1ccc5 $CCB5 8D 09 07                ;; used for going outside??
sta      $075B                         ; 0x1ccc8 $CCB8 8D 5B 07                ;
ldy      $0748                         ; 0x1cccb $CCBB AC 48 07                ;; area location index (the index of the spot on the overworld that pulled you into the sideview)	; Overworld Area out of Side View
lda      $6A00,y                       ; 0x1ccce $CCBE B9 00 6A                ; Area Byte 0 (Y Position)
bne      LCCCC                         ; 0x1ccd1 $CCC1 D0 09                   ;
lda      #$3D                          ; 0x1ccd3 $CCC3 A9 3D                   ; A = 3D
cmp      $6A3F,y                       ; 0x1ccd5 $CCC5 D9 3F 6A                ; Area Byte 1 (X Position)
bne      LCCAF                         ; 0x1ccd8 $CCC8 D0 E5                   ;
lda      #$51                          ; 0x1ccda $CCCA A9 51                   ; A = 51
LCCCC                                                                          ;
and      #$7F                          ; 0x1ccdc $CCCC 29 7F                   ; keep bits .xxx xxxx
sta      $73                           ; 0x1ccde $CCCE 85 73                   ; Y Position on OW (square unit)
lda      $6A3F,y                       ; 0x1cce0 $CCD0 B9 3F 6A                ; Area Byte 1 (X Position)
and      #$3F                          ; 0x1cce3 $CCD3 29 3F                   ; keep bits ..xx xxxx
sta      $74                           ; 0x1cce5 $CCD5 85 74                   ; X Position on OW (square unit)
lda      $6ABD,y                       ; 0x1cce7 $CCD7 B9 BD 6A                ; Area Byte 3 (World Number)
and      #$40                          ; 0x1ccea $CCDA 29 40                   ; keep bits .x.. .... (unknown bit)
beq      LCCF9                         ; 0x1ccec $CCDC F0 1B                   ;
ldx      $0562                         ; 0x1ccee $CCDE AE 62 05                ; Link's facing direction in OW
cpx      #$04                          ; 0x1ccf1 $CCE1 E0 04                   ; check if Link is facing down
bcs      LCCFF                         ; 0x1ccf3 $CCE3 B0 1A                   ;
inc      $74                           ; 0x1ccf5 $CCE5 E6 74                   ; X Position on OW (square unit)
ldx      $5F                           ; 0x1ccf7 $CCE7 A6 5F                   ;; Link's facing direction
lda      $6A00,y                       ; 0x1ccf9 $CCE9 B9 00 6A                ; Area Byte 0 (Y Position)
asl                                    ; 0x1ccfc $CCEC 0A                      ; check for "External" bit
bcc      LCCF2                         ; 0x1ccfd $CCED 90 03                   ;
ldx      $0562                         ; 0x1ccff $CCEF AE 62 05                ; Link's facing direction in OW
LCCF2                                                                          ;
dex                                    ; 0x1cd02 $CCF2 CA                      ;
beq      LCCF9                         ; 0x1cd03 $CCF3 F0 04                   ;
dec      $74                           ; 0x1cd05 $CCF5 C6 74                   ; X Position on OW (square unit)
dec      $74                           ; 0x1cd07 $CCF7 C6 74                   ;; Overworld X; X Position on OW (square unit)
LCCF9                                                                          ;
jsr      bank7_Load_Bank_0_at_0x8000   ; 0x1cd09 $CCF9 20 C5 FF                ; Load Bank 0
jmp      LCF05                         ; 0x1cd0c $CCFC 4C 05 CF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCCFF                                                                          ;
inc      $73                           ; 0x1cd0f $CCFF E6 73                   ; Y Position on OW (square unit)
ldx      $5F                           ; 0x1cd11 $CD01 A6 5F                   ;; Link's facing direction
lda      $6A00,y                       ; 0x1cd13 $CD03 B9 00 6A                ; Area Byte 0 (Y Position)
asl                                    ; 0x1cd16 $CD06 0A                      ; check for "External" bit
bcc      LCD0F                         ; 0x1cd17 $CD07 90 06                   ;
lda      $0562                         ; 0x1cd19 $CD09 AD 62 05                ; Link's facing direction in OW
lsr                                    ; 0x1cd1c $CD0C 4A                      ;
lsr                                    ; 0x1cd1d $CD0D 4A                      ;
tax                                    ; 0x1cd1e $CD0E AA                      ;
LCD0F                                                                          ;
dex                                    ; 0x1cd1f $CD0F CA                      ;
beq      LCCF9                         ; 0x1cd20 $CD10 F0 E7                   ;
dec      $73                           ; 0x1cd22 $CD12 C6 73                   ; Y Position on OW (square unit)
dec      $73                           ; 0x1cd24 $CD14 C6 73                   ;; Overworld Y; Y Position on OW (square unit)
jmp      LCCF9                         ; 0x1cd26 $CD16 4C F9 CC                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCD19                                                                          ;
jsr      LD15C                         ; 0x1cd29 $CD19 20 5C D1                ;
jsr      bank7_PullAddrFromTableFollowingThisJSR_withIndexOfA_then_JMP; 0x1cd2c $CD1C 20 85 D3;
bank7_pointer_table12                                                          ;
.word    LCF21_SaveGameWhenChooseSAVEwhenDead__maybe; 0x1cd2f $CD1F 21 CF      ;
.word    LCF05                         ; 0x1cd31 $CD21 05 CF                   ;
bank7_Pointer_table_for_Key_Areas_Data                                         ;
.word    L861F                         ; 0x1cd33 $CD23 1F 86                   ;West Hyrule - Key Areas (Y Pos, X Pos, Map, World)
.word    LA0FC                         ; 0x1cd35 $CD25 FC A0                   ;Death Mountain - Key Areas (Y Pos, X Pos, Map, World)
; ---------------------------------------------------------------------------- ;
bank7_Region_Overworld_Map_Pointer_Offset_Selector                             ;
.byt    $00,$02,$00                    ; 0x1cd37 $CD27 00 02 00                ;Region Overworld Map Pointer Offset Selector (3 bytes) for $706?
bank7_Graphics_Bank_for_Palaces_Palace_1                                       ;
;Index = Region (706) * 4 + Palace Code (56C)                                  ;
.byt    $04                            ; 0x1cd3a $CD2A 04                      ;04	Palace 1
bank7_Graphics_Bank_for_Palaces_Palace_2                                       ;
.byt    $05                            ; 0x1cd3b $CD2B 05                      ;05	Palace 2
bank7_Graphics_Bank_for_Palaces_Palace_3                                       ;
.byt    $09                            ; 0x1cd3c $CD2C 09                      ;09	Palace 3
bank7_Graphics_Bank_for_Palaces_Hypothetical_Palace_in_Region_0                ;
.byt    $09                            ; 0x1cd3d $CD2D 09                      ;09	Hypothetical Palace in Region 0
bank7_Graphics_Bank_for_Palaces_Palace_4                                       ;
.byt    $0A                            ; 0x1cd3e $CD2E 0A                      ;0A	Palace 4
bank7_Graphics_Bank_for_Palaces_Hypothetical_Palace_in_Region_1                ;
.byt    $0A                            ; 0x1cd3f $CD2F 0A                      ;0A	Hypothetical Palace in Region 1
                                                                               ;
.byt    $0A                            ; 0x1cd40 $CD30 0A                      ;0A	Hypothetical Palace in Region 1
                                                                               ;
.byt    $0A                            ; 0x1cd41 $CD31 0A                      ;0A	Hypothetical Palace in Region 1
bank7_Graphics_Bank_for_Palaces_Palace_5                                       ;
.byt    $0B                            ; 0x1cd42 $CD32 0B                      ;0B	Palace 5
bank7_Graphics_Bank_for_Palaces_Palace_6                                       ;
.byt    $0C                            ; 0x1cd43 $CD33 0C                      ;0C	Palace 6
bank7_Graphics_Bank_for_Palaces_Palace_7                                       ;
.byt    $06                            ; 0x1cd44 $CD34 06                      ;06	Palace 7                       
bank7_Table_for_Palace_Entrance_Palettes_Offset                                ;
;Index = Region (706) * 4 + Palace Code (56C)                                  ;
.byt    $00,$10,$20,$20,$30,$30,$30,$30; 0x1cd45 $CD35 00 10 20 20 30 30 30 30 ;
.byt    $40,$50,$60                    ; 0x1cd4d $CD3D 40 50 60                ;
; ---------------------------------------------------------------------------- ;
bank7_code18                                                                   ;
ldy      $0707                         ; 0x1cd50 $CD40 AC 07 07                ; Current World;cd40 ;Normalized world number into Y
lda      LC4B7,y                       ; 0x1cd53 $CD43 B9 B7 C4                ;cd43 ;Load bank number from table 
cmp      #$01                          ; 0x1cd56 $CD46 C9 01                   ;cd46 ;Bank 1 represents overworlds
bne      LCD59                         ; 0x1cd58 $CD48 D0 0F                   ;cd48 ;if not overworld, then done
; Determine if we really want bank 1 or 2                                      ;
ldy      $0706                         ; 0x1cd5a $CD4A AC 06 07                ; Current Region;cd4a ;Get the overworld index
beq      LCD59                         ; 0x1cd5d $CD4D F0 0A                   ;cd4d ;If index==0 then WestHy (bank1).  done.
dey                                    ; 0x1cd5f $CD4F 88                      ;cd4f ;Decrement index
bne      LCD57                         ; 0x1cd60 $CD50 D0 05                   ;cd50 ;If index!=0 then EastHy (bank2).
ldy      $070A                         ; 0x1cd62 $CD52 AC 0A 07                ;cd52 ;index was 1, so its either DM or MZ.
; Use the previous overworld ($070a) to                                        ;
; determin if bank 1 or bank 2.                                                ;
beq      LCD59                         ; 0x1cd65 $CD55 F0 02                   ;cd55 ;If Y==0, then bank 1.
LCD57                                                                          ;
lda      #$02                          ; 0x1cd67 $CD57 A9 02                   ; A = 02;cd57 ;Load bank 2
LCD59                                                                          ;
sta      $0769                         ; 0x1cd69 $CD59 8D 69 07                ; Bank to switch to;cd59 ;Store desired bank number                 
jsr      LFFCC                         ; 0x1cd6c $CD5C 20 CC FF                ; Bank Switch
lda      $0769                         ; 0x1cd6f $CD5F AD 69 07                ; Bank to switch to
ldy      $0707                         ; 0x1cd72 $CD62 AC 07 07                ; Current World
cpy      #$03                          ; 0x1cd75 $CD65 C0 03                   ;
bcc      LCD78                         ; 0x1cd77 $CD67 90 0F                   ;
lda      $0706                         ; 0x1cd79 $CD69 AD 06 07                ; Current Region
asl                                    ; 0x1cd7c $CD6C 0A                      ;
asl                                    ; 0x1cd7d $CD6D 0A                      ;
adc      $056C                         ; 0x1cd7e $CD6E 6D 6C 05                ; Palace Code
tay                                    ; 0x1cd81 $CD71 A8                      ;
lda      bank7_Graphics_Bank_for_Palaces_Palace_1,y; 0x1cd82 $CD72 B9 2A CD    ;
sta      $070B                         ; 0x1cd85 $CD75 8D 0B 07                ;Graphics Bank for Palaces
LCD78                                                                          ;
asl                                    ; 0x1cd88 $CD78 0A                      ;
sta      $076E                         ; 0x1cd89 $CD79 8D 6E 07                ; Graphics bank to use
ldy      $0707                         ; 0x1cd8c $CD7C AC 07 07                ; Current World
bne      LCD8A                         ; 0x1cd8f $CD7F D0 09                   ;
lda      $0706                         ; 0x1cd91 $CD81 AD 06 07                ; Current Region
cmp      #$01                          ; 0x1cd94 $CD84 C9 01                   ;
bne      LCD8A                         ; 0x1cd96 $CD86 D0 02                   ;
ldy      #$04                          ; 0x1cd98 $CD88 A0 04                   ; Y = 04
LCD8A                                                                          ;
lda      LC4BD,y                       ; 0x1cd9a $CD8A B9 BD C4                ;
tay                                    ; 0x1cd9d $CD8D A8                      ;
lda      bank7_Pointer_table_for_Key_Areas_Data,y; 0x1cd9e $CD8E B9 23 CD      ; Pointer to Area Pointers (low byte)
sta      $00                           ; 0x1cda1 $CD91 85 00                   ;
lda      bank7_Pointer_table_for_Key_Areas_Data+$01,y; 0x1cda3 $CD93 B9 24 CD  ; Pointer to Area Pointers (high byte)
sta      $01                           ; 0x1cda6 $CD96 85 01                   ;
ldy      #$00                          ; 0x1cda8 $CD98 A0 00                   ; Y = 00
LOOP_load_enemy_data_to_ram7000_7CFF                                           ;
lda      L88A0,y                       ; 0x1cdaa $CD9A B9 A0 88                ; Enemy Data Table
sta      $7000,y                       ; 0x1cdad $CD9D 99 00 70                ; load into 7000-70FF
iny                                    ; 0x1cdb0 $CDA0 C8                      ;
bne      LOOP_load_enemy_data_to_ram7000_7CFF; 0x1cdb1 $CDA1 D0 F7             ;
LCDA3                                                                          ;
lda      L89A0,y                       ; 0x1cdb3 $CDA3 B9 A0 89                ; Enemy Data Table
sta      $7100,y                       ; 0x1cdb6 $CDA6 99 00 71                ; load into 7100-71FF
iny                                    ; 0x1cdb9 $CDA9 C8                      ;
bne      LCDA3                         ; 0x1cdba $CDAA D0 F7                   ;
LCDAC                                                                          ;
lda      L8AA0,y                       ; 0x1cdbc $CDAC B9 A0 8A                ; Enemy Data Table
sta      $7200,y                       ; 0x1cdbf $CDAF 99 00 72                ; load into 7200-72FF
iny                                    ; 0x1cdc2 $CDB2 C8                      ;
bne      LCDAC                         ; 0x1cdc3 $CDB3 D0 F7                   ;
LCDB5                                                                          ;
lda      L8BA0,y                       ; 0x1cdc5 $CDB5 B9 A0 8B                ; Enemy Data Table
sta      $7300,y                       ; 0x1cdc8 $CDB8 99 00 73                ; load into 7300-73FF
iny                                    ; 0x1cdcb $CDBB C8                      ;
bne      LCDB5                         ; 0x1cdcc $CDBC D0 F7                   ;
ldx      $0706                         ; 0x1cdce $CDBE AE 06 07                ; Current Region
lda      bank7_Region_Overworld_Map_Pointer_Offset_Selector,x; 0x1cdd1 $CDC1 BD 27 CD;
tax                                    ; 0x1cdd4 $CDC4 AA                      ;
lda      L8508,x                       ; 0x1cdd5 $CDC5 BD 08 85                ; Overworld Map Data Pointer Low Byte
sta      $02                           ; 0x1cdd8 $CDC8 85 02                   ;
lda      L8509,x                       ; 0x1cdda $CDCA BD 09 85                ; Overworld Map Data Pointer High Byte
sta      $03                           ; 0x1cddd $CDCD 85 03                   ;
LCDCF                                                                          ;
lda      ($02),y                       ; 0x1cddf $CDCF B1 02                   ; Overworld Data
sta      $7C00,y                       ; 0x1cde1 $CDD1 99 00 7C                ; load into 7C00-7CFF
iny                                    ; 0x1cde4 $CDD4 C8                      ;
bne      LCDCF                         ; 0x1cde5 $CDD5 D0 F8                   ;
inc      $03                           ; 0x1cde7 $CDD7 E6 03                   ;
LCDD9                                                                          ;
lda      ($02),y                       ; 0x1cde9 $CDD9 B1 02                   ; Overworld Data
sta      $7D00,y                       ; 0x1cdeb $CDDB 99 00 7D                ; load into 7D00-7DFF
iny                                    ; 0x1cdee $CDDE C8                      ;
bne      LCDD9                         ; 0x1cdef $CDDF D0 F8                   ;
inc      $03                           ; 0x1cdf1 $CDE1 E6 03                   ;
LCDE3                                                                          ;
lda      ($02),y                       ; 0x1cdf3 $CDE3 B1 02                   ; Overworld Data
sta      $7E00,y                       ; 0x1cdf5 $CDE5 99 00 7E                ; load into 7E00-7EFF
iny                                    ; 0x1cdf8 $CDE8 C8                      ;
bne      LCDE3                         ; 0x1cdf9 $CDE9 D0 F8                   ;
inc      $03                           ; 0x1cdfb $CDEB E6 03                   ;
LCDED                                                                          ;
lda      ($02),y                       ; 0x1cdfd $CDED B1 02                   ; Overworld Data
sta      $7F00,y                       ; 0x1cdff $CDEF 99 00 7F                ; load into 7F00-7FFF
iny                                    ; 0x1ce02 $CDF2 C8                      ;
bpl      LCDED                         ; 0x1ce03 $CDF3 10 F8                   ;
ldy      #$00                          ; 0x1ce05 $CDF5 A0 00                   ; Y = 00
LCDF7                                                                          ;
lda      ($00),y                       ; 0x1ce07 $CDF7 B1 00                   ; Area Data
sta      $6A00,y                       ; 0x1ce09 $CDF9 99 00 6A                ; load into 6A00-6AFF
iny                                    ; 0x1ce0c $CDFC C8                      ;
bne      LCDF7                         ; 0x1ce0d $CDFD D0 F8                   ;
inc      $01                           ; 0x1ce0f $CDFF E6 01                   ;
LCE01                                                                          ;
lda      ($00),y                       ; 0x1ce11 $CE01 B1 00                   ; Area Data
sta      $6B00,y                       ; 0x1ce13 $CE03 99 00 6B                ; load into 6B00-6BFF
iny                                    ; 0x1ce16 $CE06 C8                      ;
bne      LCE01                         ; 0x1ce17 $CE07 D0 F8                   ;
inc      $01                           ; 0x1ce19 $CE09 E6 01                   ;
LCE0B                                                                          ;
lda      ($00),y                       ; 0x1ce1b $CE0B B1 00                   ; Area Data
sta      $6C00,y                       ; 0x1ce1d $CE0D 99 00 6C                ; load into 6C00-6CF5
iny                                    ; 0x1ce20 $CE10 C8                      ;
cpy      #$58                          ; 0x1ce21 $CE11 C0 58                   ;
bne      LCE0B                         ; 0x1ce23 $CE13 D0 F6                   ;
;Load All Palettes for Palaces into 7919-79F8 (E0 bytes)                       ;
ldy      #$00                          ; 0x1ce25 $CE15 A0 00                   ; Y = 00
LCE17                                                                          ;
lda      L800E,y                       ; 0x1ce27 $CE17 B9 0E 80                ; Palettes Table
sta      $7919,y                       ; 0x1ce2a $CE1A 99 19 79                ;
iny                                    ; 0x1ce2d $CE1D C8                      ;
cpy      #$E0                          ; 0x1ce2e $CE1E C0 E0                   ;
bcc      LCE17                         ; 0x1ce30 $CE20 90 F5                   ;
lda      $0707                         ; 0x1ce32 $CE22 AD 07 07                ; Current World
cmp      #$03                          ; 0x1ce35 $CE25 C9 03                   ;
bcc      bank7_Transfer_2A1_bytes_from_9400_or_A900_if_World_4_to_6D00; 0x1ce37 $CE27 90 4E;
lda      $0706                         ; 0x1ce39 $CE29 AD 06 07                ; Current Region
asl                                    ; 0x1ce3c $CE2C 0A                      ;
asl                                    ; 0x1ce3d $CE2D 0A                      ;
adc      $056C                         ; 0x1ce3e $CE2E 6D 6C 05                ; Palace Code
tay                                    ; 0x1ce41 $CE31 A8                      ;
lda      bank7_Table_for_Palace_Entrance_Palettes_Offset,y; 0x1ce42 $CE32 B9 35 CD;
tay                                    ; 0x1ce45 $CE35 A8                      ;
cmp      #$60                          ; 0x1ce46 $CE36 C9 60                   ; 60 is index A, Great Palace (R2 P2)
beq      LCE63                         ; 0x1ce48 $CE38 F0 29                   ;
pha                                    ; 0x1ce4a $CE3A 48                      ;
pha                                    ; 0x1ce4b $CE3B 48                      ;
ldx      #$00                          ; 0x1ce4c $CE3C A2 00                   ; X = 00
bank7_Load_Palace_Entrance_Palettes_into_7919_7928_10_bytes                    ;
lda      L8470,y                       ; 0x1ce4e $CE3E B9 70 84                ;
sta      $7919,x                       ; 0x1ce51 $CE41 9D 19 79                ;
iny                                    ; 0x1ce54 $CE44 C8                      ;
inx                                    ; 0x1ce55 $CE45 E8                      ;
cpx      #$10                          ; 0x1ce56 $CE46 E0 10                   ;
bcc      bank7_Load_Palace_Entrance_Palettes_into_7919_7928_10_bytes; 0x1ce58 $CE48 90 F4;
pla                                    ; 0x1ce5a $CE4A 68                      ;
tay                                    ; 0x1ce5b $CE4B A8                      ;
bank7_Recopy_the_same_set_of_Palace_Palettes_into_7929_7998                    ;
lda      LBF00,y                       ; 0x1ce5c $CE4C B9 00 BF                ;
sta      $7919,x                       ; 0x1ce5f $CE4F 9D 19 79                ;
iny                                    ; 0x1ce62 $CE52 C8                      ;
inx                                    ; 0x1ce63 $CE53 E8                      ;
tya                                    ; 0x1ce64 $CE54 98                      ;
and      #$0F                          ; 0x1ce65 $CE55 29 0F                   ; keep bits .... xxxx
bne      bank7_Recopy_the_same_set_of_Palace_Palettes_into_7929_7998; 0x1ce67 $CE57 D0 F3;
tya                                    ; 0x1ce69 $CE59 98                      ;
sec                                    ; 0x1ce6a $CE5A 38                      ;
sbc      #$10                          ; 0x1ce6b $CE5B E9 10                   ;
tay                                    ; 0x1ce6d $CE5D A8                      ;
cpx      #$80                          ; 0x1ce6e $CE5E E0 80                   ;
bcc      bank7_Recopy_the_same_set_of_Palace_Palettes_into_7929_7998; 0x1ce70 $CE60 90 EA;
pla                                    ; 0x1ce72 $CE62 68                      ;
LCE63                                                                          ;
lsr                                    ; 0x1ce73 $CE63 4A                      ;
lsr                                    ; 0x1ce74 $CE64 4A                      ;
tay                                    ; 0x1ce75 $CE65 A8                      ;
ldx      #$00                          ; 0x1ce76 $CE66 A2 00                   ; X = 00
LCE68                                                                          ;
lda      L84D8,y                       ; 0x1ce78 $CE68 B9 D8 84                ;
sta      $79C5,x                       ; 0x1ce7b $CE6B 9D C5 79                ;
sta      $79D5,x                       ; 0x1ce7e $CE6E 9D D5 79                ;
iny                                    ; 0x1ce81 $CE71 C8                      ;
inx                                    ; 0x1ce82 $CE72 E8                      ;
cpx      #$04                          ; 0x1ce83 $CE73 E0 04                   ;
bcc      LCE68                         ; 0x1ce85 $CE75 90 F1                   ;
bank7_Transfer_2A1_bytes_from_9400_or_A900_if_World_4_to_6D00                  ;
lda      #$00                          ; 0x1ce87 $CE77 A9 00                   ; A = 00
sta      $00                           ; 0x1ce89 $CE79 85 00                   ;
lda      #$94                          ; 0x1ce8b $CE7B A9 94                   ; A = 94
sta      $01                           ; 0x1ce8d $CE7D 85 01                   ;
lda      $0707                         ; 0x1ce8f $CE7F AD 07 07                ; Current World
cmp      #$04                          ; 0x1ce92 $CE82 C9 04                   ; World 4 = Palaces Type B
bne      LCE8E                         ; 0x1ce94 $CE84 D0 08                   ;
lda      #$00                          ; 0x1ce96 $CE86 A9 00                   ; A = 00
sta      $00                           ; 0x1ce98 $CE88 85 00                   ;
lda      #$A9                          ; 0x1ce9a $CE8A A9 A9                   ; A = A9
sta      $01                           ; 0x1ce9c $CE8C 85 01                   ;
LCE8E                                                                          ;
lda      #$00                          ; 0x1ce9e $CE8E A9 00                   ; A = 00
sta      $02                           ; 0x1cea0 $CE90 85 02                   ;
lda      #$6D                          ; 0x1cea2 $CE92 A9 6D                   ; A = 6D
sta      $03                           ; 0x1cea4 $CE94 85 03                   ;
lda      #$A1                          ; 0x1cea6 $CE96 A9 A1                   ; A = A1
sta      $04                           ; 0x1cea8 $CE98 85 04                   ;
lda      #$02                          ; 0x1ceaa $CE9A A9 02                   ; A = 02
sta      $05                           ; 0x1ceac $CE9C 85 05                   ;
ldy      #$00                          ; 0x1ceae $CE9E A0 00                   ; A = 00
LCEA0                                                                          ;
lda      ($00),y                       ; 0x1ceb0 $CEA0 B1 00                   ;
sta      ($02),y                       ; 0x1ceb2 $CEA2 91 02                   ;
lda      $00                           ; 0x1ceb4 $CEA4 A5 00                   ;
clc                                    ; 0x1ceb6 $CEA6 18                      ;
adc      #$01                          ; 0x1ceb7 $CEA7 69 01                   ;
sta      $00                           ; 0x1ceb9 $CEA9 85 00                   ;
lda      $01                           ; 0x1cebb $CEAB A5 01                   ;
adc      #$00                          ; 0x1cebd $CEAD 69 00                   ;
sta      $01                           ; 0x1cebf $CEAF 85 01                   ;
lda      $02                           ; 0x1cec1 $CEB1 A5 02                   ;
clc                                    ; 0x1cec3 $CEB3 18                      ;
adc      #$01                          ; 0x1cec4 $CEB4 69 01                   ;
sta      $02                           ; 0x1cec6 $CEB6 85 02                   ;
lda      $03                           ; 0x1cec8 $CEB8 A5 03                   ;
adc      #$00                          ; 0x1ceca $CEBA 69 00                   ;
sta      $03                           ; 0x1cecc $CEBC 85 03                   ;
lda      $04                           ; 0x1cece $CEBE A5 04                   ;
sec                                    ; 0x1ced0 $CEC0 38                      ;
sbc      #$01                          ; 0x1ced1 $CEC1 E9 01                   ;
sta      $04                           ; 0x1ced3 $CEC3 85 04                   ;
lda      $05                           ; 0x1ced5 $CEC5 A5 05                   ;
sbc      #$00                          ; 0x1ced7 $CEC7 E9 00                   ;
sta      $05                           ; 0x1ced9 $CEC9 85 05                   ;
ora      $04                           ; 0x1cedb $CECB 05 04                   ;
bne      LCEA0                         ; 0x1cedd $CECD D0 D1                   ;
ldy      $0707                         ; 0x1cedf $CECF AC 07 07                ; Current World
dey                                    ; 0x1cee2 $CED2 88                      ;
cpy      #$02                          ; 0x1cee3 $CED3 C0 02                   ;
bcs      LCEF6                         ; 0x1cee5 $CED5 B0 1F                   ;
ldy      $056B                         ; 0x1cee7 $CED7 AC 6B 05                ; Town Code
dey                                    ; 0x1ceea $CEDA 88                      ;
cpy      #$06                          ; 0x1ceeb $CEDB C0 06                   ;
bcs      LCEF6                         ; 0x1ceed $CEDD B0 17                   ;
;If Town Code is < 6                                                           ;
;Transfer 14 bytes from a table to 6DE2                                        ;
;Related to Enemy Velocities                                                   ;
tya                                    ; 0x1ceef $CEDF 98                      ;
asl                                    ; 0x1cef0 $CEE0 0A                      ;
tay                                    ; 0x1cef1 $CEE1 A8                      ;
lda      L9624,y                       ; 0x1cef2 $CEE2 B9 24 96                ;
sta      $00                           ; 0x1cef5 $CEE5 85 00                   ;
lda      L9625,y                       ; 0x1cef7 $CEE7 B9 25 96                ;
sta      $01                           ; 0x1cefa $CEEA 85 01                   ;
ldy      #$13                          ; 0x1cefc $CEEC A0 13                   ; Y = 13
LCEEE                                                                          ;
lda      ($00),y                       ; 0x1cefe $CEEE B1 00                   ;
sta      $6DE2,y                       ; 0x1cf00 $CEF0 99 E2 6D                ;
dey                                    ; 0x1cf03 $CEF3 88                      ;
bpl      LCEEE                         ; 0x1cf04 $CEF4 10 F8                   ;
LCEF6                                                                          ;
ldy      $0707                         ; 0x1cf06 $CEF6 AC 07 07                ; Current World
bne      LCF09                         ; 0x1cf09 $CEF9 D0 0E                   ;
lda      $0709                         ; 0x1cf0b $CEFB AD 09 07                ;; used for going outside??
bne      LCF05                         ; 0x1cf0e $CEFE D0 05                   ;
lda      #$06                          ; 0x1cf10 $CF00 A9 06                   ; A = 06
jmp      LCF0B                         ; 0x1cf12 $CF02 4C 0B CF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCF05                                                                          ;
inc      $0736                         ; 0x1cf15 $CF05 EE 36 07                ; Game Mode
rts                                    ; 0x1cf18 $CF08 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCF09                                                                          ;
lda      #$07                          ; 0x1cf19 $CF09 A9 07                   ; A = 07
LCF0B                                                                          ;
sta      $0736                         ; 0x1cf1b $CF0B 8D 36 07                ; Game Mode
lda      #$01                          ; 0x1cf1e $CF0E A9 01                   ; A = 01
cpy      #$02                          ; 0x1cf20 $CF10 C0 02                   ;
bne      LCF1D                         ; 0x1cf22 $CF12 D0 09                   ;
ldy      $056B                         ; 0x1cf24 $CF14 AC 6B 05                ; Town Code
cpy      #$07                          ; 0x1cf27 $CF17 C0 07                   ;
bne      LCF1D                         ; 0x1cf29 $CF19 D0 02                   ;
lda      #$08                          ; 0x1cf2b $CF1B A9 08                   ; A = 08
LCF1D                                                                          ;
sta      $075F                         ; 0x1cf2d $CF1D 8D 5F 07                ;;at bank0: 0D64: AD 5F07	LDA $075F	then 	STA $EB		; Music Channel	; something to do with music
rts                                    ; 0x1cf30 $CF20 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCF21_SaveGameWhenChooseSAVEwhenDead__maybe                                    ;
lda      #$05                          ; 0x1cf31 $CF21 A9 05                   ; A = 05
jsr      LFFCC                         ; 0x1cf33 $CF23 20 CC FF                ;
jsr      LB9CA                         ; 0x1cf36 $CF26 20 CA B9                ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1cf39 $CF29 20 C9 FF                ; Load Bank $0769
inc      $0738                         ; 0x1cf3c $CF2C EE 38 07                ;
rts                                    ; 0x1cf3f $CF2F 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_FUNCTION_CONVERT_706_and_707_to_Rx5plusW                                 ;
;Region Code * 5 + World Code                                                  ;
lda      $0706                         ; 0x1cf40 $CF30 AD 06 07                ; Current Region
asl                                    ; 0x1cf43 $CF33 0A                      ;
asl                                    ; 0x1cf44 $CF34 0A                      ;
adc      $0706                         ; 0x1cf45 $CF35 6D 06 07                ;; overworld index (0=west hyrule, 1=death mtn/maze island, 2=east hyrule)
adc      $0707                         ; 0x1cf48 $CF38 6D 07 07                ; Current World
rts                                    ; 0x1cf4b $CF3B 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCF3C                                                                          ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1cf4c $CF3C 20 C9 FF                ; Load Bank $0769
jsr      bank7_JmpToRoutine_at_Index_073D_in_Table_Address_from_the_top_of_the_Stack_The_Pointer_Table_immediately_follows_the_JSR_to_D382; 0x1cf4f $CF3F 20 82 D3;
bank7_pointer_table13                                                          ;
.word    LD25E                         ; 0x1cf52 $CF42 5E D2                   ;
.word    LD269                         ; 0x1cf54 $CF44 69 D2                   ;
.word    bank7_Set_PPU_Macro_for_Palettes; 0x1cf56 $CF46 5B D0                 ;
.word    bank7_code19                  ; 0x1cf58 $CF48 FC D0                   ;
.word    LD120                         ; 0x1cf5a $CF4A 20 D1                   ;
; ---------------------------------------------------------------------------- ;
bank7_take_side_exit                                                           ;
jsr      bank7_Remove_All_Sprites      ; 0x1cf5c $CF4C 20 4C D2                ; Remove All Sprites
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1cf5f $CF4F 20 C9 FF                ; Load Bank $0769
lda      $0561                         ; 0x1cf62 $CF52 AD 61 05                ; Area Code
ldy      $0707                         ; 0x1cf65 $CF55 AC 07 07                ; Current World
bne      LCF60                         ; 0x1cf68 $CF58 D0 06                   ;
cmp      #$1D                          ; 0x1cf6a $CF5A C9 1D                   ;
bcc      LCF60                         ; 0x1cf6c $CF5C 90 02                   ;
lda      #$00                          ; 0x1cf6e $CF5E A9 00                   ; A = 00
LCF60                                                                          ;
asl                                    ; 0x1cf70 $CF60 0A                      ;
asl                                    ; 0x1cf71 $CF61 0A                      ;
adc      $3B                           ; 0x1cf72 $CF62 65 3B                   ; Link's X Position (high byte)
tay                                    ; 0x1cf74 $CF64 A8                      ;
lda      $6AFC,y                       ; 0x1cf75 $CF65 B9 FC 6A                ; Connectivity Data Table
pha                                    ; 0x1cf78 $CF68 48                      ;
and      #$FC                          ; 0x1cf79 $CF69 29 FC                   ; keep bits xxxx xx..
cmp      #$FC                          ; 0x1cf7b $CF6B C9 FC                   ;
bne      LCFB2                         ; 0x1cf7d $CF6D D0 43                   ;
pla                                    ; 0x1cf7f $CF6F 68                      ;
and      #$03                          ; 0x1cf80 $CF70 29 03                   ; keep bits .... ..xx
clc                                    ; 0x1cf82 $CF72 18                      ;
adc      $0748                         ; 0x1cf83 $CF73 6D 48 07                ;; area location index (the index of the spot on the overworld that pulled you into the sideview)	; Overworld Area out of Side View
sta      $0748                         ; 0x1cf86 $CF76 8D 48 07                ;; area location index (the index of the spot on the overworld that pulled you into the sideview)	; Overworld Area out of Side View
ldy      #$00                          ; 0x1cf89 $CF79 A0 00                   ; Y = 00
sty      $07FF                         ; 0x1cf8b $CF7B 8C FF 07                ;
sty      $05E9                         ; 0x1cf8e $CF7E 8C E9 05                ; Sound Played Out of Area
ldy      #$90                          ; 0x1cf91 $CF81 A0 90                   ; Y = 90
sty      $4000                         ; 0x1cf93 $CF83 8C 00 40                ;
lda      #$01                          ; 0x1cf96 $CF86 A9 01                   ; A = 01
ldy      $0707                         ; 0x1cf98 $CF88 AC 07 07                ; Current World
beq      LCF9D                         ; 0x1cf9b $CF8B F0 10                   ;
jsr      bank7_Mute_music_when_loading_between_areas; 0x1cf9d $CF8D 20 3D D0   ; Mute Music
ldy      #$00                          ; 0x1cfa0 $CF90 A0 00                   ; Y = 00
sty      $0707                         ; 0x1cfa2 $CF92 8C 07 07                ; Current World
inc      $0709                         ; 0x1cfa5 $CF95 EE 09 07                ;; used for going outside??
lda      #$00                          ; 0x1cfa8 $CF98 A9 00                   ; A = 00
LCF9A                                                                          ;
jmp      LCFF8                         ; 0x1cfaa $CF9A 4C F8 CF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCF9D                                                                          ;
ldy      #$04                          ; 0x1cfad $CF9D A0 04                   ; Y = 04
sty      $05E9                         ; 0x1cfaf $CF9F 8C E9 05                ; Sound Played Out of Area
ldy      $0706                         ; 0x1cfb2 $CFA2 AC 06 07                ; Current Region
bne      LCF9A                         ; 0x1cfb5 $CFA5 D0 F3                   ;
ldy      $0561                         ; 0x1cfb7 $CFA7 AC 61 05                ; Area Code
bne      LCF9A                         ; 0x1cfba $CFAA D0 EE                   ;
sty      $05E9                         ; 0x1cfbc $CFAC 8C E9 05                ; Sound Played Out of Area
jmp      LCFF8                         ; 0x1cfbf $CFAF 4C F8 CF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LCFB2                                                                          ;
lsr                                    ; 0x1cfc2 $CFB2 4A                      ;
lsr                                    ; 0x1cfc3 $CFB3 4A                      ;
sta      $0561                         ; 0x1cfc4 $CFB4 8D 61 05                ; Area Code
pla                                    ; 0x1cfc7 $CFB7 68                      ;
ldx      $0704                         ; 0x1cfc8 $CFB8 AE 04 07                ;; 0=start bottom of screen, 1=start at top of screen ; elevator
bne      LCFC2                         ; 0x1cfcb $CFBB D0 05                   ;
and      #$03                          ; 0x1cfcd $CFBD 29 03                   ; keep bits .... ..xx
sta      $075C                         ; 0x1cfcf $CFBF 8D 5C 07                ; Position code when entering area (0-3)
LCFC2                                                                          ;
and      #$01                          ; 0x1cfd2 $CFC2 29 01                   ; keep bits .... ...x
sta      $0701                         ; 0x1cfd4 $CFC4 8D 01 07                ; Facing direction when entering area
lda      $0561                         ; 0x1cfd7 $CFC7 AD 61 05                ; Area Code
cmp      #$24                          ; 0x1cfda $CFCA C9 24                   ;
bcs      LCFEC                         ; 0x1cfdc $CFCC B0 1E                   ;
lda      $075B                         ; 0x1cfde $CFCE AD 5B 07                ;
beq      LCFEC                         ; 0x1cfe1 $CFD1 F0 19                   ;
clc                                    ; 0x1cfe3 $CFD3 18                      ;
adc      #$04                          ; 0x1cfe4 $CFD4 69 04                   ;
sta      $075C                         ; 0x1cfe6 $CFD6 8D 5C 07                ; Position code when entering area (0-3)
dec      $075B                         ; 0x1cfe9 $CFD9 CE 5B 07                ;
bne      LCFEC                         ; 0x1cfec $CFDC D0 0E                   ;
lda      $056B                         ; 0x1cfee $CFDE AD 6B 05                ; Town Code
cmp      #$07                          ; 0x1cff1 $CFE1 C9 07                   ;
beq      LCFEC                         ; 0x1cff3 $CFE3 F0 07                   ;
jsr      bank7_Mute_music_when_loading_between_areas; 0x1cff5 $CFE5 20 3D D0   ; Mute music when loading between areas
lda      #$02                          ; 0x1cff8 $CFE8 A9 02                   ; A = 02
bne      LCFF3                         ; 0x1cffa $CFEA D0 07                   ;
LCFEC                                                                          ;
ldx      $0704                         ; 0x1cffc $CFEC AE 04 07                ;; 0=start bottom of screen, 1=start at top of screen ; elevator
bne      LCFF6                         ; 0x1cfff $CFEF D0 05                   ;
lda      #$00                          ; 0x1d001 $CFF1 A9 00                   ; A = 00
LCFF3                                                                          ;
sta      $075F                         ; 0x1d003 $CFF3 8D 5F 07                ;;at bank0: 0D64: AD 5F07	LDA $075F	then 	STA $EB		; Music Channel	; something to do with music
LCFF6                                                                          ;
lda      #$07                          ; 0x1d006 $CFF6 A9 07                   ; A = 07
LCFF8                                                                          ;
sta      $0736                         ; 0x1d008 $CFF8 8D 36 07                ;; Game Mode ; screen intro type
rts                                    ; 0x1d00b $CFFB 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_take_door_exit                                                           ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1d00c $CFFC 20 C9 FF                ; Load Bank in $0769
LD000     = * + $0001                                                          ;
lda      $0561                         ; 0x1d00f $CFFF AD 61 05                ; Area Code
asl                                    ; 0x1d012 $D002 0A                      ;
asl                                    ; 0x1d013 $D003 0A                      ;
adc      $3B                           ; 0x1d014 $D004 65 3B                   ; Link's X Position (high byte)
tay                                    ; 0x1d016 $D006 A8                      ;
lda      L8817,y                       ; 0x1d017 $D007 B9 17 88                ;
and      #$FC                          ; 0x1d01a $D00A 29 FC                   ; keep bits xxxx xx..
lsr                                    ; 0x1d01c $D00C 4A                      ;
lsr                                    ; 0x1d01d $D00D 4A                      ;
sta      $0561                         ; 0x1d01e $D00E 8D 61 05                ; Area Code
lda      L8817,y                       ; 0x1d021 $D011 B9 17 88                ;
and      #$03                          ; 0x1d024 $D014 29 03                   ; keep bits .... ..xx
sta      $075C                         ; 0x1d026 $D016 8D 5C 07                ; Position code when entering area (0-3)
and      #$01                          ; 0x1d029 $D019 29 01                   ; keep bits .... ...x
sta      $0701                         ; 0x1d02b $D01B 8D 01 07                ; Facing direction when entering area
lda      $075B                         ; 0x1d02e $D01E AD 5B 07                ;
clc                                    ; 0x1d031 $D021 18                      ;
adc      #$04                          ; 0x1d032 $D022 69 04                   ;
tax                                    ; 0x1d034 $D024 AA                      ;
jsr      LC690                         ; 0x1d035 $D025 20 90 C6                ;
jsr      LCFEC                         ; 0x1d038 $D028 20 EC CF                ;
ldx      $075B                         ; 0x1d03b $D02B AE 5B 07                ;
dex                                    ; 0x1d03e $D02E CA                      ;
bne      LD041                         ; 0x1d03f $D02F D0 10                   ;
lda      $056B                         ; 0x1d041 $D031 AD 6B 05                ;; Town Code	;used by wise man to pick magic to give?
cmp      #$07                          ; 0x1d044 $D034 C9 07                   ;
beq      LD041                         ; 0x1d046 $D036 F0 09                   ;
lda      #$08                          ; 0x1d048 $D038 A9 08                   ; A = 08		;indoor music
sta      $075F                         ; 0x1d04a $D03A 8D 5F 07                ;sets $eb later
bank7_Mute_music_when_loading_between_areas                                    ;
lda      #$80                          ; 0x1d04d $D03D A9 80                   ; A = 80 (80 = no music)
sta      $EB                           ; 0x1d04f $D03F 85 EB                   ; Music Channel
LD041                                                                          ;
rts                                    ; 0x1d051 $D041 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD042                                                                          ;
lda      #$02                          ; 0x1d052 $D042 A9 02                   ; A = 02
jsr      bank7_chr_bank_switch__load_A ; 0x1d054 $D044 20 B1 FF                ;
jsr      bank7_Erase_Name_Tables_0and1__set_scroll_to_0_0; 0x1d057 $D047 20 66 D2;
jmp      LCF05                         ; 0x1d05a $D04A 4C 05 CF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD04D                                                                          ;
lda      #$06                          ; 0x1d05d $D04D A9 06                   ; A = 06
jsr      bank7_chr_bank_switch__load_A ; 0x1d05f $D04F 20 B1 FF                ;
jsr      bank7_JmpToRoutine_at_Index_073D_in_Table_Address_from_the_top_of_the_Stack_The_Pointer_Table_immediately_follows_the_JSR_to_D382; 0x1d062 $D052 20 82 D3;
bank7_pointer_table14                                                          ;
.word    bank7_Erase_Name_Tables_0and1__set_scroll_to_0_0; 0x1d065 $D055 66 D2 ;
.word    LD0B8                         ; 0x1d067 $D057 B8 D0                   ;
.word    LD150                         ; 0x1d069 $D059 50 D1                   ;
; ---------------------------------------------------------------------------- ;
bank7_Set_PPU_Macro_for_Palettes                                               ;
ldy      #$03                          ; 0x1d06b $D05B A0 03                   ; Y = 03
lda      ($D4),y                       ; 0x1d06d $D05D B1 D4                   ; Area Header Byte 3; Area Header Byte 3
lsr                                    ; 0x1d06f $D05F 4A                      ;
lsr                                    ; 0x1d070 $D060 4A                      ;
and      #$30                          ; 0x1d071 $D061 29 30                   ; keep bits ..xx ....
sta      $00                           ; 0x1d073 $D063 85 00                   ;
lda      ($D4),y                       ; 0x1d075 $D065 B1 D4                   ; Area Header Byte 3
asl                                    ; 0x1d077 $D067 0A                      ;
and      #$70                          ; 0x1d078 $D068 29 70                   ; keep bits .xxx ....
cmp      #$10                          ; 0x1d07a $D06A C9 10                   ;
bne      LD07D                         ; 0x1d07c $D06C D0 0F                   ;
ldx      $0707                         ; 0x1d07e $D06E AE 07 07                ; Current World
bne      LD07D                         ; 0x1d081 $D071 D0 0A                   ;
ldx      $0785                         ; 0x1d083 $D073 AE 85 07                ; Have Candle
bne      LD07D                         ; 0x1d086 $D076 D0 05                   ;
lda      #$40                          ; 0x1d088 $D078 A9 40                   ; A = 40
sta      $00                           ; 0x1d08a $D07A 85 00                   ;
asl                                    ; 0x1d08c $D07C 0A                      ;
LD07D                                                                          ;
tax                                    ; 0x1d08d $D07D AA                      ;
ldy      #$00                          ; 0x1d08e $D07E A0 00                   ; Y = 00
lda      #$3F                          ; 0x1d090 $D080 A9 3F                   ; A = 3F
sta      L0302                         ; 0x1d092 $D082 8D 02 03                ;; Used when writing text to screen
sty      $0303                         ; 0x1d095 $D085 8C 03 03                ;; Letter position when writing to screen
LD088                                                                          ;
lda      $7919,x                       ; 0x1d098 $D088 BD 19 79                ;
sta      $0305,y                       ; 0x1d09b $D08B 99 05 03                ;
inx                                    ; 0x1d09e $D08E E8                      ;
iny                                    ; 0x1d09f $D08F C8                      ;
cpy      #$10                          ; 0x1d0a0 $D090 C0 10                   ;
bcc      LD088                         ; 0x1d0a2 $D092 90 F4                   ;
ldx      $00                           ; 0x1d0a4 $D094 A6 00                   ;
LD096                                                                          ;
lda      $79A9,x                       ; 0x1d0a6 $D096 BD A9 79                ;
cmp      #$FF                          ; 0x1d0a9 $D099 C9 FF                   ;
bne      LD0A3                         ; 0x1d0ab $D09B D0 06                   ;
lda      $0305                         ; 0x1d0ad $D09D AD 05 03                ;; Empty Row Space Character
sta      $0751                         ; 0x1d0b0 $D0A0 8D 51 07                ;
LD0A3                                                                          ;
sta      $0305,y                       ; 0x1d0b3 $D0A3 99 05 03                ;
inx                                    ; 0x1d0b6 $D0A6 E8                      ;
iny                                    ; 0x1d0b7 $D0A7 C8                      ;
cpy      #$20                          ; 0x1d0b8 $D0A8 C0 20                   ;
bcc      LD096                         ; 0x1d0ba $D0AA 90 EA                   ;
sty      $0304                         ; 0x1d0bc $D0AC 8C 04 03                ;; Text memory offset?
lda      #$FF                          ; 0x1d0bf $D0AF A9 FF                   ; A = FF
sta      $0305,y                       ; 0x1d0c1 $D0B1 99 05 03                ;
inc      $073D                         ; 0x1d0c4 $D0B4 EE 3D 07                ; Routine Index
rts                                    ; 0x1d0c7 $D0B7 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD0B8                                                                          ;
lda      #$03                          ; 0x1d0c8 $D0B8 A9 03                   ; A = 03
jmp      LD11A                         ; 0x1d0ca $D0BA 4C 1A D1                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Table_for_some_Palettes                                                  ;
.byt    $3F,$00,$10,$0F,$30,$12,$16,$0F; 0x1d0cd $D0BD 3F 00 10 0F 30 12 16 0F ;
.byt    $30,$30,$30,$0F,$30,$30,$30,$0F; 0x1d0d5 $D0C5 30 30 30 0F 30 30 30 0F ;
.byt    $26,$0F,$0F,$FF                ; 0x1d0dd $D0CD 26 0F 0F FF             ;
bank7_Tables_for_some_PPU_Command_Data                                         ;
.byt    $20,$44,$06                    ; 0x1d0e1 $D0D1 20 44 06                ;
                                                                               ;
.byt    $E6,$DA,$E0,$E2,$DC,$F6        ; 0x1d0e4 $D0D4 E6 DA E0 E2 DC F6       ;MAGIC-
                                                                               ;
.byt    $20,$4D,$05                    ; 0x1d0ea $D0DA 20 4D 05                ;
                                                                               ;
.byt    $E5,$E2,$DF,$DE,$F6            ; 0x1d0ed $D0DD E5 E2 DF DE F6          ;LIFE-
                                                                               ;
.byt    $20,$5A,$04                    ; 0x1d0f2 $D0E2 20 5A 04                ;
                                                                               ;
.byt    $E7,$DE,$F1,$ED                ; 0x1d0f5 $D0E5 E7 DE F1 ED             ;NEXT
                                                                               ;
.byt    $20,$61,$01                    ; 0x1d0f9 $D0E9 20 61 01                ;
                                                                               ;
.byt    $C9                            ; 0x1d0fc $D0EC C9                      ;
                                                                               ;
.byt    $20,$6D,$01                    ; 0x1d0fd $D0ED 20 6D 01                ;
                                                                               ;
.byt    $F7,$20,$7A,$05,$CE            ; 0x1d100 $D0F0 F7 20 7A 05 CE          ;
                                                                               ;
.byt    $D0,$D0,$D0,$D0                ; 0x1d105 $D0F5 D0 D0 D0 D0             ;
bank7_table12                                                                  ;
.byt    $4C,$02,$03                    ; 0x1d109 $D0F9 4C 02 03                ;
; ---------------------------------------------------------------------------- ;
bank7_code19                                                                   ;
jsr      bank7_Load_Bank_0_at_0x8000   ; 0x1d10c $D0FC 20 C5 FF                ; Load Bank 0
lda      #$80                          ; 0x1d10f $D0FF A9 80                   ; A = 80
sta      $074F                         ; 0x1d111 $D101 8D 4F 07                ;; Related to Pause Pane
sta      $0750                         ; 0x1d114 $D104 8D 50 07                ;
ldy      $0301                         ; 0x1d117 $D107 AC 01 03                ;;ppu number of bytes following (counts both instructions and tile data values); Used when writing text to screen
jsr      L96A8                         ; 0x1d11a $D10A 20 A8 96                ;
lda      #$40                          ; 0x1d11d $D10D A9 40                   ; A = 40
sta      $074F                         ; 0x1d11f $D10F 8D 4F 07                ;; Related to Pause Pane
ldy      $0301                         ; 0x1d122 $D112 AC 01 03                ;;ppu number of bytes following (counts both instructions and tile data values); Used when writing text to screen
jsr      L96A8                         ; 0x1d125 $D115 20 A8 96                ;
lda      #$07                          ; 0x1d128 $D118 A9 07                   ; A = 07
LD11A                                                                          ;
inc      $073D                         ; 0x1d12a $D11A EE 3D 07                ;; Routine Index
jmp      LD158                         ; 0x1d12d $D11D 4C 58 D1                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD120                                                                          ;
jsr      bank7_Load_Bank_0_at_0x8000   ; 0x1d130 $D120 20 C5 FF                ; Load Bank 0
jsr      L9A04                         ; 0x1d133 $D123 20 04 9A                ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1d136 $D126 20 C9 FF                ; Load Bank $0769
bank7_function_find_a_free_enemy_slot__maybe                                   ;
ldx      #$05                          ; 0x1d139 $D129 A2 05                   ; X = 05
LD12B                                                                          ;
stx      $10                           ; 0x1d13b $D12B 86 10                   ;; used as monster x register ;draw boss hp bar
lda      $B6,x                         ; 0x1d13d $D12D B5 B6                   ; Generated Enemy Slot
bne      LD135                         ; 0x1d13f $D12F D0 04                   ;
tax                                    ; 0x1d141 $D131 AA                      ;
jsr      LD625                         ; 0x1d142 $D132 20 25 D6                ;
LD135                                                                          ;
dex                                    ; 0x1d145 $D135 CA                      ;
bpl      LD12B                         ; 0x1d146 $D136 10 F3                   ;
lda      $0740                         ; 0x1d148 $D138 AD 40 07                ;
beq      LD143                         ; 0x1d14b $D13B F0 06                   ;
cmp      #$05                          ; 0x1d14d $D13D C9 05                   ;
beq      LD14B                         ; 0x1d14f $D13F F0 0A                   ;
bne      LD120                         ; 0x1d151 $D141 D0 DD                   ;
LD143                                                                          ;
dec      $0722                         ; 0x1d153 $D143 CE 22 07                ;
bpl      LD14B                         ; 0x1d156 $D146 10 03                   ;
inc      $0736                         ; 0x1d158 $D148 EE 36 07                ; Game Mode
LD14B                                                                          ;
lda      #$02                          ; 0x1d15b $D14B A9 02                   ; A = 02
jmp      LD158                         ; 0x1d15d $D14D 4C 58 D1                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD150                                                                          ;
inc      $0736                         ; 0x1d160 $D150 EE 36 07                ; Game Mode
lda      #$08                          ; 0x1d163 $D153 A9 08                   ; A = 08
jmp      LD158                         ; 0x1d165 $D155 4C 58 D1                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD158                                                                          ;
sta      $0725                         ; 0x1d168 $D158 8D 25 07                ;; PPU Macro Selector	
rts                                    ; 0x1d16b $D15B 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD15C                                                                          ;
lda      $0738                         ; 0x1d16c $D15C AD 38 07                ;
cmp      $0739                         ; 0x1d16f $D15F CD 39 07                ;
sta      $0739                         ; 0x1d172 $D162 8D 39 07                ;
bne      LD195                         ; 0x1d175 $D165 D0 2E                   ;
rts                                    ; 0x1d177 $D167 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD168                                                                          ;
lda      $0736                         ; 0x1d178 $D168 AD 36 07                ; Game Mode
cmp      $0737                         ; 0x1d17b $D16B CD 37 07                ;
sta      $0737                         ; 0x1d17e $D16E 8D 37 07                ;
bne      LD18D                         ; 0x1d181 $D171 D0 1A                   ;
rts                                    ; 0x1d183 $D173 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD174                                                                          ;
lda      $076C                         ; 0x1d184 $D174 AD 6C 07                ;; (00=restart from zelda's castle with 3 lives,  01=no routine, 02=die, 03=wake up zelda, 04=roll credits, 06=show the lives then restart the scene)
cmp      $076D                         ; 0x1d187 $D177 CD 6D 07                ;
sta      $076D                         ; 0x1d18a $D17A 8D 6D 07                ;
beq      LD19A                         ; 0x1d18d $D17D F0 1B                   ;
jsr      bank7_Remove_All_Sprites      ; 0x1d18f $D17F 20 4C D2                ;
lda      $076C                         ; 0x1d192 $D182 AD 6C 07                ;; (00=restart from zelda's castle with 3 lives,  01=no routine, 02=die, 03=wake up zelda, 04=roll credits, 06=show the lives then restart the scene)
ldy      #$00                          ; 0x1d195 $D185 A0 00                   ; Y = 00
sty      $073C                         ; 0x1d197 $D187 8C 3C 07                ;
sty      $0736                         ; 0x1d19a $D18A 8C 36 07                ; Game Mode
LD18D                                                                          ;
ldy      #$00                          ; 0x1d19d $D18D A0 00                   ; Y = 00
sty      $073B                         ; 0x1d19f $D18F 8C 3B 07                ;
sty      $0738                         ; 0x1d1a2 $D192 8C 38 07                ;
LD195                                                                          ;
ldy      #$00                          ; 0x1d1a5 $D195 A0 00                   ; Y = 00
sty      $073D                         ; 0x1d1a7 $D197 8C 3D 07                ; Routine Index
LD19A                                                                          ;
rts                                    ; 0x1d1aa $D19A 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_applyGravityMotion                                                       ;
ldy      #$00                          ; 0x1d1ab $D19B A0 00                   ; Y = 00
lda      $057D,x                       ; 0x1d1ad $D19D BD 7D 05                ; Link/Enemy Y Velocity
bpl      LD1A3                         ; 0x1d1b0 $D1A0 10 01                   ;
dey                                    ; 0x1d1b2 $D1A2 88                      ;
LD1A3                                                                          ;
sty      $07                           ; 0x1d1b3 $D1A3 84 07                   ;
clc                                    ; 0x1d1b5 $D1A5 18                      ;
adc      $29,x                         ; 0x1d1b6 $D1A6 75 29                   ;;y_pos (Link's y position in sideview)
sta      $29,x                         ; 0x1d1b8 $D1A8 95 29                   ; Link/Enemy Y position
lda      $19,x                         ; 0x1d1ba $D1AA B5 19                   ;;fall_or_invisible (0=invisible, 1=normal, 2~FF=fall in hole)
adc      $07                           ; 0x1d1bc $D1AC 65 07                   ;
sta      $19,x                         ; 0x1d1be $D1AE 95 19                   ;;fall_or_invisible (0=invisible, 1=normal, 2~FF=fall in hole)
lda      $03E6,x                       ; 0x1d1c0 $D1B0 BD E6 03                ;;gravity_counter (each time it overflows, vspeed += 1)
clc                                    ; 0x1d1c3 $D1B3 18                      ;
adc      $00                           ; 0x1d1c4 $D1B4 65 00                   ;
sta      $03E6,x                       ; 0x1d1c6 $D1B6 9D E6 03                ;;gravity_counter (each time it overflows, vspeed += 1)
lda      $057D,x                       ; 0x1d1c9 $D1B9 BD 7D 05                ;;vspeed (Link's vertical velocity, negative is up.)
adc      #$00                          ; 0x1d1cc $D1BC 69 00                   ;
sta      $057D,x                       ; 0x1d1ce $D1BE 9D 7D 05                ; Link/Enemy Y Velocity				triggered when jumping
cmp      $02                           ; 0x1d1d1 $D1C1 C5 02                   ;
bne      LD1CD                         ; 0x1d1d3 $D1C3 D0 08                   ;
sta      $057D,x                       ; 0x1d1d5 $D1C5 9D 7D 05                ;;vspeed (Link's vertical velocity, negative is up.)
lda      #$00                          ; 0x1d1d8 $D1C8 A9 00                   ; A = 00
sta      $03E6,x                       ; 0x1d1da $D1CA 9D E6 03                ;;gravity_counter (each time it overflows, vspeed += 1)
LD1CD                                                                          ;
rts                                    ; 0x1d1dd $D1CD 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_XY_Movements_Routine                                                     ;
lda      $70,x                         ; 0x1d1de $D1CE B5 70                   ;;hspeed (Link's horizontal velocity)
asl                                    ; 0x1d1e0 $D1D0 0A                      ;
asl                                    ; 0x1d1e1 $D1D1 0A                      ;
asl                                    ; 0x1d1e2 $D1D2 0A                      ;
asl                                    ; 0x1d1e3 $D1D3 0A                      ;
sta      $01                           ; 0x1d1e4 $D1D4 85 01                   ;
lda      $70,x                         ; 0x1d1e6 $D1D6 B5 70                   ;;hspeed (Link's horizontal velocity)
lsr                                    ; 0x1d1e8 $D1D8 4A                      ;
lsr                                    ; 0x1d1e9 $D1D9 4A                      ;
lsr                                    ; 0x1d1ea $D1DA 4A                      ;
lsr                                    ; 0x1d1eb $D1DB 4A                      ;
cmp      #$08                          ; 0x1d1ec $D1DC C9 08                   ;
bcc      LD1E2                         ; 0x1d1ee $D1DE 90 02                   ;
ora      #$F0                          ; 0x1d1f0 $D1E0 09 F0                   ; set bits  xxxx ....
LD1E2                                                                          ;
sta      $00                           ; 0x1d1f2 $D1E2 85 00                   ;
ldy      #$00                          ; 0x1d1f4 $D1E4 A0 00                   ; Y = 00
cmp      #$00                          ; 0x1d1f6 $D1E6 C9 00                   ;
bpl      LD1EB                         ; 0x1d1f8 $D1E8 10 01                   ;
dey                                    ; 0x1d1fa $D1EA 88                      ;
LD1EB                                                                          ;
sty      $02                           ; 0x1d1fb $D1EB 84 02                   ;
lda      $03D6,x                       ; 0x1d1fd $D1ED BD D6 03                ;
clc                                    ; 0x1d200 $D1F0 18                      ;
adc      $01                           ; 0x1d201 $D1F1 65 01                   ;
sta      $03D6,x                       ; 0x1d203 $D1F3 9D D6 03                ;
lda      #$00                          ; 0x1d206 $D1F6 A9 00                   ; A = 00
rol                                    ; 0x1d208 $D1F8 2A                      ;
pha                                    ; 0x1d209 $D1F9 48                      ;
ror                                    ; 0x1d20a $D1FA 6A                      ;
lda      $4D,x                         ; 0x1d20b $D1FB B5 4D                   ; Link/Enemy X Position (low byte)
adc      $00                           ; 0x1d20d $D1FD 65 00                   ;
sta      $4D,x                         ; 0x1d20f $D1FF 95 4D                   ;
lda      $3B,x                         ; 0x1d211 $D201 B5 3B                   ; Link/Enemy X position (high byte)
adc      $02                           ; 0x1d213 $D203 65 02                   ;
sta      $3B,x                         ; 0x1d215 $D205 95 3B                   ;
jmp      LD247                         ; 0x1d217 $D207 4C 47 D2                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD20A                                                                          ;
lda      $057D,x                       ; 0x1d21a $D20A BD 7D 05                ; Link/Enemy Y Velocity
asl                                    ; 0x1d21d $D20D 0A                      ;
asl                                    ; 0x1d21e $D20E 0A                      ;
asl                                    ; 0x1d21f $D20F 0A                      ;
asl                                    ; 0x1d220 $D210 0A                      ;
sta      $01                           ; 0x1d221 $D211 85 01                   ;
lda      $057D,x                       ; 0x1d223 $D213 BD 7D 05                ; Link/Enemy Y Velocity
lsr                                    ; 0x1d226 $D216 4A                      ;
lsr                                    ; 0x1d227 $D217 4A                      ;
lsr                                    ; 0x1d228 $D218 4A                      ;
lsr                                    ; 0x1d229 $D219 4A                      ;
cmp      #$08                          ; 0x1d22a $D21A C9 08                   ;
bcc      LD220                         ; 0x1d22c $D21C 90 02                   ;
ora      #$F0                          ; 0x1d22e $D21E 09 F0                   ; set bits  xxxx ....
LD220                                                                          ;
sta      $00                           ; 0x1d230 $D220 85 00                   ;
ldy      #$00                          ; 0x1d232 $D222 A0 00                   ; Y = 00
cmp      #$00                          ; 0x1d234 $D224 C9 00                   ;
bpl      LD229                         ; 0x1d236 $D226 10 01                   ;
dey                                    ; 0x1d238 $D228 88                      ;
LD229                                                                          ;
sty      $02                           ; 0x1d239 $D229 84 02                   ;
lda      $03E6,x                       ; 0x1d23b $D22B BD E6 03                ;;gravity_counter (each time it overflows, vspeed += 1)
clc                                    ; 0x1d23e $D22E 18                      ;
adc      $01                           ; 0x1d23f $D22F 65 01                   ;
sta      $03E6,x                       ; 0x1d241 $D231 9D E6 03                ;;gravity_counter (each time it overflows, vspeed += 1)
lda      #$00                          ; 0x1d244 $D234 A9 00                   ; A = 00
rol                                    ; 0x1d246 $D236 2A                      ;
pha                                    ; 0x1d247 $D237 48                      ;
ror                                    ; 0x1d248 $D238 6A                      ;
lda       !$29,x                       ; 0x1d249 $D239 BD 29 00                ; Link/Enemy Y position
adc      $00                           ; 0x1d24c $D23C 65 00                   ;
sta       !$29,x                       ; 0x1d24e $D23E 9D 29 00                ; Link/Enemy Y position
lda      $19,x                         ; 0x1d251 $D241 B5 19                   ;;fall_or_invisible (0=invisible, 1=normal, 2~FF=fall in hole)
adc      $02                           ; 0x1d253 $D243 65 02                   ;
sta      $19,x                         ; 0x1d255 $D245 95 19                   ;;fall_or_invisible (0=invisible, 1=normal, 2~FF=fall in hole)
LD247                                                                          ;
pla                                    ; 0x1d257 $D247 68                      ;
clc                                    ; 0x1d258 $D248 18                      ;
adc      $00                           ; 0x1d259 $D249 65 00                   ;
rts                                    ; 0x1d25b $D24B 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Remove_All_Sprites                                                       ;
ldy      #$00                          ; 0x1d25c $D24C A0 00                   ; Y = 00
beq      LD252                         ; 0x1d25e $D24E F0 02                   ;
bank7_Remove_All_Sprites_except_Sprite0                                        ;
ldy      #$04                          ; 0x1d260 $D250 A0 04                   ; Y = 04
LD252                                                                          ;
lda      #$F8                          ; 0x1d262 $D252 A9 F8                   ; A = F8
LD254                                                                          ;
sta      $0200,y                       ; 0x1d264 $D254 99 00 02                ;
iny                                    ; 0x1d267 $D257 C8                      ;
iny                                    ; 0x1d268 $D258 C8                      ;
iny                                    ; 0x1d269 $D259 C8                      ;
iny                                    ; 0x1d26a $D25A C8                      ;
bne      LD254                         ; 0x1d26b $D25B D0 F7                   ;
rts                                    ; 0x1d26d $D25D 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD25E                                                                          ;
jsr      LD27D                         ; 0x1d26e $D25E 20 7D D2                ;
bank7_Erase_Name_Table_1                                                       ;
lda      #$24                          ; 0x1d271 $D261 A9 24                   ; A = 24
bank7_Erase_Name_Table_0                                                       ;
jmp      bank7_Fill_Screen_with_Tile_Code_F4_space__Starting_at_PPU_Address_A_mulipliedby_100; 0x1d273 $D263 4C BE D2; Fill Screen with Tile Code F4
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Erase_Name_Tables_0and1__set_scroll_to_0_0                               ;
jsr      bank7_Erase_Name_Table_1      ; 0x1d276 $D266 20 61 D2                ; Erase Name Table 1
LD269                                                                          ;
lda      #$20                          ; 0x1d279 $D269 A9 20                   ; A = 20
jsr      bank7_Erase_Name_Table_0      ; 0x1d27b $D26B 20 63 D2                ; Erase Name Table 0
lda      #$00                          ; 0x1d27e $D26E A9 00                   ; A = 00
sta      $FC                           ; 0x1d280 $D270 85 FC                   ;
sta      $FD                           ; 0x1d282 $D272 85 FD                   ;
sta      $0746                         ; 0x1d284 $D274 8D 46 07                ;
sta      $2005                         ; 0x1d287 $D277 8D 05 20                ; Screen Scroll Register (V)
sta      $2005                         ; 0x1d28a $D27A 8D 05 20                ; Screen Scroll Register (H)
LD27D                                                                          ;
inc      $073D                         ; 0x1d28d $D27D EE 3D 07                ; Routine Index
rts                                    ; 0x1d290 $D280 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Reset_Memory_Ranges                                                      ;
ldx      #$00                          ; 0x1d291 $D281 A2 00                   ; X = 00
txa                                    ; 0x1d293 $D283 8A                      ;
LD284                                                                          ;
sta      $0700,x                       ; 0x1d294 $D284 9D 00 07                ;
dex                                    ; 0x1d297 $D287 CA                      ;
bne      LD284                         ; 0x1d298 $D288 D0 FA                   ;
ldx      #$00                          ; 0x1d29a $D28A A2 00                   ; X = 00
txa                                    ; 0x1d29c $D28C 8A                      ;
LD28D                                                                          ;
sta      L0600,x                       ; 0x1d29d $D28D 9D 00 06                ;
dex                                    ; 0x1d2a0 $D290 CA                      ;
bne      LD28D                         ; 0x1d2a1 $D291 D0 FA                   ;
LD293                                                                          ;
ldx      #$00                          ; 0x1d2a3 $D293 A2 00                   ; X = 00
txa                                    ; 0x1d2a5 $D295 8A                      ;
LD296                                                                          ;
sta      $0500,x                       ; 0x1d2a6 $D296 9D 00 05                ;
dex                                    ; 0x1d2a9 $D299 CA                      ;
bne      LD296                         ; 0x1d2aa $D29A D0 FA                   ;
bank7_Set_Memory_200_4FF_and_00_DF_to_Zero                                     ;
ldx      #$00                          ; 0x1d2ac $D29C A2 00                   ; X = 00
txa                                    ; 0x1d2ae $D29E 8A                      ;
LD29F                                                                          ;
sta      $0400,x                       ; 0x1d2af $D29F 9D 00 04                ;;sword_slash_frame (animation frame)
dex                                    ; 0x1d2b2 $D2A2 CA                      ;
bne      LD29F                         ; 0x1d2b3 $D2A3 D0 FA                   ;
ldx      #$00                          ; 0x1d2b5 $D2A5 A2 00                   ; X = 00
txa                                    ; 0x1d2b7 $D2A7 8A                      ;
LD2A8                                                                          ;
sta      $0300,x                       ; 0x1d2b8 $D2A8 9D 00 03                ;
dex                                    ; 0x1d2bb $D2AB CA                      ;
bne      LD2A8                         ; 0x1d2bc $D2AC D0 FA                   ;
ldx      #$DF                          ; 0x1d2be $D2AE A2 DF                   ; X = DF
LD2B0                                                                          ;
sta      $00,x                         ; 0x1d2c0 $D2B0 95 00                   ;
dex                                    ; 0x1d2c2 $D2B2 CA                      ;
cpx      #$FF                          ; 0x1d2c3 $D2B3 E0 FF                   ;
bne      LD2B0                         ; 0x1d2c5 $D2B5 D0 F9                   ;
stx      L0302                         ; 0x1d2c7 $D2B7 8E 02 03                ;; Used when writing text to screen
stx      L0363                         ; 0x1d2ca $D2BA 8E 63 03                ;
rts                                    ; 0x1d2cd $D2BD 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Fill_Screen_with_Tile_Code_F4_space__Starting_at_PPU_Address_A_mulipliedby_100 ;
ldy      $2002                         ; 0x1d2ce $D2BE AC 02 20                ;
ldy      #$30                          ; 0x1d2d1 $D2C1 A0 30                   ; Y = 30
sty      $2000                         ; 0x1d2d3 $D2C3 8C 00 20                ;
ldy      #$00                          ; 0x1d2d6 $D2C6 A0 00                   ; Y = 00
sta      $2006                         ; 0x1d2d8 $D2C8 8D 06 20                ;
sty      $2006                         ; 0x1d2db $D2CB 8C 06 20                ;
ldx      #$03                          ; 0x1d2de $D2CE A2 03                   ; X = 03
lda      #$F4                          ; 0x1d2e0 $D2D0 A9 F4                   ; A = F4
LD2D2                                                                          ;
sta      $2007                         ; 0x1d2e2 $D2D2 8D 07 20                ;
iny                                    ; 0x1d2e5 $D2D5 C8                      ;
bne      LD2D2                         ; 0x1d2e6 $D2D6 D0 FA                   ;
dex                                    ; 0x1d2e8 $D2D8 CA                      ;
bne      LD2D2                         ; 0x1d2e9 $D2D9 D0 F7                   ;
LD2DB                                                                          ;
sta      $2007                         ; 0x1d2eb $D2DB 8D 07 20                ;
iny                                    ; 0x1d2ee $D2DE C8                      ;
cpy      #$C0                          ; 0x1d2ef $D2DF C0 C0                   ;
bne      LD2DB                         ; 0x1d2f1 $D2E1 D0 F8                   ;
lda      #$00                          ; 0x1d2f3 $D2E3 A9 00                   ; A = 00
LD2E5                                                                          ;
sta      $2007                         ; 0x1d2f5 $D2E5 8D 07 20                ;
iny                                    ; 0x1d2f8 $D2E8 C8                      ;
bne      LD2E5                         ; 0x1d2f9 $D2E9 D0 FA                   ;
LD2EB                                                                          ;
rts                                    ; 0x1d2fb $D2EB 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD2EC                                                                          ;
ldy      #$00                          ; 0x1d2fc $D2EC A0 00                   ; Y = 00			;07:D2EC
lda      ($00),y                       ; 0x1d2fe $D2EE B1 00                   ;
cmp      #$FF                          ; 0x1d300 $D2F0 C9 FF                   ;
beq      LD2EB                         ; 0x1d302 $D2F2 F0 F7                   ;RTS is here
cmp      #$4C                          ; 0x1d304 $D2F4 C9 4C                   ;
bne      LD307                         ; 0x1d306 $D2F6 D0 0F                   ;
iny                                    ; 0x1d308 $D2F8 C8                      ;
lda      ($00),y                       ; 0x1d309 $D2F9 B1 00                   ;
tax                                    ; 0x1d30b $D2FB AA                      ;
iny                                    ; 0x1d30c $D2FC C8                      ;
lda      ($00),y                       ; 0x1d30d $D2FD B1 00                   ;
sta      $01                           ; 0x1d30f $D2FF 85 01                   ;
stx      $00                           ; 0x1d311 $D301 86 00                   ;
ldy      #$00                          ; 0x1d313 $D303 A0 00                   ; Y = 00
lda      ($00),y                       ; 0x1d315 $D305 B1 00                   ;
LD307                                                                          ;
ldx      $2002                         ; 0x1d317 $D307 AE 02 20                ; PPU Status Register
sta      $2006                         ; 0x1d31a $D30A 8D 06 20                ; PPU Memory Address
iny                                    ; 0x1d31d $D30D C8                      ;
lda      ($00),y                       ; 0x1d31e $D30E B1 00                   ;
sta      $2006                         ; 0x1d320 $D310 8D 06 20                ; PPU Memory Address
iny                                    ; 0x1d323 $D313 C8                      ;
lda      ($00),y                       ; 0x1d324 $D314 B1 00                   ;
asl                                    ; 0x1d326 $D316 0A                      ;
pha                                    ; 0x1d327 $D317 48                      ;
lda      $FF                           ; 0x1d328 $D318 A5 FF                   ;; Sprite Bank ?
ora      #$04                          ; 0x1d32a $D31A 09 04                   ; set bits  .... .x..
bcs      LD320                         ; 0x1d32c $D31C B0 02                   ;
and      #$FB                          ; 0x1d32e $D31E 29 FB                   ; keep bits xxxx x.xx
LD320                                                                          ;
sta      $2000                         ; 0x1d330 $D320 8D 00 20                ;
LD323                                                                          ;
pla                                    ; 0x1d333 $D323 68                      ;
asl                                    ; 0x1d334 $D324 0A                      ;
bcc      LD32A                         ; 0x1d335 $D325 90 03                   ;
ora      #$02                          ; 0x1d337 $D327 09 02                   ; set bits  .... ..x.
iny                                    ; 0x1d339 $D329 C8                      ;
LD32A                                                                          ;
lsr                                    ; 0x1d33a $D32A 4A                      ;
lsr                                    ; 0x1d33b $D32B 4A                      ;
tax                                    ; 0x1d33c $D32C AA                      ;
LD32D                                                                          ;
bcs      LD330                         ; 0x1d33d $D32D B0 01                   ;
iny                                    ; 0x1d33f $D32F C8                      ;
LD330                                                                          ;
lda      ($00),y                       ; 0x1d340 $D330 B1 00                   ;top status bar text "MAGIC" gets read here
sta      $2007                         ; 0x1d342 $D332 8D 07 20                ;
dex                                    ; 0x1d345 $D335 CA                      ;
bne      LD32D                         ; 0x1d346 $D336 D0 F5                   ;
iny                                    ; 0x1d348 $D338 C8                      ;
tya                                    ; 0x1d349 $D339 98                      ;
clc                                    ; 0x1d34a $D33A 18                      ;
adc      $00                           ; 0x1d34b $D33B 65 00                   ;
sta      $00                           ; 0x1d34d $D33D 85 00                   ;
bcc      LD2EC                         ; 0x1d34f $D33F 90 AB                   ;
inc      $01                           ; 0x1d351 $D341 E6 01                   ;
jmp      LD2EC                         ; 0x1d353 $D343 4C EC D2                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Controllers_Input                                                        ;
jsr      bank7_Controllers_Input_Capture; 0x1d356 $D346 20 67 D3               ;
lda      $F5                           ; 0x1d359 $D349 A5 F5                   ; Controller 1 buttons pressed
sta      $00                           ; 0x1d35b $D34B 85 00                   ;
jsr      bank7_Controllers_Input_Capture; 0x1d35d $D34D 20 67 D3               ;
lda      $F5                           ; 0x1d360 $D350 A5 F5                   ; Controller 1 buttons pressed
cmp      $00                           ; 0x1d362 $D352 C5 00                   ;
bne      bank7_Controllers_Input       ; 0x1d364 $D354 D0 F0                   ;
ldx      #$01                          ; 0x1d366 $D356 A2 01                   ; X = 01
LD358                                                                          ;
lda      $F5,x                         ; 0x1d368 $D358 B5 F5                   ;
tay                                    ; 0x1d36a $D35A A8                      ;
eor      $F7,x                         ; 0x1d36b $D35B 55 F7                   ;
and      $F5,x                         ; 0x1d36d $D35D 35 F5                   ;
sta      $F5,x                         ; 0x1d36f $D35F 95 F5                   ;
sty      $F7,x                         ; 0x1d371 $D361 94 F7                   ;
dex                                    ; 0x1d373 $D363 CA                      ;
bpl      LD358                         ; 0x1d374 $D364 10 F2                   ;
rts                                    ; 0x1d376 $D366 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Controllers_Input_Capture                                                ;
ldx      #$01                          ; 0x1d377 $D367 A2 01                   ;;X = #$01 0000_0001
stx      $4016                         ; 0x1d379 $D369 8E 16 40                ; controllers strobe (01)
dex                                    ; 0x1d37c $D36C CA                      ;
stx      $4016                         ; 0x1d37d $D36D 8E 16 40                ; controllers strobe (00)
ldx      #$08                          ; 0x1d380 $D370 A2 08                   ;;X = #$08 0000_1000
LD372                                                                          ;
lda      $4016                         ; 0x1d382 $D372 AD 16 40                ;
lsr                                    ; 0x1d385 $D375 4A                      ;
rol      $F5                           ; 0x1d386 $D376 26 F5                   ;; Controller 1 Buttons Pressed
lda      $4017                         ; 0x1d388 $D378 AD 17 40                ;
lsr                                    ; 0x1d38b $D37B 4A                      ;
rol      $F6                           ; 0x1d38c $D37C 26 F6                   ;; Controller 2 Buttons Pressed
dex                                    ; 0x1d38e $D37E CA                      ;
bne      LD372                         ; 0x1d38f $D37F D0 F1                   ;
rts                                    ; 0x1d391 $D381 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_JmpToRoutine_at_Index_073D_in_Table_Address_from_the_top_of_the_Stack_The_Pointer_Table_immediately_follows_the_JSR_to_D382 ;
lda      $073D                         ; 0x1d392 $D382 AD 3D 07                ;; Routine Index
bank7_PullAddrFromTableFollowingThisJSR_withIndexOfA_then_JMP                  ;
asl                                    ; 0x1d395 $D385 0A                      ;multiply by 2 because table entry is 2 bytes per entry
tay                                    ; 0x1d396 $D386 A8                      ;transfer A to Y
pla                                    ; 0x1d397 $D387 68                      ;pull the address which we would normally RTS to 
sta      $0C                           ; 0x1d398 $D388 85 0C                   ;store for indirect read later
pla                                    ; 0x1d39a $D38A 68                      ;pull the address which we would normally RTS to 
sta      $0D                           ; 0x1d39b $D38B 85 0D                   ;store for indirect read later
iny                                    ; 0x1d39d $D38D C8                      ;increment Y because jsr makes the RTS point 1 behind?
lda      ($0C),y                       ; 0x1d39e $D38E B1 0C                   ;load address to jmp to (from the table following the JSR's RTS point)
sta      L000E                         ; 0x1d3a0 $D390 85 0E                   ;store for indirect jmp later
iny                                    ; 0x1d3a2 $D392 C8                      ;increment Y
lda      ($0C),y                       ; 0x1d3a3 $D393 B1 0C                   ;load address to jmp to
sta      $0F                           ; 0x1d3a5 $D395 85 0F                   ;store for indirect jmp later
jmp      (L000E)                       ; 0x1d3a7 $D397 6C 0E 00                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_UNUSED_D39A                                                              ;
.byt    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF; 0x1d3aa $D39A FF FF FF FF FF FF FF FF ;
.byt    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF; 0x1d3b2 $D3A2 FF FF FF FF FF FF FF FF ;
.byt    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF; 0x1d3ba $D3AA FF FF FF FF FF FF FF FF ;
.byt    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF; 0x1d3c2 $D3B2 FF FF FF FF FF FF FF FF ;
.byt    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF; 0x1d3ca $D3BA FF FF FF FF FF FF FF FF ;
.byt    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF; 0x1d3d2 $D3C2 FF FF FF FF FF FF FF FF ;
bank7_table13                                                                  ;
.byt    $80,$40                        ; 0x1d3da $D3CA 80 40                   ;
; ---------------------------------------------------------------------------- ;
bank7_check_if_link_died_0494__linkdeath                                       ;
lda      $0494                         ; 0x1d3dc $D3CC AD 94 04                ;; INC $0494 TO KILL LINK
beq      LD3E9                         ; 0x1d3df $D3CF F0 18                   ;
;occurs shortly after INC $0012		?		only in sidescroll with menu closed?       ;
;possibly only when you are allowed control                                    ;
ldx      $050C                         ; 0x1d3e1 $D3D1 AE 0C 05                ; Timer for Link being in injured state
bne      LD3E9                         ; 0x1d3e4 $D3D4 D0 13                   ;
stx      $0494                         ; 0x1d3e6 $D3D6 8E 94 04                ;; INC $0494 TO KILL LINK
inx                                    ; 0x1d3e9 $D3D9 E8                      ;
stx      $EC                           ; 0x1d3ea $D3DA 86 EC                   ; Sound Effects Type 1
lda      #$02                          ; 0x1d3ec $D3DC A9 02                   ; A = 02
sta      $076C                         ; 0x1d3ee $D3DE 8D 6C 07                ;; (00=restart from zelda's castle with 3 lives,  01=no routine, 02=die, 03=wake up zelda, 04=roll credits, 06=show the lives then restart the scene)
lda      #$00                          ; 0x1d3f1 $D3E1 A9 00                   ; A = 00
sta      $2001                         ; 0x1d3f3 $D3E3 8D 01 20                ;
jmp      LE18A                         ; 0x1d3f6 $D3E6 4C 8A E1                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD3E9                                                                          ;
jsr      bank7_Load_Bank_0_at_0x8000   ; 0x1d3f9 $D3E9 20 C5 FF                ; Load Bank 0
jsr      Spell_Casting_Routine         ; 0x1d3fc $D3EC 20 C3 8D                ; Spell Casting Routine
lda      $12                           ; 0x1d3ff $D3EF A5 12                   ;; Frame Counter (ascending)
and      #$01                          ; 0x1d401 $D3F1 29 01                   ; keep bits .... ...x				
tax                                    ; 0x1d403 $D3F3 AA                      ;
lda      $070C,x                       ; 0x1d404 $D3F4 BD 0C 07                ; Magic/Life to be added to Magic Meter
beq      LD433                         ; 0x1d407 $D3F7 F0 3A                   ;
dec      $070C,x                       ; 0x1d409 $D3F9 DE 0C 07                ; Magic/Life to be added to Magic Meter
lda      $0783,x                       ; 0x1d40c $D3FC BD 83 07                ; Current number of Magic/Life Containers
asl                                    ; 0x1d40f $D3FF 0A                      ;
asl                                    ; 0x1d410 $D400 0A                      ;
asl                                    ; 0x1d411 $D401 0A                      ;
asl                                    ; 0x1d412 $D402 0A                      ;
asl                                    ; 0x1d413 $D403 0A                      ;
sec                                    ; 0x1d414 $D404 38                      ;
sbc      #$01                          ; 0x1d415 $D405 E9 01                   ;
sta      $00                           ; 0x1d417 $D407 85 00                   ;
lda      $0773,x                       ; 0x1d419 $D409 BD 73 07                ; Current Magic/Life left in meter
clc                                    ; 0x1d41c $D40C 18                      ;
adc      #$02                          ; 0x1d41d $D40D 69 02                   ;
bcs      LD415                         ; 0x1d41f $D40F B0 04                   ;
cmp      $00                           ; 0x1d421 $D411 C5 00                   ;
bcc      LD41C                         ; 0x1d423 $D413 90 07                   ;
LD415                                                                          ;
lda      #$00                          ; 0x1d425 $D415 A9 00                   ; A = 00
sta      $070C,x                       ; 0x1d427 $D417 9D 0C 07                ; Magic/Life to be added to Magic Meter
lda      $00                           ; 0x1d42a $D41A A5 00                   ;
LD41C                                                                          ;
sta      $0773,x                       ; 0x1d42c $D41C 9D 73 07                ; Current Magic/Life left in meter
lda      $074F                         ; 0x1d42f $D41F AD 4F 07                ;; Related to Pause Pane
ora      bank7_table13,x               ; 0x1d432 $D422 1D CA D3                ;
sta      $074F                         ; 0x1d435 $D425 8D 4F 07                ;; Related to Pause Pane
lda      $07FB                         ; 0x1d438 $D428 AD FB 07                ;
cmp      #$10                          ; 0x1d43b $D42B C9 10                   ;
beq      LD433                         ; 0x1d43d $D42D F0 04                   ;
lda      #$10                          ; 0x1d43f $D42F A9 10                   ; A = 10 (sound for meters/experience up/down)
sta      $EF                           ; 0x1d441 $D431 85 EF                   ; Sound Effects Type 4
LD433                                                                          ;
lda      $0756                         ; 0x1d443 $D433 AD 56 07                ; Experience to be added (low byte)
ora      $0755                         ; 0x1d446 $D436 0D 55 07                ; Experience to be added (high byte)
beq      LD477                         ; 0x1d449 $D439 F0 3C                   ; check if Exp. to be added is 0
ldy      #$0A                          ; 0x1d44b $D43B A0 0A                   ; Y = 0A
lda      $0756                         ; 0x1d44d $D43D AD 56 07                ; Experience to be added (low byte)
ldx      $0755                         ; 0x1d450 $D440 AE 55 07                ; Experience to be added (high byte)
bne      LD44B                         ; 0x1d453 $D443 D0 06                   ;
cmp      #$0A                          ; 0x1d455 $D445 C9 0A                   ;
bcs      LD44B                         ; 0x1d457 $D447 B0 02                   ;
ldy      #$01                          ; 0x1d459 $D449 A0 01                   ; Y = 01
LD44B                                                                          ;
sty      $00                           ; 0x1d45b $D44B 84 00                   ;
sec                                    ; 0x1d45d $D44D 38                      ;
sbc      $00                           ; 0x1d45e $D44E E5 00                   ;
sta      $0756                         ; 0x1d460 $D450 8D 56 07                ; Experience to be added (low byte)
bcs      LD458                         ; 0x1d463 $D453 B0 03                   ;
dec      $0755                         ; 0x1d465 $D455 CE 55 07                ; Experience to be added (high byte)
LD458                                                                          ;
lda      $0776                         ; 0x1d468 $D458 AD 76 07                ; Current Experience (low byte)
clc                                    ; 0x1d46b $D45B 18                      ;
adc      $00                           ; 0x1d46c $D45C 65 00                   ;
sta      $0776                         ; 0x1d46e $D45E 8D 76 07                ; Current Experience (low byte)
lda      $0775                         ; 0x1d471 $D461 AD 75 07                ; Current Experience (high byte)
adc      #$00                          ; 0x1d474 $D464 69 00                   ;
sta      $0775                         ; 0x1d476 $D466 8D 75 07                ; Current Experience (high byte)
lda      $07FB                         ; 0x1d479 $D469 AD FB 07                ;
cmp      #$10                          ; 0x1d47c $D46C C9 10                   ;
beq      LD474                         ; 0x1d47e $D46E F0 04                   ;
lda      #$10                          ; 0x1d480 $D470 A9 10                   ; A = 10 (sound for meters/experience up/down)
sta      $EF                           ; 0x1d482 $D472 85 EF                   ; Sound Effects Type 4
LD474                                                                          ;
jmp      LD4A3                         ; 0x1d484 $D474 4C A3 D4                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD477                                                                          ;
lda      $05E8                         ; 0x1d487 $D477 AD E8 05                ;
beq      LD4AB                         ; 0x1d48a $D47A F0 2F                   ;
dec      $05E8                         ; 0x1d48c $D47C CE E8 05                ;
lda      $0776                         ; 0x1d48f $D47F AD 76 07                ; Current Experience (low byte)
ora      $0775                         ; 0x1d492 $D482 0D 75 07                ; Current Experience (high byte)
beq      LD4AB                         ; 0x1d495 $D485 F0 24                   ;
lda      $0776                         ; 0x1d497 $D487 AD 76 07                ; Current Experience (low byte)
sec                                    ; 0x1d49a $D48A 38                      ;
sbc      #$01                          ; 0x1d49b $D48B E9 01                   ;
sta      $0776                         ; 0x1d49d $D48D 8D 76 07                ; Current Experience (low byte)
lda      $0775                         ; 0x1d4a0 $D490 AD 75 07                ; Current Experience (high byte)
sbc      #$00                          ; 0x1d4a3 $D493 E9 00                   ;
sta      $0775                         ; 0x1d4a5 $D495 8D 75 07                ; Current Experience (high byte)
lda      $07FB                         ; 0x1d4a8 $D498 AD FB 07                ;
cmp      #$10                          ; 0x1d4ab $D49B C9 10                   ;
beq      LD4A3                         ; 0x1d4ad $D49D F0 04                   ;
lda      #$10                          ; 0x1d4af $D49F A9 10                   ; A = 10
sta      $EF                           ; 0x1d4b1 $D4A1 85 EF                   ; Sound Effects Type 4
LD4A3                                                                          ;
lda      $074F                         ; 0x1d4b3 $D4A3 AD 4F 07                ;; Related to Pause Pane
ora      #$40                          ; 0x1d4b6 $D4A6 09 40                   ; set bits .x.. ....
sta      $074F                         ; 0x1d4b8 $D4A8 8D 4F 07                ;; Related to Pause Pane
LD4AB                                                                          ;
lda      $074C                         ; 0x1d4bb $D4AB AD 4C 07                ;; Dialog Type (00 - None, 01 - Level Up, 02 - Talking); * related to Raft Animation * (and other events, like spell learning)
cmp      #$02                          ; 0x1d4be $D4AE C9 02                   ;
bcs      LD4CE                         ; 0x1d4c0 $D4B0 B0 1C                   ;
LD4B2                                                                          ;
bit      $2002                         ; 0x1d4c2 $D4B2 2C 02 20                ;
bvc      LD4B2                         ; 0x1d4c5 $D4B5 50 FB                   ;
lda      $FF                           ; 0x1d4c7 $D4B7 A5 FF                   ;; Sprite Bank ?
ora      $0746                         ; 0x1d4c9 $D4B9 0D 46 07                ;
sta      $FF                           ; 0x1d4cc $D4BC 85 FF                   ;; Sprite Bank ?
ldx      $FD                           ; 0x1d4ce $D4BE A6 FD                   ;
ldy      #$10                          ; 0x1d4d0 $D4C0 A0 10                   ; Y = 10
LD4C2                                                                          ;
dey                                    ; 0x1d4d2 $D4C2 88                      ;
bne      LD4C2                         ; 0x1d4d3 $D4C3 D0 FD                   ;
sta      $2000                         ; 0x1d4d5 $D4C5 8D 00 20                ;
stx      $2005                         ; 0x1d4d8 $D4C8 8E 05 20                ;
sty      $2005                         ; 0x1d4db $D4CB 8C 05 20                ;
LD4CE                                                                          ;
jsr      Hub_Update_Routine            ; 0x1d4de $D4CE 20 8D 96                ; Hub Update Routine
lda      $0565                         ; 0x1d4e1 $D4D1 AD 65 05                ;; Hit Points - Display
cmp      #$20                          ; 0x1d4e4 $D4D4 C9 20                   ;
bcs      LD4F3                         ; 0x1d4e6 $D4D6 B0 1B                   ;
lda      $07FB                         ; 0x1d4e8 $D4D8 AD FB 07                ;
cmp      #$10                          ; 0x1d4eb $D4DB C9 10                   ;
bcs      LD4F3                         ; 0x1d4ed $D4DD B0 14                   ;
lda      $07FC                         ; 0x1d4ef $D4DF AD FC 07                ;
cmp      #$40                          ; 0x1d4f2 $D4E2 C9 40                   ;
beq      LD4F3                         ; 0x1d4f4 $D4E4 F0 0D                   ;
lda      $07FE                         ; 0x1d4f6 $D4E6 AD FE 07                ;
cmp      #$02                          ; 0x1d4f9 $D4E9 C9 02                   ;
beq      LD4F3                         ; 0x1d4fb $D4EB F0 06                   ;
lda      $EF                           ; 0x1d4fd $D4ED A5 EF                   ; Sound Effects Type 4
ora      #$40                          ; 0x1d4ff $D4EF 09 40                   ; set bits .x.. ....
sta      $EF                           ; 0x1d501 $D4F1 85 EF                   ; sound for Low Health Beeping
LD4F3                                                                          ;
jsr      L903A                         ; 0x1d503 $D4F3 20 3A 90                ;
lda      #$00                          ; 0x1d506 $D4F6 A9 00                   ; A = 00
sta      $0754                         ; 0x1d508 $D4F8 8D 54 07                ;;in_elevator (boolean)
sta      $05E7                         ; 0x1d50b $D4FB 8D E7 05                ;
jsr      L9925                         ; 0x1d50e $D4FE 20 25 99                ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1d511 $D501 20 C9 FF                ; Load Bank $0769
jsr      bank7_code21                  ; 0x1d514 $D504 20 A7 D5                ;
jsr      bank7_Load_Bank_0_at_0x8000   ; 0x1d517 $D507 20 C5 FF                ; Load Bank 0
jsr      Chandeliers_in_North_Castle   ; 0x1d51a $D50A 20 E5 80                ; North Castle Chandeliers
jsr      Check_for_Fire_Spell          ; 0x1d51d $D50D 20 47 98                ;
jsr      bank0_unknown37               ; 0x1d520 $D510 20 D2 A6                ;
lda      $0497                         ; 0x1d523 $D513 AD 97 04                ;;crouch_timer (timer for Link crouching after landing); Timer for Link crouching after landing
beq      LD51F                         ; 0x1d526 $D516 F0 07                   ;
dec      $0497                         ; 0x1d528 $D518 CE 97 04                ;;crouch_timer (timer for Link crouching after landing); Timer for Link crouching after landing
lda      #$06                          ; 0x1d52b $D51B A9 06                   ; A = 06
sta      $80                           ; 0x1d52d $D51D 85 80                   ;; Controller 1 Last Poll; Current Animation Frame for Link (OW and SS)	;animation frame, powerful: can cause link to attack
LD51F                                                                          ;
lda      $0518                         ; 0x1d52f $D51F AD 18 05                ;; Invulnerable Timeout (01-02 - Blinking, 03+ - Not Blinking); Timer for Link being immune from attacks
beq      LD52D                         ; 0x1d532 $D522 F0 09                   ;
cmp      #$03                          ; 0x1d534 $D524 C9 03                   ;
bcs      LD52D                         ; 0x1d536 $D526 B0 05                   ;
lda      $12                           ; 0x1d538 $D528 A5 12                   ;; Frame Counter (ascending)
lsr                                    ; 0x1d53a $D52A 4A                      ;
bcs      LD538                         ; 0x1d53b $D52B B0 0B                   ;
LD52D                                                                          ;
jsr      bank7_Links_Display_Routine   ; 0x1d53d $D52D 20 F0 EB                ;
lda      $0503                         ; 0x1d540 $D530 AD 03 05                ;; Timer for moving left or right (when entering area)
bne      LD538                         ; 0x1d543 $D533 D0 03                   ;
jsr      bank7_related_to_breakable_block; 0x1d545 $D535 20 DD E1              ;related to breakable block
LD538                                                                          ;
lda      $0736                         ; 0x1d548 $D538 AD 36 07                ; Game Mode
cmp      #$0B                          ; 0x1d54b $D53B C9 0B                   ;
bne      LD545                         ; 0x1d54d $D53D D0 06                   ;
inc      $0727                         ; 0x1d54f $D53F EE 27 07                ;
inc      $0729                         ; 0x1d552 $D542 EE 29 07                ;
LD545                                                                          ;
jmp      L99E6                         ; 0x1d555 $D545 4C E6 99                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Flying_Blade_Disappearing__maybe                                         ;
ldy      $97,x                         ; 0x1d558 $D548 B4 97                   ;
lda      $CA                           ; 0x1d55a $D54A A5 CA                   ;
and      #$08                          ; 0x1d55c $D54C 29 08                   ; keep bits .... x...
bne      LD55A                         ; 0x1d55e $D54E D0 0A                   ;
lda      $30,x                         ; 0x1d560 $D550 B5 30                   ; Projectile Y Position
sta      $0200,y                       ; 0x1d562 $D552 99 00 02                ;
lda      $CE                           ; 0x1d565 $D555 A5 CE                   ;
sta      $0203,y                       ; 0x1d567 $D557 99 03 02                ;
LD55A                                                                          ;
inc      $87,x                         ; 0x1d56a $D55A F6 87                   ; Projectile Type
lda      $87,x                         ; 0x1d56c $D55C B5 87                   ;; Projectile Type
LD55E                                                                          ;
and      #$08                          ; 0x1d56e $D55E 29 08                   ; keep bits .... x...
lsr                                    ; 0x1d570 $D560 4A                      ;
lsr                                    ; 0x1d571 $D561 4A                      ;
adc      #$78                          ; 0x1d572 $D562 69 78                   ; 78 = Tile Mapping offset
sta      $0201,y                       ; 0x1d574 $D564 99 01 02                ;
lda      #$01                          ; 0x1d577 $D567 A9 01                   ; A = 01
sta      $0202,y                       ; 0x1d579 $D569 99 02 02                ;
LD56C                                                                          ;
rts                                    ; 0x1d57c $D56C 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD56D                                                                          ;
txa                                    ; 0x1d57d $D56D 8A                      ;
clc                                    ; 0x1d57e $D56E 18                      ;
adc      #$07                          ; 0x1d57f $D56F 69 07                   ;
tax                                    ; 0x1d581 $D571 AA                      ;
ldy      #$02                          ; 0x1d582 $D572 A0 02                   ; Y = 02
jsr      bank7_code51                  ; 0x1d584 $D574 20 7D F2                ;
ldx      $10                           ; 0x1d587 $D577 A6 10                   ;; used as monster x register ;draw boss hp bar
lda      $87,x                         ; 0x1d589 $D579 B5 87                   ; Projectile Type
beq      LD56C                         ; 0x1d58b $D57B F0 EF                   ;
bmi      bank7_Flying_Blade_Disappearing__maybe; 0x1d58d $D57D 30 C9           ;
sec                                    ; 0x1d58f $D57F 38                      ;
sbc      #$01                          ; 0x1d590 $D580 E9 01                   ;
asl                                    ; 0x1d592 $D582 0A                      ;
tay                                    ; 0x1d593 $D583 A8                      ;
lda      $6D00,y                       ; 0x1d594 $D584 B9 00 6D                ;
sta      L000E                         ; 0x1d597 $D587 85 0E                   ;
lda      $6D01,y                       ; 0x1d599 $D589 B9 01 6D                ;
bank7_table14 = * + $0002                                                      ;
jmp      bank7_JUMPS_TO___E_           ; 0x1d59c $D58C 4C D6 D6                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD58F                                                                          ;
.byt    $50,$68,$80,$98,$B0,$C8,$50,$68; 0x1d59f $D58F 50 68 80 98 B0 C8 50 68 ;
.byt    $80,$98,$B0,$C8                ; 0x1d5a7 $D597 80 98 B0 C8             ;
LD59B                                                                          ;
.byt    $20,$28,$30,$E0,$E8,$F0,$20,$28; 0x1d5ab $D59B 20 28 30 E0 E8 F0 20 28 ;
.byt    $30,$E0,$E8,$F0                ; 0x1d5b3 $D5A3 30 E0 E8 F0             ;
; ---------------------------------------------------------------------------- ;
bank7_code21                                                                   ;
lda      $B5                           ; 0x1d5b7 $D5A7 A5 B5                   ;;2 will make link die in lava	;3 move right like when win game at dark link
beq      LD5D9                         ; 0x1d5b9 $D5A9 F0 2E                   ;
inc      $0485                         ; 0x1d5bb $D5AB EE 85 04                ;
ldx      #$05                          ; 0x1d5be $D5AE A2 05                   ; X = 05
LD5B0                                                                          ;
stx      $10                           ; 0x1d5c0 $D5B0 86 10                   ;; used as monster x register ;draw boss hp bar
lda      $0485                         ; 0x1d5c2 $D5B2 AD 85 04                ;
cmp      #$06                          ; 0x1d5c5 $D5B5 C9 06                   ;
bcc      LD5BE                         ; 0x1d5c7 $D5B7 90 05                   ;
lda      #$00                          ; 0x1d5c9 $D5B9 A9 00                   ; A = 00
sta      $0485                         ; 0x1d5cb $D5BB 8D 85 04                ;
LD5BE                                                                          ;
clc                                    ; 0x1d5ce $D5BE 18                      ;
adc      $10                           ; 0x1d5cf $D5BF 65 10                   ;; used as monster x register ;draw boss hp bar
tay                                    ; 0x1d5d1 $D5C1 A8                      ;
lda      LD58F,y                       ; 0x1d5d2 $D5C2 B9 8F D5                ;
sta      $91,x                         ; 0x1d5d5 $D5C5 95 91                   ;
lda      LD59B,y                       ; 0x1d5d7 $D5C7 B9 9B D5                ;
sta      $97,x                         ; 0x1d5da $D5CA 95 97                   ;
jsr      LD5DA                         ; 0x1d5dc $D5CC 20 DA D5                ;
ldx      $10                           ; 0x1d5df $D5CF A6 10                   ;; used as monster x register ;draw boss hp bar
jsr      LD56D                         ; 0x1d5e1 $D5D1 20 6D D5                ;
ldx      $10                           ; 0x1d5e4 $D5D4 A6 10                   ;; used as monster x register ;draw boss hp bar
dex                                    ; 0x1d5e6 $D5D6 CA                      ;
bpl      LD5B0                         ; 0x1d5e7 $D5D7 10 D7                   ;
LD5D9                                                                          ;
rts                                    ; 0x1d5e9 $D5D9 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD5DA                                                                          ;
ldy      #$01                          ; 0x1d5ea $D5DA A0 01                   ; Y = 01
inx                                    ; 0x1d5ec $D5DC E8                      ;
jsr      bank7_code51                  ; 0x1d5ed $D5DD 20 7D F2                ;
ldx      $10                           ; 0x1d5f0 $D5E0 A6 10                   ;; used as monster x register ;draw boss hp bar
lda      $B6,x                         ; 0x1d5f2 $D5E2 B5 B6                   ; Generated Enemy Slot
asl                                    ; 0x1d5f4 $D5E4 0A                      ;
tay                                    ; 0x1d5f5 $D5E5 A8                      ;
lda      bank7_pointer_table15,y       ; 0x1d5f6 $D5E6 B9 F1 D5                ;
sta      L000E                         ; 0x1d5f9 $D5E9 85 0E                   ;
lda      bank7_pointer_table15+$01,y   ; 0x1d5fb $D5EB B9 F2 D5                ;
jmp      bank7_JUMPS_TO___E_           ; 0x1d5fe $D5EE 4C D6 D6                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_pointer_table15                                                          ;
.word    bank7_code22                  ; 0x1d601 $D5F1 03 D6                   ;
.word    bank7_enemy_every_frame_routine; 0x1d603 $D5F3 CA D6                  ;
.word    LDCAE                         ; 0x1d605 $D5F5 AE DC                   ;
.word    bank7_code30                  ; 0x1d607 $D5F7 6C DD                   ;
; ---------------------------------------------------------------------------- ;
bank7_table15                                                                  ;
.byt    $08,$F8                        ; 0x1d609 $D5F9 08 F8                   ;
LD5FB                                                                          ;
.byt    $30,$50,$60,$70,$80,$90,$A0,$B0; 0x1d60b $D5FB 30 50 60 70 80 90 A0 B0 ;
; ---------------------------------------------------------------------------- ;
bank7_code22                                                                   ;
lda      $0759                         ; 0x1d613 $D603 AD 59 07                ;; if not 0, cause fairy spawn at next encounter (??)
bne      LD624                         ; 0x1d616 $D606 D0 1C                   ;
lda      $071F                         ; 0x1d618 $D608 AD 1F 07                ;; ???
lsr                                    ; 0x1d61b $D60B 4A                      ;
eor      #$01                          ; 0x1d61c $D60C 49 01                   ; flip bits .... ...x
tax                                    ; 0x1d61e $D60E AA                      ;
lda      $0732                         ; 0x1d61f $D60F AD 32 07                ;
cmp      $0733                         ; 0x1d622 $D612 CD 33 07                ;
bcc      LD625                         ; 0x1d625 $D615 90 0E                   ;
cmp      #$02                          ; 0x1d627 $D617 C9 02                   ;
beq      LD620                         ; 0x1d629 $D619 F0 05                   ;
cpx      #$01                          ; 0x1d62b $D61B E0 01                   ;
beq      LD625                         ; 0x1d62d $D61D F0 06                   ;
rts                                    ; 0x1d62f $D61F 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD620                                                                          ;
cpx      #$00                          ; 0x1d630 $D620 E0 00                   ;
beq      LD625                         ; 0x1d632 $D622 F0 01                   ;
LD624                                                                          ;
rts                                    ; 0x1d634 $D624 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD625                                                                          ;
lda      $0732,x                       ; 0x1d635 $D625 BD 32 07                ;
sta      $00                           ; 0x1d638 $D628 85 00                   ;
lda      $0734,x                       ; 0x1d63a $D62A BD 34 07                ;
sta      $01                           ; 0x1d63d $D62D 85 01                   ;
ldx      $10                           ; 0x1d63f $D62F A6 10                   ;; used as monster x register ;draw boss hp bar
ldy      #$01                          ; 0x1d641 $D631 A0 01                   ; Y = 01
LD633                                                                          ;
tya                                    ; 0x1d643 $D633 98                      ;
ldy      #$00                          ; 0x1d644 $D634 A0 00                   ; Y = 00
cmp      ($D6),y                       ; 0x1d646 $D636 D1 D6                   ;
bcs      LD624                         ; 0x1d648 $D638 B0 EA                   ;
tay                                    ; 0x1d64a $D63A A8                      ;
iny                                    ; 0x1d64b $D63B C8                      ;
lda      ($D6),y                       ; 0x1d64c $D63C B1 D6                   ;
asl                                    ; 0x1d64e $D63E 0A                      ;
rol                                    ; 0x1d64f $D63F 2A                      ;
rol                                    ; 0x1d650 $D640 2A                      ;
and      #$03                          ; 0x1d651 $D641 29 03                   ; keep bits .... ..xx
cmp      $00                           ; 0x1d653 $D643 C5 00                   ;
beq      LD64B                         ; 0x1d655 $D645 F0 04                   ;
LD647                                                                          ;
iny                                    ; 0x1d657 $D647 C8                      ;
jmp      LD633                         ; 0x1d658 $D648 4C 33 D6                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD64B                                                                          ;
dey                                    ; 0x1d65b $D64B 88                      ;
lda      ($D6),y                       ; 0x1d65c $D64C B1 D6                   ;
and      #$0F                          ; 0x1d65e $D64E 29 0F                   ; keep bits .... xxxx
cmp      $01                           ; 0x1d660 $D650 C5 01                   ;
beq      LD658                         ; 0x1d662 $D652 F0 04                   ;DECIDE IF SPAWN MONSTER FROM MAP DATA
;---- spawn monster ?                                                          ;
;                                                                              ;
;Related to Enemy Generation ?		2 bytes: 	[0-2:Y index for table to get Y position]	[bits0-5:monID];
;                                                                              ; JSR $D685: 		07:D685:B1 D6     LDA ($D6),Y @ $700D = #$1D
;                                                                              ;set D6 to point to 2 bytes of monster data
iny                                    ; 0x1d664 $D654 C8                      ;
jmp      LD647                         ; 0x1d665 $D655 4C 47 D6                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD658                                                                          ;
lda      ($D6),y                       ; 0x1d668 $D658 B1 D6                   ;
asl                                    ; 0x1d66a $D65A 0A                      ;
bcs      LD6C0                         ; 0x1d66b $D65B B0 63                   ;
inc      $B6,x                         ; 0x1d66d $D65D F6 B6                   ; Generated Enemy Slot
pha                                    ; 0x1d66f $D65F 48                      ;
sec                                    ; 0x1d670 $D660 38                      ;
ror                                    ; 0x1d671 $D661 6A                      ;
sta      ($D6),y                       ; 0x1d672 $D662 91 D6                   ;
sty      $02                           ; 0x1d674 $D664 84 02                   ;
pla                                    ; 0x1d676 $D666 68                      ;
lsr                                    ; 0x1d677 $D667 4A                      ;
lsr                                    ; 0x1d678 $D668 4A                      ;
lsr                                    ; 0x1d679 $D669 4A                      ;
lsr                                    ; 0x1d67a $D66A 4A                      ;
lsr                                    ; 0x1d67b $D66B 4A                      ;
and      #$07                          ; 0x1d67c $D66C 29 07                   ; keep bits .... .xxx
tay                                    ; 0x1d67e $D66E A8                      ;
lda      LD5FB,y                       ; 0x1d67f $D66F B9 FB D5                ;
sta      $2A,x                         ; 0x1d682 $D672 95 2A                   ; Enemy Y Position
ldy      $02                           ; 0x1d684 $D674 A4 02                   ;
sty      $BC,x                         ; 0x1d686 $D676 94 BC                   ;; Generated Enemy Y Position ?
lda      $00                           ; 0x1d688 $D678 A5 00                   ;
sta      $3C,x                         ; 0x1d68a $D67A 95 3C                   ; Enemy X Position (high byte)
lda      $01                           ; 0x1d68c $D67C A5 01                   ;
asl                                    ; 0x1d68e $D67E 0A                      ;
asl                                    ; 0x1d68f $D67F 0A                      ;
asl                                    ; 0x1d690 $D680 0A                      ;
asl                                    ; 0x1d691 $D681 0A                      ;
sta      $4E,x                         ; 0x1d692 $D682 95 4E                   ; Enemy X Position (low byte)
iny                                    ; 0x1d694 $D684 C8                      ;
lda      ($D6),y                       ; 0x1d695 $D685 B1 D6                   ;??got called when existing for awhile as a bot <-bug?
and      #$3F                          ; 0x1d697 $D687 29 3F                   ; keep bits ..xx xxxx
sta      $A1,x                         ; 0x1d699 $D689 95 A1                   ; Enemy Code
jsr      bank7_Determine_Enemy_Facing_Direction_relative_to_Link; 0x1d69b $D68B 20 91 DC; Determine Enemy Facing Direction
lda      bank7_table15,y               ; 0x1d69e $D68E B9 F9 D5                ; 08 or F8
sta      $71,x                         ; 0x1d6a1 $D691 95 71                   ; Enemy X Velocity
lda      #$01                          ; 0x1d6a3 $D693 A9 01                   ; A = 01
sta      $1A,x                         ; 0x1d6a5 $D695 95 1A                   ;
lsr                                    ; 0x1d6a7 $D697 4A                      ;
sta      $040E,x                       ; 0x1d6a8 $D698 9D 0E 04                ; Enemy Hit State (0 = not in Hit State)
sta      $AF,x                         ; 0x1d6ab $D69B 95 AF                   ; Various enemy state variables
sta      $81,x                         ; 0x1d6ad $D69D 95 81                   ; Current Animation Frame for Enemy
sta      $043E,x                       ; 0x1d6af $D69F 9D 3E 04                ;
sta      $057E,x                       ; 0x1d6b2 $D6A2 9D 7E 05                ;; Enemy Y Velocity; Enemy Y Velocity
sta      $0444,x                       ; 0x1d6b5 $D6A5 9D 44 04                ; Enemy Vulnerability
sta      $04A0,x                       ; 0x1d6b8 $D6A8 9D A0 04                ;
ldy      $A1,x                         ; 0x1d6bb $D6AB B4 A1                   ; Enemy Code
lda      $6D21,y                       ; 0x1d6bd $D6AD B9 21 6D                ;
sta      $C2,x                         ; 0x1d6c0 $D6B0 95 C2                   ; Enemy Current HP
tya                                    ; 0x1d6c2 $D6B2 98                      ;
asl                                    ; 0x1d6c3 $D6B3 0A                      ;
tay                                    ; 0x1d6c4 $D6B4 A8                      ;
lda      $6D45,y                       ; 0x1d6c5 $D6B5 B9 45 6D                ;
sta      L000E                         ; 0x1d6c8 $D6B8 85 0E                   ;
lda      $6D46,y                       ; 0x1d6ca $D6BA B9 46 6D                ;
jmp      bank7_JUMPS_TO___E_           ; 0x1d6cd $D6BD 4C D6 D6                ;<----- JUMPS TO $(E)
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD6C0                                                                          ;
rts                                    ; 0x1d6d0 $D6C0 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Link_Collision_Detection                                                 ;
lda      $A8,x                         ; 0x1d6d1 $D6C1 B5 A8                   ; Enemy State ?
and      #$10                          ; 0x1d6d3 $D6C3 29 10                   ; keep bits ...x .... (bit for enemy frozen ?)
beq      LD6C0                         ; 0x1d6d5 $D6C5 F0 F9                   ;
jmp      bank7_Link_Hit_Routine        ; 0x1d6d7 $D6C7 4C EF E2                ; Link Hit Routine
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_enemy_every_frame_routine                                                ;
lda      $A1,x                         ; 0x1d6da $D6CA B5 A1                   ; Enemy Code
asl                                    ; 0x1d6dc $D6CC 0A                      ;
tay                                    ; 0x1d6dd $D6CD A8                      ;
lda      $6D8D,y                       ; 0x1d6de $D6CE B9 8D 6D                ;
sta      L000E                         ; 0x1d6e1 $D6D1 85 0E                   ;
lda      $6D8E,y                       ; 0x1d6e3 $D6D3 B9 8E 6D                ;
bank7_JUMPS_TO___E_                                                            ;
sta      $0F                           ; 0x1d6e6 $D6D6 85 0F                   ;
jmp      (L000E)                       ; 0x1d6e8 $D6D8 6C 0E 00                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Table_for_Deeler                                                         ;
.byt    $20,$F0                        ; 0x1d6eb $D6DB 20 F0                   ;20 = Speed when descending	;F0 = Speed when ascending
LD6DD                                                                          ;
.byt    $08,$F8                        ; 0x1d6ed $D6DD 08 F8                   ;08 = Speed going right	;F8 = Speed going left
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines1_Deeler                                                   ;
jsr      bank7_Enemy_Stops_when_Hit    ; 0x1d6ef $D6DF 20 02 DA                ; Enemy Stops when Hit
jsr      bank7_Link_Collision_Detection; 0x1d6f2 $D6E2 20 C1 D6                ; Link Collision Detection
lda      $AF,x                         ; 0x1d6f5 $D6E5 B5 AF                   ;; Various enemy state variables
bpl      LD6EC                         ; 0x1d6f7 $D6E7 10 03                   ;
jmp      bank7_Enemy_Routines1_Deeler_Code; 0x1d6f9 $D6E9 4C 50 D7             ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD6EC                                                                          ;
jsr      bank7_Determine_Enemy_Facing_Direction_relative_to_Link; 0x1d6fc $D6EC 20 91 DC; Determine Enemy Facing Direction
lda      $AF,x                         ; 0x1d6ff $D6EF B5 AF                   ;; Various enemy state variables
bne      LD711                         ; 0x1d701 $D6F1 D0 1E                   ;
lda      $0F                           ; 0x1d703 $D6F3 A5 0F                   ;
adc      #$40                          ; 0x1d705 $D6F5 69 40                   ;
cmp      #$80                          ; 0x1d707 $D6F7 C9 80                   ;
bcc      bank7_Deeler_Red_Blue         ; 0x1d709 $D6F9 90 0B                   ;
LD6FB                                                                          ;
lda      LD6DD,y                       ; 0x1d70b $D6FB B9 DD D6                ;
sta      $71,x                         ; 0x1d70e $D6FE 95 71                   ; Enemy X Velocity
jsr      bank7_Simple_Horizontal_Movement; 0x1d710 $D700 20 B8 DE              ; Simple Horizontal Movement
jmp      LD74D                         ; 0x1d713 $D703 4C 4D D7                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Deeler_Red_Blue                                                          ;
lda      $051B,x                       ; 0x1d716 $D706 BD 1B 05                ; Randomizer
and      #$1F                          ; 0x1d719 $D709 29 1F                   ; keep bits ...x xxxx
ora      $C9                           ; 0x1d71b $D70B 05 C9                   ;
bne      LD6FB                         ; 0x1d71d $D70D D0 EC                   ;
LD70F                                                                          ;
inc      $AF,x                         ; 0x1d71f $D70F F6 AF                   ;; Various enemy state variables
LD711                                                                          ;
lda      $AF,x                         ; 0x1d721 $D711 B5 AF                   ;; Various enemy state variables
lsr                                    ; 0x1d723 $D713 4A                      ;
tay                                    ; 0x1d724 $D714 A8                      ;
lda      $2A,x                         ; 0x1d725 $D715 B5 2A                   ; Enemy Y Position
cmp      $05DC,y                       ; 0x1d727 $D717 D9 DC 05                ; Go down that many pixels
bne      LD728                         ; 0x1d72a $D71A D0 0C                   ;
lda      $AF,x                         ; 0x1d72c $D71C B5 AF                   ;; Various enemy state variables
cmp      #$02                          ; 0x1d72e $D71E C9 02                   ;
bne      LD70F                         ; 0x1d730 $D720 D0 ED                   ;
lda      #$00                          ; 0x1d732 $D722 A9 00                   ; A = 00
sta      $AF,x                         ; 0x1d734 $D724 95 AF                   ;; Various enemy state variables
beq      LD74D                         ; 0x1d736 $D726 F0 25                   ;
LD728                                                                          ;
lda      $A1,x                         ; 0x1d738 $D728 B5 A1                   ; Enemy Code
cmp      #$0E                          ; 0x1d73a $D72A C9 0E                   ; 0E = Blue Deeler
bne      LD744                         ; 0x1d73c $D72C D0 16                   ;
lda      $2A,x                         ; 0x1d73e $D72E B5 2A                   ; Enemy Y Position
cmp      #$8E                          ; 0x1d740 $D730 C9 8E                   ; minimum height after first fall
bcc      LD744                         ; 0x1d742 $D732 90 10                   ;
ror      $AF,x                         ; 0x1d744 $D734 76 AF                   ;; Various enemy state variables
lda      #$00                          ; 0x1d746 $D736 A9 00                   ; A = 00
sta      $71,x                         ; 0x1d748 $D738 95 71                   ; Enemy X Velocity
lda      #$20                          ; 0x1d74a $D73A A9 20                   ; A = 20
sta      $057E,x                       ; 0x1d74c $D73C 9D 7E 05                ; Enemy Y Velocity
sta      $0504,x                       ; 0x1d74f $D73F 9D 04 05                ; Timer for Enemy
bne      LD773                         ; 0x1d752 $D742 D0 2F                   ;
LD744                                                                          ;
lda      bank7_Table_for_Deeler,y      ; 0x1d754 $D744 B9 DB D6                ;
sta      $057E,x                       ; 0x1d757 $D747 9D 7E 05                ; Enemy Y Velocity
jsr      bank7_Simple_Vertical_Movement; 0x1d75a $D74A 20 C8 DE                ; Simple Vertical Movement
LD74D                                                                          ;
jmp      LDE40                         ; 0x1d75d $D74D 4C 40 DE                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines1_Deeler_Code                                              ;
lda      $0504,x                       ; 0x1d760 $D750 BD 04 05                ; Timer for Enemy
bne      LD773                         ; 0x1d763 $D753 D0 1E                   ;
lda      $051B,x                       ; 0x1d765 $D755 BD 1B 05                ; Randomizer
and      #$3F                          ; 0x1d768 $D758 29 3F                   ; keep bits ..xx xxxx
ora      #$40                          ; 0x1d76a $D75A 09 40                   ; set  bits .x.. ....
sta      $0504,x                       ; 0x1d76c $D75C 9D 04 05                ; random 40-7F (delay before next jump)
jsr      bank7_Determine_Enemy_Facing_Direction_relative_to_Link; 0x1d76f $D75F 20 91 DC; Determine Enemy Facing Direction
lda      LD6DD,y                       ; 0x1d772 $D762 B9 DD D6                ;
asl                                    ; 0x1d775 $D765 0A                      ;
asl                                    ; 0x1d776 $D766 0A                      ;
sta      $71,x                         ; 0x1d777 $D767 95 71                   ; Enemy X Velocity
lda      $051B,x                       ; 0x1d779 $D769 BD 1B 05                ; Randomizer
and      #$07                          ; 0x1d77c $D76C 29 07                   ; keep bits .... .xxx
ora      #$E8                          ; 0x1d77e $D76E 09 E8                   ; set  bits xxx. x...
sta      $057E,x                       ; 0x1d780 $D770 9D 7E 05                ; Enemy Y Velocity (random E8-EF) (-18 -11)
LD773                                                                          ;
jsr      bank7_Simple_Horizontal_Movement; 0x1d783 $D773 20 B8 DE              ; Simple Horizontal Movement
jsr      bank7_Simple_Vertical_Movement; 0x1d786 $D776 20 C8 DE                ; Simple Vertical Movement
inc      $057E,x                       ; 0x1d789 $D779 FE 7E 05                ; Enemy Y Velocity
jsr      LDE3D                         ; 0x1d78c $D77C 20 3D DE                ;
lda      $A8,x                         ; 0x1d78f $D77F B5 A8                   ; Enemy State ?
and      #$04                          ; 0x1d791 $D781 29 04                   ; keep bits .... .x..
beq      LD78A                         ; 0x1d793 $D783 F0 05                   ;
jsr      bank7_Floor_Y_Position        ; 0x1d795 $D785 20 C1 DA                ; Floor Enemy Y Position
sta      $71,x                         ; 0x1d798 $D788 95 71                   ; Enemy X Velocity
LD78A                                                                          ;
rts                                    ; 0x1d79a $D78A 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Table_for_Bago_Bago                                                      ;
.byt    $10,$F0                        ; 0x1d79b $D78B 10 F0                   ;10 = Initial X Position, facing right	;F0 = Initial X Position, facing left
LD78D                                                                          ;
.byt    $20,$E0                        ; 0x1d79d $D78D 20 E0                   ;20 = X Velocity while in mid-air, facing right	;E0 = X Velocity while in mid-air, facing left
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines1_Bago_Bago_Generator                                      ;
lda      $12                           ; 0x1d79f $D78F A5 12                   ;; Frame Counter (ascending)
and      #$7F                          ; 0x1d7a1 $D791 29 7F                   ; keep bits .xxx xxxx
bne      LD79E                         ; 0x1d7a3 $D793 D0 09                   ; delay before next Bago Bago is spawned
ldx      #$05                          ; 0x1d7a5 $D795 A2 05                   ; X = 05
LD797                                                                          ;
lda      $B6,x                         ; 0x1d7a7 $D797 B5 B6                   ;; Generated Enemy Slot
beq      LD7A1                         ; 0x1d7a9 $D799 F0 06                   ;
dex                                    ; 0x1d7ab $D79B CA                      ;
bpl      LD797                         ; 0x1d7ac $D79C 10 F9                   ;
LD79E                                                                          ;
ldx      $10                           ; 0x1d7ae $D79E A6 10                   ;; used as monster x register ;draw boss hp bar
rts                                    ; 0x1d7b0 $D7A0 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD7A1                                                                          ;
lda      #$01                          ; 0x1d7b1 $D7A1 A9 01                   ; A = 01
sta      $B6,x                         ; 0x1d7b3 $D7A3 95 B6                   ;; Generated Enemy Slot
lda      #$10                          ; 0x1d7b5 $D7A5 A9 10                   ; A = 10
sta      $A1,x                         ; 0x1d7b7 $D7A7 95 A1                   ; Enemy Code (10 = Bago Bago)
lda      $051B,x                       ; 0x1d7b9 $D7A9 BD 1B 05                ; Randomizer
and      #$01                          ; 0x1d7bc $D7AC 29 01                   ; keep bits .... ...x
tay                                    ; 0x1d7be $D7AE A8                      ;
LD7B0     = * + $0001                                                          ;
lda      $072C                         ; 0x1d7bf $D7AF AD 2C 07                ; Scrolling Offset Low Byte
adc      bank7_Table_for_Bago_Bago,y   ; 0x1d7c2 $D7B2 79 8B D7                ;
sta      $4E,x                         ; 0x1d7c5 $D7B5 95 4E                   ; Enemy X position (low byte)
lda      $072A                         ; 0x1d7c7 $D7B7 AD 2A 07                ; Scrolling Offset High Byte
adc      #$00                          ; 0x1d7ca $D7BA 69 00                   ;
sta      $3C,x                         ; 0x1d7cc $D7BC 95 3C                   ; Enemy X position (high byte)
lda      LD78D,y                       ; 0x1d7ce $D7BE B9 8D D7                ;
sta      $71,x                         ; 0x1d7d1 $D7C1 95 71                   ; X Velocity for Enemy
lda      #$D0                          ; 0x1d7d3 $D7C3 A9 D0                   ; A = D0
sta      $2A,x                         ; 0x1d7d5 $D7C5 95 2A                   ; Initial Y position for Bago Bago
sta      $BC,x                         ; 0x1d7d7 $D7C7 95 BC                   ;; Generated Enemy Y Position ?
lda      #$C0                          ; 0x1d7d9 $D7C9 A9 C0                   ; A = C0
sta      $057E,x                       ; 0x1d7db $D7CB 9D 7E 05                ; Initial Y Velocity for Bago Bago
lda      #$03                          ; 0x1d7de $D7CE A9 03                   ; A = 03
sta      $C2,x                         ; 0x1d7e0 $D7D0 95 C2                   ; Enemy HP
lsr                                    ; 0x1d7e2 $D7D2 4A                      ;
sta      $1A,x                         ; 0x1d7e3 $D7D3 95 1A                   ;
lsr                                    ; 0x1d7e5 $D7D5 4A                      ;
sta      $040E,x                       ; 0x1d7e6 $D7D6 9D 0E 04                ; Enemy Hit State
iny                                    ; 0x1d7e9 $D7D9 C8                      ;
sty      $60,x                         ; 0x1d7ea $D7DA 94 60                   ;; Enemy facing direction
ldx      $10                           ; 0x1d7ec $D7DC A6 10                   ;; used as monster x register ;draw boss hp bar
rts                                    ; 0x1d7ee $D7DE 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Table_for_Bago_Bago_X_Velocity_on_ground                                 ;
.byt    $10,$F0                        ; 0x1d7ef $D7DF 10 F0                   ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines1_Bago_Bago0                                               ;
jsr      bank7_Enemy_Stops_when_Hit    ; 0x1d7f1 $D7E1 20 02 DA                ; Enemy Stops when Hit
lda      $C9                           ; 0x1d7f4 $D7E4 A5 C9                   ;
and      #$0C                          ; 0x1d7f6 $D7E6 29 0C                   ; keep bits .... xx..
cmp      #$0C                          ; 0x1d7f8 $D7E8 C9 0C                   ;
bne      LD7F1                         ; 0x1d7fa $D7EA D0 05                   ;
lda      #$00                          ; 0x1d7fc $D7EC A9 00                   ; A = 00
sta      $B6,x                         ; 0x1d7fe $D7EE 95 B6                   ;; Generated Enemy Slot
rts                                    ; 0x1d800 $D7F0 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD7F1                                                                          ;
jsr      bank7_Link_Collision_Detection; 0x1d801 $D7F1 20 C1 D6                ; Link Collision Detection
lda      $AF,x                         ; 0x1d804 $D7F4 B5 AF                   ;; Various enemy state variables
bne      bank7_Bago_Bago_and_Octorok   ; 0x1d806 $D7F6 D0 40                   ;
lda      $A8,x                         ; 0x1d808 $D7F8 B5 A8                   ;; Enemy State
and      #$04                          ; 0x1d80a $D7FA 29 04                   ;;Keep Bits:0000_0100
beq      LD812                         ; 0x1d80c $D7FC F0 14                   ;
lda      $057E,x                       ; 0x1d80e $D7FE BD 7E 05                ;; Enemy Y Velocity; Enemy Y Velocity
bmi      LD812                         ; 0x1d811 $D801 30 0F                   ;
inc      $AF,x                         ; 0x1d813 $D803 F6 AF                   ;; Various enemy state variables
jsr      bank7_Floor_Y_Position        ; 0x1d815 $D805 20 C1 DA                ; Floor Enemy Y Position
jsr      bank7_Determine_Enemy_Facing_Direction_relative_to_Link; 0x1d818 $D808 20 91 DC; Determine Enemy Facing Direction
lda      bank7_Table_for_Bago_Bago_X_Velocity_on_ground,y; 0x1d81b $D80B B9 DF D7;
sta      $71,x                         ; 0x1d81e $D80E 95 71                   ;; Enemy X Velocity
bne      bank7_Bago_Bago_and_Octorok   ; 0x1d820 $D810 D0 26                   ;
LD812                                                                          ;
inc      $057E,x                       ; 0x1d822 $D812 FE 7E 05                ;; Enemy Y Velocity; Enemy Y Velocity
jsr      bank7_Simple_Vertical_Movement; 0x1d825 $D815 20 C8 DE                ; Simple Vertical Movement
LD818                                                                          ;
lda      $0504,x                       ; 0x1d828 $D818 BD 04 05                ;; Timer for Enemy
bne      LD832                         ; 0x1d82b $D81B D0 15                   ;
lda      $2A,x                         ; 0x1d82d $D81D B5 2A                   ; Enemy Y position
sbc      $29                           ; 0x1d82f $D81F E5 29                   ; Link's Y position
cmp      #$11                          ; 0x1d831 $D821 C9 11                   ;
bcs      LD832                         ; 0x1d833 $D823 B0 0D                   ;
lda      #$70                          ; 0x1d835 $D825 A9 70                   ; A = 70
sta      $0504,x                       ; 0x1d837 $D827 9D 04 05                ; Minimum delay between rocks
lda      $051B,x                       ; 0x1d83a $D82A BD 1B 05                ; Randomizer
bmi      LD832                         ; 0x1d83d $D82D 30 03                   ; 50% chance of shooting rock at right Y pos
jsr      bank7_shoot_rock              ; 0x1d83f $D82F 20 6C D8                ; Shoot Rock
LD832                                                                          ;
jsr      bank7_Simple_Horizontal_Movement; 0x1d842 $D832 20 B8 DE              ;
jmp      LDE3D                         ; 0x1d845 $D835 4C 3D DE                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Bago_Bago_and_Octorok                                                    ;
lda      $A8,x                         ; 0x1d848 $D838 B5 A8                   ;; Enemy State
and      #$04                          ; 0x1d84a $D83A 29 04                   ; keep bits .... .x..
bne      LD840                         ; 0x1d84c $D83C D0 02                   ;
sta      $AF,x                         ; 0x1d84e $D83E 95 AF                   ;; Various enemy state variables
LD840                                                                          ;
bpl      LD818                         ; 0x1d850 $D840 10 D6                   ;
bank7_Enemy_Routines1_Bago_Bago1                                               ;
jsr      bank7_Enemy_Stops_when_Hit    ; 0x1d852 $D842 20 02 DA                ; Enemy Stops when Hit
jsr      bank7_Determine_Enemy_Facing_Direction_relative_to_Link; 0x1d855 $D845 20 91 DC; Determine Enemy Facing Direction
LD848                                                                          ;
inc      $AF,x                         ; 0x1d858 $D848 F6 AF                   ;; Various enemy state variables
lda      $AF,x                         ; 0x1d85a $D84A B5 AF                   ;; Various enemy state variables
and      #$7F                          ; 0x1d85c $D84C 29 7F                   ; keep bits .xxx xxxx
bne      LD855                         ; 0x1d85e $D84E D0 05                   ; delay before next jump (Octorok)
lda      #$E0                          ; 0x1d860 $D850 A9 E0                   ; A = E0
sta      $057E,x                       ; 0x1d862 $D852 9D 7E 05                ; Y Velocity for Octorok jump
LD855                                                                          ;
jsr      bank7_Gravity                 ; 0x1d865 $D855 20 BE DE                ; Gravity
jsr      LDE3D                         ; 0x1d868 $D858 20 3D DE                ; Display
jsr      bank7_Link_Collision_Detection; 0x1d86b $D85B 20 C1 D6                ; Link Collision Detection
lda      $A8,x                         ; 0x1d86e $D85E B5 A8                   ;; Enemy State
and      #$04                          ; 0x1d870 $D860 29 04                   ; keep bits .... .x..
beq      LD867                         ; 0x1d872 $D862 F0 03                   ;
jmp      bank7_Floor_Y_Position        ; 0x1d874 $D864 4C C1 DA                ; Floor Enemy Y Position
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD867                                                                          ;
lda      $057E,x                       ; 0x1d877 $D867 BD 7E 05                ; Enemy Y Velocity
bne      LD885                         ; 0x1d87a $D86A D0 19                   ;
bank7_shoot_rock                                                               ;
lda      $60,x                         ; 0x1d87c $D86C B5 60                   ;; Enemy facing direction
pha                                    ; 0x1d87e $D86E 48                      ;
jsr      bank7_Determine_Enemy_Facing_Direction_relative_to_Link; 0x1d87f $D86F 20 91 DC; Determine Enemy Facing Direction
pla                                    ; 0x1d882 $D872 68                      ;
sta      $60,x                         ; 0x1d883 $D873 95 60                   ;; Enemy facing direction
iny                                    ; 0x1d885 $D875 C8                      ;
tya                                    ; 0x1d886 $D876 98                      ;
cmp      $60,x                         ; 0x1d887 $D877 D5 60                   ;; Enemy facing direction
bne      LD885                         ; 0x1d889 $D879 D0 0A                   ;
jsr      bank7_Spawn_New_Projectile    ; 0x1d88b $D87B 20 CE DB                ; Spawn New Projectile
bcs      LD885                         ; 0x1d88e $D87E B0 05                   ;
lda      #$03                          ; 0x1d890 $D880 A9 03                   ; A = 03
sta      $87,y                         ; 0x1d892 $D882 99 87 00                ; generate projectile type 3 (Octorok rock)
LD885                                                                          ;
rts                                    ; 0x1d895 $D885 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Table_for_Octorok_X_Velocity                                             ;
.byt    $08,$F8                        ; 0x1d896 $D886 08 F8                   ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines1_Octorok                                                  ;
jsr      bank7_Enemy_Stops_when_Hit    ; 0x1d898 $D888 20 02 DA                ; Enemy Stops when Hit
jsr      LD848                         ; 0x1d89b $D88B 20 48 D8                ;
lda      $A8,x                         ; 0x1d89e $D88E B5 A8                   ;; Enemy State
and      #$03                          ; 0x1d8a0 $D890 29 03                   ; keep bits .... ..xx
beq      LD897                         ; 0x1d8a2 $D892 F0 03                   ;
jsr      bank7_Change_Enemy_Facing_Direction_and_X_Velocity; 0x1d8a4 $D894 20 EB E8; Wall Hit Collision Test
LD897                                                                          ;
jsr      bank7_Simple_Horizontal_Movement; 0x1d8a7 $D897 20 B8 DE              ; Simple Horizontal Movement
lda      $AF,x                         ; 0x1d8aa $D89A B5 AF                   ;; Various enemy state variables
asl                                    ; 0x1d8ac $D89C 0A                      ;
cmp      #$80                          ; 0x1d8ad $D89D C9 80                   ;
bne      LD8A9                         ; 0x1d8af $D89F D0 08                   ;
jsr      bank7_Determine_Enemy_Facing_Direction_relative_to_Link; 0x1d8b1 $D8A1 20 91 DC; Determine Enemy Facing Direction
lda      bank7_Table_for_Octorok_X_Velocity,y; 0x1d8b4 $D8A4 B9 86 D8          ;
sta      $71,x                         ; 0x1d8b7 $D8A7 95 71                   ; Enemy X Velocity
LD8A9                                                                          ;
lda      $0504,x                       ; 0x1d8b9 $D8A9 BD 04 05                ;; Timer for Enemy
bne      LD8BE                         ; 0x1d8bc $D8AC D0 10                   ;
lda      $051B,x                       ; 0x1d8be $D8AE BD 1B 05                ; Randomizer
and      #$7F                          ; 0x1d8c1 $D8B1 29 7F                   ; keep bits .xxx xxxx
ora      #$80                          ; 0x1d8c3 $D8B3 09 80                   ; set  bits x... ....
sta      $0504,x                       ; 0x1d8c5 $D8B5 9D 04 05                ; random 80-FF (delay before shooting rock)
lda      $A8,x                         ; 0x1d8c8 $D8B8 B5 A8                   ;; Enemy State
and      #$04                          ; 0x1d8ca $D8BA 29 04                   ; keep bits .... .x..
bne      bank7_shoot_rock              ; 0x1d8cc $D8BC D0 AE                   ;
LD8BE                                                                          ;
rts                                    ; 0x1d8ce $D8BE 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Table_for_Elevator_Y_Velocity                                            ;
.byt    $00,$18,$E8                    ; 0x1d8cf $D8BF 00 18 E8                ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines1_Elevator                                                 ;
lda      $A8,x                         ; 0x1d8d2 $D8C2 B5 A8                   ;; Enemy State
and      #$10                          ; 0x1d8d4 $D8C4 29 10                   ; keep bits ...x ....
beq      LD91B                         ; 0x1d8d6 $D8C6 F0 53                   ;
sta      $0754                         ; 0x1d8d8 $D8C8 8D 54 07                ;;in_elevator (boolean)
lda      #$00                          ; 0x1d8db $D8CB A9 00                   ; A = 00
sta      $0479                         ; 0x1d8dd $D8CD 8D 79 04                ; Link is in mid-air ?
sta      $057D                         ; 0x1d8e0 $D8D0 8D 7D 05                ;;vspeed (Link's vertical velocity, negative is up.); Link's Y Velocity; Player Y Delta; Link's Y Velocity
lda      $0743                         ; 0x1d8e3 $D8D3 AD 43 07                ; Up/Down Buttons Held
lsr                                    ; 0x1d8e6 $D8D6 4A                      ;
lsr                                    ; 0x1d8e7 $D8D7 4A                      ;
tay                                    ; 0x1d8e8 $D8D8 A8                      ;
lda      bank7_Table_for_Elevator_Y_Velocity,y; 0x1d8e9 $D8D9 B9 BF D8         ;
sta      $057E,x                       ; 0x1d8ec $D8DC 9D 7E 05                ; Enemy Y Velocity
lda      $0743                         ; 0x1d8ef $D8DF AD 43 07                ;; Controller 1 Input; Up/Down Buttons Held		;elevator was moving up or down: 8=up, 4=down
beq      LD8F4                         ; 0x1d8f2 $D8E2 F0 10                   ;
lda      $A7                           ; 0x1d8f4 $D8E4 A5 A7                   ;;collision bits for Link - 0000ABLR (above,below,left,right)
and      #$0C                          ; 0x1d8f6 $D8E6 29 0C                   ; keep bits .... xx..
eor      $0743                         ; 0x1d8f8 $D8E8 4D 43 07                ; Up/Down Buttons Held
beq      LD8FB                         ; 0x1d8fb $D8EB F0 0E                   ;
lda      #$20                          ; 0x1d8fd $D8ED A9 20                   ; A = 20
sta      $EF                           ; 0x1d8ff $D8EF 85 EF                   ; Sound Effects Type 4
jsr      bank7_Simple_Vertical_Movement; 0x1d901 $D8F1 20 C8 DE                ;
LD8F4                                                                          ;
lda      $2A,x                         ; 0x1d904 $D8F4 B5 2A                   ; Enemy Y position
clc                                    ; 0x1d906 $D8F6 18                      ;
adc      #$08                          ; 0x1d907 $D8F7 69 08                   ;
sta      $29                           ; 0x1d909 $D8F9 85 29                   ; Link's Y position
LD8FB                                                                          ;
lda      $2A,x                         ; 0x1d90b $D8FB B5 2A                   ; Enemy Y position
cmp      #$D8                          ; 0x1d90d $D8FD C9 D8                   ;
;BCS when going down to new floor below while on elevator                      ;
bcc      LD91B                         ; 0x1d90f $D8FF 90 1A                   ;
lda      #$70                          ; 0x1d911 $D901 A9 70                   ; A = 70
sta      $4D                           ; 0x1d913 $D903 85 4D                   ; Link's X position (low byte)
lda      #$06                          ; 0x1d915 $D905 A9 06                   ; A = 06
sta      $0735                         ; 0x1d917 $D907 8D 35 07                ;
lda      #$0B                          ; 0x1d91a $D90A A9 0B                   ; A = 0B
sta      $0734                         ; 0x1d91c $D90C 8D 34 07                ;
lda      #$00                          ; 0x1d91f $D90F A9 00                   ; A = 00
sta      $FD                           ; 0x1d921 $D911 85 FD                   ;
sta      $072C                         ; 0x1d923 $D913 8D 2C 07                ; Scrolling Offset Low Byte
lda      #$13                          ; 0x1d926 $D916 A9 13                   ; A = 13
jmp      LE187                         ; 0x1d928 $D918 4C 87 E1                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD91B                                                                          ;
jmp      LDE40                         ; 0x1d92b $D91B 4C 40 DE                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines1_Fairy                                                    ;
lda      $C9                           ; 0x1d92e $D91E A5 C9                   ;
and      #$08                          ; 0x1d930 $D920 29 08                   ; keep bits .... x...
bne      LD931                         ; 0x1d932 $D922 D0 0D                   ;
lda      $81,x                         ; 0x1d934 $D924 B5 81                   ;; Current Animation Frame for Enemys
ora      $07FE                         ; 0x1d936 $D926 0D FE 07                ;
bne      LD931                         ; 0x1d939 $D929 D0 06                   ;
lda      #$C0                          ; 0x1d93b $D92B A9 C0                   ; A = C0
sta      $EC                           ; 0x1d93d $D92D 85 EC                   ; Sound Effects Type 1
inc      $81,x                         ; 0x1d93f $D92F F6 81                   ;; Current Animation Frame for Enemys
LD931                                                                          ;
jsr      LDE40                         ; 0x1d941 $D931 20 40 DE                ;
ldy      $AF,x                         ; 0x1d944 $D934 B4 AF                   ;; Various enemy state variables
bne      LD947                         ; 0x1d946 $D936 D0 0F                   ;
lda      $A8,x                         ; 0x1d948 $D938 B5 A8                   ;; Enemy State
and      #$10                          ; 0x1d94a $D93A 29 10                   ; keep bits ...x ....
beq      LD946                         ; 0x1d94c $D93C F0 08                   ;
inc      $AF,x                         ; 0x1d94e $D93E F6 AF                   ;; Various enemy state variables
inc      $DE                           ; 0x1d950 $D940 E6 DE                   ;;prevent movement/actions, occur when a chat is occuring; Spell Spell modifier (1 = Spell spell active) (and more)	;set to 1 to prevent moving, 0 to allow??
dey                                    ; 0x1d952 $D942 88                      ;
sty      $070D                         ; 0x1d953 $D943 8C 0D 07                ; Life to be added to Life Meter
LD946                                                                          ;
rts                                    ; 0x1d956 $D946 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LD947                                                                          ;
lda      $074B                         ; 0x1d957 $D947 AD 4B 07                ; Spell Flash Counter
ora      #$10                          ; 0x1d95a $D94A 09 10                   ; set bits ...x ....
sta      $074B                         ; 0x1d95c $D94C 8D 4B 07                ;; Spell Flash Counter (bit 7 set = decor flash)
lda      $070D                         ; 0x1d95f $D94F AD 0D 07                ; Life to be added to Life Meter
bne      LD946                         ; 0x1d962 $D952 D0 F2                   ;
sta      $DE                           ; 0x1d964 $D954 85 DE                   ; Spell Spell modifier
jmp      bank7_remove_enemy_or_item    ; 0x1d966 $D956 4C 47 DD                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines1_Red_Jar                                                  ;
jsr      LDE3D                         ; 0x1d969 $D959 20 3D DE                ; Display
lda      $A8,x                         ; 0x1d96c $D95C B5 A8                   ;; Enemy State
and      #$04                          ; 0x1d96e $D95E 29 04                   ; keep bits .... .x..
beq      LD98B                         ; 0x1d970 $D960 F0 29                   ;
lda      $2A,x                         ; 0x1d972 $D962 B5 2A                   ; Enemy Y position
and      #$F0                          ; 0x1d974 $D964 29 F0                   ; keep bits xxxx ....
sta      $2A,x                         ; 0x1d976 $D966 95 2A                   ;; Enemy Y Position
lda      $AF,x                         ; 0x1d978 $D968 B5 AF                   ;; Various enemy state variables
and      #$7F                          ; 0x1d97a $D96A 29 7F                   ; keep bits .xxx xxxx
tay                                    ; 0x1d97c $D96C A8                      ;
lda      #$FF                          ; 0x1d97d $D96D A9 FF                   ; A = FF
cpy      #$0A                          ; 0x1d97f $D96F C0 0A                   ;
bcc      LD977                         ; 0x1d981 $D971 90 04                   ;
cpy      #$0E                          ; 0x1d983 $D973 C0 0E                   ;
bcc      LD988                         ; 0x1d985 $D975 90 11                   ;
LD977                                                                          ;
ldy      $057E,x                       ; 0x1d987 $D977 BC 7E 05                ;; Enemy Y Velocity; Enemy Y Velocity
cpy      #$0E                          ; 0x1d98a $D97A C0 0E                   ;
bcc      LD988                         ; 0x1d98c $D97C 90 0A                   ;
dec      $2A,x                         ; 0x1d98e $D97E D6 2A                   ;; Enemy Y Position
lda      #$F7                          ; 0x1d990 $D980 A9 F7                   ; A = F7
cpy      #$30                          ; 0x1d992 $D982 C0 30                   ;
bcc      LD988                         ; 0x1d994 $D984 90 02                   ;
lda      #$F0                          ; 0x1d996 $D986 A9 F0                   ; A = F0
LD988                                                                          ;
sta      $057E,x                       ; 0x1d998 $D988 9D 7E 05                ;; Enemy Y Velocity; Enemy Y Velocity
LD98B                                                                          ;
inc      $057E,x                       ; 0x1d99b $D98B FE 7E 05                ;; Enemy Y Velocity; Enemy Y Velocity
jmp      bank7_Simple_Vertical_Movement; 0x1d99e $D98E 4C C8 DE                ; Simple Vertical Movement
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines1_Locked_Door                                              ;
jsr      LDE40                         ; 0x1d9a1 $D991 20 40 DE                ;
ldy      $AF,x                         ; 0x1d9a4 $D994 B4 AF                   ;; Various enemy state variables
beq      bank7_link_door_collision_maybe; 0x1d9a6 $D996 F0 22                  ;
inc      $AF,x                         ; 0x1d9a8 $D998 F6 AF                   ;; Various enemy state variables
cpy      #$11                          ; 0x1d9aa $D99A C0 11                   ;
bne      LD9FD                         ; 0x1d9ac $D99C D0 5F                   ;
lda      #$F0                          ; 0x1d9ae $D99E A9 F0                   ; A = F0
sta      $87                           ; 0x1d9b0 $D9A0 85 87                   ; Projectile Type
lda      $4E,x                         ; 0x1d9b2 $D9A2 B5 4E                   ; Enemy X position (low byte)
sta      $54                           ; 0x1d9b4 $D9A4 85 54                   ; Projectile X Position (low byte)
lda      $3C,x                         ; 0x1d9b6 $D9A6 B5 3C                   ; Enemy X position (high byte)
sta      $42                           ; 0x1d9b8 $D9A8 85 42                   ; Projectile X Position (high byte)
lda      #$AC                          ; 0x1d9ba $D9AA A9 AC                   ; A = AC
sta      $30                           ; 0x1d9bc $D9AC 85 30                   ; Projectile Y Position
lda      #$01                          ; 0x1d9be $D9AE A9 01                   ; A = 01
sta      $20                           ; 0x1d9c0 $D9B0 85 20                   ; Enemy Condition
sta      $EF                           ; 0x1d9c2 $D9B2 85 EF                   ; Sound Effects Type 4
lsr                                    ; 0x1d9c4 $D9B4 4A                      ;
sta      $DE                           ; 0x1d9c5 $D9B5 85 DE                   ; Spell Spell modifier
jmp      bank7_remove_enemy_or_item    ; 0x1d9c7 $D9B7 4C 47 DD                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_link_door_collision_maybe                                                ;
lda      $A8,x                         ; 0x1d9ca $D9BA B5 A8                   ;; Enemy State
and      #$10                          ; 0x1d9cc $D9BC 29 10                   ; keep bits ...x ....
sta      $05E7                         ; 0x1d9ce $D9BE 8D E7 05                ;
beq      LD9FD                         ; 0x1d9d1 $D9C1 F0 3A                   ;
lda      $13                           ; 0x1d9d3 $D9C3 A5 13                   ;; Fairy state (0 = Not in Fairy state)	faery, flip from 8=faery,0=link (set $076F to 0, then set $13 to 0)	setting 76F to ff, changes 76F to 3B which prevents changing $13 from 8 to 0
bne      LD9D0                         ; 0x1d9d5 $D9C5 D0 09                   ;
lda      #$00                          ; 0x1d9d7 $D9C7 A9 00                   ; A = 00
sta      $05                           ; 0x1d9d9 $D9C9 85 05                   ;
sta      $0B                           ; 0x1d9db $D9CB 85 0B                   ;
jsr      bank7_code37                  ; 0x1d9dd $D9CD 20 71 E3                ;
LD9D0                                                                          ;
jsr      bank7_Determine_Enemy_Facing_Direction_relative_to_Link; 0x1d9e0 $D9D0 20 91 DC; Determine Enemy Facing Direction
iny                                    ; 0x1d9e3 $D9D3 C8                      ;
tya                                    ; 0x1d9e4 $D9D4 98                      ;
eor      #$03                          ; 0x1d9e5 $D9D5 49 03                   ; flip bits .... ..xx
sta      $05E7                         ; 0x1d9e7 $D9D7 8D E7 05                ;
lda      $078C                         ; 0x1d9ea $D9DA AD 8C 07                ; Have Magic Key
bne      LD9E7                         ; 0x1d9ed $D9DD D0 08                   ;
lda      $0793                         ; 0x1d9ef $D9DF AD 93 07                ; Current number of keys
beq      LD9FD                         ; 0x1d9f2 $D9E2 F0 19                   ;
dec      $0793                         ; 0x1d9f4 $D9E4 CE 93 07                ;; Keys (00-09); Current number of Keys
LD9E7                                                                          ;
lda      $3C,x                         ; 0x1d9f7 $D9E7 B5 3C                   ;; Enemy X Position (high byte)
tax                                    ; 0x1d9f9 $D9E9 AA                      ;
jsr      Set_Item_RAM_bit_to_0__Bits_0_3; 0x1d9fa $D9EA 20 95 C2               ;
ldx      $10                           ; 0x1d9fd $D9ED A6 10                   ;; used as monster x register ;draw boss hp bar
lda      #$80                          ; 0x1d9ff $D9EF A9 80                   ; A = 80
sta      $EC                           ; 0x1da01 $D9F1 85 EC                   ; Sound Effects Type 1
sta      $DE                           ; 0x1da03 $D9F3 85 DE                   ; Spell Spell modifier
asl                                    ; 0x1da05 $D9F5 0A                      ; A >> 0
sta      $70                           ; 0x1da06 $D9F6 85 70                   ; Link's X Velocity
sta      $057D                         ; 0x1da08 $D9F8 8D 7D 05                ; Link's Y Velocity
inc      $AF,x                         ; 0x1da0b $D9FB F6 AF                   ;; Various enemy state variables
LD9FD                                                                          ;
rts                                    ; 0x1da0d $D9FD 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Table_for_Bot                                                            ;
.byt    $10,$F0                        ; 0x1da0e $D9FE 10 F0                   ;10 = X velocity while jumping, facing right	;F0 = X velocity while jumping, facing left
LDA00                                                                          ;
.byt    $C0,$40                        ; 0x1da10 $DA00 C0 40                   ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Stops_when_Hit                                                     ;
lda      $040E,x                       ; 0x1da12 $DA02 BD 0E 04                ;; Enemy Hit State (0 = not in Hit State)	;	causes flashing
beq      LD9FD                         ; 0x1da15 $DA05 F0 F6                   ; if 0, return...
pla                                    ; 0x1da17 $DA07 68                      ;
pla                                    ; 0x1da18 $DA08 68                      ;
jmp      LDE40                         ; 0x1da19 $DA09 4C 40 DE                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines1_Bot                                                      ;
jsr      bank7_Enemy_Stops_when_Hit    ; 0x1da1c $DA0C 20 02 DA                ; Enemy Stops when Hit
lda      $A8,x                         ; 0x1da1f $DA0F B5 A8                   ; Enemy state ?
and      #$04                          ; 0x1da21 $DA11 29 04                   ;;Keep Bits:0000_0100
beq      LDA28                         ; 0x1da23 $DA13 F0 13                   ;
lda      $051B,x                       ; 0x1da25 $DA15 BD 1B 05                ; Randomizer
asl                                    ; 0x1da28 $DA18 0A                      ; 1 : 128
bne      LDA28                         ; 0x1da29 $DA19 D0 0D                   ;
lda      #$E5                          ; 0x1da2b $DA1B A9 E5                   ; Bot's initial Y velocity when jumping
sta      $057E,x                       ; 0x1da2d $DA1D 9D 7E 05                ;; Enemy Y Velocity; Enemy Y Velocity
jsr      bank7_Determine_Enemy_Facing_Direction_relative_to_Link; 0x1da30 $DA20 20 91 DC; Determine Enemy Facing Direction; Determine Enemy Facing Direction
lda      bank7_Table_for_Bot,y         ; 0x1da33 $DA23 B9 FE D9                ; refer to table at $1D9FE
sta      $71,x                         ; 0x1da36 $DA26 95 71                   ;; Enemy X Velocity
LDA28                                                                          ;
jmp      bank7_Enemy_Routines1_Myu     ; 0x1da38 $DA28 4C 47 DA                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines1_Bit                                                      ;
jsr      bank7_Enemy_Stops_when_Hit    ; 0x1da3b $DA2B 20 02 DA                ; Enemy Stops when Hit
txa                                    ; 0x1da3e $DA2E 8A                      ;
asl                                    ; 0x1da3f $DA2F 0A                      ;
asl                                    ; 0x1da40 $DA30 0A                      ;
asl                                    ; 0x1da41 $DA31 0A                      ;
asl                                    ; 0x1da42 $DA32 0A                      ;
asl                                    ; 0x1da43 $DA33 0A                      ;
ora      $12                           ; 0x1da44 $DA34 05 12                   ;; Frame Counter (ascending)
cmp      #$C0                          ; 0x1da46 $DA36 C9 C0                   ; affects Bit's movement (slow vs fast)
bcc      bank7_Enemy_Routines1_Myu     ; 0x1da48 $DA38 90 0D                   ;
lda      #$40                          ; 0x1da4a $DA3A A9 40                   ; Bit/Bot fast movement, facing right
sta      $05DA                         ; 0x1da4c $DA3C 8D DA 05                ;
lda      #$C0                          ; 0x1da4f $DA3F A9 C0                   ; Bit/Bot fast movement, facing left
sta      $05DB                         ; 0x1da51 $DA41 8D DB 05                ;
jmp      LDA54                         ; 0x1da54 $DA44 4C 54 DA                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines1_Myu                                                      ;
jsr      bank7_Enemy_Stops_when_Hit    ; 0x1da57 $DA47 20 02 DA                ; Enemy Stops when Hit
lda      #$20                          ; 0x1da5a $DA4A A9 20                   ; Bit/Bot slow movement, facing right
sta      $05DA                         ; 0x1da5c $DA4C 8D DA 05                ;
lda      #$E0                          ; 0x1da5f $DA4F A9 E0                   ; Bit/Bot slow movement, facing left
sta      $05DB                         ; 0x1da61 $DA51 8D DB 05                ;
LDA54                                                                          ;
jsr      bank7_Gravity                 ; 0x1da64 $DA54 20 BE DE                ; Gravity
jsr      LDE3D                         ; 0x1da67 $DA57 20 3D DE                ; Display
jsr      bank7_Link_Collision_Detection; 0x1da6a $DA5A 20 C1 D6                ; Link Collision Detection
lda      $2A,x                         ; 0x1da6d $DA5D B5 2A                   ; Enemy Y Position
cmp      #$60                          ; 0x1da6f $DA5F C9 60                   ;
bcc      LDA69                         ; 0x1da71 $DA61 90 06                   ;
lda      $A8,x                         ; 0x1da73 $DA63 B5 A8                   ;; Enemy State
and      #$04                          ; 0x1da75 $DA65 29 04                   ; keep bits .... .x..
bne      LDA72                         ; 0x1da77 $DA67 D0 09                   ;
LDA69                                                                          ;
lda      $A8,x                         ; 0x1da79 $DA69 B5 A8                   ;; Enemy State
and      #$03                          ; 0x1da7b $DA6B 29 03                   ; keep bits .... ..xx
bne      LDAC0                         ; 0x1da7d $DA6D D0 51                   ;
jmp      bank7_Simple_Horizontal_Movement; 0x1da7f $DA6F 4C B8 DE              ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDA72                                                                          ;
jsr      bank7_Floor_Y_Position        ; 0x1da82 $DA72 20 C1 DA                ; Floor Enemy Y Position
lda      $AF,x                         ; 0x1da85 $DA75 B5 AF                   ;; Various enemy state variables
beq      LDA7D                         ; 0x1da87 $DA77 F0 04                   ;
sta      $81,x                         ; 0x1da89 $DA79 95 81                   ;; Current Animation Frame for Enemys
bne      LDAA4                         ; 0x1da8b $DA7B D0 27                   ;
LDA7D                                                                          ;
lda      $0444,x                       ; 0x1da8d $DA7D BD 44 04                ;; Enemy Vulnerability, for example: horsehead and helmethead have =2, which prevents hit-with-sword in body and feet, but not head
pha                                    ; 0x1da90 $DA80 48                      ;
and      #$0C                          ; 0x1da91 $DA81 29 0C                   ; keep bits ... xx..
sta      $81,x                         ; 0x1da93 $DA83 95 81                   ;; Current Animation Frame for Enemys
inc      $0444,x                       ; 0x1da95 $DA85 FE 44 04                ;; Enemy Vulnerability, for example: horsehead and helmethead have =2, which prevents hit-with-sword in body and feet, but not head
pla                                    ; 0x1da98 $DA88 68                      ;
and      #$0F                          ; 0x1da99 $DA89 29 0F                   ; keep bits .... xxxx
cmp      #$0F                          ; 0x1da9b $DA8B C9 0F                   ; delay for pause between slides
beq      LDA93                         ; 0x1da9d $DA8D F0 04                   ; (affects Myu also)
cmp      #$03                          ; 0x1da9f $DA8F C9 03                   ;
bne      LDAA4                         ; 0x1daa1 $DA91 D0 11                   ;
LDA93                                                                          ;
ldy      $0401,x                       ; 0x1daa3 $DA93 BC 01 04                ;
lda      $05DA,y                       ; 0x1daa6 $DA96 B9 DA 05                ;
sta      $71,x                         ; 0x1daa9 $DA99 95 71                   ;; Enemy X Velocity
lda      $A8,x                         ; 0x1daab $DA9B B5 A8                   ;; Enemy State
and      #$03                          ; 0x1daad $DA9D 29 03                   ; keep bits .... ..xx
bne      LDAA4                         ; 0x1daaf $DA9F D0 03                   ;
jsr      bank7_Simple_Horizontal_Movement; 0x1dab1 $DAA1 20 B8 DE              ; Simple Horizontal Movement
LDAA4                                                                          ;
lda      $0504,x                       ; 0x1dab4 $DAA4 BD 04 05                ;; Timer for Enemy
bne      LDAC0                         ; 0x1dab7 $DAA7 D0 17                   ;
lda      $AF,x                         ; 0x1dab9 $DAA9 B5 AF                   ;; Various enemy state variables
eor      #$01                          ; 0x1dabb $DAAB 49 01                   ; flip bits .... ...x
sta      $AF,x                         ; 0x1dabd $DAAD 95 AF                   ;; Various enemy state variables
tay                                    ; 0x1dabf $DAAF A8                      ;
lda      $051B,x                       ; 0x1dac0 $DAB0 BD 1B 05                ; Randomizer
and      #$3F                          ; 0x1dac3 $DAB3 29 3F                   ; keep bits ..xx xxxx
ora      LDA00,y                       ; 0x1dac5 $DAB5 19 00 DA                ; refer to table at $1D9FE (offset +2)
sta      $0504,x                       ; 0x1dac8 $DAB8 9D 04 05                ;; Timer for Enemy
and      #$01                          ; 0x1dacb $DABB 29 01                   ; keep bits .... ...x
sta      $0401,x                       ; 0x1dacd $DABD 9D 01 04                ;
LDAC0                                                                          ;
rts                                    ; 0x1dad0 $DAC0 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Floor_Y_Position                                                         ;
;Floor Enemy Y Position to multiple of 0x10                                    ;
lda      $2A,x                         ; 0x1dad1 $DAC1 B5 2A                   ; Enemy Y Position
and      #$F0                          ; 0x1dad3 $DAC3 29 F0                   ; keep bits xxxx ....
sta      $2A,x                         ; 0x1dad5 $DAC5 95 2A                   ;; Enemy Y Position
;Set Enemy Y Velocity to 0                                                     ;
lda      #$00                          ; 0x1dad7 $DAC7 A9 00                   ; A = 00
sta      $057E,x                       ; 0x1dad9 $DAC9 9D 7E 05                ; Enemy Y Velocity
rts                                    ; 0x1dadc $DACC 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_table_for_Moa                                                            ;
.byt    $08,$F8                        ; 0x1dadd $DACD 08 F8                   ;08 = Moa's Y velocity when going down	;F8 = Moa's Y velocity when going up
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines1_Moa                                                      ;
jsr      bank7_Enemy_Stops_when_Hit    ; 0x1dadf $DACF 20 02 DA                ; Enemy Stops when Hit
jsr      LDE54                         ; 0x1dae2 $DAD2 20 54 DE                ;
lda      $0706                         ; 0x1dae5 $DAD5 AD 06 07                ; Current Region
cmp      #$02                          ; 0x1dae8 $DAD8 C9 02                   ; check if Region is 02 (East Hyrule)
bne      LDAE1                         ; 0x1daea $DADA D0 05                   ;
lda      $078A                         ; 0x1daec $DADC AD 8A 07                ; Have Cross ?
beq      LDAE4                         ; 0x1daef $DADF F0 03                   ; if NOT, skip display routine
LDAE1                                                                          ;
jsr      bank7_Display                 ; 0x1daf1 $DAE1 20 11 EF                ; Display
LDAE4                                                                          ;
jsr      bank7_Link_Collision_Detection; 0x1daf4 $DAE4 20 C1 D6                ; Link Collision Detection
jsr      bank7_Determine_Enemy_Facing_Direction_relative_to_Link; 0x1daf7 $DAE7 20 91 DC; Determine Enemy Facing Direction
lda      $71,x                         ; 0x1dafa $DAEA B5 71                   ; Enemy X Velocity
pha                                    ; 0x1dafc $DAEC 48                      ;
adc      $70                           ; 0x1dafd $DAED 65 70                   ; Link's X Velocity
adc      bank7_table_for_Moa,y         ; 0x1daff $DAEF 79 CD DA                ;
sta      $71,x                         ; 0x1db02 $DAF2 95 71                   ;; Enemy X Velocity
jsr      bank7_Simple_Horizontal_Movement; 0x1db04 $DAF4 20 B8 DE              ; Simple Horizontal Movement
pla                                    ; 0x1db07 $DAF7 68                      ;
sta      $71,x                         ; 0x1db08 $DAF8 95 71                   ;; Enemy X Velocity
ldy      #$02                          ; 0x1db0a $DAFA A0 02                   ; Y = 02
asl                                    ; 0x1db0c $DAFC 0A                      ;
bcs      LDB00                         ; 0x1db0d $DAFD B0 01                   ;
dey                                    ; 0x1db0f $DAFF 88                      ;
LDB00                                                                          ;
sty      $60,x                         ; 0x1db10 $DB00 94 60                   ;; Enemy facing direction
lda      $AF,x                         ; 0x1db12 $DB02 B5 AF                   ;; Various enemy state variables
bne      LDB2D                         ; 0x1db14 $DB04 D0 27                   ;
lda      $0504,x                       ; 0x1db16 $DB06 BD 04 05                ;; Timer for Enemy
bne      LDB2C                         ; 0x1db19 $DB09 D0 21                   ;
inc      $AF,x                         ; 0x1db1b $DB0B F6 AF                   ;; Various enemy state variables
lda      $051B,x                       ; 0x1db1d $DB0D BD 1B 05                ; Randomizer
and      #$01                          ; 0x1db20 $DB10 29 01                   ; keep bits .... ...x
tay                                    ; 0x1db22 $DB12 A8                      ;
lda      $2A,x                         ; 0x1db23 $DB13 B5 2A                   ; Enemy Y Position
cmp      #$40                          ; 0x1db25 $DB15 C9 40                   ;
bcs      LDB1B                         ; 0x1db27 $DB17 B0 02                   ;
ldy      #$00                          ; 0x1db29 $DB19 A0 00                   ; Y = 00 (Moa going down)
LDB1B                                                                          ;
cmp      #$C0                          ; 0x1db2b $DB1B C9 C0                   ;
bcc      LDB21                         ; 0x1db2d $DB1D 90 02                   ;
ldy      #$01                          ; 0x1db2f $DB1F A0 01                   ; Y = 01 (Moa going up)
LDB21                                                                          ;
lda      bank7_table_for_Moa,y         ; 0x1db31 $DB21 B9 CD DA                ;
sta      $057E,x                       ; 0x1db34 $DB24 9D 7E 05                ; Enemy Y Velocity
lda      $60,x                         ; 0x1db37 $DB27 B5 60                   ; Enemy facing direction
sta      $0401,x                       ; 0x1db39 $DB29 9D 01 04                ;
LDB2C                                                                          ;
rts                                    ; 0x1db3c $DB2C 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDB2D                                                                          ;
jsr      bank7_Simple_Vertical_Movement; 0x1db3d $DB2D 20 C8 DE                ; Simple Vertical Movement
ldy      $0401,x                       ; 0x1db40 $DB30 BC 01 04                ;
dey                                    ; 0x1db43 $DB33 88                      ;
beq      bank7_Related_to_Moa          ; 0x1db44 $DB34 F0 09                   ;
inc      $71,x                         ; 0x1db46 $DB36 F6 71                   ; * double the increase for more speed *
lda      $71,x                         ; 0x1db48 $DB38 B5 71                   ; Enemy X Velocity
cmp      #$20                          ; 0x1db4a $DB3A C9 20                   ; velocity for changing X direction (right)
beq      LDB47                         ; 0x1db4c $DB3C F0 09                   ;
rts                                    ; 0x1db4e $DB3E 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Related_to_Moa                                                           ;
dec      $71,x                         ; 0x1db4f $DB3F D6 71                   ; * double the decrease for more speed *
lda      $71,x                         ; 0x1db51 $DB41 B5 71                   ; Enemy X Velocity
cmp      #$E0                          ; 0x1db53 $DB43 C9 E0                   ; velocity for changing X direction (left)
bne      LDB4E                         ; 0x1db55 $DB45 D0 07                   ;
LDB47                                                                          ;
dec      $AF,x                         ; 0x1db57 $DB47 D6 AF                   ;; Various enemy state variables
lda      #$20                          ; 0x1db59 $DB49 A9 20                   ; A = 20
sta      $0504,x                       ; 0x1db5b $DB4B 9D 04 05                ;; Timer for Enemy
LDB4E                                                                          ;
rts                                    ; 0x1db5e $DB4E 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Table_for_Ache_Acheman_and_many_others                                   ;
;38 C8 = good speed for challenge                                              ;
;                                                                              ;
;F8 = X Velocity, flying left                                                  ;
;08 = X Velocity, flying right                                                 ;
;20 = X Velocity of Flame, facing right                                        ;
;E0 = X Velocity of Flame, facing left                                         ;
.byt    $F8                            ; 0x1db5f $DB4F F8                      ;
LDB50                                                                          ;
.byt    $08,$20,$E0                    ; 0x1db60 $DB50 08 20 E0                ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines1_Ache_and_Acheman                                         ;
jsr      bank7_Enemy_Stops_when_Hit    ; 0x1db63 $DB53 20 02 DA                ; Enemy Stops when Hit
lda      $A1,x                         ; 0x1db66 $DB56 B5 A1                   ; Enemy Code
cmp      #$0A                          ; 0x1db68 $DB58 C9 0A                   ; 0A = Acheman
bne      bank7_Ache                    ; 0x1db6a $DB5A D0 1D                   ;
lda      $AF,x                         ; 0x1db6c $DB5C B5 AF                   ;; Various enemy state variables
beq      bank7_Ache                    ; 0x1db6e $DB5E F0 19                   ;
dec      $AF,x                         ; 0x1db70 $DB60 D6 AF                   ;; Various enemy state variables
cmp      #$18                          ; 0x1db72 $DB62 C9 18                   ; delay before flying back
bne      bank7_Go_on___                ; 0x1db74 $DB64 D0 0D                   ;
bank7_Spawn_Flame                                                              ;
jsr      bank7_Spawn_New_Projectile    ; 0x1db76 $DB66 20 CE DB                ; Spawn New Projectile
bcs      bank7_Go_on___                ; 0x1db79 $DB69 B0 08                   ; Carry Set = max number of projectiles reached
lda      $30,y                         ; 0x1db7b $DB6B B9 30 00                ; Projectile Y Position
adc      #$02                          ; 0x1db7e $DB6E 69 02                   ; 02 = relative Y position of Flame
sta      $30,y                         ; 0x1db80 $DB70 99 30 00                ; ** can be randomized! 02 or 12 **
bank7_Go_on___                                                                 ;
jsr      bank7_Determine_Enemy_Facing_Direction_relative_to_Link; 0x1db83 $DB73 20 91 DC; Determine Enemy Facing Direction
jmp      LDBC8                         ; 0x1db86 $DB76 4C C8 DB                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Ache                                                                     ;
lda      $81,x                         ; 0x1db89 $DB79 B5 81                   ;; Current Animation Frame for Enemys
bne      LDBA8                         ; 0x1db8b $DB7B D0 2B                   ;
ldy      $3C,x                         ; 0x1db8d $DB7D B4 3C                   ;; Enemy X Position (high byte)
dey                                    ; 0x1db8f $DB7F 88                      ;
cpy      #$02                          ; 0x1db90 $DB80 C0 02                   ;
bcc      bank7_Ache_Acheman1           ; 0x1db92 $DB82 90 07                   ;
tya                                    ; 0x1db94 $DB84 98                      ;
and      #$01                          ; 0x1db95 $DB85 29 01                   ; keep bits .... ...x
tay                                    ; 0x1db97 $DB87 A8                      ;
jmp      LDB9C                         ; 0x1db98 $DB88 4C 9C DB                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Ache_Acheman1                                                            ;
jsr      bank7_Determine_Enemy_Facing_Direction_relative_to_Link; 0x1db9b $DB8B 20 91 DC; Determine Enemy Facing Direction
lda      $0F                           ; 0x1db9e $DB8E A5 0F                   ;
adc      #$20                          ; 0x1dba0 $DB90 69 20                   ; 30 and 60 work, reaction distance increased
cmp      #$40                          ; 0x1dba2 $DB92 C9 40                   ; 40 and 80 work, too
bcs      LDBC8                         ; 0x1dba4 $DB94 B0 32                   ;
lda      $051B,x                       ; 0x1dba6 $DB96 BD 1B 05                ; Randomizer
and      #$01                          ; 0x1dba9 $DB99 29 01                   ; keep bits .... ...x
tay                                    ; 0x1dbab $DB9B A8                      ; fly down direction (random 0-1)
LDB9C                                                                          ;
lda      bank7_Table_for_Ache_Acheman_and_many_others,y; 0x1dbac $DB9C B9 4F DB;
sta      $71,x                         ; 0x1dbaf $DB9F 95 71                   ; Enemy X Velocity
inc      $81,x                         ; 0x1dbb1 $DBA1 F6 81                   ; Current Animation Frame for Enemy
lda      #$40                          ; 0x1dbb3 $DBA3 A9 40                   ; A = 40; A = 5C
sta      $057E,x                       ; 0x1dbb5 $DBA5 9D 7E 05                ; initial Y velocity for Ache/Acheman
LDBA8                                                                          ;
jsr      bank7_Simple_Horizontal_Movement; 0x1dbb8 $DBA8 20 B8 DE              ; Simple Horizontal Movement
dec      $057E,x                       ; 0x1dbbb $DBAB DE 7E 05                ; Enemy Y Velocity
bne      LDBB4                         ; 0x1dbbe $DBAE D0 04                   ;
lda      #$30                          ; 0x1dbc0 $DBB0 A9 30                   ; A = 30
sta      $AF,x                         ; 0x1dbc2 $DBB2 95 AF                   ; delay for Acheman in dragon form
LDBB4                                                                          ;
jsr      bank7_Simple_Vertical_Movement; 0x1dbc4 $DBB4 20 C8 DE                ; Simple Vertical Movement
lda      $2A,x                         ; 0x1dbc7 $DBB7 B5 2A                   ; Enemy Y Position
cmp      #$30                          ; 0x1dbc9 $DBB9 C9 30                   ;
bcs      LDBC8                         ; 0x1dbcb $DBBB B0 0B                   ;
lda      #$30                          ; 0x1dbcd $DBBD A9 30                   ; A = 30
sta      $2A,x                         ; 0x1dbcf $DBBF 95 2A                   ; Enemy Y Position
lda      #$00                          ; 0x1dbd1 $DBC1 A9 00                   ; A = 00
sta      $057E,x                       ; 0x1dbd3 $DBC3 9D 7E 05                ; Enemy Y Velocity
sta      $81,x                         ; 0x1dbd6 $DBC6 95 81                   ; Current Animation Frame for Enemy
LDBC8                                                                          ;
jsr      LDE40                         ; 0x1dbd8 $DBC8 20 40 DE                ;
jmp      bank7_Link_Collision_Detection; 0x1dbdb $DBCB 4C C1 D6                ; Link Collision Detection
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Spawn_New_Projectile                                                     ;
ldy      #$05                          ; 0x1dbde $DBCE A0 05                   ; Y = 05
jsr      LDBFD                         ; 0x1dbe0 $DBD0 20 FD DB                ;
bcs      LDBF8                         ; 0x1dbe3 $DBD3 B0 23                   ; Carry Set = No Projectile Slot Available
lda      #$04                          ; 0x1dbe5 $DBD5 A9 04                   ; A = 04
sta      $87,y                         ; 0x1dbe7 $DBD7 99 87 00                ; Projectile Type (04 = Flame)
lda      $4E,x                         ; 0x1dbea $DBDA B5 4E                   ; Enemy X position (low byte)
sta      $54,y                         ; 0x1dbec $DBDC 99 54 00                ; Projectile X Position (low byte)
lda      $3C,x                         ; 0x1dbef $DBDF B5 3C                   ; Enemy X position (high byte)
sta      $42,y                         ; 0x1dbf1 $DBE1 99 42 00                ; Projectile X Position (high byte)
lda      $2A,x                         ; 0x1dbf4 $DBE4 B5 2A                   ; Enemy Y Position
sta      $30,y                         ; 0x1dbf6 $DBE6 99 30 00                ; Projectile Y Position
lda      $60,x                         ; 0x1dbf9 $DBE9 B5 60                   ; Enemy facing direction
sta      $66,y                         ; 0x1dbfb $DBEB 99 66 00                ; Projectile facing direction
tax                                    ; 0x1dbfe $DBEE AA                      ;
lda      LDB50,x                       ; 0x1dbff $DBEF BD 50 DB                ;
sta      $77,y                         ; 0x1dc02 $DBF2 99 77 00                ; Projectile X Velocity
ldx      $10                           ; 0x1dc05 $DBF5 A6 10                   ;; used as monster x register ;draw boss hp bar
clc                                    ; 0x1dc07 $DBF7 18                      ;
LDBF8                                                                          ;
rts                                    ; 0x1dc08 $DBF8 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Table_for_Generated_Rock_X_Velocity                                      ;
.byt    $10,$F0                        ; 0x1dc09 $DBF9 10 F0                   ;
; ---------------------------------------------------------------------------- ;
bank7_spawn_new_bubble_or_rock                                                 ;
ldy      #$03                          ; 0x1dc0b $DBFB A0 03                   ; Y = 03
LDBFD                                                                          ;
lda      $87,y                         ; 0x1dc0d $DBFD B9 87 00                ; Projectile Type
beq      bank7_Related_to_Desert_Rocks__Raising_Bubbles__projectiles__etc; 0x1dc10 $DC00 F0 05;
dey                                    ; 0x1dc12 $DC02 88                      ;
bpl      LDBFD                         ; 0x1dc13 $DC03 10 F8                   ;
sec                                    ; 0x1dc15 $DC05 38                      ;
rts                                    ; 0x1dc16 $DC06 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Related_to_Desert_Rocks__Raising_Bubbles__projectiles__etc               ;
lda      #$01                          ; 0x1dc17 $DC07 A9 01                   ; A = 01
sta      $20,y                         ; 0x1dc19 $DC09 99 20 00                ;
sta      $66,y                         ; 0x1dc1c $DC0C 99 66 00                ;
lsr                                    ; 0x1dc1f $DC0F 4A                      ; A >> 00
sta      $0584,y                       ; 0x1dc20 $DC10 99 84 05                ;
clc                                    ; 0x1dc23 $DC13 18                      ;
rts                                    ; 0x1dc24 $DC14 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines1_Raising_Bubbles                                          ;
inc      $AF,x                         ; 0x1dc25 $DC15 F6 AF                   ;; Various enemy state variables
lda      $AF,x                         ; 0x1dc27 $DC17 B5 AF                   ;; Various enemy state variables
and      #$1F                          ; 0x1dc29 $DC19 29 1F                   ; 1F = delay before next bubble appears
bne      LDC44                         ; 0x1dc2b $DC1B D0 27                   ;
jsr      bank7_spawn_new_bubble_or_rock; 0x1dc2d $DC1D 20 FB DB                ; spawn new bubble
bcs      LDC44                         ; 0x1dc30 $DC20 B0 22                   ; Carry Set = max number of bubbles reached
lda      #$02                          ; 0x1dc32 $DC22 A9 02                   ; 02 = bubble
sta      $87,y                         ; 0x1dc34 $DC24 99 87 00                ; projectile type
lda      $072C                         ; 0x1dc37 $DC27 AD 2C 07                ; Scrolling Offset Low Byte
adc      $051B,x                       ; 0x1dc3a $DC2A 7D 1B 05                ; Randomizer
and      #$F0                          ; 0x1dc3d $DC2D 29 F0                   ; keep bits xxxx ....
sta      $54,y                         ; 0x1dc3f $DC2F 99 54 00                ;
lda      $072A                         ; 0x1dc42 $DC32 AD 2A 07                ; Scrolling Offset High Byte
adc      #$00                          ; 0x1dc45 $DC35 69 00                   ;
sta      $42,y                         ; 0x1dc47 $DC37 99 42 00                ;
lda      #$E0                          ; 0x1dc4a $DC3A A9 E0                   ; A = E0
sta      $30,y                         ; 0x1dc4c $DC3C 99 30 00                ; Initial Y position
lda      #$E4                          ; 0x1dc4f $DC3F A9 E4                   ; A = E4
sta      $0584,y                       ; 0x1dc51 $DC41 99 84 05                ; Initial Y velocity
LDC44                                                                          ;
rts                                    ; 0x1dc54 $DC44 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Table_for_Rocks_possible_X_Positions_                                    ;
.byt    $0C,$F4                        ; 0x1dc55 $DC45 0C F4                   ;
bank7_Table_for_Rocks_possible_Y_Positions_                                    ;
.byt    $03,$13,$F3,$E3,$D3,$C3,$03,$13; 0x1dc57 $DC47 03 13 F3 E3 D3 C3 03 13 ;
; ---------------------------------------------------------------------------- ;
bank7_Desert_Rocks_initialization_routine                                      ;
lda      $12                           ; 0x1dc5f $DC4F A5 12                   ;; Frame Counter (ascending)
and      #$1F                          ; 0x1dc61 $DC51 29 1F                   ; 1F = delay before next rock appears
bne      LDC90                         ; 0x1dc63 $DC53 D0 3B                   ;
jsr      bank7_spawn_new_bubble_or_rock; 0x1dc65 $DC55 20 FB DB                ; spawn new rock
bcs      LDC90                         ; 0x1dc68 $DC58 B0 36                   ;
lda      $051B,x                       ; 0x1dc6a $DC5A BD 1B 05                ; Randomizer
and      #$07                          ; 0x1dc6d $DC5D 29 07                   ; keep bits .... .xxx
tax                                    ; 0x1dc6f $DC5F AA                      ;
lda      $29                           ; 0x1dc70 $DC60 A5 29                   ; Link's Y Position
adc      bank7_Table_for_Rocks_possible_Y_Positions_,x; 0x1dc72 $DC62 7D 47 DC ;
sta      $30,y                         ; 0x1dc75 $DC65 99 30 00                ;
txa                                    ; 0x1dc78 $DC68 8A                      ;
and      #$01                          ; 0x1dc79 $DC69 29 01                   ; keep bits .... ...x
sta      $044C,y                       ; 0x1dc7b $DC6B 99 4C 04                ;
tax                                    ; 0x1dc7e $DC6E AA                      ;
lda      $072C                         ; 0x1dc7f $DC6F AD 2C 07                ;; Scrolling Offset Low Byte
adc      bank7_Table_for_Rocks_possible_X_Positions_,x; 0x1dc82 $DC72 7D 45 DC ;
sta      $54,y                         ; 0x1dc85 $DC75 99 54 00                ; Rock's X Position (low byte)
lda      $072A                         ; 0x1dc88 $DC78 AD 2A 07                ;;link Pagepos SideScroll		; Scrolling Offset High Byte
adc      #$00                          ; 0x1dc8b $DC7B 69 00                   ;
sta      $42,y                         ; 0x1dc8d $DC7D 99 42 00                ; Rock's X Position (high byte)
lda      bank7_Table_for_Generated_Rock_X_Velocity,x; 0x1dc90 $DC80 BD F9 DB   ;
sta      $77,y                         ; 0x1dc93 $DC83 99 77 00                ; Rock's X Velocity
inx                                    ; 0x1dc96 $DC86 E8                      ;
stx      $66,y                         ; 0x1dc97 $DC87 96 66                   ;
ldx      $10                           ; 0x1dc99 $DC89 A6 10                   ;; used as monster x register ;draw boss hp bar
lda      #$01                          ; 0x1dc9b $DC8B A9 01                   ; A = 01
sta      $87,y                         ; 0x1dc9d $DC8D 99 87 00                ;
LDC90                                                                          ;
rts                                    ; 0x1dca0 $DC90 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Determine_Enemy_Facing_Direction_relative_to_Link                        ;
ldy      #$01                          ; 0x1dca1 $DC91 A0 01                   ; Y = 01
lda      $4D                           ; 0x1dca3 $DC93 A5 4D                   ; Link's Current X position (low byte)
adc      #$08                          ; 0x1dca5 $DC95 69 08                   ;
pha                                    ; 0x1dca7 $DC97 48                      ;
lda      $3B                           ; 0x1dca8 $DC98 A5 3B                   ; Link's Current X position (high byte)
adc      #$00                          ; 0x1dcaa $DC9A 69 00                   ;
sta      L000E                         ; 0x1dcac $DC9C 85 0E                   ;
pla                                    ; 0x1dcae $DC9E 68                      ;
sbc      $4E,x                         ; 0x1dcaf $DC9F F5 4E                   ; Enemy X position (low byte)
sta      $0F                           ; 0x1dcb1 $DCA1 85 0F                   ;
lda      L000E                         ; 0x1dcb3 $DCA3 A5 0E                   ;
sbc      $3C,x                         ; 0x1dcb5 $DCA5 F5 3C                   ; Enemy X position (high byte)
bpl      LDCAA                         ; 0x1dcb7 $DCA7 10 01                   ;
iny                                    ; 0x1dcb9 $DCA9 C8                      ;
LDCAA                                                                          ;
sty      $60,x                         ; 0x1dcba $DCAA 94 60                   ;facing dir
dey                                    ; 0x1dcbc $DCAC 88                      ;
rts                                    ; 0x1dcbd $DCAD 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDCAE                                                                          ;
lda      $0504,x                       ; 0x1dcbe $DCAE BD 04 05                ;; Timer for Enemy
bne      LDCC2                         ; 0x1dcc1 $DCB1 D0 0F                   ;
lda      #$20                          ; 0x1dcc3 $DCB3 A9 20                   ; A = 20
ldy      $0414,x                       ; 0x1dcc5 $DCB5 BC 14 04                ;
bpl      LDCBC                         ; 0x1dcc8 $DCB8 10 02                   ;
lda      #$00                          ; 0x1dcca $DCBA A9 00                   ; A = 00
LDCBC                                                                          ;
sta      $0504,x                       ; 0x1dccc $DCBC 9D 04 05                ;; Timer for Enemy
inc      $B6,x                         ; 0x1dccf $DCBF F6 B6                   ; Generated Enemy Slot
rts                                    ; 0x1dcd1 $DCC1 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDCC2                                                                          ;
ldy      $A1,x                         ; 0x1dcd2 $DCC2 B4 A1                   ; Enemy Code
lda      $6E1D,y                       ; 0x1dcd4 $DCC4 B9 1D 6E                ;
ldy      $0504,x                       ; 0x1dcd7 $DCC7 BC 04 05                ;; Timer for Enemy
cmp      #$FF                          ; 0x1dcda $DCCA C9 FF                   ;
beq      bank7_code29                  ; 0x1dcdc $DCCC F0 0D                   ;
jmp      LEEB2                         ; 0x1dcde $DCCE 4C B2 EE                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_table17                                                                  ;
.byt    $08,$F8                        ; 0x1dce1 $DCD1 08 F8                   ;
LDCD3                                                                          ;
.byt    $3F,$18,$04,$0F,$0F,$0F,$0F,$FF; 0x1dce3 $DCD3 3F 18 04 0F 0F 0F 0F FF ;
; ---------------------------------------------------------------------------- ;
bank7_code29                                                                   ;
cpy      #$68                          ; 0x1dceb $DCDB C0 68                   ;
bne      LDCED                         ; 0x1dced $DCDD D0 0E                   ;
lda      #$E8                          ; 0x1dcef $DCDF A9 E8                   ; A = E8
sta      $074B                         ; 0x1dcf1 $DCE1 8D 4B 07                ;; Spell Flash Counter (bit 7 set = decor flash)
lda      #$0F                          ; 0x1dcf4 $DCE4 A9 0F                   ; A = 0F
sta      $0725                         ; 0x1dcf6 $DCE6 8D 25 07                ;; PPU Macro Selector	
lda      #$80                          ; 0x1dcf9 $DCE9 A9 80                   ; A = 80
sta      $EC                           ; 0x1dcfb $DCEB 85 EC                   ; Sound Effects Type 1
LDCED                                                                          ;
bcc      LDCF5                         ; 0x1dcfd $DCED 90 06                   ;
jsr      bank7_Display                 ; 0x1dcff $DCEF 20 11 EF                ;
jmp      LDD27                         ; 0x1dd02 $DCF2 4C 27 DD                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDCF5                                                                          ;
lda      $29                           ; 0x1dd05 $DCF5 A5 29                   ; Link's Y Position
sta      $2A                           ; 0x1dd07 $DCF7 85 2A                   ;;monster y	2a,2b,2c,2d,2e,2f
jsr      bank7_Determine_Enemy_Facing_Direction_relative_to_Link; 0x1dd09 $DCF9 20 91 DC; Determine Enemy Facing Direction
lda      $CC                           ; 0x1dd0c $DCFC A5 CC                   ;; Link's X Position on Screen; Player X On Screen; Link's X Position on Screen
adc      bank7_table17,y               ; 0x1dd0e $DCFE 79 D1 DC                ;
sta      $CD                           ; 0x1dd11 $DD01 85 CD                   ;
lda      $80                           ; 0x1dd13 $DD03 A5 80                   ;; Controller 1 Last Poll; Current Animation Frame for Link (OW and SS)	;animation frame, powerful: can cause link to attack
sta      $81                           ; 0x1dd15 $DD05 85 81                   ;
lda      $9F                           ; 0x1dd17 $DD07 A5 9F                   ;;link facedir SideScroll		; Direction arrow pressed (1 = right, 2 = left)
sta      $A0                           ; 0x1dd19 $DD09 85 A0                   ;
lda      #$50                          ; 0x1dd1b $DD0B A9 50                   ; A = 50
sta      $91                           ; 0x1dd1d $DD0D 85 91                   ;
lda      #$00                          ; 0x1dd1f $DD0F A9 00                   ; A = 00
sta      $C9                           ; 0x1dd21 $DD11 85 C9                   ;
ldx      #$01                          ; 0x1dd23 $DD13 A2 01                   ; X = 01
stx      $11                           ; 0x1dd25 $DD15 86 11                   ;
inx                                    ; 0x1dd27 $DD17 E8                      ;
stx      $0753                         ; 0x1dd28 $DD18 8E 53 07                ;
jsr      LEC02                         ; 0x1dd2b $DD1B 20 02 EC                ;
ldx      $10                           ; 0x1dd2e $DD1E A6 10                   ;; used as monster x register ;draw boss hp bar
lda      $4E,x                         ; 0x1dd30 $DD20 B5 4E                   ; Enemy X position (low byte)
sbc      $072C                         ; 0x1dd32 $DD22 ED 2C 07                ; Scrolling Offset Low Byte
sta      $CD                           ; 0x1dd35 $DD25 85 CD                   ;
LDD27                                                                          ;
jsr      bank7_FUNCTION_CONVERT_706_and_707_to_Rx5plusW; 0x1dd37 $DD27 20 30 CF; Region Code * 5 + World Code
cmp      #$0F                          ; 0x1dd3a $DD2A C9 0F                   ;
bne      LDD31                         ; 0x1dd3c $DD2C D0 03                   ;
jmp      L9764                         ; 0x1dd3e $DD2E 4C 64 97                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDD31                                                                          ;
jmp      L9A46                         ; 0x1dd41 $DD31 4C 46 9A                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDD34                                                                          ;
ldy      $A1,x                         ; 0x1dd44 $DD34 B4 A1                   ; Enemy Code
lda      $6E41,y                       ; 0x1dd46 $DD36 B9 41 6E                ;
and      #$40                          ; 0x1dd49 $DD39 29 40                   ; keep bits .x.. .... (Regenerate bit)
beq      bank7_remove_enemy_or_item    ; 0x1dd4b $DD3B F0 0A                   ;
LDD3D                                                                          ;
ldy      $BC,x                         ; 0x1dd4d $DD3D B4 BC                   ;; Generated Enemy Y Position ?
bmi      bank7_remove_enemy_or_item    ; 0x1dd4f $DD3F 30 06                   ;
lda      ($D6),y                       ; 0x1dd51 $DD41 B1 D6                   ;
and      #$7F                          ; 0x1dd53 $DD43 29 7F                   ; keep bits .xxx xxxx
sta      ($D6),y                       ; 0x1dd55 $DD45 91 D6                   ;
bank7_remove_enemy_or_item                                                     ;
lda      #$00                          ; 0x1dd57 $DD47 A9 00                   ; A = 00
sta      $B6,x                         ; 0x1dd59 $DD49 95 B6                   ; Generated Enemy Slot
rts                                    ; 0x1dd5b $DD4B 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Table_for_Enemy_Score_Tile_Mapping_Codes                                 ;
;F5 = Nothing                                                                  ;
;A0 = 10                                                                       ;
;A2 = 5                                                                        ;
;A4 = 2                                                                        ;
;A6 = 7                                                                        ;
;60 = 3                                                                        ;
;6C = 15                                                                       ;
;9C = 0                                                                        ;
;9E = 00                                                                       ;
.byt    $F5,$F5,$F5,$F5,$F5,$A4,$60,$A2; 0x1dd5c $DD4C F5 F5 F5 F5 F5 A4 60 A2 ;
.byt    $A6,$A0,$6C,$A4,$60,$A2,$A6,$A0; 0x1dd64 $DD54 A6 A0 6C A4 60 A2 A6 A0 ;
LDD5C                                                                          ;
.byt    $F5,$A4,$60,$A2,$A0,$9C,$9C,$9C; 0x1dd6c $DD5C F5 A4 60 A2 A0 9C 9C 9C ;
.byt    $9C,$9C,$9C,$9E,$9E,$9E,$9E,$9E; 0x1dd74 $DD64 9C 9C 9C 9E 9E 9E 9E 9E ;
; ---------------------------------------------------------------------------- ;
bank7_code30                                                                   ;
lda      $0504,x                       ; 0x1dd7c $DD6C BD 04 05                ;; Timer for Enemy
beq      bank7_monster_death_give_exp  ; 0x1dd7f $DD6F F0 7B                   ;
ldy      $91,x                         ; 0x1dd81 $DD71 B4 91                   ;
lda      $0414,x                       ; 0x1dd83 $DD73 BD 14 04                ;
and      #$0F                          ; 0x1dd86 $DD76 29 0F                   ; keep bits .... xxxx
tax                                    ; 0x1dd88 $DD78 AA                      ;
lda      bank7_Table_for_Enemy_Score_Tile_Mapping_Codes,x; 0x1dd89 $DD79 BD 4C DD;
sta      $0201,y                       ; 0x1dd8c $DD7C 99 01 02                ;
lda      LDD5C,x                       ; 0x1dd8f $DD7F BD 5C DD                ;
ldx      $10                           ; 0x1dd92 $DD82 A6 10                   ;; used as monster x register ;draw boss hp bar
sta      $0205,y                       ; 0x1dd94 $DD84 99 05 02                ;
lda      #$01                          ; 0x1dd97 $DD87 A9 01                   ; A = 01
sta      $0202,y                       ; 0x1dd99 $DD89 99 02 02                ;
sta      $0206,y                       ; 0x1dd9c $DD8C 99 06 02                ;
lda      $12                           ; 0x1dd9f $DD8F A5 12                   ;; Frame Counter (ascending)
lsr                                    ; 0x1dda1 $DD91 4A                      ;
bcc      LDD96                         ; 0x1dda2 $DD92 90 02                   ;
dec      $2A,x                         ; 0x1dda4 $DD94 D6 2A                   ; Enemy Y Position
LDD96                                                                          ;
lda      $2A,x                         ; 0x1dda6 $DD96 B5 2A                   ; Enemy Y Position
sta      $0200,y                       ; 0x1dda8 $DD98 99 00 02                ;
sta      $0204,y                       ; 0x1ddab $DD9B 99 04 02                ;
lda      $CD                           ; 0x1ddae $DD9E A5 CD                   ;
sta      $0203,y                       ; 0x1ddb0 $DDA0 99 03 02                ;
clc                                    ; 0x1ddb3 $DDA3 18                      ;
adc      #$08                          ; 0x1ddb4 $DDA4 69 08                   ;
sta      $0207,y                       ; 0x1ddb6 $DDA6 99 07 02                ;
lda      $C9                           ; 0x1ddb9 $DDA9 A5 C9                   ;
pha                                    ; 0x1ddbb $DDAB 48                      ;
and      #$08                          ; 0x1ddbc $DDAC 29 08                   ; keep bits .... x...
beq      LDDB5                         ; 0x1ddbe $DDAE F0 05                   ;
lda      #$F8                          ; 0x1ddc0 $DDB0 A9 F8                   ; A = F8
sta      $0200,y                       ; 0x1ddc2 $DDB2 99 00 02                ;
LDDB5                                                                          ;
pla                                    ; 0x1ddc5 $DDB5 68                      ;
and      #$04                          ; 0x1ddc6 $DDB6 29 04                   ; keep bits .... .x..
beq      LDDBF                         ; 0x1ddc8 $DDB8 F0 05                   ;
lda      #$F8                          ; 0x1ddca $DDBA A9 F8                   ; A = F8
sta      $0204,y                       ; 0x1ddcc $DDBC 99 04 02                ;
LDDBF                                                                          ;
rts                                    ; 0x1ddcf $DDBF 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Experience_Table_Low_Byte                                                ;
.byt    $00,$02,$03,$05,$0A,$14,$1E,$32; 0x1ddd0 $DDC0 00 02 03 05 0A 14 1E 32 ;
.byt    $46,$64,$96,$C8,$2D,$F4,$BC,$E8; 0x1ddd8 $DDC8 46 64 96 C8 2D F4 BC E8 ;
bank7_Japanese_version_score_table                                             ;
.byt    $00,$01,$02,$05,$0A,$14,$32,$64; 0x1dde0 $DDD0 00 01 02 05 0A 14 32 64 ;
.byt    $C8,$F4,$E8,$D0                ; 0x1dde8 $DDD8 C8 F4 E8 D0             ;
bank7_Experience_Table_High_Byte                                               ;
.byt    $00,$00,$00,$00,$00,$00,$00,$00; 0x1ddec $DDDC 00 00 00 00 00 00 00 00 ;
.byt    $00,$00,$00,$00,$01,$01,$02,$03; 0x1ddf4 $DDE4 00 00 00 00 01 01 02 03 ;
; ---------------------------------------------------------------------------- ;
bank7_monster_death_give_exp                                                   ;
lda      $0414,x                       ; 0x1ddfc $DDEC BD 14 04                ;
bmi      LDE20                         ; 0x1ddff $DDEF 30 2F                   ;
tay                                    ; 0x1de01 $DDF1 A8                      ;
lda      bank7_Experience_Table_Low_Byte,y; 0x1de02 $DDF2 B9 C0 DD             ;
clc                                    ; 0x1de05 $DDF5 18                      ;
adc      $0756                         ; 0x1de06 $DDF6 6D 56 07                ;; Experience to be added (low byte)
sta      $0756                         ; 0x1de09 $DDF9 8D 56 07                ; Experience to be added (low byte)
lda      bank7_Experience_Table_High_Byte,y; 0x1de0c $DDFC B9 DC DD            ;
adc      $0755                         ; 0x1de0f $DDFF 6D 55 07                ;; Experience to be added (high byte)
sta      $0755                         ; 0x1de12 $DE02 8D 55 07                ; Experience to be added (high byte)
ldy      $A1,x                         ; 0x1de15 $DE05 B4 A1                   ; Enemy Code
lda      $6E1D,y                       ; 0x1de17 $DE07 B9 1D 6E                ;
cmp      #$FF                          ; 0x1de1a $DE0A C9 FF                   ;
bne      LDE1D                         ; 0x1de1c $DE0C D0 0F                   ;
;boss (now dead) turns into a key ?                                            ;
lda      #$80                          ; 0x1de1e $DE0E A9 80                   ; A = 80
sta      $4E,x                         ; 0x1de20 $DE10 95 4E                   ; Enemy X position (low byte)
lsr                                    ; 0x1de22 $DE12 4A                      ;
sta      $2A,x                         ; 0x1de23 $DE13 95 2A                   ; Enemy Y Position
jsr      LDE20                         ; 0x1de25 $DE15 20 20 DE                ;
lda      #$08                          ; 0x1de28 $DE18 A9 08                   ; A = 08					;key ID
sta      $AF,x                         ; 0x1de2a $DE1A 95 AF                   ; Various enemy state variables			;store as item ID
rts                                    ; 0x1de2c $DE1C 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDE1D                                                                          ;
jmp      LDD34                         ; 0x1de2d $DE1D 4C 34 DD                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDE20                                                                          ;
jsr      LDD34                         ; 0x1de30 $DE20 20 34 DD                ;
lda      #$02                          ; 0x1de33 $DE23 A9 02                   ; sound of dropped item
sta      $EF                           ; 0x1de35 $DE25 85 EF                   ;; Sound Effects Type 4; Sound Effects Type 4
lda      $048E,x                       ; 0x1de37 $DE27 BD 8E 04                ; (set to any item ID, anything can be dropped)
sta      $AF,x                         ; 0x1de3a $DE2A 95 AF                   ;; Various enemy state variables
lda      #$FF                          ; 0x1de3c $DE2C A9 FF                   ; A = FF
sta      $BC,x                         ; 0x1de3e $DE2E 95 BC                   ;; Generated Enemy Y Position ?
lda      #$01                          ; 0x1de40 $DE30 A9 01                   ; Code for Red Jar (maybe Blue too)
sta      $B6,x                         ; 0x1de42 $DE32 95 B6                   ;; Generated Enemy Slot
sta      $A1,x                         ; 0x1de44 $DE34 95 A1                   ; Takes the defeated enemy's slot
lsr                                    ; 0x1de46 $DE36 4A                      ;
sta      $057E,x                       ; 0x1de47 $DE37 9D 7E 05                ; Enemy Y Velocity
sta      $C2,x                         ; 0x1de4a $DE3A 95 C2                   ; Enemy Current HP
rts                                    ; 0x1de4c $DE3C 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDE3D                                                                          ;
jsr      LEA32                         ; 0x1de4d $DE3D 20 32 EA                ;
LDE40                                                                          ;
ldy      #$01                          ; 0x1de50 $DE40 A0 01                   ; Y = 01
inx                                    ; 0x1de52 $DE42 E8                      ;
jsr      bank7_code51                  ; 0x1de53 $DE43 20 7D F2                ;
ldx      $10                           ; 0x1de56 $DE46 A6 10                   ;; used as monster x register ;draw boss hp bar
lda      $1A,x                         ; 0x1de58 $DE48 B5 1A                   ;
cmp      #$02                          ; 0x1de5a $DE4A C9 02                   ;
bcc      LDE51                         ; 0x1de5c $DE4C 90 03                   ;
jmp      LDD3D                         ; 0x1de5e $DE4E 4C 3D DD                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDE51                                                                          ;
jsr      bank7_Display                 ; 0x1de61 $DE51 20 11 EF                ; Display
LDE54                                                                          ;
lda      $C9                           ; 0x1de64 $DE54 A5 C9                   ;
and      #$FC                          ; 0x1de66 $DE56 29 FC                   ; keep bits xxxx xx..
beq      LDE63                         ; 0x1de68 $DE58 F0 09                   ;
lda      $A8,x                         ; 0x1de6a $DE5A B5 A8                   ; Enemy State
and      #$0F                          ; 0x1de6c $DE5C 29 0F                   ; keep bits .... xxxx
sta      $A8,x                         ; 0x1de6e $DE5E 95 A8                   ; Enemy State
jmp      LDE6C                         ; 0x1de70 $DE60 4C 6C DE                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDE63                                                                          ;
jsr      LE48B                         ; 0x1de73 $DE63 20 8B E4                ;
jsr      bank7_Sword_Hit_Detection_maybe__probably_part_of_it_at_least; 0x1de76 $DE66 20 77 E6; Sword Hit Detection
jmp      LE4D9                         ; 0x1de79 $DE69 4C D9 E4                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDE6C                                                                          ;
lda      $A1,x                         ; 0x1de7c $DE6C B5 A1                   ; Enemy Code
cmp      #$13                          ; 0x1de7e $DE6E C9 13                   ; 13 = Elevator
beq      LDEB7                         ; 0x1de80 $DE70 F0 45                   ;
cmp      #$03                          ; 0x1de82 $DE72 C9 03                   ; 03 = Myu
bcc      LDEB7                         ; 0x1de84 $DE74 90 41                   ;
ldy      #$01                          ; 0x1de86 $DE76 A0 01                   ; Y = 01
sty      $0F                           ; 0x1de88 $DE78 84 0F                   ;
lda      $072C                         ; 0x1de8a $DE7A AD 2C 07                ; Scrolling Offset Low Byte
sec                                    ; 0x1de8d $DE7D 38                      ;
sbc      #$60                          ; 0x1de8e $DE7E E9 60                   ;
sta      $01                           ; 0x1de90 $DE80 85 01                   ;
lda      $072A                         ; 0x1de92 $DE82 AD 2A 07                ; Scrolling Offset High Byte
sbc      $0F                           ; 0x1de95 $DE85 E5 0F                   ;
sta      $00                           ; 0x1de97 $DE87 85 00                   ;
inc      $00                           ; 0x1de99 $DE89 E6 00                   ;
lda      $072D                         ; 0x1de9b $DE8B AD 2D 07                ;
clc                                    ; 0x1de9e $DE8E 18                      ;
adc      #$60                          ; 0x1de9f $DE8F 69 60                   ;
sta      $03                           ; 0x1dea1 $DE91 85 03                   ;
lda      $072B                         ; 0x1dea3 $DE93 AD 2B 07                ;
adc      $0F                           ; 0x1dea6 $DE96 65 0F                   ;
sta      $02                           ; 0x1dea8 $DE98 85 02                   ;
inc      $02                           ; 0x1deaa $DE9A E6 02                   ;
lda      $4E,x                         ; 0x1deac $DE9C B5 4E                   ; Enemy X position (low byte)
cmp      $01                           ; 0x1deae $DE9E C5 01                   ;
ldy      $3C,x                         ; 0x1deb0 $DEA0 B4 3C                   ; Enemy X position (high byte)
iny                                    ; 0x1deb2 $DEA2 C8                      ;
tya                                    ; 0x1deb3 $DEA3 98                      ;
sbc      $00                           ; 0x1deb4 $DEA4 E5 00                   ;
bmi      LDEB4                         ; 0x1deb6 $DEA6 30 0C                   ;
lda      $4E,x                         ; 0x1deb8 $DEA8 B5 4E                   ; Enemy X position (low byte)
cmp      $03                           ; 0x1deba $DEAA C5 03                   ;
ldy      $3C,x                         ; 0x1debc $DEAC B4 3C                   ; Enemy X position (high byte)
iny                                    ; 0x1debe $DEAE C8                      ;
tya                                    ; 0x1debf $DEAF 98                      ;
sbc      $02                           ; 0x1dec0 $DEB0 E5 02                   ;
bmi      LDEB7                         ; 0x1dec2 $DEB2 30 03                   ;
LDEB4                                                                          ;
jsr      LDD3D                         ; 0x1dec4 $DEB4 20 3D DD                ;
LDEB7                                                                          ;
rts                                    ; 0x1dec7 $DEB7 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Simple_Horizontal_Movement                                               ;
inx                                    ; 0x1dec8 $DEB8 E8                      ;
jsr      bank7_XY_Movements_Routine    ; 0x1dec9 $DEB9 20 CE D1                ;
dex                                    ; 0x1decc $DEBC CA                      ;
rts                                    ; 0x1decd $DEBD 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Gravity                                                                  ;
jsr      bank7_Simple_Vertical_Movement; 0x1dece $DEBE 20 C8 DE                ; Simple Vertical Movement
inc      $057E,x                       ; 0x1ded1 $DEC1 FE 7E 05                ; Enemy Y Velocity
inc      $057E,x                       ; 0x1ded4 $DEC4 FE 7E 05                ;; Enemy Y Velocity; Enemy Y Velocity
rts                                    ; 0x1ded7 $DEC7 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Simple_Vertical_Movement                                                 ;
inx                                    ; 0x1ded8 $DEC8 E8                      ;
jsr      LD20A                         ; 0x1ded9 $DEC9 20 0A D2                ;
dex                                    ; 0x1dedc $DECC CA                      ;
rts                                    ; 0x1dedd $DECD 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
inx                                    ; 0x1dede $DECE E8                      ;
jsr      bank7_applyGravityMotion      ; 0x1dedf $DECF 20 9B D1                ;
dex                                    ; 0x1dee2 $DED2 CA                      ;
rts                                    ; 0x1dee3 $DED3 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
txa                                    ; 0x1dee4 $DED4 8A                      ;
clc                                    ; 0x1dee5 $DED5 18                      ;
adc      #$07                          ; 0x1dee6 $DED6 69 07                   ;
tax                                    ; 0x1dee8 $DED8 AA                      ;
jsr      bank7_XY_Movements_Routine    ; 0x1dee9 $DED9 20 CE D1                ;
jsr      LD20A                         ; 0x1deec $DEDC 20 0A D2                ;
ldy      #$02                          ; 0x1deef $DEDF A0 02                   ; Y = 02
jsr      bank7_code51                  ; 0x1def1 $DEE1 20 7D F2                ;
ldx      $10                           ; 0x1def4 $DEE4 A6 10                   ;; used as monster x register ;draw boss hp bar
rts                                    ; 0x1def6 $DEE6 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Set_tile_and_move_right_1_column                                         ;
sta      (L000E),y                     ; 0x1def7 $DEE7 91 0E                   ;
iny                                    ; 0x1def9 $DEE9 C8                      ;
tya                                    ; 0x1defa $DEEA 98                      ;
and      #$0F                          ; 0x1defb $DEEB 29 0F                   ; keep bits .... xxxx
bne      LDF00                         ; 0x1defd $DEED D0 11                   ;
lda      L000E                         ; 0x1deff $DEEF A5 0E                   ;
clc                                    ; 0x1df01 $DEF1 18                      ;
adc      #$D0                          ; 0x1df02 $DEF2 69 D0                   ;
sta      L000E                         ; 0x1df04 $DEF4 85 0E                   ;
bcc      LDEFA                         ; 0x1df06 $DEF6 90 02                   ;
inc      $0F                           ; 0x1df08 $DEF8 E6 0F                   ;
LDEFA                                                                          ;
lda      $0730                         ; 0x1df0a $DEFA AD 30 07                ;; Position of Object Placement
and      #$F0                          ; 0x1df0d $DEFD 29 F0                   ; keep bits xxxx ....
tay                                    ; 0x1df0f $DEFF A8                      ;
LDF00                                                                          ;
rts                                    ; 0x1df10 $DF00 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDF01                                                                          ;
lda      $75                           ; 0x1df11 $DF01 A5 75                   ; X position in OW
jsr      LDF3F                         ; 0x1df13 $DF03 20 3F DF                ;
sta      $00                           ; 0x1df16 $DF06 85 00                   ;
tya                                    ; 0x1df18 $DF08 98                      ;
asl                                    ; 0x1df19 $DF09 0A                      ;
asl                                    ; 0x1df1a $DF0A 0A                      ;
asl                                    ; 0x1df1b $DF0B 0A                      ;
asl                                    ; 0x1df1c $DF0C 0A                      ;
ora      $00                           ; 0x1df1d $DF0D 05 00                   ;
sta      $0A                           ; 0x1df1f $DF0F 85 0A                   ;
sta      $77                           ; 0x1df21 $DF11 85 77                   ;;projectile speed	77,78,79,7A,7B,7C	77,Y
lda      #$08                          ; 0x1df23 $DF13 A9 08                   ; A = 08
sta      $00                           ; 0x1df25 $DF15 85 00                   ;
asl                                    ; 0x1df27 $DF17 0A                      ;
sta      $7D                           ; 0x1df28 $DF18 85 7D                   ;;number of pixels to move? automove? on overworld, only partially, causes bug
lda      $0A                           ; 0x1df2a $DF1A A5 0A                   ;
asl                                    ; 0x1df2c $DF1C 0A                      ;
asl                                    ; 0x1df2d $DF1D 0A                      ;
asl                                    ; 0x1df2e $DF1E 0A                      ;
asl                                    ; 0x1df2f $DF1F 0A                      ;
asl                                    ; 0x1df30 $DF20 0A                      ;
rol      $00                           ; 0x1df31 $DF21 26 00                   ;
asl                                    ; 0x1df33 $DF23 0A                      ;
rol      $00                           ; 0x1df34 $DF24 26 00                   ;
sta      $01                           ; 0x1df36 $DF26 85 01                   ;
lda      $76                           ; 0x1df38 $DF28 A5 76                   ; X position on map (Link)
and      #$0F                          ; 0x1df3a $DF2A 29 0F                   ; keep bits .... xxxx
asl                                    ; 0x1df3c $DF2C 0A                      ;
adc      $01                           ; 0x1df3d $DF2D 65 01                   ;
sta      $7A                           ; 0x1df3f $DF2F 85 7A                   ;;are used to draw the Overworld tiles? offset in the Name Table(s) for Overworld redrawing.
lda      $0A                           ; 0x1df41 $DF31 A5 0A                   ;
and      #$10                          ; 0x1df43 $DF33 29 10                   ; keep bits ...x ....
lsr                                    ; 0x1df45 $DF35 4A                      ;
ora      $00                           ; 0x1df46 $DF36 05 00                   ;
sta      $79                           ; 0x1df48 $DF38 85 79                   ;;are used to draw the Overworld tiles? offset in the Name Table(s) for Overworld redrawing.
lda      #$00                          ; 0x1df4a $DF3A A9 00                   ; A = 00
sta      $7E                           ; 0x1df4c $DF3C 85 7E                   ;
rts                                    ; 0x1df4e $DF3E 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDF3F                                                                          ;
ldy      #$FF                          ; 0x1df4f $DF3F A0 FF                   ; Y = FF
LDF41                                                                          ;
iny                                    ; 0x1df51 $DF41 C8                      ;
sec                                    ; 0x1df52 $DF42 38                      ;
sbc      #$0F                          ; 0x1df53 $DF43 E9 0F                   ;
bcs      LDF41                         ; 0x1df55 $DF45 B0 FA                   ;
adc      #$0F                          ; 0x1df57 $DF47 69 0F                   ;
rts                                    ; 0x1df59 $DF49 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Set_tile_and_go_down_1_row_in_2x2_tiles_units                            ;
sta      (L000E),y                     ; 0x1df5a $DF4A 91 0E                   ;
lda      $0730                         ; 0x1df5c $DF4C AD 30 07                ; Position of Object Placement
clc                                    ; 0x1df5f $DF4F 18                      ;
adc      #$10                          ; 0x1df60 $DF50 69 10                   ; Go down 1 row
sta      $0730                         ; 0x1df62 $DF52 8D 30 07                ;; Position of Object Placement
rts                                    ; 0x1df65 $DF55 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDF56                                                                          ;
sta      (L000E),y                     ; 0x1df66 $DF56 91 0E                   ;
tya                                    ; 0x1df68 $DF58 98                      ;
clc                                    ; 0x1df69 $DF59 18                      ;
adc      #$10                          ; 0x1df6a $DF5A 69 10                   ;
tay                                    ; 0x1df6c $DF5C A8                      ;
rts                                    ; 0x1df6d $DF5D 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Table_for_OW_tiles_that_transform_into_another_type                      ;
;0E -> 04	Rock   -> Desert                                                     ;
;0F -> 04	Spider -> Desert                                                     ;
;04 -> 02	Desert -> Palace                                                     ;
;06 -> 00	Forest -> Town                                                       ;
.byt    $0E,$0F,$04,$06                ; 0x1df6e $DF5E 0E 0F 04 06             ;
bank7_Transform_into_this                                                      ;
.byt    $04,$04,$02,$00                ; 0x1df72 $DF62 04 04 02 00             ;
bank7_table19                                                                  ;
.byt    $35,$31                        ; 0x1df76 $DF66 35 31                   ;
LDF68                                                                          ;
.byt    $E6,$D1                        ; 0x1df78 $DF68 E6 D1                   ;
bank7_PPU_Macros_for_Hidden_Palace                                             ;
.byt    $23,$1A,$02,$60,$62,$23,$3A,$02; 0x1df7a $DF6A 23 1A 02 60 62 23 3A 02 ;
.byt    $61,$63,$23,$F6,$01,$FB,$FF    ; 0x1df82 $DF72 61 63 23 F6 01 FB FF    ;
; ---------------------------------------------------------------------------- ;
bank7_forest_chop_with_hammer                                                  ;
jsr      L83CF                         ; 0x1df89 $DF79 20 CF 83                ;
LDF7C                                                                          ;
lda      (L000E),y                     ; 0x1df8c $DF7C B1 0E                   ;
cmp      bank7_Table_for_OW_tiles_that_transform_into_another_type,x; 0x1df8e $DF7E DD 5E DF;
beq      bank7_Related_to_Hidden_Town_revealed; 0x1df91 $DF81 F0 08            ;
dex                                    ; 0x1df93 $DF83 CA                      ;
bpl      LDF7C                         ; 0x1df94 $DF84 10 F6                   ;
inx                                    ; 0x1df96 $DF86 E8                      ;
stx      $0725                         ; 0x1df97 $DF87 8E 25 07                ;; PPU Macro Selector	
rts                                    ; 0x1df9a $DF8A 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Related_to_Hidden_Town_revealed                                          ;
txa                                    ; 0x1df9b $DF8B 8A                      ;
beq      LDFBD                         ; 0x1df9c $DF8C F0 2F                   ;
lda      $0706                         ; 0x1df9e $DF8E AD 06 07                ; Current Region
cmp      #$02                          ; 0x1dfa1 $DF91 C9 02                   ; Region 02 = East Hyrule
bne      LDFD1                         ; 0x1dfa3 $DF93 D0 3C                   ; if NOT 02, return
cpx      #$03                          ; 0x1dfa5 $DF95 E0 03                   ;
bne      LDFB9                         ; 0x1dfa7 $DF97 D0 20                   ;
lda      $04                           ; 0x1dfa9 $DF99 A5 04                   ; Y Units Offset in Overworld
cmp      #$33                          ; 0x1dfab $DF9B C9 33                   ; Y Coordinate of Hidden Kasuto ???
bne      LDFD1                         ; 0x1dfad $DF9D D0 32                   ;
lda      $00                           ; 0x1dfaf $DF9F A5 00                   ;
cmp      #$3E                          ; 0x1dfb1 $DFA1 C9 3E                   ; X Coordinate of Hidden Kasuto ???
bne      LDFD1                         ; 0x1dfb3 $DFA3 D0 2C                   ;
lda      #$5C                          ; 0x1dfb5 $DFA5 A9 5C                   ; A = 5C
sta      $0305                         ; 0x1dfb7 $DFA7 8D 05 03                ;; Empty Row Space Character
lda      #$5D                          ; 0x1dfba $DFAA A9 5D                   ; A = 5D
sta      $0306                         ; 0x1dfbc $DFAC 8D 06 03                ;; Letter Written to Screen
lda      #$5E                          ; 0x1dfbf $DFAF A9 5E                   ; A = 5E
sta      $030A                         ; 0x1dfc1 $DFB1 8D 0A 03                ;
lda      #$5F                          ; 0x1dfc4 $DFB4 A9 5F                   ; A = 5F
sta      $030B                         ; 0x1dfc6 $DFB6 8D 0B 03                ;
LDFB9                                                                          ;
lda      #$10                          ; 0x1dfc9 $DFB9 A9 10                   ; A = 10
sta      $EB                           ; 0x1dfcb $DFBB 85 EB                   ; EB = Music
LDFBD                                                                          ;
lda      bank7_Transform_into_this,x   ; 0x1dfcd $DFBD BD 62 DF                ;
sta      (L000E),y                     ; 0x1dfd0 $DFC0 91 0E                   ;
cpx      #$02                          ; 0x1dfd2 $DFC2 E0 02                   ;
bcc      LDFD1                         ; 0x1dfd4 $DFC4 90 0B                   ;
dex                                    ; 0x1dfd6 $DFC6 CA                      ;
dex                                    ; 0x1dfd7 $DFC7 CA                      ;
ldy      bank7_table19,x               ; 0x1dfd8 $DFC8 BC 66 DF                ;
lda      LDF68,x                       ; 0x1dfdb $DFCB BD 68 DF                ;
sta      $6A00,y                       ; 0x1dfde $DFCE 99 00 6A                ;
LDFD1                                                                          ;
rts                                    ; 0x1dfe1 $DFD1 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDFD2                                                                          ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1dfe2 $DFD2 20 C9 FF                ; Load Bank $0769
jsr      bank7_forest_chop_with_hammer ; 0x1dfe5 $DFD5 20 79 DF                ;
jmp      bank7_Load_Bank_0_at_0x8000   ; 0x1dfe8 $DFD8 4C C5 FF                ; Load Bank 0
                                                                               ;
; ---------------------------------------------------------------------------- ;
LDFDB                                                                          ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1dfeb $DFDB 20 C9 FF                ; Load Bank $0769
jsr      bank7_Set_0E_0F_pointer_according_to_Object_Group; 0x1dfee $DFDE 20 E4 DF;
jmp      bank7_Load_Bank_0_at_0x8000   ; 0x1dff1 $DFE1 4C C5 FF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Set_0E_0F_pointer_according_to_Object_Group                              ;
;Y is the index, already multiplied by 2                                       ;
lda      L8500,y                       ; 0x1dff4 $DFE4 B9 00 85                ;
sta      L000E                         ; 0x1dff7 $DFE7 85 0E                   ;
lda      L8501,y                       ; 0x1dff9 $DFE9 B9 01 85                ;
sta      $0F                           ; 0x1dffc $DFEC 85 0F                   ;
rts                                    ; 0x1dffe $DFEE 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Overworld_Boundaries__Mountain_or_Water_Bank_1                           ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1dfff $DFEF 20 C9 FF                ; Load Bank $0769
jsr      L83CF                         ; 0x1e002 $DFF2 20 CF 83                ;
jmp      bank7_Load_Bank_0_at_0x8000   ; 0x1e005 $DFF5 4C C5 FF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Check_for_Hidden_Palace_spot_Bank_1                                      ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1e008 $DFF8 20 C9 FF                ; Load Bank $0769
jsr      L8368                         ; 0x1e00b $DFFB 20 68 83                ;
LE000     = * + $0002                                                          ;
jmp      bank7_Load_Bank_0_at_0x8000   ; 0x1e00e $DFFE 4C C5 FF                ; Load Bank 0
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE001                                                                          ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1e011 $E001 20 C9 FF                ; Load Bank $0769
lda      (L000E),y                     ; 0x1e014 $E004 B1 0E                   ;
and      #$0F                          ; 0x1e016 $E006 29 0F                   ; keep bits .... xxxx
sta      $02                           ; 0x1e018 $E008 85 02                   ;
lda      (L000E),y                     ; 0x1e01a $E00A B1 0E                   ;
lsr                                    ; 0x1e01c $E00C 4A                      ;
lsr                                    ; 0x1e01d $E00D 4A                      ;
lsr                                    ; 0x1e01e $E00E 4A                      ;
lsr                                    ; 0x1e01f $E00F 4A                      ;
sec                                    ; 0x1e020 $E010 38                      ;
adc      $03                           ; 0x1e021 $E011 65 03                   ;
sta      $03                           ; 0x1e023 $E013 85 03                   ;
pha                                    ; 0x1e025 $E015 48                      ;
jsr      bank7_Load_Bank_0_at_0x8000   ; 0x1e026 $E016 20 C5 FF                ; Load Bank 0
pla                                    ; 0x1e029 $E019 68                      ;
rts                                    ; 0x1e02a $E01A 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Turn_Palaces_into_Stone_Bank_1                                           ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1e02b $E01B 20 C9 FF                ; Load Bank $0769
jsr      L879B                         ; 0x1e02e $E01E 20 9B 87                ;
jmp      bank7_Load_Bank_0_at_0x8000   ; 0x1e031 $E021 4C C5 FF                ; Load Bank 0
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE024                                                                          ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1e034 $E024 20 C9 FF                ; Load Bank $0769
jsr      L83A1                         ; 0x1e037 $E027 20 A1 83                ;
jmp      bank7_Load_Bank_0_at_0x8000   ; 0x1e03a $E02A 4C C5 FF                ; Load Bank 0
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_table20                                                                  ;
.byt    $FF,$FF,$FF                    ; 0x1e03d $E02D FF FF FF                ;
; ---------------------------------------------------------------------------- ;
bank7_code33                                                                   ;
lda      #$AF                          ; 0x1e040 $E030 A9 AF                   ; A = AF
bank7_Links_initial_Y_Position_when_entering_an_area__ground_center_or_side    ;
sta      $29                           ; 0x1e042 $E032 85 29                   ; Link's Y position
ldy      #$00                          ; 0x1e044 $E034 A0 00                   ; Y = 00
ldx      #$00                          ; 0x1e046 $E036 A2 00                   ; X = 00
jsr      bank7_code51                  ; 0x1e048 $E038 20 7D F2                ;
jsr      bank7_code34                  ; 0x1e04b $E03B 20 70 E0                ;
lda      $A7                           ; 0x1e04e $E03E A5 A7                   ;;collision bits for Link - 0000ABLR (above,below,left,right)
beq      LE04B                         ; 0x1e050 $E040 F0 09                   ;
lda      $29                           ; 0x1e052 $E042 A5 29                   ; Link's Y Position
sec                                    ; 0x1e054 $E044 38                      ;
sbc      #$10                          ; 0x1e055 $E045 E9 10                   ;
cmp      #$10                          ; 0x1e057 $E047 C9 10                   ;
bcs      bank7_Links_initial_Y_Position_when_entering_an_area__ground_center_or_side; 0x1e059 $E049 B0 E7;
LE04B                                                                          ;
inc      $29                           ; 0x1e05b $E04B E6 29                   ; Link's Y position
rts                                    ; 0x1e05d $E04D 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_table21                                                                  ;
.byt    $01,$02,$01,$02,$04,$04,$08,$08; 0x1e05e $E04E 01 02 01 02 04 04 08 08 ;
.byt    $01,$02,$01,$02,$04,$04,$08,$08; 0x1e066 $E056 01 02 01 02 04 04 08 08 ;
.byt    $01,$02,$01,$02,$04,$08,$01,$02; 0x1e06e $E05E 01 02 01 02 04 08 01 02 ;
.byt    $01,$02,$04,$08,$01,$02,$01,$02; 0x1e076 $E066 01 02 04 08 01 02 01 02 ;
.byt    $04,$08                        ; 0x1e07e $E06E 04 08                   ;
; ---------------------------------------------------------------------------- ;
bank7_code34                                                                   ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1e080 $E070 20 C9 FF                ;
jsr      bank7_Related_to_Link_falling_in_Lava_Water; 0x1e083 $E073 20 79 E0   ;
jmp      bank7_Load_Bank_0_at_0x8000   ; 0x1e086 $E076 4C C5 FF                ; Load Bank 0
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Related_to_Link_falling_in_Lava_Water                                    ;
ldx      #$00                          ; 0x1e089 $E079 A2 00                   ; X = 00
stx      $A7                           ; 0x1e08b $E07B 86 A7                   ;;collision bits for Link - 0000ABLR (above,below,left,right)
lda      #$07                          ; 0x1e08d $E07D A9 07                   ; A = 07
clc                                    ; 0x1e08f $E07F 18                      ;
adc      $13                           ; 0x1e090 $E080 65 13                   ; Fairy state (0 = Not in Fairy state)
tay                                    ; 0x1e092 $E082 A8                      ;
jsr      LE1B8                         ; 0x1e093 $E083 20 B8 E1                ;
lda      $03                           ; 0x1e096 $E086 A5 03                   ;
sta      $0D                           ; 0x1e098 $E088 85 0D                   ;
lda      #$05                          ; 0x1e09a $E08A A9 05                   ; A = 05
clc                                    ; 0x1e09c $E08C 18                      ;
adc      $13                           ; 0x1e09d $E08D 65 13                   ; Fairy state (0 = Not in Fairy state)
tay                                    ; 0x1e09f $E08F A8                      ;
jsr      LE1B8                         ; 0x1e0a0 $E090 20 B8 E1                ;
ldy      #$1D                          ; 0x1e0a3 $E093 A0 1D                   ; Y = 1D
jsr      bank7_Generic_Collision_Test_with_Level_Objects; 0x1e0a5 $E095 20 E8 EA;
lda      #$00                          ; 0x1e0a8 $E098 A9 00                   ; A = 00
sta      $0752                         ; 0x1e0aa $E09A 8D 52 07                ;
lda      $03                           ; 0x1e0ad $E09D A5 03                   ;tile index stepped on?
cmp      L8520                         ; 0x1e0af $E09F CD 20 85                ;
bne      LE0B0                         ; 0x1e0b2 $E0A2 D0 0C                   ;
bank7_Link_touched_Lava_Water                                                  ;
lda      #$01                          ; 0x1e0b4 $E0A4 A9 01                   ; A = 01
sta      $E9                           ; 0x1e0b6 $E0A6 85 E9                   ;
lda      #$10                          ; 0x1e0b8 $E0A8 A9 10                   ; A = 10
sta      $050C                         ; 0x1e0ba $E0AA 8D 0C 05                ; Timer for Link being in injured state
inc      $B5                           ; 0x1e0bd $E0AD E6 B5                   ;;2 will make link die in lava	;3 move right like when win game at dark link
rts                                    ; 0x1e0bf $E0AF 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE0B0                                                                          ;
cmp      L8521                         ; 0x1e0c0 $E0B0 CD 21 85                ;
beq      LE0BA                         ; 0x1e0c3 $E0B3 F0 05                   ;
cmp      L8522                         ; 0x1e0c5 $E0B5 CD 22 85                ;
bne      LE0C5                         ; 0x1e0c8 $E0B8 D0 0B                   ;
;at this point:                                                                ;
;$2 is the offset for below foot(10*Y position), add to $E or $F               ;
;$3 is tile below links foot                                                   ;
;$E, $F are the vertical line which contains the tiles link is at              ;
LE0BA                                                                          ;
ldy      $29                           ; 0x1e0ca $E0BA A4 29                   ; Link's Y Position
cpy      #$A5                          ; 0x1e0cc $E0BC C0 A5                   ;
bcc      LE0C5                         ; 0x1e0ce $E0BE 90 05                   ;
ldy      #$20                          ; 0x1e0d0 $E0C0 A0 20                   ; Y = 20
sty      $0752                         ; 0x1e0d2 $E0C2 8C 52 07                ;
LE0C5                                                                          ;
cmp      L851F                         ; 0x1e0d5 $E0C5 CD 1F 85                ;breakable step on break-able step-on
beq      LE0FC                         ; 0x1e0d8 $E0C8 F0 32                   ;
cmp      L851A                         ; 0x1e0da $E0CA CD 1A 85                ;
beq      LE0E6                         ; 0x1e0dd $E0CD F0 17                   ;
cmp      L851C                         ; 0x1e0df $E0CF CD 1C 85                ;
beq      LE0E6                         ; 0x1e0e2 $E0D2 F0 12                   ;
cmp      L851B                         ; 0x1e0e4 $E0D4 CD 1B 85                ;
beq      LE0E6                         ; 0x1e0e7 $E0D7 F0 0D                   ;
bank7_table22                                                                  ;
.byt    $CD,$1D,$85,$D0                ; 0x1e0e9 $E0D9 CD 1D 85 D0             ;
; ---------------------------------------------------------------------------- ;
bank7_code35                                                                   ;
.byt    $1B                            ; 0x1e0ed $E0DD 1B                      ;
lda      $17                           ; 0x1e0ee $E0DE A5 17                   ;; Link's Shield Position; Link's Shield Position (0 = Link ducked)
bne      LE0F9                         ; 0x1e0f0 $E0E0 D0 17                   ;
inc      $070E                         ; 0x1e0f2 $E0E2 EE 0E 07                ;;setting to 1 will make link sink (duck into the chimney)
LE0E5                                                                          ;
rts                                    ; 0x1e0f5 $E0E5 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE0E6                                                                          ;
lda      $F7                           ; 0x1e0f6 $E0E6 A5 F7                   ;; Controller 1 Buttons Held
and      #$08                          ; 0x1e0f8 $E0E8 29 08                   ;;Keep Bits:0000_1000
beq      LE0F9                         ; 0x1e0fa $E0EA F0 0D                   ;
lda      $0479                         ; 0x1e0fc $E0EC AD 79 04                ;;jumping_state (2=going up, 1=coming down, 0=not jumping); Link is in mid-air ? (1 = mid-air, 0 = on ground); Link is in mid-air ? (1 = mid-air, 0 = on ground)
bne      LE0E5                         ; 0x1e0ff $E0EF D0 F4                   ;
inc      $075B                         ; 0x1e101 $E0F1 EE 5B 07                ;
lda      #$16                          ; 0x1e104 $E0F4 A9 16                   ;;A = #$16 0001_0110
jmp      LE187                         ; 0x1e106 $E0F6 4C 87 E1                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE0F9                                                                          ;
jmp      LE12B                         ; 0x1e109 $E0F9 4C 2B E1                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE0FC                                                                          ;
lda      #$8F                          ; 0x1e10c $E0FC A9 8F                   ;;A = #$8f 1000_1111
ldy      $02                           ; 0x1e10e $E0FE A4 02                   ;
sta      (L000E),y                     ; 0x1e110 $E100 91 0E                   ;
jsr      bank7_find_next_free_41A_X_or_something_and_write_to___associated; 0x1e112 $E102 20 92 E2;
lda      #$81                          ; 0x1e115 $E105 A9 81                   ;;A = #$81 1000_0001
sta      $041A,x                       ; 0x1e117 $E107 9D 1A 04                ;;break block by stab/stepon: ?exists/in-use
lda      #$02                          ; 0x1e11a $E10A A9 02                   ;;A = #$02 0000_0010
sta      $ED                           ; 0x1e11c $E10C 85 ED                   ;; Sound Effects Type 2; Sound Effects Type 2
lda      $29                           ; 0x1e11e $E10E A5 29                   ;;y_pos (Link's y position in sideview);link Y pos SideScroll		; Link's Y Position
clc                                    ; 0x1e120 $E110 18                      ;
adc      #$20                          ; 0x1e121 $E111 69 20                   ;
and      #$F0                          ; 0x1e123 $E113 29 F0                   ;;Keep Bits:1111_0000
sta      $0429,x                       ; 0x1e125 $E115 9D 29 04                ;;break block by stab/stepon: y
lda      $4D                           ; 0x1e128 $E118 A5 4D                   ;;link X pos SideScroll		; Link's X Position (low byte)
clc                                    ; 0x1e12a $E11A 18                      ;
adc      #$0F                          ; 0x1e12b $E11B 69 0F                   ;
and      #$F0                          ; 0x1e12d $E11D 29 F0                   ;;Keep Bits:1111_0000
sta      $0424,x                       ; 0x1e12f $E11F 9D 24 04                ;;break block by stab/stepon: X
lda      $3B                           ; 0x1e132 $E122 A5 3B                   ;;link Pagepos SideScroll		; Link's X Position (high byte)
adc      #$00                          ; 0x1e134 $E124 69 00                   ;
sta      $041F,x                       ; 0x1e136 $E126 9D 1F 04                ;;break block by stab/stepon: map page
ldx      #$00                          ; 0x1e139 $E129 A2 00                   ;;X = #$00 0000_0000
LE12B                                                                          ;
lda      $5F                           ; 0x1e13b $E12B A5 5F                   ;; Link's facing direction
lsr                                    ; 0x1e13d $E12D 4A                      ;
clc                                    ; 0x1e13e $E12E 18                      ;
adc      $13                           ; 0x1e13f $E12F 65 13                   ;; Fairy state (0 = Not in Fairy state)	faery, flip from 8=faery,0=link (set $076F to 0, then set $13 to 0)	setting 76F to ff, changes 76F to 3B which prevents changing $13 from 8 to 0
sta      $00                           ; 0x1e141 $E131 85 00                   ;
pha                                    ; 0x1e143 $E133 48                      ;
lda      #$00                          ; 0x1e144 $E134 A9 00                   ;;A = #$00 0000_0000
sta      $01                           ; 0x1e146 $E136 85 01                   ;
jsr      LE1BE                         ; 0x1e148 $E138 20 BE E1                ;
pla                                    ; 0x1e14b $E13B 68                      ;
clc                                    ; 0x1e14c $E13C 18                      ;
adc      #$02                          ; 0x1e14d $E13D 69 02                   ;
adc      $13                           ; 0x1e14f $E13F 65 13                   ;; Fairy state (0 = Not in Fairy state)	faery, flip from 8=faery,0=link (set $076F to 0, then set $13 to 0)	setting 76F to ff, changes 76F to 3B which prevents changing $13 from 8 to 0
sta      $00                           ; 0x1e151 $E141 85 00                   ;
lda      #$00                          ; 0x1e153 $E143 A9 00                   ;;A = #$00 0000_0000
sta      $01                           ; 0x1e155 $E145 85 01                   ;
jsr      LE1BE                         ; 0x1e157 $E147 20 BE E1                ;
lda      $B5                           ; 0x1e15a $E14A A5 B5                   ;;2 will make link die in lava	;3 move right like when win game at dark link
cmp      #$01                          ; 0x1e15c $E14C C9 01                   ;
bne      LE19D                         ; 0x1e15e $E14E D0 4D                   ;
lda      $0503                         ; 0x1e160 $E150 AD 03 05                ;; Timer for moving left or right (when entering area)
bne      LE19E                         ; 0x1e163 $E153 D0 49                   ;
lda      $C8                           ; 0x1e165 $E155 A5 C8                   ;; go outside: set $c8 to 3
ldy      $0728                         ; 0x1e167 $E157 AC 28 07                ;;_728_FreezeScrolling		= $728	;1=freeze screen, prevent from exiting left/right
beq      LE16F                         ; 0x1e16a $E15A F0 13                   ;
and      #$09                          ; 0x1e16c $E15C 29 09                   ;;Keep Bits:0000_1001
beq      LE16E                         ; 0x1e16e $E15E F0 0E                   ;
lsr                                    ; 0x1e170 $E160 4A                      ;
lsr                                    ; 0x1e171 $E161 4A                      ;
lsr                                    ; 0x1e172 $E162 4A                      ;
tay                                    ; 0x1e173 $E163 A8                      ;
iny                                    ; 0x1e174 $E164 C8                      ;
cpy      $5F                           ; 0x1e175 $E165 C4 5F                   ;; Link's facing direction
bne      LE16E                         ; 0x1e177 $E167 D0 05                   ;
tya                                    ; 0x1e179 $E169 98                      ;
ora      $A7                           ; 0x1e17a $E16A 05 A7                   ;;collision bits for Link - 0000ABLR (above,below,left,right)
sta      $A7                           ; 0x1e17c $E16C 85 A7                   ;;collision bits for Link - 0000ABLR (above,below,left,right)
LE16E                                                                          ;
rts                                    ; 0x1e17e $E16E 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE16F                                                                          ;
and      #$06                          ; 0x1e17f $E16F 29 06                   ;;Keep Bits:0000_0110
beq      LE19E                         ; 0x1e181 $E171 F0 2B                   ;
and      #$04                          ; 0x1e183 $E173 29 04                   ;;Keep Bits:0000_0100
beq      LE179                         ; 0x1e185 $E175 F0 02                   ;
inc      $3B                           ; 0x1e187 $E177 E6 3B                   ;;link Pagepos SideScroll		; Link's X Position (high byte)
LE179                                                                          ;
lda      #$00                          ; 0x1e189 $E179 A9 00                   ;;A = #$00 0000_0000
sta      $13                           ; 0x1e18b $E17B 85 13                   ;; Fairy state (0 = Not in Fairy state)	faery, flip from 8=faery,0=link (set $076F to 0, then set $13 to 0)	setting 76F to ff, changes 76F to 3B which prevents changing $13 from 8 to 0
sta      $0759                         ; 0x1e18d $E17D 8D 59 07                ;; if not 0, cause fairy spawn at next encounter (??)
sta      $075A                         ; 0x1e190 $E180 8D 5A 07                ;
sta      $70                           ; 0x1e193 $E183 85 70                   ;;hspeed (Link's horizontal velocity); Link's X Velocity	; Player X Delta (E8-00, 00-18)
lda      #$10                          ; 0x1e195 $E185 A9 10                   ;;A = #$10 0001_0000
LE187                                                                          ;
sta      $0736                         ; 0x1e197 $E187 8D 36 07                ;; Game Mode ; screen intro type
LE18A                                                                          ;
inc      $0726                         ; 0x1e19a $E18A EE 26 07                ;;?which is the black transition screen when loading a battle scene.  It hides the loading gfx.; Dialog Box Drawing Flag (00-01) Toggles while a dialog box is being drawn.
ldx      #$05                          ; 0x1e19d $E18D A2 05                   ; X = 05
bank7_KillAllMonsters                                                          ;
lda      $B6,x                         ; 0x1e19f $E18F B5 B6                   ;does monster exist?
beq      LE198                         ; 0x1e1a1 $E191 F0 05                   ;if no, skip past 
jsr      LDD3D                         ; 0x1e1a3 $E193 20 3D DD                ;do something  and  kill monster (set B6,x=0)
inc      $B6,x                         ; 0x1e1a6 $E196 F6 B6                   ;
LE198                                                                          ;
dex                                    ; 0x1e1a8 $E198 CA                      ;decrement x
bpl      bank7_KillAllMonsters         ; 0x1e1a9 $E199 10 F4                   ;if x > 0
ldx      $10                           ; 0x1e1ab $E19B A6 10                   ;last current monster x register?
LE19D                                                                          ;
rts                                    ; 0x1e1ad $E19D 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE19E                                                                          ;
lda      $13                           ; 0x1e1ae $E19E A5 13                   ;; Fairy state (0 = Not in Fairy state)	faery, flip from 8=faery,0=link (set $076F to 0, then set $13 to 0)	setting 76F to ff, changes 76F to 3B which prevents changing $13 from 8 to 0
beq      LE1A8                         ; 0x1e1b0 $E1A0 F0 06                   ;
lda      $29                           ; 0x1e1b2 $E1A2 A5 29                   ; Link's Y Position
cmp      #$E4                          ; 0x1e1b4 $E1A4 C9 E4                   ;
bcs      LE1AE                         ; 0x1e1b6 $E1A6 B0 06                   ;
LE1A8                                                                          ;
lda      $19                           ; 0x1e1b8 $E1A8 A5 19                   ;;fall_or_invisible (0=invisible, 1=normal, 2~FF=fall in hole); Position Code for Fairy Cursor (Selection Screen)	(and) ;draw link's sprite =yes/no
cmp      #$02                          ; 0x1e1ba $E1AA C9 02                   ;
bcc      LE19D                         ; 0x1e1bc $E1AC 90 EF                   ;
LE1AE                                                                          ;
lda      #$00                          ; 0x1e1be $E1AE A9 00                   ; A = 00
sta      $13                           ; 0x1e1c0 $E1B0 85 13                   ;fall down hole ?
inc      $0736                         ; 0x1e1c2 $E1B2 EE 36 07                ; Game Mode
jmp      LE18A                         ; 0x1e1c5 $E1B5 4C 8A E1                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE1B8                                                                          ;
sty      $00                           ; 0x1e1c8 $E1B8 84 00                   ;
lda      #$01                          ; 0x1e1ca $E1BA A9 01                   ; A = 01
sta      $01                           ; 0x1e1cc $E1BC 85 01                   ;
LE1BE                                                                          ;
ldy      $00                           ; 0x1e1ce $E1BE A4 00                   ;
jsr      bank7_Generic_Collision_Test_with_Level_Objects; 0x1e1d0 $E1C0 20 E8 EA;
jsr      L850C                         ; 0x1e1d3 $E1C3 20 0C 85                ; Check for False Wall	while step on?
bcc      LE1D2                         ; 0x1e1d6 $E1C6 90 0A                   ;007 CHANGE THIS AND CAN EXIST IN TILES, COLLIDE WITH SKY?
ldy      $00                           ; 0x1e1d8 $E1C8 A4 00                   ;
lda      $A7,x                         ; 0x1e1da $E1CA B5 A7                   ;;collision bits for Link - 0000ABLR (above,below,left,right)
ora      bank7_table21,y               ; 0x1e1dc $E1CC 19 4E E0                ;
sta      $A7,x                         ; 0x1e1df $E1CF 95 A7                   ;;collision bits for Link - 0000ABLR (above,below,left,right)
rts                                    ; 0x1e1e1 $E1D1 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE1D2                                                                          ;
dec      $00                           ; 0x1e1e2 $E1D2 C6 00                   ;
dec      $01                           ; 0x1e1e4 $E1D4 C6 01                   ;
bpl      LE1BE                         ; 0x1e1e6 $E1D6 10 E6                   ;
rts                                    ; 0x1e1e8 $E1D8 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Related_to_Links_velocities_when_breaking_blocks_or_hitting_walls        ;
.byt    $0C                            ; 0x1e1e9 $E1D9 0C                      ;24 DC 0C F4	Values multiplied by 3
.byt    $F4                            ; 0x1e1ea $E1DA F4                      ;
LE1DB                                                                          ;
.byt    $04                            ; 0x1e1eb $E1DB 04                      ;
.byt    $FC                            ; 0x1e1ec $E1DC FC                      ;
bank7_related_to_breakable_block                                               ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1e1ed $E1DD 20 C9 FF                ; Load Bank $0769
jsr      bank7_Related_to_Breakable_Blocks; 0x1e1f0 $E1E0 20 E6 E1             ;
jmp      bank7_Load_Bank_0_at_0x8000   ; 0x1e1f3 $E1E3 4C C5 FF                ; Load Bank 0
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Related_to_Breakable_Blocks                                              ;
lda      $0480                         ; 0x1e1f6 $E1E6 AD 80 04                ;
cmp      #$F8                          ; 0x1e1f9 $E1E9 C9 F8                   ;
bcs      LE234                         ; 0x1e1fb $E1EB B0 47                   ;
ldy      $80                           ; 0x1e1fd $E1ED A4 80                   ; Current Animation Frame for Link
cpy      #$08                          ; 0x1e1ff $E1EF C0 08                   ; 08 = Up Stab
beq      LE1F7                         ; 0x1e201 $E1F1 F0 04                   ;
cpy      #$09                          ; 0x1e203 $E1F3 C0 09                   ; 09 = Down Stab
beq      LE1F7                         ; 0x1e205 $E1F5 F0 00                   ;
LE1F7                                                                          ;
clc                                    ; 0x1e207 $E1F7 18                      ;
adc      #$03                          ; 0x1e208 $E1F8 69 03                   ;
sta      $39                           ; 0x1e20a $E1FA 85 39                   ;
lda      $047E                         ; 0x1e20c $E1FC AD 7E 04                ;
cpy      #$08                          ; 0x1e20f $E1FF C0 08                   ;
bne      LE214                         ; 0x1e211 $E201 D0 11                   ;
dec      $39                           ; 0x1e213 $E203 C6 39                   ;
dec      $39                           ; 0x1e215 $E205 C6 39                   ;
dec      $39                           ; 0x1e217 $E207 C6 39                   ;
lda      $CC                           ; 0x1e219 $E209 A5 CC                   ;; Link's X Position on Screen; Player X On Screen; Link's X Position on Screen
clc                                    ; 0x1e21b $E20B 18                      ;
adc      #$0A                          ; 0x1e21c $E20C 69 0A                   ;
ldy      $5F                           ; 0x1e21e $E20E A4 5F                   ; Link's facing direction
dey                                    ; 0x1e220 $E210 88                      ;
adc      LE1DB,y                       ; 0x1e221 $E211 79 DB E1                ;
LE214                                                                          ;
clc                                    ; 0x1e224 $E214 18                      ;
adc      #$04                          ; 0x1e225 $E215 69 04                   ;
adc      $072C                         ; 0x1e227 $E217 6D 2C 07                ; Scrolling Offset Low Byte
sta      $5D                           ; 0x1e22a $E21A 85 5D                   ;
lda      $072A                         ; 0x1e22c $E21C AD 2A 07                ; Scrolling Offset High Byte
adc      #$00                          ; 0x1e22f $E21F 69 00                   ;
sta      $4B                           ; 0x1e231 $E221 85 4B                   ;
ldx      #$10                          ; 0x1e233 $E223 A2 10                   ; X = 10
ldy      #$1C                          ; 0x1e235 $E225 A0 1C                   ; Y = 1C
jsr      bank7_Generic_Collision_Test_with_Level_Objects; 0x1e237 $E227 20 E8 EA;sets $e $f $2 and $3	, with Y as offset: based on location of link, below his foot	;60D3	Y=B0	54B0
cmp      L851E                         ; 0x1e23a $E22A CD 1E 85                ; check for Breakable Block Tile Code
beq      LE235                         ; 0x1e23d $E22D F0 06                   ;
jsr      L850C                         ; 0x1e23f $E22F 20 0C 85                ; Check for False Wall
bcs      LE26A                         ; 0x1e242 $E232 B0 36                   ;
LE234                                                                          ;
rts                                    ; 0x1e244 $E234 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE235                                                                          ;
lda      $0786                         ; 0x1e245 $E235 AD 86 07                ; Have Glove
beq      LE26A                         ; 0x1e248 $E238 F0 30                   ;
bank7_stab_brick_at_0E_with_A_and_does_draw                                    ;
lda      #$42                          ; 0x1e24a $E23A A9 42                   ; A = 42						;FUNCTION: stab brick at E with A and does draw
ldy      $02                           ; 0x1e24c $E23C A4 02                   ;
sta      (L000E),y                     ; 0x1e24e $E23E 91 0E                   ;store to side screen tile  in ram			;FUNCTION: stab brick at E with A
jsr      bank7_find_next_free_41A_X_or_something_and_write_to___associated; 0x1e250 $E240 20 92 E2;
lda      #$01                          ; 0x1e253 $E243 A9 01                   ; A = 01
sta      $041A,x                       ; 0x1e255 $E245 9D 1A 04                ;;break block by stab/stepon: ?exists/in-use
lda      #$04                          ; 0x1e258 $E248 A9 04                   ; A = 04 (04 = Sound of Block Breaking)
sta      $ED                           ; 0x1e25a $E24A 85 ED                   ; Sound Effects Type 2
lda      $39                           ; 0x1e25c $E24C A5 39                   ;
and      #$F0                          ; 0x1e25e $E24E 29 F0                   ; keep bits xxxx ....
sta      $0429,x                       ; 0x1e260 $E250 9D 29 04                ;;break block by stab/stepon: y
lda      $5D                           ; 0x1e263 $E253 A5 5D                   ;
and      #$F0                          ; 0x1e265 $E255 29 F0                   ; keep bits xxxx ....
sta      $0424,x                       ; 0x1e267 $E257 9D 24 04                ;;break block by stab/stepon: X
lda      $4B                           ; 0x1e26a $E25A A5 4B                   ;
sta      $041F,x                       ; 0x1e26c $E25C 9D 1F 04                ;;break block by stab/stepon: map page
lda      $80                           ; 0x1e26f $E25F A5 80                   ; Current Animation Frame for Link
sec                                    ; 0x1e271 $E261 38                      ;
sbc      #$08                          ; 0x1e272 $E262 E9 08                   ;
cmp      #$02                          ; 0x1e274 $E264 C9 02                   ;
bcc      LE28C                         ; 0x1e276 $E266 90 24                   ;
bcs      LE277                         ; 0x1e278 $E268 B0 0D                   ;
LE26A                                                                          ;
lda      $80                           ; 0x1e27a $E26A A5 80                   ; Current Animation Frame for Link
sec                                    ; 0x1e27c $E26C 38                      ;
sbc      #$08                          ; 0x1e27d $E26D E9 08                   ;
cmp      #$02                          ; 0x1e27f $E26F C9 02                   ;
bcc      LE28B                         ; 0x1e281 $E271 90 18                   ;
lda      #$02                          ; 0x1e283 $E273 A9 02                   ; A = 02 (sound of wall hit by sword)
sta      $EC                           ; 0x1e285 $E275 85 EC                   ; Sound Effects Type 1
LE277                                                                          ;
lda      #$18                          ; 0x1e287 $E277 A9 18                   ; A = 18
sta      $0502                         ; 0x1e289 $E279 8D 02 05                ;; Timer
ldy      #$00                          ; 0x1e28c $E27C A0 00                   ; Y = 00
lda      $047E                         ; 0x1e28e $E27E AD 7E 04                ;
cmp      $CC                           ; 0x1e291 $E281 C5 CC                   ; Link's X Position on Screen
bcc      LE286                         ; 0x1e293 $E283 90 01                   ;
iny                                    ; 0x1e295 $E285 C8                      ;
LE286                                                                          ;
lda      bank7_Related_to_Links_velocities_when_breaking_blocks_or_hitting_walls,y; 0x1e296 $E286 B9 D9 E1;
sta      $70                           ; 0x1e299 $E289 85 70                   ; Link's X Velocity
LE28B                                                                          ;
rts                                    ; 0x1e29b $E28B 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE28C                                                                          ;
lda      #$00                          ; 0x1e29c $E28C A9 00                   ; A = 00
sta      $057D                         ; 0x1e29e $E28E 8D 7D 05                ; Link's Y Velocity
rts                                    ; 0x1e2a1 $E291 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_find_next_free_41A_X_or_something_and_write_to___associated              ;
ldx      #$04                          ; 0x1e2a2 $E292 A2 04                   ; X = 04
LE294                                                                          ;
lda      $041A,x                       ; 0x1e2a4 $E294 BD 1A 04                ;;break block by stab/stepon: ?exists/in-use
beq      LE29E                         ; 0x1e2a7 $E297 F0 05                   ;
dex                                    ; 0x1e2a9 $E299 CA                      ;
bpl      LE294                         ; 0x1e2aa $E29A 10 F8                   ;
ldx      #$00                          ; 0x1e2ac $E29C A2 00                   ; X = 00
LE29E                                                                          ;
ldy      $02                           ; 0x1e2ae $E29E A4 02                   ;
tya                                    ; 0x1e2b0 $E2A0 98                      ;
sta      $042E,x                       ; 0x1e2b1 $E2A1 9D 2E 04                ;
lda      L000E                         ; 0x1e2b4 $E2A4 A5 0E                   ;
sta      $0433,x                       ; 0x1e2b6 $E2A6 9D 33 04                ;;break block by stab/stepon: ?addy (low)
lda      $0F                           ; 0x1e2b9 $E2A9 A5 0F                   ;
sta      $0438,x                       ; 0x1e2bb $E2AB 9D 38 04                ;;break block by stab/stepon: ?addy (high)
LE2AE                                                                          ;
rts                                    ; 0x1e2be $E2AE 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Table_for_Enemy_Damage                                                   ;
.byt    $10,$0C,$0C,$0C,$08,$04,$04,$04; 0x1e2bf $E2AF 10 0C 0C 0C 08 04 04 04 ;Damage Code 0
.byt    $20,$1C,$14,$10,$0C,$0C,$08,$08; 0x1e2c7 $E2B7 20 1C 14 10 0C 0C 08 08 ;Damage Code 1
.byt    $30,$28,$24,$20,$18,$14,$10,$0C; 0x1e2cf $E2BF 30 28 24 20 18 14 10 0C ;Damage Code 2
.byt    $60,$48,$38,$30,$28,$20,$1C,$18; 0x1e2d7 $E2C7 60 48 38 30 28 20 1C 18 ;Damage Code 3
.byt    $90,$78,$60,$48,$38,$30,$28,$20; 0x1e2df $E2CF 90 78 60 48 38 30 28 20 ;Damage Code 4
.byt    $E0,$A0,$80,$70,$60,$50,$40,$30; 0x1e2e7 $E2D7 E0 A0 80 70 60 50 40 30 ;Damage Code 5
.byt    $E0,$C0,$A0,$90,$80,$70,$60,$50; 0x1e2ef $E2DF E0 C0 A0 90 80 70 60 50 ;Damage Code 6
                                                                               ;
.byt    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF; 0x1e2f7 $E2E7 FF FF FF FF FF FF FF FF ;Damage Code 7
; ---------------------------------------------------------------------------- ;
bank7_Link_Hit_Routine                                                         ;
ldy      $A1,x                         ; 0x1e2ff $E2EF B4 A1                   ; Enemy Code
lda      $0518                         ; 0x1e301 $E2F1 AD 18 05                ; Timer for Link immunity (0 = vulnerable)
bne      LE308                         ; 0x1e304 $E2F4 D0 12                   ; if Link Invulnerable, skip to $1E308
lda      $6DD5,y                       ; 0x1e306 $E2F6 B9 D5 6D                ; load Enemy Bits; load Enemy Bits (from RAM)
and      #$10                          ; 0x1e309 $E2F9 29 10                   ; keep bits ...x .... (Steal Points bit); keep bits .... xxxx (Experience bits)
beq      LE305                         ; 0x1e30b $E2FB F0 08                   ; if 0, skip to $1E305
lda      #$0A                          ; 0x1e30d $E2FD A9 0A                   ; A = 0A (lose 10 exp. when hit)
cpy      #$06                          ; 0x1e30f $E2FF C0 06                   ; if Enemy Code NOT 6 (Moa); restore Y to its original value
bne      LE305                         ; 0x1e311 $E301 D0 02                   ; skip
lda      #$14                          ; 0x1e313 $E303 A9 14                   ; else A = 14 (lose 20 exp. when hit)
LE305                                                                          ;
sta      $05E8                         ; 0x1e315 $E305 8D E8 05                ; amount of exp. to lose
LE308                                                                          ;
lda      $6DF9,y                       ; 0x1e318 $E308 B9 F9 6D                ; Enemy Vulnerability/Damage Code
and      #$0F                          ; 0x1e31b $E30B 29 0F                   ; keep bits .... xxxx
LE30D                                                                          ;
sta      $0C                           ; 0x1e31d $E30D 85 0C                   ;
lda      $0518                         ; 0x1e31f $E30F AD 18 05                ; Timer for Link being immune from attacks
bne      LE368                         ; 0x1e322 $E312 D0 54                   ; if Invulnerable (Not 0), skip to $1E368
lda      #$01                          ; 0x1e324 $E314 A9 01                   ; A = 01					;link hurt sound
sta      $E9                           ; 0x1e326 $E316 85 E9                   ;
sta      $00                           ; 0x1e328 $E318 85 00                   ;
jsr      bank7_Set_Links_Recoil        ; 0x1e32a $E31A 20 99 E3                ; set Link's recoil
lda      $0C                           ; 0x1e32d $E31D A5 0C                   ; Code for amount of Life to lose (0-7)
asl                                    ; 0x1e32f $E31F 0A                      ;
asl                                    ; 0x1e330 $E320 0A                      ;
asl                                    ; 0x1e331 $E321 0A                      ;
adc      $0779                         ; 0x1e332 $E322 6D 79 07                ; Add Life Power (1-8)
tay                                    ; 0x1e335 $E325 A8                      ;
lda      LE2AE,y                       ; 0x1e336 $E326 B9 AE E2                ; refer to table at 1E2AF (Enemy Damage)
ldy      $070F                         ; 0x1e339 $E329 AC 0F 07                ; Color of Link after Shield Spell
beq      LE32F                         ; 0x1e33c $E32C F0 01                   ;
lsr                                    ; 0x1e33e $E32E 4A                      ; Divide by 2 (if Shield is cast)
LE32F                                                                          ;
sta      $0C                           ; 0x1e33f $E32F 85 0C                   ;
lda      $0774                         ; 0x1e341 $E331 AD 74 07                ; Current Life left in meter
sec                                    ; 0x1e344 $E334 38                      ;
sbc      $0C                           ; 0x1e345 $E335 E5 0C                   ;
sta      $0774                         ; 0x1e347 $E337 8D 74 07                ;; Hit Points; Current Life left in meter
lda      $074F                         ; 0x1e34a $E33A AD 4F 07                ;; Related to Pause Pane
ora      #$40                          ; 0x1e34d $E33D 09 40                   ; set bits  .x.. ....
sta      $074F                         ; 0x1e34f $E33F 8D 4F 07                ;; Related to Pause Pane
bcs      LE34C                         ; 0x1e352 $E342 B0 08                   ;
lda      #$00                          ; 0x1e354 $E344 A9 00                   ; A = 00
sta      $0774                         ; 0x1e356 $E346 8D 74 07                ; Current Life left in meter
inc      $0494                         ; 0x1e359 $E349 EE 94 04                ;kill link
LE34C                                                                          ;
lda      #$20                          ; 0x1e35c $E34C A9 20                   ; A = 20
sta      $050C                         ; 0x1e35e $E34E 8D 0C 05                ; Timer for Link being in injured state
lda      #$04                          ; 0x1e361 $E351 A9 04                   ; A = 04
sta      $0518                         ; 0x1e363 $E353 8D 18 05                ; Timer for Link being immune (0 = vulnerable)
lda      #$00                          ; 0x1e366 $E356 A9 00                   ; A = 00
sta      $0400                         ; 0x1e368 $E358 8D 00 04                ; Sword slash frame code
lda      $A7                           ; 0x1e36b $E35B A5 A7                   ;;collision bits for Link - 0000ABLR (above,below,left,right)
and      #$FB                          ; 0x1e36d $E35D 29 FB                   ; keep bits xxxx x.xx
sta      $A7                           ; 0x1e36f $E35F 85 A7                   ;;collision bits for Link - 0000ABLR (above,below,left,right)
lda      #$FE                          ; 0x1e371 $E361 A9 FE                   ; A = FE
sta      $057D                         ; 0x1e373 $E363 8D 7D 05                ; Link's Y Velocity when hit
sec                                    ; 0x1e376 $E366 38                      ;
rts                                    ; 0x1e377 $E367 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE368                                                                          ;
clc                                    ; 0x1e378 $E368 18                      ;
LE369                                                                          ;
rts                                    ; 0x1e379 $E369 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Table_for_various_recoil_variables                                       ;
;0C = recoil when hit by Flying Blade - Facing left                            ;
;F4 = recoil when hit by Flying Blade - Facing right                           ;
;0C =                                                                          ;
;04 = recoil when Link is hit on shield, when Link hits - Facing left          ;
;FC = recoil when Link is hit on shield, when Link hits - Facing right         ;
;                                                                              ;
;Doesn't apply to all enemies                                                  ;
;Mostly ground enemies with weapons, but also Moa                              ;
;                                                                              ;
;0D = X Velocity when Link is hit - Facing left                                ;
;F3 = X Velocity when Link is hit - Facing right                               ;
;                                                                              ;
;This applies to being hit by the enemy itself, but not its weapon             ;
.byt    $0C,$F4                        ; 0x1e37a $E36A 0C F4                   ;
LE36C                                                                          ;
.byt    $0C,$04,$FC,$0D,$F3            ; 0x1e37c $E36C 0C 04 FC 0D F3          ;
; ---------------------------------------------------------------------------- ;
bank7_code37                                                                   ;
lda      #$00                          ; 0x1e381 $E371 A9 00                   ; A = 00
sta      $00                           ; 0x1e383 $E373 85 00                   ;
lda      $0B                           ; 0x1e385 $E375 A5 0B                   ;
bne      LE381                         ; 0x1e387 $E377 D0 08                   ;
lda      #$18                          ; 0x1e389 $E379 A9 18                   ; A = 18
sta      $0502                         ; 0x1e38b $E37B 8D 02 05                ;; Timer
jsr      bank7_Set_Links_Recoil        ; 0x1e38e $E37E 20 99 E3                ;
LE381                                                                          ;
lda      $60,x                         ; 0x1e391 $E381 B5 60                   ;; Enemy facing direction
pha                                    ; 0x1e393 $E383 48                      ;
jsr      bank7_Determine_Enemy_Facing_Direction_relative_to_Link; 0x1e394 $E384 20 91 DC; Determine Enemy Facing Direction
pla                                    ; 0x1e397 $E387 68                      ;
sta      $60,x                         ; 0x1e398 $E388 95 60                   ;; Enemy facing direction
iny                                    ; 0x1e39a $E38A C8                      ;
iny                                    ; 0x1e39b $E38B C8                      ;
LE38C                                                                          ;
lda      LE369,y                       ; 0x1e39c $E38C B9 69 E3                ;
ldy      $040E,x                       ; 0x1e39f $E38F BC 0E 04                ; Enemy Hit State (0 = not in Hit State)
beq      LE395                         ; 0x1e3a2 $E392 F0 01                   ;
asl                                    ; 0x1e3a4 $E394 0A                      ;
LE395                                                                          ;
sta      $043E,x                       ; 0x1e3a5 $E395 9D 3E 04                ;
rts                                    ; 0x1e3a8 $E398 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Set_Links_Recoil                                                         ;
lda      $A7                           ; 0x1e3a9 $E399 A5 A7                   ;;collision bits for Link - 0000ABLR (above,below,left,right)
and      #$03                          ; 0x1e3ab $E39B 29 03                   ; keep bits .... ..xx
sta      $0D                           ; 0x1e3ad $E39D 85 0D                   ;
lda      $60,x                         ; 0x1e3af $E39F B5 60                   ; Enemy facing direction
pha                                    ; 0x1e3b1 $E3A1 48                      ;
jsr      bank7_Determine_Enemy_Facing_Direction_relative_to_Link; 0x1e3b2 $E3A2 20 91 DC; Determine Enemy Facing Direction
pla                                    ; 0x1e3b5 $E3A5 68                      ;
sta      $60,x                         ; 0x1e3b6 $E3A6 95 60                   ; Enemy facing direction
iny                                    ; 0x1e3b8 $E3A8 C8                      ;
cpy      $0D                           ; 0x1e3b9 $E3A9 C4 0D                   ;
beq      LE3B8                         ; 0x1e3bb $E3AB F0 0B                   ;
lda      $00                           ; 0x1e3bd $E3AD A5 00                   ;
beq      LE3B3                         ; 0x1e3bf $E3AF F0 02                   ;
LE3B1                                                                          ;
iny                                    ; 0x1e3c1 $E3B1 C8                      ;
iny                                    ; 0x1e3c2 $E3B2 C8                      ;
LE3B3                                                                          ;
lda      LE36C,y                       ; 0x1e3c3 $E3B3 B9 6C E3                ;
sta      $70                           ; 0x1e3c6 $E3B6 85 70                   ; Link's X Velocity
LE3B8                                                                          ;
rts                                    ; 0x1e3c8 $E3B8 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
lda      $12                           ; 0x1e3c9 $E3B9 A5 12                   ;; Frame Counter (ascending)
lsr                                    ; 0x1e3cb $E3BB 4A                      ;
txa                                    ; 0x1e3cc $E3BC 8A                      ;
and      #$01                          ; 0x1e3cd $E3BD 29 01                   ; keep bits .... ...x
bne      LE3C7                         ; 0x1e3cf $E3BF D0 06                   ;
php                                    ; 0x1e3d1 $E3C1 08                      ;
pla                                    ; 0x1e3d2 $E3C2 68                      ;
eor      #$01                          ; 0x1e3d3 $E3C3 49 01                   ; flip bits .... ...x
pha                                    ; 0x1e3d5 $E3C5 48                      ;
plp                                    ; 0x1e3d6 $E3C6 28                      ;
LE3C7                                                                          ;
bcs      LE3B8                         ; 0x1e3d7 $E3C7 B0 EF                   ;
jsr      LE469                         ; 0x1e3d9 $E3C9 20 69 E4                ;
ldy      $87,x                         ; 0x1e3dc $E3CC B4 87                   ; Projectile Type
lda      $6D17,y                       ; 0x1e3de $E3CE B9 17 6D                ;
and      #$C0                          ; 0x1e3e1 $E3D1 29 C0                   ; keep bits xx.. ....
cmp      #$80                          ; 0x1e3e3 $E3D3 C9 80                   ;
bne      LE3DD                         ; 0x1e3e5 $E3D5 D0 06                   ;
ldy      $0710                         ; 0x1e3e7 $E3D7 AC 10 07                ; Reflect Spell effect (01 = activated)
beq      LE442                         ; 0x1e3ea $E3DA F0 66                   ;
asl                                    ; 0x1e3ec $E3DC 0A                      ;
LE3DD                                                                          ;
sta      $D9                           ; 0x1e3ed $E3DD 85 D9                   ;; Thunder Spell modifier ?
ldy      #$02                          ; 0x1e3ef $E3DF A0 02                   ; Y = 02
lda      $77,x                         ; 0x1e3f1 $E3E1 B5 77                   ; Projectile X Velocity
beq      LE3ED                         ; 0x1e3f3 $E3E3 F0 08                   ;
bmi      LE3E8                         ; 0x1e3f5 $E3E5 30 01                   ;
dey                                    ; 0x1e3f7 $E3E7 88                      ;
LE3E8                                                                          ;
tya                                    ; 0x1e3f8 $E3E8 98                      ;
cmp      $66,x                         ; 0x1e3f9 $E3E9 D5 66                   ; Projectile facing direction
bne      LE441                         ; 0x1e3fb $E3EB D0 54                   ;
LE3ED                                                                          ;
lda      $13                           ; 0x1e3fd $E3ED A5 13                   ;; Fairy state (0 = Not in Fairy state)	faery, flip from 8=faery,0=link (set $076F to 0, then set $13 to 0)	setting 76F to ff, changes 76F to 3B which prevents changing $13 from 8 to 0
bne      LE442                         ; 0x1e3ff $E3EF D0 51                   ;
jsr      bank7_code45                  ; 0x1e401 $E3F1 20 D8 E9                ;
jsr      bank7_idem__maybe             ; 0x1e404 $E3F4 20 F9 E9                ;
bcc      LE442                         ; 0x1e407 $E3F7 90 49                   ;
lda      $D9                           ; 0x1e409 $E3F9 A5 D9                   ;; Thunder Spell modifier ?
beq      LE413                         ; 0x1e40b $E3FB F0 16                   ;
cmp      #$40                          ; 0x1e40d $E3FD C9 40                   ;
beq      bank7_code38                  ; 0x1e40f $E3FF F0 30                   ;
lda      $0710                         ; 0x1e411 $E401 AD 10 07                ; Reflect Spell effect (01 = activated)
beq      LE413                         ; 0x1e414 $E404 F0 0D                   ;
lda      #$00                          ; 0x1e416 $E406 A9 00                   ; A = 00
sta      $044C,x                       ; 0x1e418 $E408 9D 4C 04                ;
jsr      bank7_code38                  ; 0x1e41b $E40B 20 31 E4                ;
asl      $77,x                         ; 0x1e41e $E40E 16 77                   ; Projectile X Velocity
asl      $77,x                         ; 0x1e420 $E410 16 77                   ; Projectile X Velocity
rts                                    ; 0x1e422 $E412 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE413                                                                          ;
ldy      $87,x                         ; 0x1e423 $E413 B4 87                   ; Projectile Type
lda      $6D17,y                       ; 0x1e425 $E415 B9 17 6D                ;
ldy      #$10                          ; 0x1e428 $E418 A0 10                   ; Y = 10 (sound for absorbed projectile)
and      #$10                          ; 0x1e42a $E41A 29 10                   ; keep bits ...x ....
beq      LE424                         ; 0x1e42c $E41C F0 06                   ;
lda      #$02                          ; 0x1e42e $E41E A9 02                   ; A = 02
sta      $EC                           ; 0x1e430 $E420 85 EC                   ; Sound Effects Type 1
ldy      #$00                          ; 0x1e432 $E422 A0 00                   ; Y = 00
LE424                                                                          ;
sty      $EE                           ; 0x1e434 $E424 84 EE                   ; Sound Effects Type 3
dec      $30,x                         ; 0x1e436 $E426 D6 30                   ;; Projectile Y Position
dec      $30,x                         ; 0x1e438 $E428 D6 30                   ;; Projectile Y Position
lda      #$F2                          ; 0x1e43a $E42A A9 F2                   ; A = F2
sta      $87,x                         ; 0x1e43c $E42C 95 87                   ;; Projectile Type
LE42E                                                                          ;
rts                                    ; 0x1e43e $E42E 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_table23                                                                  ;
.byt    $F8,$08                        ; 0x1e43f $E42F F8 08                   ;
; ---------------------------------------------------------------------------- ;
bank7_code38                                                                   ;
lda      #$10                          ; 0x1e441 $E431 A9 10                   ; A = 10
sta      $EE                           ; 0x1e443 $E433 85 EE                   ; Sound Effects Type 3
ldy      $66,x                         ; 0x1e445 $E435 B4 66                   ; Projectile facing direction
lda      LE42E,y                       ; 0x1e447 $E437 B9 2E E4                ;
sta      $77,x                         ; 0x1e44a $E43A 95 77                   ; Projectile X Velocity
lda      #$F8                          ; 0x1e44c $E43C A9 F8                   ; A = F8 (Y Velocity after shield hit)
sta      $0584,x                       ; 0x1e44e $E43E 9D 84 05                ; Projectile Y Velocity
LE441                                                                          ;
rts                                    ; 0x1e451 $E441 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE442                                                                          ;
jsr      bank7_code43                  ; 0x1e452 $E442 20 75 E9                ;
jsr      bank7_idem__maybe             ; 0x1e455 $E445 20 F9 E9                ;
bcc      LE441                         ; 0x1e458 $E448 90 F7                   ;
ldy      $87,x                         ; 0x1e45a $E44A B4 87                   ; Projectile Type
lda      $6D17,y                       ; 0x1e45c $E44C B9 17 6D                ;
and      #$20                          ; 0x1e45f $E44F 29 20                   ; keep bits ..x. ....
bne      LE457                         ; 0x1e461 $E451 D0 04                   ;
lda      #$00                          ; 0x1e463 $E453 A9 00                   ; A = 00
sta      $87,x                         ; 0x1e465 $E455 95 87                   ;; Projectile Type
LE457                                                                          ;
lda      $0518                         ; 0x1e467 $E457 AD 18 05                ;; Invulnerable Timeout (01-02 - Blinking, 03+ - Not Blinking); Timer for Link being immune from attacks
bne      LE441                         ; 0x1e46a $E45A D0 E5                   ;
lda      $6D17,y                       ; 0x1e46c $E45C B9 17 6D                ;
and      #$07                          ; 0x1e46f $E45F 29 07                   ; keep bits .... .xxx
jsr      LE30D                         ; 0x1e471 $E461 20 0D E3                ;
ldy      $66,x                         ; 0x1e474 $E464 B4 66                   ;; Projectile facing direction
jmp      LE3B1                         ; 0x1e476 $E466 4C B1 E3                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE469                                                                          ;
ldy      $87,x                         ; 0x1e479 $E469 B4 87                   ; Projectile Type
lda      $6D17,y                       ; 0x1e47b $E46B B9 17 6D                ;
ldy      #$03                          ; 0x1e47e $E46E A0 03                   ; Y = 03
and      #$08                          ; 0x1e480 $E470 29 08                   ; keep bits .... x...
beq      LE476                         ; 0x1e482 $E472 F0 02                   ;
ldy      #$0A                          ; 0x1e484 $E474 A0 0A                   ; Y = 0A
LE476                                                                          ;
sty      $06                           ; 0x1e486 $E476 84 06                   ;
lda      $30,x                         ; 0x1e488 $E478 B5 30                   ;; Projectile Y Position
clc                                    ; 0x1e48a $E47A 18                      ;
adc      #$07                          ; 0x1e48b $E47B 69 07                   ;
sta      $05                           ; 0x1e48d $E47D 85 05                   ;
lda      #$02                          ; 0x1e48f $E47F A9 02                   ; A = 02
sta      $07                           ; 0x1e491 $E481 85 07                   ;
lda      $CE                           ; 0x1e493 $E483 A5 CE                   ;
clc                                    ; 0x1e495 $E485 18                      ;
adc      #$03                          ; 0x1e496 $E486 69 03                   ;
sta      $04                           ; 0x1e498 $E488 85 04                   ;
rts                                    ; 0x1e49a $E48A 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE48B                                                                          ;
lda      $B6,x                         ; 0x1e49b $E48B B5 B6                   ; Generated Enemy Slot
cmp      #$01                          ; 0x1e49d $E48D C9 01                   ;
bne      LE4BB                         ; 0x1e49f $E48F D0 2A                   ;
lda      $040E,x                       ; 0x1e4a1 $E491 BD 0E 04                ; Enemy Hit State (0 = not in Hit State)
bne      LE4BB                         ; 0x1e4a4 $E494 D0 25                   ;
ldy      #$01                          ; 0x1e4a6 $E496 A0 01                   ; Y = 01
LE498                                                                          ;
sty      $11                           ; 0x1e4a8 $E498 84 11                   ;
lda      $8D,y                         ; 0x1e4aa $E49A B9 8D 00                ; Flying Blade/Flame slot
beq      LE4B8                         ; 0x1e4ad $E49D F0 19                   ;
bmi      LE4B8                         ; 0x1e4af $E49F 30 17                   ;
jsr      LE4BC                         ; 0x1e4b1 $E4A1 20 BC E4                ;
lda      #$01                          ; 0x1e4b4 $E4A4 A9 01                   ; A = 01
sta      $0B                           ; 0x1e4b6 $E4A6 85 0B                   ;
jsr      LE694                         ; 0x1e4b8 $E4A8 20 94 E6                ;
ldy      $11                           ; 0x1e4bb $E4AB A4 11                   ;
bcc      LE4B8                         ; 0x1e4bd $E4AD 90 09                   ;
lda      $6D,y                         ; 0x1e4bf $E4AF B9 6D 00                ;
tay                                    ; 0x1e4c2 $E4B2 A8                      ;
jmp      LE38C                         ; 0x1e4c3 $E4B3 4C 8C E3                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
ldy      $11                           ; 0x1e4c6 $E4B6 A4 11                   ;
LE4B8                                                                          ;
dey                                    ; 0x1e4c8 $E4B8 88                      ;
bpl      LE498                         ; 0x1e4c9 $E4B9 10 DD                   ;
LE4BB                                                                          ;
rts                                    ; 0x1e4cb $E4BB 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE4BC                                                                          ;
lda      $5A,y                         ; 0x1e4cc $E4BC B9 5A 00                ; Flying Blade/Flame X Position (low byte)
sec                                    ; 0x1e4cf $E4BF 38                      ;
sbc      $072C                         ; 0x1e4d0 $E4C0 ED 2C 07                ; Scrolling Offset Low Byte
clc                                    ; 0x1e4d3 $E4C3 18                      ;
adc      #$02                          ; 0x1e4d4 $E4C4 69 02                   ;
sta      $00                           ; 0x1e4d6 $E4C6 85 00                   ;
lda      #$04                          ; 0x1e4d8 $E4C8 A9 04                   ; A = 04
sta      $02                           ; 0x1e4da $E4CA 85 02                   ;
lda      $36,y                         ; 0x1e4dc $E4CC B9 36 00                ; Flying Blade/Flame Y Position
clc                                    ; 0x1e4df $E4CF 18                      ;
adc      #$04                          ; 0x1e4e0 $E4D0 69 04                   ;
sta      $01                           ; 0x1e4e2 $E4D2 85 01                   ;
lda      #$06                          ; 0x1e4e4 $E4D4 A9 06                   ; A = 06
sta      $03                           ; 0x1e4e6 $E4D6 85 03                   ;
rts                                    ; 0x1e4e8 $E4D8 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE4D9                                                                          ;
lda      $A1,x                         ; 0x1e4e9 $E4D9 B5 A1                   ; Enemy Code
cmp      #$13                          ; 0x1e4eb $E4DB C9 13                   ; 13 = Elevator
beq      LE4F7                         ; 0x1e4ed $E4DD F0 18                   ;
ldy      $0707                         ; 0x1e4ef $E4DF AC 07 07                ; Current World
dey                                    ; 0x1e4f2 $E4E2 88                      ;
cpy      #$02                          ; 0x1e4f3 $E4E3 C0 02                   ;
bcc      LE4F7                         ; 0x1e4f5 $E4E5 90 10                   ;
lda      $12                           ; 0x1e4f7 $E4E7 A5 12                   ;; Frame Counter (ascending)
lsr                                    ; 0x1e4f9 $E4E9 4A                      ;
txa                                    ; 0x1e4fa $E4EA 8A                      ;
and      #$01                          ; 0x1e4fb $E4EB 29 01                   ; keep bits .... ...x
bne      LE4F5                         ; 0x1e4fd $E4ED D0 06                   ;
php                                    ; 0x1e4ff $E4EF 08                      ;
pla                                    ; 0x1e500 $E4F0 68                      ;
eor      #$01                          ; 0x1e501 $E4F1 49 01                   ; flip bits .... ...x
pha                                    ; 0x1e503 $E4F3 48                      ;
plp                                    ; 0x1e504 $E4F4 28                      ;
LE4F5                                                                          ;
bcs      LE54F                         ; 0x1e505 $E4F5 B0 58                   ;
LE4F7                                                                          ;
lda      $B6,x                         ; 0x1e507 $E4F7 B5 B6                   ; Generated Enemy Slot
cmp      #$01                          ; 0x1e509 $E4F9 C9 01                   ;
bne      LE54F                         ; 0x1e50b $E4FB D0 52                   ;
lda      $040E,x                       ; 0x1e50d $E4FD BD 0E 04                ; Enemy Hit State (0 = not in Hit State)
bne      LE54F                         ; 0x1e510 $E500 D0 4D                   ;
lda      $C8                           ; 0x1e512 $E502 A5 C8                   ;; go outside: set $c8 to 3
and      #$06                          ; 0x1e514 $E504 29 06                   ; keep bits .... .xx.
asl                                    ; 0x1e516 $E506 0A                      ;
ora      $C9                           ; 0x1e517 $E507 05 C9                   ;
and      #$FC                          ; 0x1e519 $E509 29 FC                   ; keep bits xxxx xx..
bne      LE54F                         ; 0x1e51b $E50B D0 42                   ;
jsr      LE942                         ; 0x1e51d $E50D 20 42 E9                ;
jsr      bank7_code43                  ; 0x1e520 $E510 20 75 E9                ;
jsr      bank7_idem__maybe             ; 0x1e523 $E513 20 F9 E9                ;
bcc      LE54F                         ; 0x1e526 $E516 90 37                   ;
lda      $A8,x                         ; 0x1e528 $E518 B5 A8                   ; Enemy State ?
ora      #$10                          ; 0x1e52a $E51A 09 10                   ; set  bits ...x ....
sta      $A8,x                         ; 0x1e52c $E51C 95 A8                   ;; Enemy State
lda      $A1,x                         ; 0x1e52e $E51E B5 A1                   ; Enemy Code
cmp      #$01                          ; 0x1e530 $E520 C9 01                   ; 01 = Red Jar
bne      LE555                         ; 0x1e532 $E522 D0 31                   ;
lda      $AF,x                         ; 0x1e534 $E524 B5 AF                   ;; Various enemy state variables
and      #$7F                          ; 0x1e536 $E526 29 7F                   ; keep bits .xxx xxxx
cmp      #$08                          ; 0x1e538 $E528 C9 08                   ;
bcc      LE538                         ; 0x1e53a $E52A 90 0C                   ;
cmp      #$0E                          ; 0x1e53c $E52C C9 0E                   ;
bcc      LE555                         ; 0x1e53e $E52E 90 25                   ;
cmp      #$10                          ; 0x1e540 $E530 C9 10                   ;
beq      LE555                         ; 0x1e542 $E532 F0 21                   ;
cmp      #$11                          ; 0x1e544 $E534 C9 11                   ;
beq      LE555                         ; 0x1e546 $E536 F0 1D                   ;
LE538                                                                          ;
jsr      bank7_get_item                ; 0x1e548 $E538 20 71 E7                ;
lda      #$70                          ; 0x1e54b $E53B A9 70                   ; A = 70
sta      $049C                         ; 0x1e54d $E53D 8D 9C 04                ;;hold item above head: timer
lda      #$00                          ; 0x1e550 $E540 A9 00                   ; A = 00
sta      $057D                         ; 0x1e552 $E542 8D 7D 05                ; Link's Y Velocity
sta      $70                           ; 0x1e555 $E545 85 70                   ; Link's X Velocity
lda      $AF,x                         ; 0x1e557 $E547 B5 AF                   ;; Various enemy state variables
and      #$7F                          ; 0x1e559 $E549 29 7F                   ; keep bits .xxx xxxx
sta      $049D                         ; 0x1e55b $E54B 8D 9D 04                ; Related to Palace Item
rts                                    ; 0x1e55e $E54E 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE54F                                                                          ;
lda      $A8,x                         ; 0x1e55f $E54F B5 A8                   ; Enemy State ?
and      #$EF                          ; 0x1e561 $E551 29 EF                   ; keep bits xxx. xxxx
sta      $A8,x                         ; 0x1e563 $E553 95 A8                   ;; Enemy State
LE555                                                                          ;
rts                                    ; 0x1e565 $E555 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Table_for_X_Velocity_when_Link_is_hit_                                   ;
.byt    $18,$E8                        ; 0x1e566 $E556 18 E8                   ;
; ---------------------------------------------------------------------------- ;
bank7_code39                                                                   ;
lda      $0710                         ; 0x1e568 $E558 AD 10 07                ; Reflect Spell effect
bne      LE563                         ; 0x1e56b $E55B D0 06                   ;
lda      $A1,x                         ; 0x1e56d $E55D B5 A1                   ; Enemy Code
cmp      #$17                          ; 0x1e56f $E55F C9 17                   ; 17 = Orange Daira
bcs      LE579                         ; 0x1e571 $E561 B0 16                   ;
LE563                                                                          ;
jsr      bank7_check_if_shield_protects_from_sword_hit; 0x1e573 $E563 20 F3 E5 ; check if shield protects from sword hit
jsr      bank7_code45                  ; 0x1e576 $E566 20 D8 E9                ; idem ?
jsr      bank7_idem__maybe             ; 0x1e579 $E569 20 F9 E9                ; idem ?
bcc      LE579                         ; 0x1e57c $E56C 90 0B                   ; if Carry set, shield protects
lda      #$02                          ; 0x1e57e $E56E A9 02                   ; A = 02 (sound of enemy sword hit shield)
sta      $EC                           ; 0x1e580 $E570 85 EC                   ;; Sound Effects Type 1; Sound Effects Type 1
lda      #$00                          ; 0x1e582 $E572 A9 00                   ; A = 00
sta      $0B                           ; 0x1e584 $E574 85 0B                   ;
jmp      bank7_code37                  ; 0x1e586 $E576 4C 71 E3                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE579                                                                          ;
jsr      bank7_check_if_shield_protects_from_sword_hit; 0x1e589 $E579 20 F3 E5 ;
jsr      bank7_code43                  ; 0x1e58c $E57C 20 75 E9                ;
jsr      bank7_idem__maybe             ; 0x1e58f $E57F 20 F9 E9                ;
bcc      LE5F2                         ; 0x1e592 $E582 90 6E                   ; if Carry set, Link is hit (sword or spike)
jsr      bank7_Link_Hit_Routine        ; 0x1e594 $E584 20 EF E2                ; Link Hit Routine
bcc      LE59B                         ; 0x1e597 $E587 90 12                   ;
lda      $0444,x                       ; 0x1e599 $E589 BD 44 04                ;; Enemy Vulnerability, for example: horsehead and helmethead have =2, which prevents hit-with-sword in body and feet, but not head
cmp      #$02                          ; 0x1e59c $E58C C9 02                   ;
bcc      LE59B                         ; 0x1e59e $E58E 90 0B                   ;
asl      $057D                         ; 0x1e5a0 $E590 0E 7D 05                ; Link's Y Velocity * 2 (hit by strong boss)
jsr      bank7_Determine_Enemy_Facing_Direction_relative_to_Link; 0x1e5a3 $E593 20 91 DC; Determine Enemy Facing Direction
lda      bank7_Table_for_X_Velocity_when_Link_is_hit_,y; 0x1e5a6 $E596 B9 56 E5;
sta      $70                           ; 0x1e5a9 $E599 85 70                   ; Link's X Velocity
LE59B                                                                          ;
rts                                    ; 0x1e5ab $E59B 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Related_to_Ironknuckle_Shield_protection                                 ;
.byt    $12,$00,$05,$10,$05,$02,$02    ; 0x1e5ac $E59C 12 00 05 10 05 02 02    ;
LE5A3                                                                          ;
.byt    $08,$0D,$20,$10,$20,$0D,$10    ; 0x1e5b3 $E5A3 08 0D 20 10 20 0D 10    ;
LE5AA                                                                          ;
.byt    $00,$00,$00,$FC,$00,$FF,$02    ; 0x1e5ba $E5AA 00 00 00 FC 00 FF 02    ;
LE5B1                                                                          ;
.byt    $02,$02,$10,$18,$0F,$12        ; 0x1e5c1 $E5B1 02 02 10 18 0F 12       ;
LE5B7                                                                          ;
.byt    $14,$F0,$00                    ; 0x1e5c7 $E5B7 14 F0 00                ;
; ---------------------------------------------------------------------------- ;
bank7_code40                                                                   ;
lda      $2A,x                         ; 0x1e5ca $E5BA B5 2A                   ; Enemy Y Position
ldy      $0444,x                       ; 0x1e5cc $E5BC BC 44 04                ; Enemy Vulnerability
clc                                    ; 0x1e5cf $E5BF 18                      ;
adc      bank7_Related_to_Ironknuckle_Shield_protection,y; 0x1e5d0 $E5C0 79 9C E5;
sta      $05                           ; 0x1e5d3 $E5C3 85 05                   ;
lda      LE5A3,y                       ; 0x1e5d5 $E5C5 B9 A3 E5                ;
sta      $07                           ; 0x1e5d8 $E5C8 85 07                   ;
lda      $CD                           ; 0x1e5da $E5CA A5 CD                   ;
adc      LE5AA,y                       ; 0x1e5dc $E5CC 79 AA E5                ;
sta      $04                           ; 0x1e5df $E5CF 85 04                   ;
lda      LE5B1,y                       ; 0x1e5e1 $E5D1 B9 B1 E5                ;
sta      $06                           ; 0x1e5e4 $E5D4 85 06                   ;
cpy      #$02                          ; 0x1e5e6 $E5D6 C0 02                   ;
bcs      LE5E5                         ; 0x1e5e8 $E5D8 B0 0B                   ;
lda      $60,x                         ; 0x1e5ea $E5DA B5 60                   ;; Enemy facing direction
lsr                                    ; 0x1e5ec $E5DC 4A                      ;
bcc      LE5E5                         ; 0x1e5ed $E5DD 90 06                   ;
lda      $04                           ; 0x1e5ef $E5DF A5 04                   ;
adc      #$0D                          ; 0x1e5f1 $E5E1 69 0D                   ;
sta      $04                           ; 0x1e5f3 $E5E3 85 04                   ;
LE5E5                                                                          ;
cpy      #$04                          ; 0x1e5f5 $E5E5 C0 04                   ;
bne      LE5F2                         ; 0x1e5f7 $E5E7 D0 09                   ;
ldy      $60,x                         ; 0x1e5f9 $E5E9 B4 60                   ;; Enemy facing direction
lda      $04                           ; 0x1e5fb $E5EB A5 04                   ;
adc      LE5B7,y                       ; 0x1e5fd $E5ED 79 B7 E5                ;
sta      $04                           ; 0x1e600 $E5F0 85 04                   ;
LE5F2                                                                          ;
rts                                    ; 0x1e602 $E5F2 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_check_if_shield_protects_from_sword_hit                                  ;
ldy      $91,x                         ; 0x1e603 $E5F3 B4 91                   ;
lda      $0210,y                       ; 0x1e605 $E5F5 B9 10 02                ;
clc                                    ; 0x1e608 $E5F8 18                      ;
adc      #$09                          ; 0x1e609 $E5F9 69 09                   ;
sta      $05                           ; 0x1e60b $E5FB 85 05                   ;
lda      #$01                          ; 0x1e60d $E5FD A9 01                   ; A = 01
sta      $07                           ; 0x1e60f $E5FF 85 07                   ;
lda      $0213,y                       ; 0x1e611 $E601 B9 13 02                ;
sta      $04                           ; 0x1e614 $E604 85 04                   ;
lda      #$0E                          ; 0x1e616 $E606 A9 0E                   ; A = 0E
sta      $06                           ; 0x1e618 $E608 85 06                   ;
lda      $04                           ; 0x1e61a $E60A A5 04                   ;
adc      $06                           ; 0x1e61c $E60C 65 06                   ;
bcc      LE616                         ; 0x1e61e $E60E 90 06                   ;
lda      $04                           ; 0x1e620 $E610 A5 04                   ;
eor      #$FF                          ; 0x1e622 $E612 49 FF                   ; flip all bits
sta      $06                           ; 0x1e624 $E614 85 06                   ;
LE616                                                                          ;
rts                                    ; 0x1e626 $E616 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
lda      $C8                           ; 0x1e627 $E617 A5 C8                   ;; go outside: set $c8 to 3
asl                                    ; 0x1e629 $E619 0A                      ;
and      #$0C                          ; 0x1e62a $E61A 29 0C                   ; keep bits .... xx..
ora      $C9                           ; 0x1e62c $E61C 05 C9                   ;
and      #$FC                          ; 0x1e62e $E61E 29 FC                   ; keep bits xxxx xx..
bne      LE616                         ; 0x1e630 $E620 D0 F4                   ;
lda      $2A,x                         ; 0x1e632 $E622 B5 2A                   ; Enemy Y Position
adc      #$10                          ; 0x1e634 $E624 69 10                   ;
cmp      #$30                          ; 0x1e636 $E626 C9 30                   ;
bcc      LE616                         ; 0x1e638 $E628 90 EC                   ;
jsr      bank7_code40                  ; 0x1e63a $E62A 20 BA E5                ;
ldy      #$01                          ; 0x1e63d $E62D A0 01                   ; Y = 01
LE62F                                                                          ;
sty      $11                           ; 0x1e63f $E62F 84 11                   ;
lda      $8D,y                         ; 0x1e641 $E631 B9 8D 00                ; Flying Blade/Flame slot
beq      LE649                         ; 0x1e644 $E634 F0 13                   ;
bmi      LE649                         ; 0x1e646 $E636 30 11                   ;
jsr      LE4BC                         ; 0x1e648 $E638 20 BC E4                ;
jsr      bank7_idem__maybe             ; 0x1e64b $E63B 20 F9 E9                ;
ldy      $11                           ; 0x1e64e $E63E A4 11                   ;
bcc      LE649                         ; 0x1e650 $E640 90 07                   ;
lda      #$02                          ; 0x1e652 $E642 A9 02                   ; 02 = sound of enemy sword hit shield
sta      $EC                           ; 0x1e654 $E644 85 EC                   ;      or Flying Blade/Flame hit shield
jsr      LE6E8                         ; 0x1e656 $E646 20 E8 E6                ;
LE649                                                                          ;
dey                                    ; 0x1e659 $E649 88                      ;
bpl      LE62F                         ; 0x1e65a $E64A 10 E3                   ;
jsr      bank7_code44                  ; 0x1e65c $E64C 20 A2 E9                ;
jsr      bank7_idem__maybe             ; 0x1e65f $E64F 20 F9 E9                ;
bcc      LE616                         ; 0x1e662 $E652 90 C2                   ;
LE654                                                                          ;
lda      #$02                          ; 0x1e664 $E654 A9 02                   ; 02 = sound of enemy sword hit shield
sta      $EC                           ; 0x1e666 $E656 85 EC                   ;; Sound Effects Type 1; Sound Effects Type 1
lda      #$00                          ; 0x1e668 $E658 A9 00                   ; A = 00
sta      $0B                           ; 0x1e66a $E65A 85 0B                   ;
pla                                    ; 0x1e66c $E65C 68                      ;
pla                                    ; 0x1e66d $E65D 68                      ;
lda      $80                           ; 0x1e66e $E65E A5 80                   ; Current Animation Frame for Link
cmp      #$09                          ; 0x1e670 $E660 C9 09                   ; 09 = Down Stab
bne      LE66A                         ; 0x1e672 $E662 D0 06                   ;
lda      #$FE                          ; 0x1e674 $E664 A9 FE                   ; A = FE
sta      $057D                         ; 0x1e676 $E666 8D 7D 05                ; Y Velocity after downstabing an armored enemy
rts                                    ; 0x1e679 $E669 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE66A                                                                          ;
LE66C     = * + $0002                                                          ;
jmp      bank7_code37                  ; 0x1e67a $E66A 4C 71 E3                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Attack_Power_for_8_Levels                                                ;
.byt    $02,$03,$04,$06,$09,$0C,$12,$18; 0x1e67d $E66D 02 03 04 06 09 0C 12 18 ;Attack Power for 8 Levels (8 bytes)
.byt    $32                            ; 0x1e685 $E675 32                      ;Attack Power for Thunder spell
                                                                               ;
.byt    $E0                            ; 0x1e686 $E676 E0                      ;???
; ---------------------------------------------------------------------------- ;
bank7_Sword_Hit_Detection_maybe__probably_part_of_it_at_least                  ;
lda      $0480                         ; 0x1e687 $E677 AD 80 04                ;
cmp      #$F8                          ; 0x1e68a $E67A C9 F8                   ;
beq      LE6A6                         ; 0x1e68c $E67C F0 28                   ;
ldy      $A1,x                         ; 0x1e68e $E67E B4 A1                   ; Enemy Code
lda      $6E41,y                       ; 0x1e690 $E680 B9 41 6E                ; Enemy Data Table in RAM (5541)
and      #$10                          ; 0x1e693 $E683 29 10                   ; keep bits ...x ....
bne      LE6A6                         ; 0x1e695 $E685 D0 1F                   ;
lda      $B6,x                         ; 0x1e697 $E687 B5 B6                   ;; Generated Enemy Slot
cmp      #$01                          ; 0x1e699 $E689 C9 01                   ;
bne      LE6A6                         ; 0x1e69b $E68B D0 19                   ;
jsr      bank7_code44                  ; 0x1e69d $E68D 20 A2 E9                ;
lda      #$00                          ; 0x1e6a0 $E690 A9 00                   ; A = 00
sta      $0B                           ; 0x1e6a2 $E692 85 0B                   ;
LE694                                                                          ;
ldy      $A1,x                         ; 0x1e6a4 $E694 B4 A1                   ; Enemy Code
cpy      #$13                          ; 0x1e6a6 $E696 C0 13                   ; 13 = Elevator
beq      LE6AC                         ; 0x1e6a8 $E698 F0 12                   ;
cpy      #$02                          ; 0x1e6aa $E69A C0 02                   ; 02 = Locked Door
beq      LE6AC                         ; 0x1e6ac $E69C F0 0E                   ;
jsr      LE942                         ; 0x1e6ae $E69E 20 42 E9                ;
LE6A1                                                                          ;
jsr      bank7_idem__maybe             ; 0x1e6b1 $E6A1 20 F9 E9                ;
bcs      LE6AE                         ; 0x1e6b4 $E6A4 B0 08                   ;
LE6A6                                                                          ;
lda      $A8,x                         ; 0x1e6b6 $E6A6 B5 A8                   ;; Enemy State
and      #$DF                          ; 0x1e6b8 $E6A8 29 DF                   ; keep bits xx.x xxxx
sta      $A8,x                         ; 0x1e6ba $E6AA 95 A8                   ;; Enemy State
LE6AC                                                                          ;
clc                                    ; 0x1e6bc $E6AC 18                      ; Carry = 0 means sword hits nothing
LE6AD                                                                          ;
rts                                    ; 0x1e6bd $E6AD 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE6AE                                                                          ;
ldy      $A1,x                         ; 0x1e6be $E6AE B4 A1                   ; Enemy Code
lda      $0B                           ; 0x1e6c0 $E6B0 A5 0B                   ;
bne      LE6BE                         ; 0x1e6c2 $E6B2 D0 0A                   ;
lda      $6DD5,y                       ; 0x1e6c4 $E6B4 B9 D5 6D                ; Enemy Attributes Table (palette, exp., etc)
and      #$20                          ; 0x1e6c7 $E6B7 29 20                   ; keep bits ..x. ....
beq      LE6BE                         ; 0x1e6c9 $E6B9 F0 03                   ; Bit 5 = 1 means no damage from sword (fire)
jmp      LE654                         ; 0x1e6cb $E6BB 4C 54 E6                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE6BE                                                                          ;
lda      $0B                           ; 0x1e6ce $E6BE A5 0B                   ;
bne      LE6CB                         ; 0x1e6d0 $E6C0 D0 09                   ;
cpy      #$01                          ; 0x1e6d2 $E6C2 C0 01                   ;
bne      LE6CB                         ; 0x1e6d4 $E6C4 D0 05                   ;
lda      $040E,x                       ; 0x1e6d6 $E6C6 BD 0E 04                ;; Enemy Hit State (0 = not in Hit State)	;	causes flashing
bne      LE6AC                         ; 0x1e6d9 $E6C9 D0 E1                   ;
LE6CB                                                                          ;
lda      $0B                           ; 0x1e6db $E6CB A5 0B                   ;
beq      LE6F3                         ; 0x1e6dd $E6CD F0 24                   ;
lda      $6DD5,y                       ; 0x1e6df $E6CF B9 D5 6D                ; Enemy Attributes Table (palette, exp., etc)
and      #$20                          ; 0x1e6e2 $E6D2 29 20                   ; keep bits ..x. ....
beq      LE6DD                         ; 0x1e6e4 $E6D4 F0 07                   ;
ldy      $11                           ; 0x1e6e6 $E6D6 A4 11                   ;
lda      $05CA,y                       ; 0x1e6e8 $E6D8 B9 CA 05                ;
bne      LE6E6                         ; 0x1e6eb $E6DB D0 09                   ;
LE6DD                                                                          ;
ldy      $A1,x                         ; 0x1e6ed $E6DD B4 A1                   ; Enemy Code
lda      $6DF9,y                       ; 0x1e6ef $E6DF B9 F9 6D                ; Another Enemy Attributes Table
and      #$20                          ; 0x1e6f2 $E6E2 29 20                   ; keep bits ..x. ....
beq      LE6F3                         ; 0x1e6f4 $E6E4 F0 0D                   ;
LE6E6                                                                          ;
ldy      $11                           ; 0x1e6f6 $E6E6 A4 11                   ;
LE6E8                                                                          ;
lda      #$00                          ; 0x1e6f8 $E6E8 A9 00                   ; A = 00
sta      $7D,y                         ; 0x1e6fa $E6EA 99 7D 00                ;
lda      #$F2                          ; 0x1e6fd $E6ED A9 F2                   ; A = F2
sta      $8D,y                         ; 0x1e6ff $E6EF 99 8D 00                ;
rts                                    ; 0x1e702 $E6F2 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE6F3                                                                          ;
lda      $80                           ; 0x1e703 $E6F3 A5 80                   ;; Controller 1 Last Poll; Current Animation Frame for Link (OW and SS)	;animation frame, powerful: can cause link to attack
cmp      #$08                          ; 0x1e705 $E6F5 C9 08                   ; 08 = Up Stab
bne      LE708                         ; 0x1e707 $E6F7 D0 0F                   ;
lda      $0B                           ; 0x1e709 $E6F9 A5 0B                   ;
bne      LE708                         ; 0x1e70b $E6FB D0 0B                   ;
lda      $29                           ; 0x1e70d $E6FD A5 29                   ; Link Y Position
cmp      $2A,x                         ; 0x1e70f $E6FF D5 2A                   ; Enemy Y Position
bcc      LE6A6                         ; 0x1e711 $E701 90 A3                   ;
lda      #$00                          ; 0x1e713 $E703 A9 00                   ; A = 00
sta      $057D                         ; 0x1e715 $E705 8D 7D 05                ; $057D = Link Jumping State ?
LE708                                                                          ;
lda      $A8,x                         ; 0x1e718 $E708 B5 A8                   ;; Enemy State
and      #$20                          ; 0x1e71a $E70A 29 20                   ; keep bits ..x. ....
bne      LE6AD                         ; 0x1e71c $E70C D0 9F                   ;
lda      $A8,x                         ; 0x1e71e $E70E B5 A8                   ;; Enemy State
ora      #$20                          ; 0x1e720 $E710 09 20                   ; set  bits ..x. ....
sta      $A8,x                         ; 0x1e722 $E712 95 A8                   ;; Enemy State
lda      $80                           ; 0x1e724 $E714 A5 80                   ;; Controller 1 Last Poll; Current Animation Frame for Link (OW and SS)	;animation frame, powerful: can cause link to attack
cmp      #$09                          ; 0x1e726 $E716 C9 09                   ; 09 = Down Stab
bne      LE723                         ; 0x1e728 $E718 D0 09                   ;
lda      $0B                           ; 0x1e72a $E71A A5 0B                   ;
bne      LE723                         ; 0x1e72c $E71C D0 05                   ;
lda      #$FE                          ; 0x1e72e $E71E A9 FE                   ; A = FE
sta      $057D                         ; 0x1e730 $E720 8D 7D 05                ; Link's Y Velocity
LE723                                                                          ;
ldy      $0777                         ; 0x1e733 $E723 AC 77 07                ; Attack Power
LE726                                                                          ;
lda      #$30                          ; 0x1e736 $E726 A9 30                   ; A = 30
sta      $040E,x                       ; 0x1e738 $E728 9D 0E 04                ;; Enemy Hit State (0 = not in Hit State)	;	causes flashing
lda      #$10                          ; 0x1e73b $E72B A9 10                   ; A = 10
sta      $ED                           ; 0x1e73d $E72D 85 ED                   ; Sound Effects Type 2
lda      $C2,x                         ; 0x1e73f $E72F B5 C2                   ; Enemy HP
sec                                    ; 0x1e741 $E731 38                      ;
sbc      LE66C,y                       ; 0x1e742 $E732 F9 6C E6                ; refer to table at $1E66C (+1)
sta      $C2,x                         ; 0x1e745 $E735 95 C2                   ;; Enemy Current HP
beq      LE74C                         ; 0x1e747 $E737 F0 13                   ; if (HP == 0)
bcc      LE74C                         ; 0x1e749 $E739 90 11                   ; or (HP is Negative) goto $1E74C (enemy dead)
lda      $A1,x                         ; 0x1e74b $E73B B5 A1                   ; Enemy Code
cmp      #$01                          ; 0x1e74d $E73D C9 01                   ; 01 = Red Jar
beq      LE755                         ; 0x1e74f $E73F F0 14                   ;
lda      $80                           ; 0x1e751 $E741 A5 80                   ;; Controller 1 Last Poll; Current Animation Frame for Link (OW and SS)	;animation frame, powerful: can cause link to attack
cmp      #$09                          ; 0x1e753 $E743 C9 09                   ;
beq      LE74A                         ; 0x1e755 $E745 F0 03                   ;
jsr      bank7_code37                  ; 0x1e757 $E747 20 71 E3                ;
LE74A                                                                          ;
sec                                    ; 0x1e75a $E74A 38                      ;
rts                                    ; 0x1e75b $E74B 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE74C                                                                          ;
ldy      $A1,x                         ; 0x1e75c $E74C B4 A1                   ; Enemy Code
cpy      #$01                          ; 0x1e75e $E74E C0 01                   ; 01 = Red Jar
beq      LE755                         ; 0x1e760 $E750 F0 03                   ;
jmp      bank7_monster_death           ; 0x1e762 $E752 4C 80 E8                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE755                                                                          ;
;item gets stabbed ?                                                           ;
lda      $AF,x                         ; 0x1e765 $E755 B5 AF                   ;; Various enemy state variables
and      #$7F                          ; 0x1e767 $E757 29 7F                   ; keep bits .xxx xxxx
cmp      #$08                          ; 0x1e769 $E759 C9 08                   ;
bcc      LE769                         ; 0x1e76b $E75B 90 0C                   ;
cmp      #$0E                          ; 0x1e76d $E75D C9 0E                   ;
bcc      bank7_get_item                ; 0x1e76f $E75F 90 10                   ;
cmp      #$10                          ; 0x1e771 $E761 C9 10                   ;
beq      bank7_get_item                ; 0x1e773 $E763 F0 0C                   ;
cmp      #$11                          ; 0x1e775 $E765 C9 11                   ;
beq      bank7_get_item                ; 0x1e777 $E767 F0 08                   ;
LE769                                                                          ;
lda      #$00                          ; 0x1e779 $E769 A9 00                   ; A = 00
sta      $040E,x                       ; 0x1e77b $E76B 9D 0E 04                ;; Enemy Hit State (0 = not in Hit State)	;	causes flashing
sta      $ED                           ; 0x1e77e $E76E 85 ED                   ;; Sound Effects Type 2; Sound Effects Type 2
rts                                    ; 0x1e780 $E770 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_get_item                                                                 ;
lda      $AF,x                         ; 0x1e781 $E771 B5 AF                   ;; Various enemy state variables
bmi      LE77D                         ; 0x1e783 $E773 30 08                   ;
lda      $3C,x                         ; 0x1e785 $E775 B5 3C                   ; Enemy X position (high byte)
tax                                    ; 0x1e787 $E777 AA                      ;
jsr      Set_Item_RAM_bit_to_0__Bits_0_3; 0x1e788 $E778 20 95 C2               ; set Item as taken in RAM
ldx      $10                           ; 0x1e78b $E77B A6 10                   ;; used as monster x register ;draw boss hp bar
LE77D                                                                          ;
lda      $AF,x                         ; 0x1e78d $E77D B5 AF                   ;; Various enemy state variables
and      #$7F                          ; 0x1e78f $E77F 29 7F                   ; keep bits .xxx xxxx
tay                                    ; 0x1e791 $E781 A8                      ;
cpy      #$08                          ; 0x1e792 $E782 C0 08                   ;
bcs      LE79A                         ; 0x1e794 $E784 B0 14                   ; check if Item Code > 8
lda      #$A0                          ; 0x1e796 $E786 A9 A0                   ; A = A0
sta      $074B                         ; 0x1e798 $E788 8D 4B 07                ; Spell Flash Counter (bit 7 set = decor flash)
lda      #$10                          ; 0x1e79b $E78B A9 10                   ; A = 10
sta      $EB                           ; 0x1e79d $E78D 85 EB                   ; Music
lda      $0785,y                       ; 0x1e79f $E78F B9 85 07                ; Have Item Y
ora      #$01                          ; 0x1e7a2 $E792 09 01                   ; set  bits .... ...x
sta      $0785,y                       ; 0x1e7a4 $E794 99 85 07                ;
LE797                                                                          ;
jmp      bank7_remove_enemy_or_item    ; 0x1e7a7 $E797 4C 47 DD                ; Remove Enemy/Item
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE79A                                                                          ;
lda      #$08                          ; 0x1e7aa $E79A A9 08                   ; A = 08
sta      $EF                           ; 0x1e7ac $E79C 85 EF                   ; Sound Effects Type 4
cpy      #$08                          ; 0x1e7ae $E79E C0 08                   ;
bne      LE7BB                         ; 0x1e7b0 $E7A0 D0 19                   ;
lda      $0728                         ; 0x1e7b2 $E7A2 AD 28 07                ; Related to boss key state
beq      LE7B5                         ; 0x1e7b5 $E7A5 F0 0E                   ;
lda      #$00                          ; 0x1e7b7 $E7A7 A9 00                   ; A = 00
sta      $0728                         ; 0x1e7b9 $E7A9 8D 28 07                ;;_728_FreezeScrolling		= $728	;1=freeze screen, prevent from exiting left/right
lda      $07FB                         ; 0x1e7bc $E7AC AD FB 07                ;
bne      LE7B5                         ; 0x1e7bf $E7AF D0 04                   ;
;                                                                              ;Restart Music after taking a key that falls after beating a boss
lda      #$02                          ; 0x1e7c1 $E7B1 A9 02                   ; A = 02 (04 = quiet version of Palace theme)
sta      $EB                           ; 0x1e7c3 $E7B3 85 EB                   ; Music
LE7B5                                                                          ;
inc      $0793                         ; 0x1e7c5 $E7B5 EE 93 07                ; Number of Keys
jmp      LE797                         ; 0x1e7c8 $E7B8 4C 97 E7                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE7BB                                                                          ;
cpy      #$0E                          ; 0x1e7cb $E7BB C0 0E                   ;
bcc      bank7_code42                  ; 0x1e7cd $E7BD 90 35                   ;
cpy      #$10                          ; 0x1e7cf $E7BF C0 10                   ;
bcs      LE80C                         ; 0x1e7d1 $E7C1 B0 49                   ;
;Item is Magic (0E) or Heart (0F) Container                                    ;
lda      #$10                          ; 0x1e7d3 $E7C3 A9 10                   ; A = 10
sta      $EB                           ; 0x1e7d5 $E7C5 85 EB                   ; Music
lda      #$00                          ; 0x1e7d7 $E7C7 A9 00                   ; A = 00
sta      $EF                           ; 0x1e7d9 $E7C9 85 EF                   ; Sound Effects Type 4
tya                                    ; 0x1e7db $E7CB 98                      ;
tax                                    ; 0x1e7dc $E7CC AA                      ;
inc      $0775,x                       ; 0x1e7dd $E7CD FE 75 07                ; 0E = Magic Containers, 0F = Heart Containers
cpx      #$0E                          ; 0x1e7e0 $E7D0 E0 0E                   ;
bne      LE7E3                         ; 0x1e7e2 $E7D2 D0 0F                   ;
ldy      $0775,x                       ; 0x1e7e4 $E7D4 BC 75 07                ;
cpy      #$07                          ; 0x1e7e7 $E7D7 C0 07                   ; check if Link has 7 Magic Containers
bcc      LE7E3                         ; 0x1e7e9 $E7D9 90 08                   ;
lda      $079D                         ; 0x1e7eb $E7DB AD 9D 07                ;; Have 7 Magic Containers (08)
ora      #$08                          ; 0x1e7ee $E7DE 09 08                   ; set  bits .... x...
sta      $079D                         ; 0x1e7f0 $E7E0 8D 9D 07                ; set bit for 7 Magic Containers (08) (Kasuto)
LE7E3                                                                          ;
tya                                    ; 0x1e7f3 $E7E3 98                      ;
asl                                    ; 0x1e7f4 $E7E4 0A                      ;
asl                                    ; 0x1e7f5 $E7E5 0A                      ;
LE7E6                                                                          ;
asl                                    ; 0x1e7f6 $E7E6 0A                      ;
asl                                    ; 0x1e7f7 $E7E7 0A                      ;
sta      $06FE,x                       ; 0x1e7f8 $E7E8 9D FE 06                ; Magic/Life to be added to Magic/Life Meter
ldx      $10                           ; 0x1e7fb $E7EB A6 10                   ;; used as monster x register ;draw boss hp bar
jmp      bank7_remove_enemy_or_item    ; 0x1e7fd $E7ED 4C 47 DD                ; Remove Enemy/Item
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_table24                                                                  ;
.byt    $07,$09,$0B,$0D                ; 0x1e800 $E7F0 07 09 0B 0D             ;
; ---------------------------------------------------------------------------- ;
bank7_code42                                                                   ;
jsr      bank7_monster_death           ; 0x1e804 $E7F4 20 80 E8                ;
lda      $AF,x                         ; 0x1e807 $E7F7 B5 AF                   ;; Various enemy state variables
and      #$7F                          ; 0x1e809 $E7F9 29 7F                   ; keep bits .xxx xxxx
tay                                    ; 0x1e80b $E7FB A8                      ;
lda      LE7E6,y                       ; 0x1e80c $E7FC B9 E6 E7                ;
sta      $0414,x                       ; 0x1e80f $E7FF 9D 14 04                ;
lda      #$08                          ; 0x1e812 $E802 A9 08                   ; A = 08
sta      $EF                           ; 0x1e814 $E804 85 EF                   ; Sound Effects Type 4
lda      #$00                          ; 0x1e816 $E806 A9 00                   ; A = 00
sta      $0504,x                       ; 0x1e818 $E808 9D 04 05                ;; Timer for Enemy
rts                                    ; 0x1e81b $E80B 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LE80C                                                                          ;
lda      #$10                          ; 0x1e81c $E80C A9 10                   ; A = 10
sta      $EB                           ; 0x1e81e $E80E 85 EB                   ; Music
lda      #$00                          ; 0x1e820 $E810 A9 00                   ; A = 00
sta      $EF                           ; 0x1e822 $E812 85 EF                   ; Sound Effects Type 4
cpy      #$12                          ; 0x1e824 $E814 C0 12                   ; 12 = Doll
bne      LE81D                         ; 0x1e826 $E816 D0 05                   ;
inc      $0700                         ; 0x1e828 $E818 EE 00 07                ; Number of Lives
bne      LE86D                         ; 0x1e82b $E81B D0 50                   ;
LE81D                                                                          ;
cpy      #$13                          ; 0x1e82d $E81D C0 13                   ; 13 = Kidnapped Child
bne      LE82B                         ; 0x1e82f $E81F D0 0A                   ;
lda      $079C                         ; 0x1e831 $E821 AD 9C 07                ;; Have collected Lost Child (20)
ora      #$20                          ; 0x1e834 $E824 09 20                   ; set  bits ..x. ....
sta      $079C                         ; 0x1e836 $E826 8D 9C 07                ;; Have collected Lost Child (20)
bne      LE86D                         ; 0x1e839 $E829 D0 42                   ;
LE82B                                                                          ;
cpy      #$14                          ; 0x1e83b $E82B C0 14                   ; 14 = Trophy
bne      LE839                         ; 0x1e83d $E82D D0 0A                   ;
lda      $0798                         ; 0x1e83f $E82F AD 98 07                ;; Trophy In Inventory (10 - Yes); Have collected Trophy (10)
ora      #$10                          ; 0x1e842 $E832 09 10                   ; set  bits ...x ....
sta      $0798                         ; 0x1e844 $E834 8D 98 07                ;; Trophy In Inventory (10 - Yes); Have collected Trophy (10)
bne      LE86D                         ; 0x1e847 $E837 D0 34                   ;
LE839                                                                          ;
cpy      #$15                          ; 0x1e849 $E839 C0 15                   ; 15 = Medicine
bne      LE847                         ; 0x1e84b $E83B D0 0A                   ;
lda      $079A                         ; 0x1e84d $E83D AD 9A 07                ;; Have collected note from Bagu (08) Medicine (40)
ora      #$40                          ; 0x1e850 $E840 09 40                   ; set bits  .x.. ....
sta      $079A                         ; 0x1e852 $E842 8D 9A 07                ;; Have collected note from Bagu (08) Medicine (40)
bne      LE86D                         ; 0x1e855 $E845 D0 26                   ;
LE847                                                                          ;
lda      #$08                          ; 0x1e857 $E847 A9 08                   ; A = 08
sta      $EF                           ; 0x1e859 $E849 85 EF                   ; Sound Effects Type 4
lda      #$00                          ; 0x1e85b $E84B A9 00                   ; A = 00
sta      $EB                           ; 0x1e85d $E84D 85 EB                   ; Music
lda      #$10                          ; 0x1e85f $E84F A9 10                   ; A = 10
sta      $05E2                         ; 0x1e861 $E851 8D E2 05                ; Amount of Magic to restore for Blue Jar
lda      $0783                         ; 0x1e864 $E854 AD 83 07                ; Number of Magic Containers
asl                                    ; 0x1e867 $E857 0A                      ;
asl                                    ; 0x1e868 $E858 0A                      ;
asl                                    ; 0x1e869 $E859 0A                      ;
asl                                    ; 0x1e86a $E85A 0A                      ;
sta      $05E3                         ; 0x1e86b $E85B 8D E3 05                ; Amount of Magic to restore for Red Jar
tya                                    ; 0x1e86e $E85E 98                      ;
sec                                    ; 0x1e86f $E85F 38                      ;
sbc      #$10                          ; 0x1e870 $E860 E9 10                   ;
tay                                    ; 0x1e872 $E862 A8                      ;
lda      $070C                         ; 0x1e873 $E863 AD 0C 07                ;add 5E2 to 70C for blue jar=magic	;add 5E3 to 70D for red jar=hp
clc                                    ; 0x1e876 $E866 18                      ;
adc      $05E2,y                       ; 0x1e877 $E867 79 E2 05                ;
sta      $070C                         ; 0x1e87a $E86A 8D 0C 07                ;add to link MP
LE86D                                                                          ;
jmp      bank7_remove_enemy_or_item    ; 0x1e87d $E86D 4C 47 DD                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Table_for_Probability_for_Item_given_by_killed_enemy                     ;
.byt    $90,$90,$8A,$90,$90,$90,$90,$90; 0x1e880 $E870 90 90 8A 90 90 90 90 90 ;Weak Enemy
.byt    $91,$8C,$91,$8C,$8C,$91,$8C,$91; 0x1e888 $E878 91 8C 91 8C 8C 91 8C 91 ;Strong Enemy
; ---------------------------------------------------------------------------- ;
bank7_monster_death                                                            ;
ldy      $A1,x                         ; 0x1e890 $E880 B4 A1                   ; Enemy Code
lda      $6DD5,y                       ; 0x1e892 $E882 B9 D5 6D                ; Enemy Properties (Palette, Exp. Code, etc.)
and      #$0F                          ; 0x1e895 $E885 29 0F                   ; keep bits .... xxxx
sta      $0414,x                       ; 0x1e897 $E887 9D 14 04                ;
lda      $6DF9,y                       ; 0x1e89a $E88A B9 F9 6D                ; Enemy Vulnerability/Damage Code
and      #$C0                          ; 0x1e89d $E88D 29 C0                   ; keep bits xx.. ....
beq      LE8BF                         ; 0x1e89f $E88F F0 2E                   ; if enemy never give special items, skip
bank7_Drop_Item                                                                ;
lsr                                    ; 0x1e8a1 $E891 4A                      ;
lsr                                    ; 0x1e8a2 $E892 4A                      ;
lsr                                    ; 0x1e8a3 $E893 4A                      ;
lsr                                    ; 0x1e8a4 $E894 4A                      ;
lsr                                    ; 0x1e8a5 $E895 4A                      ;
lsr                                    ; 0x1e8a6 $E896 4A                      ;
tax                                    ; 0x1e8a7 $E897 AA                      ;
tay                                    ; 0x1e8a8 $E898 A8                      ;
inc      $05DE,x                       ; 0x1e8a9 $E899 FE DE 05                ; Current number of enemies killed for item
lda      $05DE,x                       ; 0x1e8ac $E89C BD DE 05                ;; Current number of enemies killed for magic/bag
cmp      #$06                          ; 0x1e8af $E89F C9 06                   ; Number of enemies to kill for item
bne      LE8BF                         ; 0x1e8b1 $E8A1 D0 1C                   ;
lda      #$00                          ; 0x1e8b3 $E8A3 A9 00                   ; A = 00
sta      $05DE,x                       ; 0x1e8b5 $E8A5 9D DE 05                ; Reset item counter
ldx      $10                           ; 0x1e8b8 $E8A8 A6 10                   ;; used as monster x register ;draw boss hp bar
ror      $0414,x                       ; 0x1e8ba $E8AA 7E 14 04                ;
lda      $051B,x                       ; 0x1e8bd $E8AD BD 1B 05                ; Randomizer
and      #$07                          ; 0x1e8c0 $E8B0 29 07                   ; keep bits .... .xxx
cpy      #$02                          ; 0x1e8c2 $E8B2 C0 02                   ; 02 = Strong Enemy (200P and Red Jar)
bne      LE8B8                         ; 0x1e8c4 $E8B4 D0 02                   ;
adc      #$07                          ; 0x1e8c6 $E8B6 69 07                   ; the Carry is set, so it's 8
LE8B8                                                                          ;
tay                                    ; 0x1e8c8 $E8B8 A8                      ;
lda      bank7_Table_for_Probability_for_Item_given_by_killed_enemy,y; 0x1e8c9 $E8B9 B9 70 E8;
sta      $048E,x                       ; 0x1e8cc $E8BC 9D 8E 04                ;; Dropped Item Code
LE8BF                                                                          ;
ldx      $10                           ; 0x1e8cf $E8BF A6 10                   ;; used as monster x register ;draw boss hp bar
lda      #$25                          ; 0x1e8d1 $E8C1 A9 25                   ; A = 25 (timer for kill animation)
sta      $0504,x                       ; 0x1e8d3 $E8C3 9D 04 05                ;; Timer for Enemy
lda      #$00                          ; 0x1e8d6 $E8C6 A9 00                   ; A = 00
sta      $043E,x                       ; 0x1e8d8 $E8C8 9D 3E 04                ;
lda      #$02                          ; 0x1e8db $E8CB A9 02                   ; A = 02
sta      $B6,x                         ; 0x1e8dd $E8CD 95 B6                   ; Generated Enemy Slot
lda      #$04                          ; 0x1e8df $E8CF A9 04                   ; A = 04
sta      $EF                           ; 0x1e8e1 $E8D1 85 EF                   ; Sound Effects Type 4
sec                                    ; 0x1e8e3 $E8D3 38                      ;
rts                                    ; 0x1e8e4 $E8D4 60                      ;try jmping at this point and check monster id then drop custom item	(Y=monID	X=monX register	)
                                                                               ;
; ---------------------------------------------------------------------------- ;
lda      $2A,x                         ; 0x1e8e5 $E8D5 B5 2A                   ; Enemy Y Position
sta      $05                           ; 0x1e8e7 $E8D7 85 05                   ;
lda      #$08                          ; 0x1e8e9 $E8D9 A9 08                   ; A = 08
sta      $07                           ; 0x1e8eb $E8DB 85 07                   ;
lda      $CD                           ; 0x1e8ed $E8DD A5 CD                   ;
sta      $04                           ; 0x1e8ef $E8DF 85 04                   ;
lda      #$08                          ; 0x1e8f1 $E8E1 A9 08                   ; A = 08
sta      $06                           ; 0x1e8f3 $E8E3 85 06                   ;
jsr      bank7_code44                  ; 0x1e8f5 $E8E5 20 A2 E9                ;
jmp      LE6A1                         ; 0x1e8f8 $E8E8 4C A1 E6                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Change_Enemy_Facing_Direction_and_X_Velocity                             ;
lda      $60,x                         ; 0x1e8fb $E8EB B5 60                   ; Enemy Facing Direction
eor      #$03                          ; 0x1e8fd $E8ED 49 03                   ; flip bits .... ..xx
sta      $60,x                         ; 0x1e8ff $E8EF 95 60                   ;; Enemy facing direction
lda      $71,x                         ; 0x1e901 $E8F1 B5 71                   ; Enemy X Velocity
eor      #$FF                          ; 0x1e903 $E8F3 49 FF                   ; flip all bits
tay                                    ; 0x1e905 $E8F5 A8                      ;
iny                                    ; 0x1e906 $E8F6 C8                      ;
sty      $71,x                         ; 0x1e907 $E8F7 94 71                   ;; Enemy X Velocity
rts                                    ; 0x1e909 $E8F9 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_UNKNOWN0                                                                 ;
.byt    $02,$0C,$03,$17,$02,$0C,$03,$0A; 0x1e90a $E8FA 02 0C 03 17 02 0C 03 0A ;
.byt    $04,$08,$0B,$03,$00,$18,$22,$08; 0x1e912 $E902 04 08 0B 03 00 18 22 08 ;
.byt    $FE,$0C,$00,$30,$00,$08,$00,$08; 0x1e91a $E90A FE 0C 00 30 00 08 00 08 ;
.byt    $03,$02,$03,$70,$00,$08,$F6,$20; 0x1e922 $E912 03 02 03 70 00 08 F6 20 ;
.byt    $0E,$04,$00,$10,$FC,$18,$10,$10; 0x1e92a $E91A 0E 04 00 10 FC 18 10 10 ;
.byt    $00,$10,$00,$18,$08,$10,$00,$30; 0x1e932 $E922 00 10 00 18 08 10 00 30 ;
.byt    $F4,$28,$00,$20,$00,$60,$00,$80; 0x1e93a $E92A F4 28 00 20 00 60 00 80 ;
.byt    $0E,$04,$10,$0E,$01,$06,$08,$03; 0x1e942 $E932 0E 04 10 0E 01 06 08 03 ;
.byt    $00,$20,$08,$18,$04,$10,$18,$18; 0x1e94a $E93A 00 20 08 18 04 10 18 18 ;
LE942                                                                          ;
.byt    $B4,$A1,$B9,$1D,$6E,$0A,$0A,$A8; 0x1e952 $E942 B4 A1 B9 1D 6E 0A 0A A8 ;
.byt    $A5,$CD,$18,$79,$FA,$E8,$85,$04; 0x1e95a $E94A A5 CD 18 79 FA E8 85 04 ;
.byt    $B9,$FB,$E8,$85,$06,$B5,$2A,$18; 0x1e962 $E952 B9 FB E8 85 06 B5 2A 18 ;
.byt    $79,$FC,$E8,$85,$05,$B9,$FD,$E8; 0x1e96a $E95A 79 FC E8 85 05 B9 FD E8 ;
.byt    $85,$07,$A5,$04,$65,$06,$90,$06; 0x1e972 $E962 85 07 A5 04 65 06 90 06 ;
.byt    $A5,$04,$49,$FF,$85,$06,$60    ; 0x1e97a $E96A A5 04 49 FF 85 06 60    ;
LE971                                                                          ;
.byt    $04,$00                        ; 0x1e981 $E971 04 00                   ;
LE973                                                                          ;
.byt    $19,$1D                        ; 0x1e983 $E973 19 1D                   ;
; ---------------------------------------------------------------------------- ;
bank7_code43                                                                   ;
lda      $CC                           ; 0x1e985 $E975 A5 CC                   ;; Link's X Position on Screen; Player X On Screen; Link's X Position on Screen
clc                                    ; 0x1e987 $E977 18                      ;
adc      #$09                          ; 0x1e988 $E978 69 09                   ;
sta      $00                           ; 0x1e98a $E97A 85 00                   ;
lda      #$0D                          ; 0x1e98c $E97C A9 0D                   ; A = 0D
sta      $02                           ; 0x1e98e $E97E 85 02                   ;
ldy      $17                           ; 0x1e990 $E980 A4 17                   ; Link's Shield Position
lda      $29                           ; 0x1e992 $E982 A5 29                   ; Link's Y Position
clc                                    ; 0x1e994 $E984 18                      ;
adc      LE971,y                       ; 0x1e995 $E985 79 71 E9                ; refer to table at $1E971
sta      $01                           ; 0x1e998 $E988 85 01                   ;
lda      LE973,y                       ; 0x1e99a $E98A B9 73 E9                ; refer to table at $1E973
sta      $03                           ; 0x1e99d $E98D 85 03                   ;
lda      $00                           ; 0x1e99f $E98F A5 00                   ;
adc      $02                           ; 0x1e9a1 $E991 65 02                   ;
bcc      LE99B                         ; 0x1e9a3 $E993 90 06                   ;
lda      $00                           ; 0x1e9a5 $E995 A5 00                   ;
eor      #$FF                          ; 0x1e9a7 $E997 49 FF                   ; flip all bits
sta      $02                           ; 0x1e9a9 $E999 85 02                   ;
LE99B                                                                          ;
rts                                    ; 0x1e9ab $E99B 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_table26                                                                  ;
.byt    $F8,$02                        ; 0x1e9ac $E99C F8 02                   ;
LE99E                                                                          ;
.byt    $07,$00                        ; 0x1e9ae $E99E 07 00                   ;
LE9A0                                                                          ;
.byt    $03,$03                        ; 0x1e9b0 $E9A0 03 03                   ;
; ---------------------------------------------------------------------------- ;
bank7_code44                                                                   ;
ldy      #$00                          ; 0x1e9b2 $E9A2 A0 00                   ; Y = 00
lda      $047E                         ; 0x1e9b4 $E9A4 AD 7E 04                ;
pha                                    ; 0x1e9b7 $E9A7 48                      ;
cmp      $CC                           ; 0x1e9b8 $E9A8 C5 CC                   ;; Link's X Position on Screen; Player X On Screen; Link's X Position on Screen
bcs      LE9AD                         ; 0x1e9ba $E9AA B0 01                   ;
iny                                    ; 0x1e9bc $E9AC C8                      ;
LE9AD                                                                          ;
pla                                    ; 0x1e9bd $E9AD 68                      ;
clc                                    ; 0x1e9be $E9AE 18                      ;
adc      bank7_table26,y               ; 0x1e9bf $E9AF 79 9C E9                ;
sta      $00                           ; 0x1e9c2 $E9B2 85 00                   ;
lda      #$0E                          ; 0x1e9c4 $E9B4 A9 0E                   ; A = 0E
sta      $02                           ; 0x1e9c6 $E9B6 85 02                   ;
ldy      #$00                          ; 0x1e9c8 $E9B8 A0 00                   ; Y = 00
lda      $80                           ; 0x1e9ca $E9BA A5 80                   ;; Controller 1 Last Poll; Current Animation Frame for Link (OW and SS)	;animation frame, powerful: can cause link to attack
cmp      #$08                          ; 0x1e9cc $E9BC C9 08                   ;
beq      LE9C4                         ; 0x1e9ce $E9BE F0 04                   ;
cmp      #$09                          ; 0x1e9d0 $E9C0 C9 09                   ;
bne      LE9C5                         ; 0x1e9d2 $E9C2 D0 01                   ;
LE9C4                                                                          ;
iny                                    ; 0x1e9d4 $E9C4 C8                      ;
LE9C5                                                                          ;
lda      $0480                         ; 0x1e9d5 $E9C5 AD 80 04                ;
clc                                    ; 0x1e9d8 $E9C8 18                      ;
adc      LE99E,y                       ; 0x1e9d9 $E9C9 79 9E E9                ;
sta      $01                           ; 0x1e9dc $E9CC 85 01                   ;
lda      LE9A0,y                       ; 0x1e9de $E9CE B9 A0 E9                ;
sta      $03                           ; 0x1e9e1 $E9D1 85 03                   ;
rts                                    ; 0x1e9e3 $E9D3 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_table27                                                                  ;
.byt    $0E,$FF                        ; 0x1e9e4 $E9D4 0E FF                   ;
LE9D6                                                                          ;
.byt    $11,$02                        ; 0x1e9e6 $E9D6 11 02                   ;
; ---------------------------------------------------------------------------- ;
bank7_code45                                                                   ;
ldy      $9F                           ; 0x1e9e8 $E9D8 A4 9F                   ;;link facedir SideScroll		; Direction arrow pressed (1 = right, 2 = left)
dey                                    ; 0x1e9ea $E9DA 88                      ;
lda      $CC                           ; 0x1e9eb $E9DB A5 CC                   ;; Link's X Position on Screen; Player X On Screen; Link's X Position on Screen
clc                                    ; 0x1e9ed $E9DD 18                      ;
adc      #$08                          ; 0x1e9ee $E9DE 69 08                   ;
clc                                    ; 0x1e9f0 $E9E0 18                      ;
adc      bank7_table27,y               ; 0x1e9f1 $E9E1 79 D4 E9                ; refer to table at $1E9D4
sta      $00                           ; 0x1e9f4 $E9E4 85 00                   ;
lda      #$05                          ; 0x1e9f6 $E9E6 A9 05                   ; A = 05
sta      $02                           ; 0x1e9f8 $E9E8 85 02                   ;
ldy      $17                           ; 0x1e9fa $E9EA A4 17                   ; Link's Shield Position
lda      $29                           ; 0x1e9fc $E9EC A5 29                   ; Link's Y Position
clc                                    ; 0x1e9fe $E9EE 18                      ;
adc      LE9D6,y                       ; 0x1e9ff $E9EF 79 D6 E9                ; refer to table at $1E9D6
sta      $01                           ; 0x1ea02 $E9F2 85 01                   ;
lda      #$0C                          ; 0x1ea04 $E9F4 A9 0C                   ; A = 0C
sta      $03                           ; 0x1ea06 $E9F6 85 03                   ;
rts                                    ; 0x1ea08 $E9F8 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_idem__maybe                                                              ;
ldx      #$01                          ; 0x1ea09 $E9F9 A2 01                   ; X = 01
LE9FB                                                                          ;
lda      $04,x                         ; 0x1ea0b $E9FB B5 04                   ;
sec                                    ; 0x1ea0d $E9FD 38                      ;
sbc      $00,x                         ; 0x1ea0e $E9FE F5 00                   ;
clc                                    ; 0x1ea10 $EA00 18                      ;
adc      $06,x                         ; 0x1ea11 $EA01 75 06                   ;
sta      $0F                           ; 0x1ea13 $EA03 85 0F                   ;
lda      $02,x                         ; 0x1ea15 $EA05 B5 02                   ;
clc                                    ; 0x1ea17 $EA07 18                      ;
adc      $06,x                         ; 0x1ea18 $EA08 75 06                   ;
cmp      $0F                           ; 0x1ea1a $EA0A C5 0F                   ;
bcc      LEA11                         ; 0x1ea1c $EA0C 90 03                   ;
dex                                    ; 0x1ea1e $EA0E CA                      ;
bpl      LE9FB                         ; 0x1ea1f $EA0F 10 EA                   ;
LEA11                                                                          ;
ldx      $10                           ; 0x1ea21 $EA11 A6 10                   ;; used as monster x register ;draw boss hp bar
rts                                    ; 0x1ea23 $EA13 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
ldy      #$1E                          ; 0x1ea24 $EA14 A0 1E                   ; Y = 1E
bne      LEA1E                         ; 0x1ea26 $EA16 D0 06                   ;
ldy      #$1E                          ; 0x1ea28 $EA18 A0 1E                   ; Y = 1E
bne      LEA24                         ; 0x1ea2a $EA1A D0 08                   ;
ldy      #$1F                          ; 0x1ea2c $EA1C A0 1F                   ; Y = 1F
LEA1E                                                                          ;
lda      $30,x                         ; 0x1ea2e $EA1E B5 30                   ; Projectile Y Position
cmp      #$90                          ; 0x1ea30 $EA20 C9 90                   ;
bcc      LEA31                         ; 0x1ea32 $EA22 90 0D                   ;
LEA24                                                                          ;
txa                                    ; 0x1ea34 $EA24 8A                      ;
clc                                    ; 0x1ea35 $EA25 18                      ;
adc      #$07                          ; 0x1ea36 $EA26 69 07                   ;
tax                                    ; 0x1ea38 $EA28 AA                      ;
jsr      bank7_Generic_Collision_Test_with_Level_Objects; 0x1ea39 $EA29 20 E8 EA;
jsr      L850C                         ; 0x1ea3c $EA2C 20 0C 85                ;
ldx      $10                           ; 0x1ea3f $EA2F A6 10                   ;; used as monster x register ;draw boss hp bar
LEA31                                                                          ;
rts                                    ; 0x1ea41 $EA31 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LEA32                                                                          ;
ldy      $A1,x                         ; 0x1ea42 $EA32 B4 A1                   ; Enemy Code
lda      $6E41,y                       ; 0x1ea44 $EA34 B9 41 6E                ;
and      #$0F                          ; 0x1ea47 $EA37 29 0F                   ; keep bits .... xxxx
sta      $09                           ; 0x1ea49 $EA39 85 09                   ;
inx                                    ; 0x1ea4b $EA3B E8                      ;
lda      $A7,x                         ; 0x1ea4c $EA3C B5 A7                   ;;collision bits for Link - 0000ABLR (above,below,left,right)
and      #$F0                          ; 0x1ea4e $EA3E 29 F0                   ; keep bits xxxx ....
sta      $A7,x                         ; 0x1ea50 $EA40 95 A7                   ;;collision bits for Link - 0000ABLR (above,below,left,right)
lda      #$15                          ; 0x1ea52 $EA42 A9 15                   ; A = 15
clc                                    ; 0x1ea54 $EA44 18                      ;
adc      $09                           ; 0x1ea55 $EA45 65 09                   ;
sta      $00                           ; 0x1ea57 $EA47 85 00                   ;
lda      #$00                          ; 0x1ea59 $EA49 A9 00                   ; A = 00
sta      $01                           ; 0x1ea5b $EA4B 85 01                   ;
jsr      LE1BE                         ; 0x1ea5d $EA4D 20 BE E1                ;
lda      #$14                          ; 0x1ea60 $EA50 A9 14                   ; A = 14
clc                                    ; 0x1ea62 $EA52 18                      ;
adc      $09                           ; 0x1ea63 $EA53 65 09                   ;
sta      $00                           ; 0x1ea65 $EA55 85 00                   ;
lda      #$00                          ; 0x1ea67 $EA57 A9 00                   ; A = 00
sta      $01                           ; 0x1ea69 $EA59 85 01                   ;
jsr      LE1BE                         ; 0x1ea6b $EA5B 20 BE E1                ;
lda      $02                           ; 0x1ea6e $EA5E A5 02                   ;
sec                                    ; 0x1ea70 $EA60 38                      ;
sbc      #$10                          ; 0x1ea71 $EA61 E9 10                   ;
sta      $044B                         ; 0x1ea73 $EA63 8D 4B 04                ;
lda      L000E                         ; 0x1ea76 $EA66 A5 0E                   ;
sta      $DA                           ; 0x1ea78 $EA68 85 DA                   ;
lda      $0F                           ; 0x1ea7a $EA6A A5 0F                   ;
sta      $DB                           ; 0x1ea7c $EA6C 85 DB                   ;
lda      #$01                          ; 0x1ea7e $EA6E A9 01                   ; A = 01
ldy      $70,x                         ; 0x1ea80 $EA70 B4 70                   ;;hspeed (Link's horizontal velocity)
bmi      LEA75                         ; 0x1ea82 $EA72 30 01                   ;
lsr                                    ; 0x1ea84 $EA74 4A                      ;
LEA75                                                                          ;
clc                                    ; 0x1ea85 $EA75 18                      ;
adc      #$10                          ; 0x1ea86 $EA76 69 10                   ;
clc                                    ; 0x1ea88 $EA78 18                      ;
adc      $09                           ; 0x1ea89 $EA79 65 09                   ;
sta      $00                           ; 0x1ea8b $EA7B 85 00                   ;
pha                                    ; 0x1ea8d $EA7D 48                      ;
lda      #$00                          ; 0x1ea8e $EA7E A9 00                   ; A = 00
sta      $01                           ; 0x1ea90 $EA80 85 01                   ;
jsr      LE1BE                         ; 0x1ea92 $EA82 20 BE E1                ;
pla                                    ; 0x1ea95 $EA85 68                      ;
clc                                    ; 0x1ea96 $EA86 18                      ;
adc      #$02                          ; 0x1ea97 $EA87 69 02                   ;
sta      $00                           ; 0x1ea99 $EA89 85 00                   ;
lda      #$00                          ; 0x1ea9b $EA8B A9 00                   ; A = 00
sta      $01                           ; 0x1ea9d $EA8D 85 01                   ;
jsr      LE1BE                         ; 0x1ea9f $EA8F 20 BE E1                ;
dex                                    ; 0x1eaa2 $EA92 CA                      ;
lda      L000E                         ; 0x1eaa3 $EA93 A5 0E                   ;
sta      $DC                           ; 0x1eaa5 $EA95 85 DC                   ;
lda      $0F                           ; 0x1eaa7 $EA97 A5 0F                   ;
sta      $DD                           ; 0x1eaa9 $EA99 85 DD                   ;
lda      $03                           ; 0x1eaab $EA9B A5 03                   ;
sta      $D9                           ; 0x1eaad $EA9D 85 D9                   ;; Thunder Spell modifier ?
rts                                    ; 0x1eaaf $EA9F 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_table28                                                                  ;
.byt    $17,$09,$17,$09,$14,$0C,$14,$0C; 0x1eab0 $EAA0 17 09 17 09 14 0C 14 0C ;
.byt    $15,$0B,$15,$0B,$12,$0E,$12,$0E; 0x1eab8 $EAA8 15 0B 15 0B 12 0E 12 0E ;
.byt    $0E,$02,$0E,$02,$08,$08,$0E,$02; 0x1eac0 $EAB0 0E 02 0E 02 08 08 0E 02 ;
.byt    $0E,$02,$08,$08,$00,$0F,$04,$04; 0x1eac8 $EAB8 0E 02 08 08 00 0F 04 04 ;
LEAC0                                                                          ;
.byt    $E6,$E6,$FA,$FA,$00,$00,$E0,$E0; 0x1ead0 $EAC0 E6 E6 FA FA 00 00 E0 E0 ;
.byt    $EC,$EC,$F0,$F0,$FA,$FA,$E8,$E8; 0x1ead8 $EAC8 EC EC F0 F0 FA FA E8 E8 ;
.byt    $E7,$E7,$F8,$F8,$00,$EA,$E5,$E5; 0x1eae0 $EAD0 E7 E7 F8 F8 00 EA E5 E5 ;
.byt    $EB,$EB,$F0,$E1,$E0,$00,$F0,$E8; 0x1eae8 $EAD8 EB EB F0 E1 E0 00 F0 E8 ;
bank7_Tables_for_generating_pointers_in_the_6000_7FFF_range                    ;
.byt    $00,$D0,$A0,$70                ; 0x1eaf0 $EAE0 00 D0 A0 70             ;6000	60D0	61A0	6270
LEAE4                                                                          ;
.byt    $60,$60,$61,$62                ; 0x1eaf4 $EAE4 60 60 61 62             ;
; ---------------------------------------------------------------------------- ;
bank7_Generic_Collision_Test_with_Level_Objects                                ;
;bank7_Generic_Collision_Test_with_Level_Objects                               ;
;sets $e $f $2 and $3	, with Y as offset: based on location of link, below his foot	;60D3	Y=B0	54B0
;----                                                                          ;
;Collision Test with Level Objects                                             ;
;Determine Collision Tile Code                                                 ;
;                                                                              ;
;$0C = Link/Enemy Y Position Offset Index ?                                    ;
;                                                                              ;
;Output                                                                        ;
;                                                                              ;
;$03 = Row Number for Tile Code                                                ;
;$02 = Column Number for Tile Code                                             ;
;$02-$03 = Address of Tile Code in the 6000-633F range                         ;
sty      $0C                           ; 0x1eaf8 $EAE8 84 0C                   ;
lda      $4D,x                         ; 0x1eafa $EAEA B5 4D                   ; Link/Enemy X position (low byte)
clc                                    ; 0x1eafc $EAEC 18                      ;
adc      bank7_table28,y               ; 0x1eafd $EAED 79 A0 EA                ;
sta      L000E                         ; 0x1eb00 $EAF0 85 0E                   ;
lda      $3B,x                         ; 0x1eb02 $EAF2 B5 3B                   ; Link/Enemy X position (high byte)
adc      #$00                          ; 0x1eb04 $EAF4 69 00                   ;
cmp      #$04                          ; 0x1eb06 $EAF6 C9 04                   ;
bcs      LEB1D                         ; 0x1eb08 $EAF8 B0 23                   ;
tay                                    ; 0x1eb0a $EAFA A8                      ;
lda      L000E                         ; 0x1eb0b $EAFB A5 0E                   ;
lsr                                    ; 0x1eb0d $EAFD 4A                      ;
lsr                                    ; 0x1eb0e $EAFE 4A                      ;
lsr                                    ; 0x1eb0f $EAFF 4A                      ;
lsr                                    ; 0x1eb10 $EB00 4A                      ;
clc                                    ; 0x1eb11 $EB01 18                      ;
adc      bank7_Tables_for_generating_pointers_in_the_6000_7FFF_range,y; 0x1eb12 $EB02 79 E0 EA;
sta      L000E                         ; 0x1eb15 $EB05 85 0E                   ;
lda      LEAE4,y                       ; 0x1eb17 $EB07 B9 E4 EA                ;
sta      $0F                           ; 0x1eb1a $EB0A 85 0F                   ;
ldy      $0C                           ; 0x1eb1c $EB0C A4 0C                   ;
lda      $29,x                         ; 0x1eb1e $EB0E B5 29                   ; Link/Enemy Y Position
clc                                    ; 0x1eb20 $EB10 18                      ;
adc      LEAC0,y                       ; 0x1eb21 $EB11 79 C0 EA                ;
and      #$F0                          ; 0x1eb24 $EB14 29 F0                   ; keep bits xxxx ....
sta      $02                           ; 0x1eb26 $EB16 85 02                   ;
tay                                    ; 0x1eb28 $EB18 A8                      ;
cpy      #$D0                          ; 0x1eb29 $EB19 C0 D0                   ;
bcc      Label_EB20                    ; 0x1eb2b $EB1B 90 03                   ;
LEB1D                                                                          ;
lda      #$40                          ; 0x1eb2d $EB1D A9 40                   ; A = 40
Label_EB20 = * + $0001                                                         ;
; read from side scroll tile data ? 6000 to 63FF                               ;
; $EB20:B1 0E    LDA ($0E),Y 	@ $6151 = #$40                                   ;
bit      $0EB1                         ; 0x1eb2f $EB1F 2C B1 0E                ;
sta      $03                           ; 0x1eb32 $EB22 85 03                   ;
rts                                    ; 0x1eb34 $EB24 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_UNKNOWN1                                                                 ;
.byt    $F5                            ; 0x1eb35 $EB25 F5                      ;Tile Mapping for Slashing Sword ?
LEB26                                                                          ;
.byt    $00                            ; 0x1eb36 $EB26 00                      ;
LEB27                                                                          ;
.byt    $02,$F5,$04,$06,$F5,$08,$0A,$F5; 0x1eb37 $EB27 02 F5 04 06 F5 08 0A F5 ;
.byt    $0C,$0E,$F5,$00,$02,$F5,$10,$12; 0x1eb3f $EB2F 0C 0E F5 00 02 F5 10 12 ;
.byt    $F5,$46,$48,$F5,$4A,$4C,$F5,$00; 0x1eb47 $EB37 F5 46 48 F5 4A 4C F5 00 ;
.byt    $02,$F5,$26,$06,$28,$2A,$30,$2C; 0x1eb4f $EB3F 02 F5 26 06 28 2A 30 2C ;
.byt    $2E,$F5,$34,$36,$38,$F5,$3A,$3C; 0x1eb57 $EB47 2E F5 34 36 38 F5 3A 3C ;
.byt    $F5,$46,$48,$4E,$50,$52,$56,$58; 0x1eb5f $EB4F F5 46 48 4E 50 52 56 58 ;
.byt    $F5,$5A,$5C,$5E,$F5,$1C,$1E,$F5; 0x1eb67 $EB57 F5 5A 5C 5E F5 1C 1E F5 ;
.byt    $20,$22,$F5,$08,$0A,$F5,$0C,$24; 0x1eb6f $EB5F 20 22 F5 08 0A F5 0C 24 ;
.byt    $28,$2A,$2C,$F5,$2E,$60,$34,$36; 0x1eb77 $EB67 28 2A 2C F5 2E 60 34 36 ;
.byt    $38,$F5,$3A,$62,$F5,$14,$16,$F5; 0x1eb7f $EB6F 38 F5 3A 62 F5 14 16 F5 ;
.byt    $18,$1A,$F5,$3E,$40,$F5,$42,$44; 0x1eb87 $EB77 18 1A F5 3E 40 F5 42 44 ;
.byt    $F5,$01,$01,$F5,$03,$03,$F5,$71; 0x1eb8f $EB7F F5 01 01 F5 03 03 F5 71 ;
.byt    $73,$F5,$75,$77,$F5,$21,$23,$F5; 0x1eb97 $EB87 73 F5 75 77 F5 21 23 F5 ;
.byt    $25,$27,$F5,$81,$83,$F5,$AD,$AF; 0x1eb9f $EB8F 25 27 F5 81 83 F5 AD AF ;
LEB97                                                                          ;
.byt    $00,$06,$0C,$18,$1E,$24,$12,$30; 0x1eba7 $EB97 00 06 0C 18 1E 24 12 30 ;
.byt    $36,$54,$4E,$5A,$60,$66,$6C,$10; 0x1ebaf $EB9F 36 54 4E 5A 60 66 6C 10 ;
.byt    $0C,$00,$04,$04                ; 0x1ebb7 $EBA7 0C 00 04 04             ;
LEBAB                                                                          ;
.byt    $00,$14                        ; 0x1ebbb $EBAB 00 14                   ;
LEBAD                                                                          ;
.byt    $EC,$0C,$08                    ; 0x1ebbd $EBAD EC 0C 08                ;
bank7_Table_for_Fairy_floating_movement                                        ;
.byt    $01,$02,$03,$04,$03,$02,$01,$00; 0x1ebc0 $EBB0 01 02 03 04 03 02 01 00 ;
; ---------------------------------------------------------------------------- ;
bank7_code47                                                                   ;
lda      $C8                           ; 0x1ebc8 $EBB8 A5 C8                   ;; go outside: set $c8 to 3
and      #$06                          ; 0x1ebca $EBBA 29 06                   ; keep bits .... .xx.
bne      LEBEF                         ; 0x1ebcc $EBBC D0 31                   ; if not Swamp, skip
lda      $12                           ; 0x1ebce $EBBE A5 12                   ;; Frame Counter (ascending)
and      #$38                          ; 0x1ebd0 $EBC0 29 38                   ; keep bits ..xx x...
lsr                                    ; 0x1ebd2 $EBC2 4A                      ;
lsr                                    ; 0x1ebd3 $EBC3 4A                      ;
lsr                                    ; 0x1ebd4 $EBC4 4A                      ;
tay                                    ; 0x1ebd5 $EBC5 A8                      ;
lda      $29                           ; 0x1ebd6 $EBC6 A5 29                   ; Link's Y position
adc      #$08                          ; 0x1ebd8 $EBC8 69 08                   ;
adc      bank7_Table_for_Fairy_floating_movement,y; 0x1ebda $EBCA 79 B0 EB     ;
sta      $0208                         ; 0x1ebdd $EBCD 8D 08 02                ;
lda      $CC                           ; 0x1ebe0 $EBD0 A5 CC                   ;; Link's X Position on Screen; Player X On Screen; Link's X Position on Screen
adc      #$0C                          ; 0x1ebe2 $EBD2 69 0C                   ;
sta      $020B                         ; 0x1ebe4 $EBD4 8D 0B 02                ;
lda      $12                           ; 0x1ebe7 $EBD7 A5 12                   ;; Frame Counter (ascending)
and      #$04                          ; 0x1ebe9 $EBD9 29 04                   ; keep bits .... .x..
lsr                                    ; 0x1ebeb $EBDB 4A                      ;
adc      #$68                          ; 0x1ebec $EBDC 69 68                   ;
sta      $0209                         ; 0x1ebee $EBDE 8D 09 02                ;
ldy      #$01                          ; 0x1ebf1 $EBE1 A0 01                   ; Y = 01
lda      $050C                         ; 0x1ebf3 $EBE3 AD 0C 05                ; Timer for Link being in injured state
beq      LEBEC                         ; 0x1ebf6 $EBE6 F0 04                   ;
lsr                                    ; 0x1ebf8 $EBE8 4A                      ;
and      #$03                          ; 0x1ebf9 $EBE9 29 03                   ; keep bits .... ..xx
tay                                    ; 0x1ebfb $EBEB A8                      ;
LEBEC                                                                          ;
sty      $020A                         ; 0x1ebfc $EBEC 8C 0A 02                ;
LEBEF                                                                          ;
rts                                    ; 0x1ebff $EBEF 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Links_Display_Routine                                                    ;
lda      $048D                         ; 0x1ec00 $EBF0 AD 8D 04                ; related to Link's flicker after being hit ?
bne      LEBEF                         ; 0x1ec03 $EBF3 D0 FA                   ;
ldx      #$00                          ; 0x1ec05 $EBF5 A2 00                   ; X = 00
stx      $11                           ; 0x1ec07 $EBF7 86 11                   ;
lda      #$08                          ; 0x1ec09 $EBF9 A9 08                   ; A = 08
sta      $90                           ; 0x1ec0b $EBFB 85 90                   ;
ldy      #$00                          ; 0x1ec0d $EBFD A0 00                   ; Y = 00
jsr      bank7_code51                  ; 0x1ec0f $EBFF 20 7D F2                ;
LEC02                                                                          ;
ldx      $11                           ; 0x1ec12 $EC02 A6 11                   ;
lda      $29,x                         ; 0x1ec14 $EC04 B5 29                   ; Link's Y Position ( ,X ?)
cpx      #$00                          ; 0x1ec16 $EC06 E0 00                   ;
bne      LEC17                         ; 0x1ec18 $EC08 D0 0D                   ;
ldy      $0479                         ; 0x1ec1a $EC0A AC 79 04                ;;jumping_state (2=going up, 1=coming down, 0=not jumping); Link is in mid-air ? (1 = mid-air, 0 = on ground); Link is in mid-air ? (1 = mid-air, 0 = on ground)
beq      LEC17                         ; 0x1ec1d $EC0D F0 08                   ;
ldy      $80,x                         ; 0x1ec1f $EC0F B4 80                   ; Link's Animation Frame
cpy      #$06                          ; 0x1ec21 $EC11 C0 06                   ; 06 = Ducked
bne      LEC17                         ; 0x1ec23 $EC13 D0 02                   ;
sbc      #$04                          ; 0x1ec25 $EC15 E9 04                   ;
LEC17                                                                          ;
sta      $00                           ; 0x1ec27 $EC17 85 00                   ;
lda      #$F8                          ; 0x1ec29 $EC19 A9 F8                   ; A = F8
sta      $0480,x                       ; 0x1ec2b $EC1B 9D 80 04                ;
lda      $13                           ; 0x1ec2e $EC1E A5 13                   ;; Fairy state (0 = Not in Fairy state)	faery, flip from 8=faery,0=link (set $076F to 0, then set $13 to 0)	setting 76F to ff, changes 76F to 3B which prevents changing $13 from 8 to 0
bne      bank7_code47                  ; 0x1ec30 $EC20 D0 96                   ;
lda      $0752                         ; 0x1ec32 $EC22 AD 52 07                ;
beq      LEC40                         ; 0x1ec35 $EC25 F0 19                   ;
lda      $29                           ; 0x1ec37 $EC27 A5 29                   ; Link's Y Position
bpl      LEC40                         ; 0x1ec39 $EC29 10 15                   ;
lda      $70                           ; 0x1ec3b $EC2B A5 70                   ; Link's Walking Velocity
beq      LEC40                         ; 0x1ec3d $EC2D F0 11                   ;
lda      $12                           ; 0x1ec3f $EC2F A5 12                   ;; Frame Counter (ascending)
lsr                                    ; 0x1ec41 $EC31 4A                      ;
lsr                                    ; 0x1ec42 $EC32 4A                      ;
lsr                                    ; 0x1ec43 $EC33 4A                      ;
lsr                                    ; 0x1ec44 $EC34 4A                      ;
and      #$07                          ; 0x1ec45 $EC35 29 07                   ; keep bits .... .xxx
tay                                    ; 0x1ec47 $EC37 A8                      ;
lda      $00                           ; 0x1ec48 $EC38 A5 00                   ;
sec                                    ; 0x1ec4a $EC3A 38                      ;
sbc      bank7_Table_for_Fairy_floating_movement,y; 0x1ec4b $EC3B F9 B0 EB     ;
sta      $00                           ; 0x1ec4e $EC3E 85 00                   ;
LEC40                                                                          ;
ldy      $90,x                         ; 0x1ec50 $EC40 B4 90                   ;
lda      $80,x                         ; 0x1ec52 $EC42 B5 80                   ; Link's Animation Frame
tax                                    ; 0x1ec54 $EC44 AA                      ;
lda      LEB97,x                       ; 0x1ec55 $EC45 BD 97 EB                ;
tax                                    ; 0x1ec58 $EC48 AA                      ;
lda      $C8                           ; 0x1ec59 $EC49 A5 C8                   ;; go outside: set $c8 to 3
and      #$C0                          ; 0x1ec5b $EC4B 29 C0                   ; keep bits xx.. ....
bne      LEC62                         ; 0x1ec5d $EC4D D0 13                   ;
lda      $0752                         ; 0x1ec5f $EC4F AD 52 07                ;
pha                                    ; 0x1ec62 $EC52 48                      ;
lda      $070E                         ; 0x1ec63 $EC53 AD 0E 07                ;;setting to 1 will make link sink (duck into the chimney)
bne      LEC5B                         ; 0x1ec66 $EC56 D0 03                   ;
sta      $0752                         ; 0x1ec68 $EC58 8D 52 07                ;
LEC5B                                                                          ;
jsr      bank7_Sword_Slash_Display_maybe; 0x1ec6b $EC5B 20 7A ED               ;
pla                                    ; 0x1ec6e $EC5E 68                      ;
sta      $0752                         ; 0x1ec6f $EC5F 8D 52 07                ;
LEC62                                                                          ;
lda      $C8                           ; 0x1ec72 $EC62 A5 C8                   ;; go outside: set $c8 to 3
and      #$30                          ; 0x1ec74 $EC64 29 30                   ; keep bits ..xx ....
bne      LEC6B                         ; 0x1ec76 $EC66 D0 03                   ;
jsr      bank7_Sword_Slash_Display_maybe; 0x1ec78 $EC68 20 7A ED               ;
LEC6B                                                                          ;
ldy      #$14                          ; 0x1ec7b $EC6B A0 14                   ; Y = 14
LEC6D                                                                          ;
lda      $0209,y                       ; 0x1ec7d $EC6D B9 09 02                ;
cmp      #$F5                          ; 0x1ec80 $EC70 C9 F5                   ;
bne      LEC79                         ; 0x1ec82 $EC72 D0 05                   ;
lda      #$F8                          ; 0x1ec84 $EC74 A9 F8                   ; A = F8
sta      $0208,y                       ; 0x1ec86 $EC76 99 08 02                ;
LEC79                                                                          ;
dey                                    ; 0x1ec89 $EC79 88                      ;
dey                                    ; 0x1ec8a $EC7A 88                      ;
dey                                    ; 0x1ec8b $EC7B 88                      ;
dey                                    ; 0x1ec8c $EC7C 88                      ;
bpl      LEC6D                         ; 0x1ec8d $EC7D 10 EE                   ;
ldx      $11                           ; 0x1ec8f $EC7F A6 11                   ;
ldy      $90,x                         ; 0x1ec91 $EC81 B4 90                   ;
lda      $0203,y                       ; 0x1ec93 $EC83 B9 03 02                ;
sta      $15,x                         ; 0x1ec96 $EC86 95 15                   ;
lda      $80,x                         ; 0x1ec98 $EC88 B5 80                   ; Link's Animation Frame
cmp      #$0B                          ; 0x1ec9a $EC8A C9 0B                   ;
bne      LEC96                         ; 0x1ec9c $EC8C D0 08                   ;
lda      #$40                          ; 0x1ec9e $EC8E A9 40                   ;;A = #$40 0100_0000
sta      $020A,y                       ; 0x1eca0 $EC90 99 0A 02                ;
sta      $0216,y                       ; 0x1eca3 $EC93 99 16 02                ;
LEC96                                                                          ;
pha                                    ; 0x1eca6 $EC96 48                      ;
lda      $9F,x                         ; 0x1eca7 $EC97 B5 9F                   ;
tax                                    ; 0x1eca9 $EC99 AA                      ;
dex                                    ; 0x1ecaa $EC9A CA                      ;
pla                                    ; 0x1ecab $EC9B 68                      ;
cmp      #$05                          ; 0x1ecac $EC9C C9 05                   ; 05 = Sword Strike
bne      bank7_Strike_Ducked           ; 0x1ecae $EC9E D0 30                   ;
lda      #$32                          ; 0x1ecb0 $ECA0 A9 32                   ; A = 32 (tile for sword slash)
sta      $0219,y                       ; 0x1ecb2 $ECA2 99 19 02                ;
ldx      $11                           ; 0x1ecb5 $ECA5 A6 11                   ;
lda      $29,x                         ; 0x1ecb7 $ECA7 B5 29                   ; Link's Y Position ( ,X ?)
sta      $0218,y                       ; 0x1ecb9 $ECA9 99 18 02                ;
LECAC                                                                          ;
lda      $CC,x                         ; 0x1ecbc $ECAC B5 CC                   ;
pha                                    ; 0x1ecbe $ECAE 48                      ;
lda      $9F,x                         ; 0x1ecbf $ECAF B5 9F                   ;
tax                                    ; 0x1ecc1 $ECB1 AA                      ;
pla                                    ; 0x1ecc2 $ECB2 68                      ;
clc                                    ; 0x1ecc3 $ECB3 18                      ;
adc      #$0C                          ; 0x1ecc4 $ECB4 69 0C                   ;
clc                                    ; 0x1ecc6 $ECB6 18                      ;
adc      LEBAB,x                       ; 0x1ecc7 $ECB7 7D AB EB                ;
sta      $021B,y                       ; 0x1ecca $ECBA 99 1B 02                ;
php                                    ; 0x1eccd $ECBD 08                      ;
dex                                    ; 0x1ecce $ECBE CA                      ;
beq      LECC5                         ; 0x1eccf $ECBF F0 04                   ;
pla                                    ; 0x1ecd1 $ECC1 68                      ;
eor      #$01                          ; 0x1ecd2 $ECC2 49 01                   ; flip bits .... ...x
pha                                    ; 0x1ecd4 $ECC4 48                      ;
LECC5                                                                          ;
plp                                    ; 0x1ecd5 $ECC5 28                      ;
bcc      LECCD                         ; 0x1ecd6 $ECC6 90 05                   ;
lda      #$F8                          ; 0x1ecd8 $ECC8 A9 F8                   ; A = F8
sta      $0218,y                       ; 0x1ecda $ECCA 99 18 02                ;
LECCD                                                                          ;
jmp      LED67                         ; 0x1ecdd $ECCD 4C 67 ED                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Strike_Ducked                                                            ;
cmp      #$07                          ; 0x1ece0 $ECD0 C9 07                   ;
bne      bank7_Up_Stab                 ; 0x1ece2 $ECD2 D0 12                   ;
lda      #$54                          ; 0x1ece4 $ECD4 A9 54                   ; A = 54
sta      $0219,y                       ; 0x1ece6 $ECD6 99 19 02                ;
ldx      $11                           ; 0x1ece9 $ECD9 A6 11                   ;
lda      $29,x                         ; 0x1eceb $ECDB B5 29                   ;;y_pos (Link's y position in sideview)
clc                                    ; 0x1eced $ECDD 18                      ;
adc      #$10                          ; 0x1ecee $ECDE 69 10                   ;
sta      $0218,y                       ; 0x1ecf0 $ECE0 99 18 02                ;
jmp      LECAC                         ; 0x1ecf3 $ECE3 4C AC EC                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Up_Stab                                                                  ;
cmp      #$08                          ; 0x1ecf6 $ECE6 C9 08                   ;
bne      LED02                         ; 0x1ecf8 $ECE8 D0 18                   ;
LECEA                                                                          ;
ldx      $11                           ; 0x1ecfa $ECEA A6 11                   ;
lda      $15,x                         ; 0x1ecfc $ECEC B5 15                   ;
ldy      $9F,x                         ; 0x1ecfe $ECEE B4 9F                   ;
clc                                    ; 0x1ed00 $ECF0 18                      ;
adc      LEBAD,y                       ; 0x1ed01 $ECF1 79 AD EB                ;
sta      $047E,x                       ; 0x1ed04 $ECF4 9D 7E 04                ;
ldy      $90,x                         ; 0x1ed07 $ECF7 B4 90                   ;
lda      $29,x                         ; 0x1ed09 $ECF9 B5 29                   ;;y_pos (Link's y position in sideview)
sec                                    ; 0x1ed0b $ECFB 38                      ;
sbc      #$04                          ; 0x1ed0c $ECFC E9 04                   ;
sta      $0480,x                       ; 0x1ed0e $ECFE 9D 80 04                ;
rts                                    ; 0x1ed11 $ED01 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LED02                                                                          ;
ldx      $11                           ; 0x1ed12 $ED02 A6 11                   ;
lda      $80,x                         ; 0x1ed14 $ED04 B5 80                   ;
cmp      #$09                          ; 0x1ed16 $ED06 C9 09                   ; 09 = Downstab
bne      LED1B                         ; 0x1ed18 $ED08 D0 11                   ;
jsr      LECEA                         ; 0x1ed1a $ED0A 20 EA EC                ;
clc                                    ; 0x1ed1d $ED0D 18                      ;
adc      #$25                          ; 0x1ed1e $ED0E 69 25                   ;
sta      $0480,x                       ; 0x1ed20 $ED10 9D 80 04                ;
lda      $CC,x                         ; 0x1ed23 $ED13 B5 CC                   ;
clc                                    ; 0x1ed25 $ED15 18                      ;
adc      #$10                          ; 0x1ed26 $ED16 69 10                   ;
sta      $047E,x                       ; 0x1ed28 $ED18 9D 7E 04                ;
LED1B                                                                          ;
lda      $80                           ; 0x1ed2b $ED1B A5 80                   ; Link's Animation Frame
cmp      #$0C                          ; 0x1ed2d $ED1D C9 0C                   ; 0C = Item in hand
bcc      LED66                         ; 0x1ed2f $ED1F 90 45                   ;
lda      $049D                         ; 0x1ed31 $ED21 AD 9D 04                ;;hold item above head: item id	; Related to Palace Item
asl                                    ; 0x1ed34 $ED24 0A                      ;
tay                                    ; 0x1ed35 $ED25 A8                      ;
lda      LEE7F,y                       ; 0x1ed36 $ED26 B9 7F EE                ; Tile Mapping for Item Y
sta      $0221                         ; 0x1ed39 $ED29 8D 21 02                ;
lda      LEE80,y                       ; 0x1ed3c $ED2C B9 80 EE                ;
sta      $0225                         ; 0x1ed3f $ED2F 8D 25 02                ;
lda      $29                           ; 0x1ed42 $ED32 A5 29                   ; Link's Y Position
sec                                    ; 0x1ed44 $ED34 38                      ;
sbc      #$10                          ; 0x1ed45 $ED35 E9 10                   ;
sta      $0220                         ; 0x1ed47 $ED37 8D 20 02                ;
sta      $0224                         ; 0x1ed4a $ED3A 8D 24 02                ;
lda      $CC                           ; 0x1ed4d $ED3D A5 CC                   ; Link's X Position on Screen
clc                                    ; 0x1ed4f $ED3F 18                      ;
adc      #$08                          ; 0x1ed50 $ED40 69 08                   ;
sta      $0223                         ; 0x1ed52 $ED42 8D 23 02                ;
adc      #$08                          ; 0x1ed55 $ED45 69 08                   ;
sta      $0227                         ; 0x1ed57 $ED47 8D 27 02                ;
lda      #$01                          ; 0x1ed5a $ED4A A9 01                   ; A = 01
sta      $0222                         ; 0x1ed5c $ED4C 8D 22 02                ;
lda      #$41                          ; 0x1ed5f $ED4F A9 41                   ; A = 41
sta      $0226                         ; 0x1ed61 $ED51 8D 26 02                ;
ldy      $049D                         ; 0x1ed64 $ED54 AC 9D 04                ;;hold item above head: item id	; Related to Palace Item
cpy      #$10                          ; 0x1ed67 $ED57 C0 10                   ;
bcc      LED66                         ; 0x1ed69 $ED59 90 0B                   ;
lda      LF0FC,y                       ; 0x1ed6b $ED5B B9 FC F0                ;
sta      $0222                         ; 0x1ed6e $ED5E 8D 22 02                ;
ora      #$40                          ; 0x1ed71 $ED61 09 40                   ; set bits  .x.. ....
sta      $0226                         ; 0x1ed73 $ED63 8D 26 02                ;
LED66                                                                          ;
rts                                    ; 0x1ed76 $ED66 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LED67                                                                          ;
ldx      $11                           ; 0x1ed77 $ED67 A6 11                   ;
lda      $0218,y                       ; 0x1ed79 $ED69 B9 18 02                ;
sta      $0480,x                       ; 0x1ed7c $ED6C 9D 80 04                ;
lda      $021B,y                       ; 0x1ed7f $ED6F B9 1B 02                ;
sta      $047E,x                       ; 0x1ed82 $ED72 9D 7E 04                ;
LED77     = * + $0002                                                          ;
jmp      LED02                         ; 0x1ed85 $ED75 4C 02 ED                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_table29                                                                  ;
.byt    $F8,$08                        ; 0x1ed88 $ED78 F8 08                   ;
; ---------------------------------------------------------------------------- ;
bank7_Sword_Slash_Display_maybe                                                ;
sty      $08                           ; 0x1ed8a $ED7A 84 08                   ;
stx      $09                           ; 0x1ed8c $ED7C 86 09                   ;
lda      bank7_UNKNOWN1,x              ; 0x1ed8e $ED7E BD 25 EB                ;
sta      $0201,y                       ; 0x1ed91 $ED81 99 01 02                ;
lda      LEB26,x                       ; 0x1ed94 $ED84 BD 26 EB                ;
sta      $0205,y                       ; 0x1ed97 $ED87 99 05 02                ;
lda      LEB27,x                       ; 0x1ed9a $ED8A BD 27 EB                ;
sta      $0209,y                       ; 0x1ed9d $ED8D 99 09 02                ;
lda      #$00                          ; 0x1eda0 $ED90 A9 00                   ; A = 00
sta      $01                           ; 0x1eda2 $ED92 85 01                   ;
ldx      $11                           ; 0x1eda4 $ED94 A6 11                   ;
lda      $C8,x                         ; 0x1eda6 $ED96 B5 C8                   ;
sta      $0B                           ; 0x1eda8 $ED98 85 0B                   ;
lda      $CC,x                         ; 0x1edaa $ED9A B5 CC                   ;
pha                                    ; 0x1edac $ED9C 48                      ;
lda      $9F,x                         ; 0x1edad $ED9D B5 9F                   ;
ldy      $80,x                         ; 0x1edaf $ED9F B4 80                   ;
tax                                    ; 0x1edb1 $EDA1 AA                      ;
pla                                    ; 0x1edb2 $EDA2 68                      ;
cpy      #$04                          ; 0x1edb3 $EDA3 C0 04                   ;
bne      LEDC1                         ; 0x1edb5 $EDA5 D0 1A                   ;
clc                                    ; 0x1edb7 $EDA7 18                      ;
adc      LED77,x                       ; 0x1edb8 $EDA8 7D 77 ED                ;
pha                                    ; 0x1edbb $EDAB 48                      ;
stx      $D9                           ; 0x1edbc $EDAC 86 D9                   ;; Thunder Spell modifier ?
ldx      #$00                          ; 0x1edbe $EDAE A2 00                   ; X = 00
ldy      #$00                          ; 0x1edc0 $EDB0 A0 00                   ; Y = 00
jsr      LF2D3                         ; 0x1edc2 $EDB2 20 D3 F2                ;
lsr                                    ; 0x1edc5 $EDB5 4A                      ;
lsr                                    ; 0x1edc6 $EDB6 4A                      ;
lsr                                    ; 0x1edc7 $EDB7 4A                      ;
dec      $D9                           ; 0x1edc8 $EDB8 C6 D9                   ;; Thunder Spell modifier ?
bne      LEDBE                         ; 0x1edca $EDBA D0 02                   ;
lsr                                    ; 0x1edcc $EDBC 4A                      ;
lsr                                    ; 0x1edcd $EDBD 4A                      ;
LEDBE                                                                          ;
sta      $0B                           ; 0x1edce $EDBE 85 0B                   ;
pla                                    ; 0x1edd0 $EDC0 68                      ;
LEDC1                                                                          ;
sta      $02                           ; 0x1edd1 $EDC1 85 02                   ;
ldx      $11                           ; 0x1edd3 $EDC3 A6 11                   ;
lda      $9F,x                         ; 0x1edd5 $EDC5 B5 9F                   ;
ldx      $09                           ; 0x1edd7 $EDC7 A6 09                   ;
ldy      $08                           ; 0x1edd9 $EDC9 A4 08                   ;
lsr                                    ; 0x1eddb $EDCB 4A                      ;
bne      LEDE7                         ; 0x1eddc $EDCC D0 19                   ;
asl      $0B                           ; 0x1edde $EDCE 06 0B                   ;
lda      bank7_UNKNOWN1,x              ; 0x1ede0 $EDD0 BD 25 EB                ;
sta      $0209,y                       ; 0x1ede3 $EDD3 99 09 02                ;
lda      LEB27,x                       ; 0x1ede6 $EDD6 BD 27 EB                ;
sta      $0201,y                       ; 0x1ede9 $EDD9 99 01 02                ;
lda      $02                           ; 0x1edec $EDDC A5 02                   ;
clc                                    ; 0x1edee $EDDE 18                      ;
adc      #$08                          ; 0x1edef $EDDF 69 08                   ;
sta      $02                           ; 0x1edf1 $EDE1 85 02                   ;
lda      #$40                          ; 0x1edf3 $EDE3 A9 40                   ; A = 40
sta      $01                           ; 0x1edf5 $EDE5 85 01                   ;
LEDE7                                                                          ;
ldx      $11                           ; 0x1edf7 $EDE7 A6 11                   ;
lda      $050C,x                       ; 0x1edf9 $EDE9 BD 0C 05                ;
beq      LEDF1                         ; 0x1edfc $EDEC F0 03                   ;
lsr                                    ; 0x1edfe $EDEE 4A                      ;
and      #$03                          ; 0x1edff $EDEF 29 03                   ; keep bits .... ..xx
LEDF1                                                                          ;
ora      $01                           ; 0x1ee01 $EDF1 05 01                   ;
ora      $0752,x                       ; 0x1ee03 $EDF3 1D 52 07                ;
ldx      $B5                           ; 0x1ee06 $EDF6 A6 B5                   ;;2 will make link die in lava	;3 move right like when win game at dark link
dex                                    ; 0x1ee08 $EDF8 CA                      ;
beq      LEDFD                         ; 0x1ee09 $EDF9 F0 02                   ;
ora      #$20                          ; 0x1ee0b $EDFB 09 20                   ; set bits  ..x. ....
LEDFD                                                                          ;
sta      $0202,y                       ; 0x1ee0d $EDFD 99 02 02                ;
sta      $0206,y                       ; 0x1ee10 $EE00 99 06 02                ;
sta      $020A,y                       ; 0x1ee13 $EE03 99 0A 02                ;
sta      $020E,y                       ; 0x1ee16 $EE06 99 0E 02                ;
lda      $00                           ; 0x1ee19 $EE09 A5 00                   ;
sta      $0200,y                       ; 0x1ee1b $EE0B 99 00 02                ;
sta      $0204,y                       ; 0x1ee1e $EE0E 99 04 02                ;
sta      $0208,y                       ; 0x1ee21 $EE11 99 08 02                ;
clc                                    ; 0x1ee24 $EE14 18                      ;
adc      #$10                          ; 0x1ee25 $EE15 69 10                   ;
sta      $00                           ; 0x1ee27 $EE17 85 00                   ;
lda      #$08                          ; 0x1ee29 $EE19 A9 08                   ; A = 08
sta      $0A                           ; 0x1ee2b $EE1B 85 0A                   ;
ldx      #$03                          ; 0x1ee2d $EE1D A2 03                   ; X = 03
LEE1F                                                                          ;
lda      $0A                           ; 0x1ee2f $EE1F A5 0A                   ;
and      $0B                           ; 0x1ee31 $EE21 25 0B                   ;
beq      LEE2A                         ; 0x1ee33 $EE23 F0 05                   ;
lda      #$F8                          ; 0x1ee35 $EE25 A9 F8                   ; A = F8
sta      $0200,y                       ; 0x1ee37 $EE27 99 00 02                ;
LEE2A                                                                          ;
iny                                    ; 0x1ee3a $EE2A C8                      ;
iny                                    ; 0x1ee3b $EE2B C8                      ;
iny                                    ; 0x1ee3c $EE2C C8                      ;
iny                                    ; 0x1ee3d $EE2D C8                      ;
lsr      $0A                           ; 0x1ee3e $EE2E 46 0A                   ;
dex                                    ; 0x1ee40 $EE30 CA                      ;
bne      LEE1F                         ; 0x1ee41 $EE31 D0 EC                   ;
ldy      $08                           ; 0x1ee43 $EE33 A4 08                   ;
ldx      $09                           ; 0x1ee45 $EE35 A6 09                   ;
lda      $02                           ; 0x1ee47 $EE37 A5 02                   ;
sta      $0203,y                       ; 0x1ee49 $EE39 99 03 02                ;
clc                                    ; 0x1ee4c $EE3C 18                      ;
adc      #$08                          ; 0x1ee4d $EE3D 69 08                   ;
sta      $0207,y                       ; 0x1ee4f $EE3F 99 07 02                ;
clc                                    ; 0x1ee52 $EE42 18                      ;
adc      #$08                          ; 0x1ee53 $EE43 69 08                   ;
sta      $020B,y                       ; 0x1ee55 $EE45 99 0B 02                ;
inx                                    ; 0x1ee58 $EE48 E8                      ;
inx                                    ; 0x1ee59 $EE49 E8                      ;
inx                                    ; 0x1ee5a $EE4A E8                      ;
tya                                    ; 0x1ee5b $EE4B 98                      ;
clc                                    ; 0x1ee5c $EE4C 18                      ;
adc      #$0C                          ; 0x1ee5d $EE4D 69 0C                   ;
tay                                    ; 0x1ee5f $EE4F A8                      ;
rts                                    ; 0x1ee60 $EE50 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_table_item_sprites_map_to_graphic_image                                  ;
;this means: tile code of the item                                             ;
;the item has a tile code (a number) associated which is used to index in the graphics table (or something);
.byt    $86                            ; 0x1ee61 $EE51 86                      ;
LEE52                                                                          ;
.byt    $86,$88,$88,$DC,$DE,$AC,$AC,$E4; 0x1ee62 $EE52 86 88 88 DC DE AC AC E4 ;
.byt    $E6,$E8,$EA,$C0,$C2,$C0,$C4,$BA; 0x1ee6a $EE5A E6 E8 EA C0 C2 C0 C4 BA ;
.byt    $BC,$C6,$C8,$CA,$CC,$50,$50,$4E; 0x1ee72 $EE62 BC C6 C8 CA CC 50 50 4E ;
.byt    $4E,$7C,$7E,$80,$82,$B6,$B8,$BB; 0x1ee7a $EE6A 4E 7C 7E 80 82 B6 B8 BB ;
.byt    $BD,$BF,$C1,$C3,$C3,$B2,$B2,$B4; 0x1ee82 $EE72 BD BF C1 C3 C3 B2 B2 B4 ;
.byt    $B4,$24,$24,$B0,$B0            ; 0x1ee8a $EE7A B4 24 24 B0 B0          ;
LEE7F                                                                          ;
.byt    $8C                            ; 0x1ee8f $EE7F 8C                      ;
; Tile Mappings for Items (2E bytes)                                           ;
;                                                                              ;
; 8C F5	Candle                                                                 ;
; 8E F5	Glove                                                                  ;
; 90 F5	Raft                                                                   ;
; 92 F5	Boot                                                                   ;
; 94 F5	Flute                                                                  ;
; 96 F5	Cross                                                                  ;
; 98 F5	Hammer                                                                 ;
; 9A F5	Magic Key                                                              ;
; 66 F5	Key                                                                    ;
; 00 F5	Invalid Index                                                          ;
; 72 F5	Experience Bag - 50 pts                                                ;
; 72 F5	Experience Bag - 100 pts                                               ;
; 72 F5	Experience Bag - 200 pts                                               ;
; 72 F5	Experience Bag - 500 pts                                               ;
; 83 83	Magic Container                                                        ;
; 81 81	Heart Container                                                        ;
; 8A F5	Blue Jar                                                               ;
; 8A F5	Red Jar                                                                ;
; A8 F5	Link Doll                                                              ;
; 31 31	Medicine                                                               ;
; 2F 2F	Trophy                                                                 ;
; 31 31	Kidnapped Child                                                        ;
; 67 67	Invalid Index ?                                                        ;
LEE80                                                                          ;
.byt    $F5,$8E,$F5,$90,$F5,$92,$F5,$94; 0x1ee90 $EE80 F5 8E F5 90 F5 92 F5 94 ;
.byt    $F5,$96,$F5,$98,$F5,$9A,$F5,$66; 0x1ee98 $EE88 F5 96 F5 98 F5 9A F5 66 ;
.byt    $F5,$00,$F5,$72,$F5,$72,$F5,$72; 0x1eea0 $EE90 F5 00 F5 72 F5 72 F5 72 ;
.byt    $F5,$72,$F5,$83,$83,$81,$81,$8A; 0x1eea8 $EE98 F5 72 F5 83 83 81 81 8A ;
.byt    $F5,$8A,$F5,$A8,$F5,$31,$31,$2F; 0x1eeb0 $EEA0 F5 8A F5 A8 F5 31 31 2F ;
.byt    $2F,$31,$31,$67,$67,$00,$02,$02; 0x1eeb8 $EEA8 2F 31 31 67 67 00 02 02 ;
.byt    $00,$00                        ; 0x1eec0 $EEB0 00 00                   ;
LEEB2                                                                          ;
.byt    $C0,$18,$90,$11,$98,$9D,$0E,$04; 0x1eec2 $EEB2 C0 18 90 11 98 9D 0E 04 ;
.byt    $B5,$91,$48,$69,$0F,$95,$91,$20; 0x1eeca $EEBA B5 91 48 69 0F 95 91 20 ;
.byt    $11,$EF,$68,$95,$91,$A9,$00,$9D; 0x1eed2 $EEC2 11 EF 68 95 91 A9 00 9D ;
.byt    $0E,$04,$B4,$A1,$B9,$1D,$6E,$48; 0x1eeda $EECA 0E 04 B4 A1 B9 1D 6E 48 ;
.byt    $B5,$2A,$85,$00,$A5,$CD,$85,$01; 0x1eee2 $EED2 B5 2A 85 00 A5 CD 85 01 ;
.byt    $A9,$02,$85,$02,$A5,$12,$0A,$0A; 0x1eeea $EEDA A9 02 85 02 A5 12 0A 0A ;
.byt    $0A,$0A,$0A,$29,$80,$09,$01,$85; 0x1eef2 $EEE2 0A 0A 0A 29 80 09 01 85 ;
.byt    $03,$B4,$91,$BD,$04,$05,$4A,$4A; 0x1eefa $EEEA 03 B4 91 BD 04 05 4A 4A ;
.byt    $4A,$AA,$BD,$AD,$EE,$AA,$20,$16; 0x1ef02 $EEF2 4A AA BD AD EE AA 20 16 ;
.byt    $F2,$20,$08,$EF,$68,$10,$05,$CA; 0x1ef0a $EEFA F2 20 08 EF 68 10 05 CA ;
.byt    $CA                            ; 0x1ef12 $EF02 CA                      ;
; ---------------------------------------------------------------------------- ;
bank7_code49                                                                   ;
jsr      LF216                         ; 0x1ef13 $EF03 20 16 F2                ;
ldx      $10                           ; 0x1ef16 $EF06 A6 10                   ;; used as monster x register ;draw boss hp bar
LEF08                                                                          ;
lda      $01FE,y                       ; 0x1ef18 $EF08 B9 FE 01                ;
ora      #$40                          ; 0x1ef1b $EF0B 09 40                   ; set bits .x.. ....
sta      $01FE,y                       ; 0x1ef1d $EF0D 99 FE 01                ;
rts                                    ; 0x1ef20 $EF10 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Display                                                                  ;
lda      $040E,x                       ; 0x1ef21 $EF11 BD 0E 04                ;; Enemy Hit State (0 = not in Hit State)	;	causes flashing
beq      LEF19                         ; 0x1ef24 $EF14 F0 03                   ;
dec      $040E,x                       ; 0x1ef26 $EF16 DE 0E 04                ;; Enemy Hit State (0 = not in Hit State)	;	causes flashing
LEF19                                                                          ;
lda      $2A,x                         ; 0x1ef29 $EF19 B5 2A                   ; Enemy Y Position
sta      $00                           ; 0x1ef2b $EF1B 85 00                   ;
lda      $CD                           ; 0x1ef2d $EF1D A5 CD                   ;
sta      $01                           ; 0x1ef2f $EF1F 85 01                   ;
lda      $60,x                         ; 0x1ef31 $EF21 B5 60                   ;; Enemy facing direction
sta      $02                           ; 0x1ef33 $EF23 85 02                   ;
lda      #$00                          ; 0x1ef35 $EF25 A9 00                   ; A = 00
sta      $03                           ; 0x1ef37 $EF27 85 03                   ;
lda      $A1,x                         ; 0x1ef39 $EF29 B5 A1                   ; Enemy Code
tay                                    ; 0x1ef3b $EF2B A8                      ;
lda      $6DD5,y                       ; 0x1ef3c $EF2C B9 D5 6D                ;
asl                                    ; 0x1ef3f $EF2F 0A                      ;
rol      $03                           ; 0x1ef40 $EF30 26 03                   ;
asl                                    ; 0x1ef42 $EF32 0A                      ;
rol      $03                           ; 0x1ef43 $EF33 26 03                   ;
tya                                    ; 0x1ef45 $EF35 98                      ;
asl                                    ; 0x1ef46 $EF36 0A                      ;
tay                                    ; 0x1ef47 $EF37 A8                      ;
lda      $6E65,y                       ; 0x1ef48 $EF38 B9 65 6E                ;
sta      L000E                         ; 0x1ef4b $EF3B 85 0E                   ;
lda      $6E66,y                       ; 0x1ef4d $EF3D B9 66 6E                ;
sta      $0F                           ; 0x1ef50 $EF40 85 0F                   ;
ldy      $91,x                         ; 0x1ef52 $EF42 B4 91                   ;
jmp      (L000E)                       ; 0x1ef54 $EF44 6C 0E 00                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines2_Elevator                                                 ;
ldx      #$06                          ; 0x1ef57 $EF47 A2 06                   ; X = 06
jsr      LF216                         ; 0x1ef59 $EF49 20 16 F2                ;
dex                                    ; 0x1ef5c $EF4C CA                      ;
dex                                    ; 0x1ef5d $EF4D CA                      ;
iny                                    ; 0x1ef5e $EF4E C8                      ;
iny                                    ; 0x1ef5f $EF4F C8                      ;
iny                                    ; 0x1ef60 $EF50 C8                      ;
iny                                    ; 0x1ef61 $EF51 C8                      ;
lda      $00                           ; 0x1ef62 $EF52 A5 00                   ;
clc                                    ; 0x1ef64 $EF54 18                      ;
adc      #$18                          ; 0x1ef65 $EF55 69 18                   ;
sta      $00                           ; 0x1ef67 $EF57 85 00                   ;
jsr      LF216                         ; 0x1ef69 $EF59 20 16 F2                ;
lda      $00                           ; 0x1ef6c $EF5C A5 00                   ;
sec                                    ; 0x1ef6e $EF5E 38                      ;
sbc      #$10                          ; 0x1ef6f $EF5F E9 10                   ;
sta      $0200,y                       ; 0x1ef71 $EF61 99 00 02                ;
sec                                    ; 0x1ef74 $EF64 38                      ;
sbc      #$28                          ; 0x1ef75 $EF65 E9 28                   ;
sta      $01F4,y                       ; 0x1ef77 $EF67 99 F4 01                ;
lda      $01                           ; 0x1ef7a $EF6A A5 01                   ;
clc                                    ; 0x1ef7c $EF6C 18                      ;
adc      #$10                          ; 0x1ef7d $EF6D 69 10                   ;
sta      $01F7,y                       ; 0x1ef7f $EF6F 99 F7 01                ;
sta      $0203,y                       ; 0x1ef82 $EF72 99 03 02                ;
ldx      #$AC                          ; 0x1ef85 $EF75 A2 AC                   ; X = AC
lda      $C9                           ; 0x1ef87 $EF77 A5 C9                   ;
and      #$02                          ; 0x1ef89 $EF79 29 02                   ; keep bits .... ..x.
beq      LEF7F                         ; 0x1ef8b $EF7B F0 02                   ;
ldx      #$F5                          ; 0x1ef8d $EF7D A2 F5                   ; X = F5
LEF7F                                                                          ;
txa                                    ; 0x1ef8f $EF7F 8A                      ;
sta      $01F5,y                       ; 0x1ef90 $EF80 99 F5 01                ;
sta      $0201,y                       ; 0x1ef93 $EF83 99 01 02                ;
lda      #$01                          ; 0x1ef96 $EF86 A9 01                   ; A = 01
sta      $01F6,y                       ; 0x1ef98 $EF88 99 F6 01                ;
sta      $0202,y                       ; 0x1ef9b $EF8B 99 02 02                ;
ldx      $10                           ; 0x1ef9e $EF8E A6 10                   ;; used as monster x register ;draw boss hp bar
rts                                    ; 0x1efa0 $EF90 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines2_Bot_and_Bit                                              ;
lda      #$02                          ; 0x1efa1 $EF91 A9 02                   ; A = 02
sta      $02                           ; 0x1efa3 $EF93 85 02                   ;
lda      $81,x                         ; 0x1efa5 $EF95 B5 81                   ;; Current Animation Frame for Enemys
ldx      #$26                          ; 0x1efa7 $EF97 A2 26                   ; X = 26
cmp      #$00                          ; 0x1efa9 $EF99 C9 00                   ;
beq      LEF9F                         ; 0x1efab $EF9B F0 02                   ;
inx                                    ; 0x1efad $EF9D E8                      ;
inx                                    ; 0x1efae $EF9E E8                      ;
LEF9F                                                                          ;
jsr      LF216                         ; 0x1efaf $EF9F 20 16 F2                ;
tya                                    ; 0x1efb2 $EFA2 98                      ;
tax                                    ; 0x1efb3 $EFA3 AA                      ;
ldy      $10                           ; 0x1efb4 $EFA4 A4 10                   ;; used as monster x register ;draw boss hp bar
lda      $AF,y                         ; 0x1efb6 $EFA6 B9 AF 00                ;
beq      LEFB7                         ; 0x1efb9 $EFA9 F0 0C                   ;
lda      $12                           ; 0x1efbb $EFAB A5 12                   ;; Frame Counter (ascending)
and      #$04                          ; 0x1efbd $EFAD 29 04                   ; keep bits .... .x..
bne      LEFB7                         ; 0x1efbf $EFAF D0 06                   ;
inc      $01FB,x                       ; 0x1efc1 $EFB1 FE FB 01                ;
dec      $01FF,x                       ; 0x1efc4 $EFB4 DE FF 01                ;
LEFB7                                                                          ;
lda      $01FA,x                       ; 0x1efc7 $EFB7 BD FA 01                ;
ora      #$40                          ; 0x1efca $EFBA 09 40                   ; set  bits .x.. ....
sta      $01FE,x                       ; 0x1efcc $EFBC 9D FE 01                ;
ldx      $10                           ; 0x1efcf $EFBF A6 10                   ;; used as monster x register ;draw boss hp bar
rts                                    ; 0x1efd1 $EFC1 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines2_Myu                                                      ;
lda      #$02                          ; 0x1efd2 $EFC2 A9 02                   ; A = 02
sta      $02                           ; 0x1efd4 $EFC4 85 02                   ;
lda      $81,x                         ; 0x1efd6 $EFC6 B5 81                   ;; Current Animation Frame for Enemys
ldx      #$2A                          ; 0x1efd8 $EFC8 A2 2A                   ; A = 2A
asl                                    ; 0x1efda $EFCA 0A                      ;
beq      LEFCF                         ; 0x1efdb $EFCB F0 02                   ;
inx                                    ; 0x1efdd $EFCD E8                      ;
inx                                    ; 0x1efde $EFCE E8                      ;
LEFCF                                                                          ;
jmp      bank7_code49                  ; 0x1efdf $EFCF 4C 03 EF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines2_unknown                                                  ;
lda      #$02                          ; 0x1efe2 $EFD2 A9 02                   ; A = 02
sta      $02                           ; 0x1efe4 $EFD4 85 02                   ;
lda      $AF,x                         ; 0x1efe6 $EFD6 B5 AF                   ;; Various enemy state variables
ldx      #$20                          ; 0x1efe8 $EFD8 A2 20                   ; X = 20
cmp      #$00                          ; 0x1efea $EFDA C9 00                   ;
beq      LEFE6                         ; 0x1efec $EFDC F0 08                   ;
ldx      #$22                          ; 0x1efee $EFDE A2 22                   ; X = 22
cmp      #$08                          ; 0x1eff0 $EFE0 C9 08                   ;
bcc      LEFE6                         ; 0x1eff2 $EFE2 90 02                   ;
ldx      #$24                          ; 0x1eff4 $EFE4 A2 24                   ; X = 24
LEFE6                                                                          ;
jmp      LF0C6                         ; 0x1eff6 $EFE6 4C C6 F0                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LEFE9                                                                          ;
.byt    $03                            ; 0x1eff9 $EFE9 03                      ;
.byt    $03                            ; 0x1effa $EFEA 03                      ;
.byt    $02                            ; 0x1effb $EFEB 02                      ;
.byt    $02                            ; 0x1effc $EFEC 02                      ;
ora      ($01,x)                       ; 0x1effd $EFED 01 01                   ;
brk                                    ; 0x1efff $EFEF 00                      ;
brk                                    ; 0x1f000 $EFF0 00                      ;
brk                                    ; 0x1f001 $EFF1 00                      ;
bank7_Enemy_Routines2_Moa                                                      ;
lda      #$01                          ; 0x1f002 $EFF2 A9 01                   ; A = 01
sta      $02                           ; 0x1f004 $EFF4 85 02                   ;
lda      $71,x                         ; 0x1f006 $EFF6 B5 71                   ;; Enemy X Velocity
bpl      LEFFC                         ; 0x1f008 $EFF8 10 02                   ;
inc      $02                           ; 0x1f00a $EFFA E6 02                   ;
LEFFC                                                                          ;
ldx      #$1E                          ; 0x1f00c $EFFC A2 1E                   ; X = 1E
lda      $12                           ; 0x1f00e $EFFE A5 12                   ;; Frame Counter (ascending)
and      #$10                          ; 0x1f010 $F000 29 10                   ; keep bits ...x ....
bne      LF00A                         ; 0x1f012 $F002 D0 06                   ;
lda      $03                           ; 0x1f014 $F004 A5 03                   ;
ora      #$80                          ; 0x1f016 $F006 09 80                   ; set  bits x... ....
sta      $03                           ; 0x1f018 $F008 85 03                   ;
LF00A                                                                          ;
jsr      LF216                         ; 0x1f01a $F00A 20 16 F2                ;
ldx      $10                           ; 0x1f01d $F00D A6 10                   ;; used as monster x register ;draw boss hp bar
ldy      $91,x                         ; 0x1f01f $F00F B4 91                   ;
lda      $71,x                         ; 0x1f021 $F011 B5 71                   ;; Enemy X Velocity
bpl      LF017                         ; 0x1f023 $F013 10 02                   ;
eor      #$FF                          ; 0x1f025 $F015 49 FF                   ;;Flip Bits:1111_1111
LF017                                                                          ;
lsr                                    ; 0x1f027 $F017 4A                      ;
lsr                                    ; 0x1f028 $F018 4A                      ;
tax                                    ; 0x1f029 $F019 AA                      ;
lda      $0207,y                       ; 0x1f02a $F01A B9 07 02                ;
sec                                    ; 0x1f02d $F01D 38                      ;
sbc      LEFE9,x                       ; 0x1f02e $F01E FD E9 EF                ;
sta      $0207,y                       ; 0x1f031 $F021 99 07 02                ;
ldx      $10                           ; 0x1f034 $F024 A6 10                   ;; used as monster x register ;draw boss hp bar
rts                                    ; 0x1f036 $F026 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines2_Deeler                                                   ;
lda      $03                           ; 0x1f037 $F027 A5 03                   ;
ldy      $AF,x                         ; 0x1f039 $F029 B4 AF                   ;; Various enemy state variables
bne      LF02F                         ; 0x1f03b $F02B D0 02                   ;
ora      #$80                          ; 0x1f03d $F02D 09 80                   ; set  bits x... .... (vertical flip bit)
LF02F                                                                          ;
cpy      #$00                          ; 0x1f03f $F02F C0 00                   ;
bpl      LF037                         ; 0x1f041 $F031 10 04                   ;
inc      $00                           ; 0x1f043 $F033 E6 00                   ;
inc      $00                           ; 0x1f045 $F035 E6 00                   ;
LF037                                                                          ;
sta      $03                           ; 0x1f047 $F037 85 03                   ;
ldy      $91,x                         ; 0x1f049 $F039 B4 91                   ;
lda      $12                           ; 0x1f04b $F03B A5 12                   ;; Frame Counter (ascending)
lsr                                    ; 0x1f04d $F03D 4A                      ;
lsr                                    ; 0x1f04e $F03E 4A                      ;
lsr                                    ; 0x1f04f $F03F 4A                      ;
and      #$01                          ; 0x1f050 $F040 29 01                   ; keep bits .... ...x
tax                                    ; 0x1f052 $F042 AA                      ;
inx                                    ; 0x1f053 $F043 E8                      ;
stx      $02                           ; 0x1f054 $F044 86 02                   ;
ldx      #$10                          ; 0x1f056 $F046 A2 10                   ; X = 10
jsr      LF0C6                         ; 0x1f058 $F048 20 C6 F0                ;
lda      $C9                           ; 0x1f05b $F04B A5 C9                   ;
and      #$0C                          ; 0x1f05d $F04D 29 0C                   ; keep bits .... xx..
bne      LF0A7                         ; 0x1f05f $F04F D0 56                   ;
lda      $AF,x                         ; 0x1f061 $F051 B5 AF                   ;; Various enemy state variables
bmi      LF0A7                         ; 0x1f063 $F053 30 52                   ;
ldy      $91,x                         ; 0x1f065 $F055 B4 91                   ;
lda      $2A,x                         ; 0x1f067 $F057 B5 2A                   ; Enemy Y position
sec                                    ; 0x1f069 $F059 38                      ;
sbc      $05DD                         ; 0x1f06a $F05A ED DD 05                ;
beq      LF0A7                         ; 0x1f06d $F05D F0 48                   ;
ldy      #$FF                          ; 0x1f06f $F05F A0 FF                   ; Y = FF
LF061                                                                          ;
iny                                    ; 0x1f071 $F061 C8                      ;
sec                                    ; 0x1f072 $F062 38                      ;
sbc      #$03                          ; 0x1f073 $F063 E9 03                   ;
bpl      LF061                         ; 0x1f075 $F065 10 FA                   ;
sty      $00                           ; 0x1f077 $F067 84 00                   ;
ldy      $91,x                         ; 0x1f079 $F069 B4 91                   ;
lda      $12                           ; 0x1f07b $F06B A5 12                   ;; Frame Counter (ascending)
lsr                                    ; 0x1f07d $F06D 4A                      ;
lda      $00                           ; 0x1f07e $F06E A5 00                   ;
bcc      LF074                         ; 0x1f080 $F070 90 02                   ;
lda      #$00                          ; 0x1f082 $F072 A9 00                   ; A = 00
LF074                                                                          ;
lsr                                    ; 0x1f084 $F074 4A                      ;
clc                                    ; 0x1f085 $F075 18                      ;
adc      $05DD                         ; 0x1f086 $F076 6D DD 05                ;
sta      $0208,y                       ; 0x1f089 $F079 99 08 02                ;
adc      $00                           ; 0x1f08c $F07C 65 00                   ;
sta      $020C,y                       ; 0x1f08e $F07E 99 0C 02                ;
adc      $00                           ; 0x1f091 $F081 65 00                   ;
sta      $0210,y                       ; 0x1f093 $F083 99 10 02                ;
lda      $CD                           ; 0x1f096 $F086 A5 CD                   ;
sta      $020B,y                       ; 0x1f098 $F088 99 0B 02                ;
sta      $020F,y                       ; 0x1f09b $F08B 99 0F 02                ;
sta      $0213,y                       ; 0x1f09e $F08E 99 13 02                ;
lda      #$01                          ; 0x1f0a1 $F091 A9 01                   ; A = 01
sta      $020A,y                       ; 0x1f0a3 $F093 99 0A 02                ;
sta      $020E,y                       ; 0x1f0a6 $F096 99 0E 02                ;
sta      $0212,y                       ; 0x1f0a9 $F099 99 12 02                ;
lda      #$BE                          ; 0x1f0ac $F09C A9 BE                   ; A = BE
sta      $0209,y                       ; 0x1f0ae $F09E 99 09 02                ;
sta      $020D,y                       ; 0x1f0b1 $F0A1 99 0D 02                ;
sta      $0211,y                       ; 0x1f0b4 $F0A4 99 11 02                ;
LF0A7                                                                          ;
rts                                    ; 0x1f0b7 $F0A7 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines2_Octorok                                                  ;
lda      $00                           ; 0x1f0b8 $F0A8 A5 00                   ;
cmp      #$B5                          ; 0x1f0ba $F0AA C9 B5                   ;
bcc      LF0B5                         ; 0x1f0bc $F0AC 90 07                   ;
lda      $03                           ; 0x1f0be $F0AE A5 03                   ;
ora      $0753                         ; 0x1f0c0 $F0B0 0D 53 07                ;
sta      $03                           ; 0x1f0c3 $F0B3 85 03                   ;
LF0B5                                                                          ;
lda      #$12                          ; 0x1f0c5 $F0B5 A9 12                   ; A = 12
bne      LF0BB                         ; 0x1f0c7 $F0B7 D0 02                   ;
bank7_Enemy_Routines2_BagoBago                                                 ;
lda      #$0C                          ; 0x1f0c9 $F0B9 A9 0C                   ; A = 0C
LF0BB                                                                          ;
sta      $05                           ; 0x1f0cb $F0BB 85 05                   ;
lda      $12                           ; 0x1f0cd $F0BD A5 12                   ; Permanent Frame Counter
and      #$08                          ; 0x1f0cf $F0BF 29 08                   ; keep bits .... x...
lsr                                    ; 0x1f0d1 $F0C1 4A                      ;
lsr                                    ; 0x1f0d2 $F0C2 4A                      ;
adc      $05                           ; 0x1f0d3 $F0C3 65 05                   ;
tax                                    ; 0x1f0d5 $F0C5 AA                      ;
LF0C6                                                                          ;
jsr      LF216                         ; 0x1f0d6 $F0C6 20 16 F2                ;
ldx      $10                           ; 0x1f0d9 $F0C9 A6 10                   ;; used as monster x register ;draw boss hp bar
rts                                    ; 0x1f0db $F0CB 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
sta      $05                           ; 0x1f0dc $F0CC 85 05                   ;
lda      $12                           ; 0x1f0de $F0CE A5 12                   ; Permanent Frame Counter
and      #$08                          ; 0x1f0e0 $F0D0 29 08                   ; keep bits .... x...
lsr                                    ; 0x1f0e2 $F0D2 4A                      ;
lsr                                    ; 0x1f0e3 $F0D3 4A                      ;
adc      $05                           ; 0x1f0e4 $F0D4 65 05                   ;
tax                                    ; 0x1f0e6 $F0D6 AA                      ;
jsr      LF1F4                         ; 0x1f0e7 $F0D7 20 F4 F1                ;
ldx      $10                           ; 0x1f0ea $F0DA A6 10                   ;; used as monster x register ;draw boss hp bar
rts                                    ; 0x1f0ec $F0DC 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines2_Fairy                                                    ;
lda      $C9                           ; 0x1f0ed $F0DD A5 C9                   ;
and      #$08                          ; 0x1f0ef $F0DF 29 08                   ; keep bits .... x...
bne      LF10B                         ; 0x1f0f1 $F0E1 D0 28                   ;
lda      $12                           ; 0x1f0f3 $F0E3 A5 12                   ;; Frame Counter (ascending)
and      #$38                          ; 0x1f0f5 $F0E5 29 38                   ; keep bits ..xx x...
lsr                                    ; 0x1f0f7 $F0E7 4A                      ;
lsr                                    ; 0x1f0f8 $F0E8 4A                      ;
lsr                                    ; 0x1f0f9 $F0E9 4A                      ;
tax                                    ; 0x1f0fa $F0EA AA                      ;
lda      $00                           ; 0x1f0fb $F0EB A5 00                   ;
adc      #$08                          ; 0x1f0fd $F0ED 69 08                   ;
adc      bank7_Table_for_Fairy_floating_movement,x; 0x1f0ff $F0EF 7D B0 EB     ;
sta      $0200,y                       ; 0x1f102 $F0F2 99 00 02                ;
ldx      $10                           ; 0x1f105 $F0F5 A6 10                   ;; used as monster x register ;draw boss hp bar
lda      $01                           ; 0x1f107 $F0F7 A5 01                   ;
sta      $0203,y                       ; 0x1f109 $F0F9 99 03 02                ;
LF0FC                                                                          ;
lda      #$01                          ; 0x1f10c $F0FC A9 01                   ; A = 01
sta      $0202,y                       ; 0x1f10e $F0FE 99 02 02                ;
lda      $12                           ; 0x1f111 $F101 A5 12                   ;; Frame Counter (ascending)
and      #$04                          ; 0x1f113 $F103 29 04                   ; keep bits .... .x..
lsr                                    ; 0x1f115 $F105 4A                      ;
adc      #$68                          ; 0x1f116 $F106 69 68                   ;
sta      $0201,y                       ; 0x1f118 $F108 99 01 02                ;
LF10B                                                                          ;
rts                                    ; 0x1f11b $F10B 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_table31                                                                  ;
.byt    $03,$02,$00,$01,$01,$01        ; 0x1f11c $F10C 03 02 00 01 01 01       ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines2_RedJar                                                   ;
lda      #$02                          ; 0x1f122 $F112 A9 02                   ; A = 02
sta      $02                           ; 0x1f124 $F114 85 02                   ;
lda      $AF,x                         ; 0x1f126 $F116 B5 AF                   ;; Various enemy state variables
and      #$7F                          ; 0x1f128 $F118 29 7F                   ; keep bits .xxx xxxx
tax                                    ; 0x1f12a $F11A AA                      ;
pha                                    ; 0x1f12b $F11B 48                      ;
cpx      #$10                          ; 0x1f12c $F11C E0 10                   ;
bcc      LF125                         ; 0x1f12e $F11E 90 05                   ;
lda      LF0FC,x                       ; 0x1f130 $F120 BD FC F0                ;
sta      $03                           ; 0x1f133 $F123 85 03                   ;
LF125                                                                          ;
pla                                    ; 0x1f135 $F125 68                      ;
asl                                    ; 0x1f136 $F126 0A                      ;
adc      #$2E                          ; 0x1f137 $F127 69 2E                   ;
tax                                    ; 0x1f139 $F129 AA                      ;
jsr      LF0C6                         ; 0x1f13a $F12A 20 C6 F0                ;
lda      $01FD,y                       ; 0x1f13d $F12D B9 FD 01                ;
cmp      #$F5                          ; 0x1f140 $F130 C9 F5                   ;
bne      LF137                         ; 0x1f142 $F132 D0 03                   ;
sta      $01FC,y                       ; 0x1f144 $F134 99 FC 01                ;
LF137                                                                          ;
jmp      LEF08                         ; 0x1f147 $F137 4C 08 EF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines2_LockedDoor                                               ;
lda      $C9                           ; 0x1f14a $F13A A5 C9                   ;
and      #$08                          ; 0x1f14c $F13C 29 08                   ; keep bits .... x...
bne      LF17D                         ; 0x1f14e $F13E D0 3D                   ;
dec      $00                           ; 0x1f150 $F140 C6 00                   ;
lda      $00                           ; 0x1f152 $F142 A5 00                   ;
clc                                    ; 0x1f154 $F144 18                      ;
adc      #$10                          ; 0x1f155 $F145 69 10                   ;
sta      $0200,y                       ; 0x1f157 $F147 99 00 02                ;
adc      #$10                          ; 0x1f15a $F14A 69 10                   ;
sec                                    ; 0x1f15c $F14C 38                      ;
sbc      $AF,x                         ; 0x1f15d $F14D F5 AF                   ;; Various enemy state variables
sta      $0204,y                       ; 0x1f15f $F14F 99 04 02                ;
lda      $00                           ; 0x1f162 $F152 A5 00                   ;
clc                                    ; 0x1f164 $F154 18                      ;
adc      $AF,x                         ; 0x1f165 $F155 75 AF                   ;; Various enemy state variables
sta      $0208,y                       ; 0x1f167 $F157 99 08 02                ;
lda      $01                           ; 0x1f16a $F15A A5 01                   ;
sta      $0203,y                       ; 0x1f16c $F15C 99 03 02                ;
sta      $0207,y                       ; 0x1f16f $F15F 99 07 02                ;
sta      $020B,y                       ; 0x1f172 $F162 99 0B 02                ;
lda      #$76                          ; 0x1f175 $F165 A9 76                   ; A = 76
sta      $0201,y                       ; 0x1f177 $F167 99 01 02                ;
lda      #$74                          ; 0x1f17a $F16A A9 74                   ; A = 74
sta      $0205,y                       ; 0x1f17c $F16C 99 05 02                ;
sta      $0209,y                       ; 0x1f17f $F16F 99 09 02                ;
lda      #$01                          ; 0x1f182 $F172 A9 01                   ; A = 01
sta      $0202,y                       ; 0x1f184 $F174 99 02 02                ;
sta      $0206,y                       ; 0x1f187 $F177 99 06 02                ;
sta      $020A,y                       ; 0x1f18a $F17A 99 0A 02                ;
LF17D                                                                          ;
rts                                    ; 0x1f18d $F17D 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Enemy_Routines2_Ache_and_Acheman                                         ;
lda      $A1,x                         ; 0x1f18e $F17E B5 A1                   ; Enemy Code
cmp      #$0A                          ; 0x1f190 $F180 C9 0A                   ; check if Acheman
bne      LF188                         ; 0x1f192 $F182 D0 04                   ;
lda      $AF,x                         ; 0x1f194 $F184 B5 AF                   ;; Various enemy state variables
bne      LF1AD                         ; 0x1f196 $F186 D0 25                   ;
LF188                                                                          ;
lda      $03                           ; 0x1f198 $F188 A5 03                   ;
ora      #$80                          ; 0x1f19a $F18A 09 80                   ; set  bits x... ....
sta      $03                           ; 0x1f19c $F18C 85 03                   ;
lda      #$02                          ; 0x1f19e $F18E A9 02                   ; A = 02
sta      $02                           ; 0x1f1a0 $F190 85 02                   ;
lda      $81,x                         ; 0x1f1a2 $F192 B5 81                   ;; Current Animation Frame for Enemys
ldx      #$16                          ; 0x1f1a4 $F194 A2 16                   ; X = 16
asl                                    ; 0x1f1a6 $F196 0A                      ;
beq      LF1A7                         ; 0x1f1a7 $F197 F0 0E                   ;
lda      $03                           ; 0x1f1a9 $F199 A5 03                   ;
and      #$0F                          ; 0x1f1ab $F19B 29 0F                   ; keep bits .... xxxx
sta      $03                           ; 0x1f1ad $F19D 85 03                   ;
lda      #$16                          ; 0x1f1af $F19F A9 16                   ; A = 16
jsr      LF0BB                         ; 0x1f1b1 $F1A1 20 BB F0                ;
jmp      LEF08                         ; 0x1f1b4 $F1A4 4C 08 EF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LF1A7                                                                          ;
jsr      LF0C6                         ; 0x1f1b7 $F1A7 20 C6 F0                ;
jmp      LEF08                         ; 0x1f1ba $F1AA 4C 08 EF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LF1AD                                                                          ;
ldx      #$1A                          ; 0x1f1bd $F1AD A2 1A                   ;;X = #$1a 0001_1010
jsr      LF216                         ; 0x1f1bf $F1AF 20 16 F2                ;
jmp      LF0C6                         ; 0x1f1c2 $F1B2 4C C6 F0                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LF1B5                                                                          ;
ora      $03                           ; 0x1f1c5 $F1B5 05 03                   ;
sty      $09                           ; 0x1f1c7 $F1B7 84 09                   ;
stx      $08                           ; 0x1f1c9 $F1B9 86 08                   ;
ldx      $10                           ; 0x1f1cb $F1BB A6 10                   ;; used as monster x register ;draw boss hp bar
ldy      $040E,x                       ; 0x1f1cd $F1BD BC 0E 04                ;; Enemy Hit State (0 = not in Hit State)	;	causes flashing
beq      LF1CC                         ; 0x1f1d0 $F1C0 F0 0A                   ;
and      #$FC                          ; 0x1f1d2 $F1C2 29 FC                   ; keep bits xxxx xx..
sta      $04                           ; 0x1f1d4 $F1C4 85 04                   ;
tya                                    ; 0x1f1d6 $F1C6 98                      ;
lsr                                    ; 0x1f1d7 $F1C7 4A                      ;
and      #$03                          ; 0x1f1d8 $F1C8 29 03                   ; keep bits .... ..xx
ora      $04                           ; 0x1f1da $F1CA 05 04                   ;
LF1CC                                                                          ;
ldy      $09                           ; 0x1f1dc $F1CC A4 09                   ;
sta      $0202,y                       ; 0x1f1de $F1CE 99 02 02                ;
sta      $0206,y                       ; 0x1f1e1 $F1D1 99 06 02                ;
ldx      $08                           ; 0x1f1e4 $F1D4 A6 08                   ;
rts                                    ; 0x1f1e6 $F1D6 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LF1D7                                                                          ;
lda      #$08                          ; 0x1f1e7 $F1D7 A9 08                   ; A = 08
sta      $0A                           ; 0x1f1e9 $F1D9 85 0A                   ;
LF1DB                                                                          ;
lda      $0A                           ; 0x1f1eb $F1DB A5 0A                   ;
and      $C9                           ; 0x1f1ed $F1DD 25 C9                   ;
beq      LF1E6                         ; 0x1f1ef $F1DF F0 05                   ;
lda      #$F8                          ; 0x1f1f1 $F1E1 A9 F8                   ; A = F8
sta      $0200,y                       ; 0x1f1f3 $F1E3 99 00 02                ;
LF1E6                                                                          ;
iny                                    ; 0x1f1f6 $F1E6 C8                      ;
iny                                    ; 0x1f1f7 $F1E7 C8                      ;
iny                                    ; 0x1f1f8 $F1E8 C8                      ;
iny                                    ; 0x1f1f9 $F1E9 C8                      ;
lsr      $0A                           ; 0x1f1fa $F1EA 46 0A                   ;
dex                                    ; 0x1f1fc $F1EC CA                      ;
bne      LF1DB                         ; 0x1f1fd $F1ED D0 EC                   ;
ldx      $08                           ; 0x1f1ff $F1EF A6 08                   ;
ldy      $09                           ; 0x1f201 $F1F1 A4 09                   ;
rts                                    ; 0x1f203 $F1F3 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LF1F4                                                                          ;
lda      $02                           ; 0x1f204 $F1F4 A5 02                   ;
lsr                                    ; 0x1f206 $F1F6 4A                      ;
lda      $6ED4,x                       ; 0x1f207 $F1F7 BD D4 6E                ;
bcc      LF209                         ; 0x1f20a $F1FA 90 0D                   ;
sta      $0205,y                       ; 0x1f20c $F1FC 99 05 02                ;
lda      $6ED5,x                       ; 0x1f20f $F1FF BD D5 6E                ;
sta      $0201,y                       ; 0x1f212 $F202 99 01 02                ;
lda      #$40                          ; 0x1f215 $F205 A9 40                   ; A = 40
bne      LF214                         ; 0x1f217 $F207 D0 0B                   ;
LF209                                                                          ;
sta      $0201,y                       ; 0x1f219 $F209 99 01 02                ;
lda      $6ED5,x                       ; 0x1f21c $F20C BD D5 6E                ;
sta      $0205,y                       ; 0x1f21f $F20F 99 05 02                ;
lda      #$00                          ; 0x1f222 $F212 A9 00                   ; A = 00
LF214                                                                          ;
bpl      LF236                         ; 0x1f224 $F214 10 20                   ;
LF216                                                                          ;
lda      $02                           ; 0x1f226 $F216 A5 02                   ;
lsr                                    ; 0x1f228 $F218 4A                      ;
lda      bank7_table_item_sprites_map_to_graphic_image,x; 0x1f229 $F219 BD 51 EE;
bcc      LF22B                         ; 0x1f22c $F21C 90 0D                   ;
sta      $0205,y                       ; 0x1f22e $F21E 99 05 02                ;
lda      LEE52,x                       ; 0x1f231 $F221 BD 52 EE                ;
sta      $0201,y                       ; 0x1f234 $F224 99 01 02                ;
lda      #$40                          ; 0x1f237 $F227 A9 40                   ; A = 40
bne      LF236                         ; 0x1f239 $F229 D0 0B                   ;
LF22B                                                                          ;
sta      $0201,y                       ; 0x1f23b $F22B 99 01 02                ;
lda      LEE52,x                       ; 0x1f23e $F22E BD 52 EE                ;
sta      $0205,y                       ; 0x1f241 $F231 99 05 02                ;
lda      #$00                          ; 0x1f244 $F234 A9 00                   ; A = 00
LF236                                                                          ;
pha                                    ; 0x1f246 $F236 48                      ;
lda      #$01                          ; 0x1f247 $F237 A9 01                   ; A = 01
sta      $0F                           ; 0x1f249 $F239 85 0F                   ;
pla                                    ; 0x1f24b $F23B 68                      ;
jsr      LF1B5                         ; 0x1f24c $F23C 20 B5 F1                ;
lda      $C9                           ; 0x1f24f $F23F A5 C9                   ;
and      #$F0                          ; 0x1f251 $F241 29 F0                   ; keep bits xxxx ....
bne      LF25D                         ; 0x1f253 $F243 D0 18                   ;
lda      $00                           ; 0x1f255 $F245 A5 00                   ;
sta      $0200,y                       ; 0x1f257 $F247 99 00 02                ;
sta      $0204,y                       ; 0x1f25a $F24A 99 04 02                ;
ldx      #$02                          ; 0x1f25d $F24D A2 02                   ; X = 02
jsr      LF1D7                         ; 0x1f25f $F24F 20 D7 F1                ;
lda      $01                           ; 0x1f262 $F252 A5 01                   ;
sta      $0203,y                       ; 0x1f264 $F254 99 03 02                ;
clc                                    ; 0x1f267 $F257 18                      ;
adc      #$08                          ; 0x1f268 $F258 69 08                   ;
sta      $0207,y                       ; 0x1f26a $F25A 99 07 02                ;
LF25D                                                                          ;
lda      $00                           ; 0x1f26d $F25D A5 00                   ;
clc                                    ; 0x1f26f $F25F 18                      ;
adc      #$10                          ; 0x1f270 $F260 69 10                   ;
sta      $00                           ; 0x1f272 $F262 85 00                   ;
tya                                    ; 0x1f274 $F264 98                      ;
clc                                    ; 0x1f275 $F265 18                      ;
adc      #$08                          ; 0x1f276 $F266 69 08                   ;
tay                                    ; 0x1f278 $F268 A8                      ;
inx                                    ; 0x1f279 $F269 E8                      ;
inx                                    ; 0x1f27a $F26A E8                      ;
rts                                    ; 0x1f27b $F26B 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Tables_for_Various_Bitmasks2                                             ;
.byt    $80,$40,$20,$10                ; 0x1f27c $F26C 80 40 20 10             ;
LF270                                                                          ;
.byt    $08,$04,$02,$01                ; 0x1f280 $F270 08 04 02 01             ;
LF274                                                                          ;
.byt    $00,$08,$10,$18,$20,$28,$30,$38; 0x1f284 $F274 00 08 10 18 20 28 30 38 ;
.byt    $40                            ; 0x1f28c $F27C 40                      ;
; ---------------------------------------------------------------------------- ;
bank7_code51                                                                   ;
sty      $00                           ; 0x1f28d $F27D 84 00                   ;
lda      #$00                          ; 0x1f28f $F27F A9 00                   ; A = 00
sta      $C8,y                         ; 0x1f291 $F281 99 C8 00                ;
ldy      #$03                          ; 0x1f294 $F284 A0 03                   ; Y = 03
LF286                                                                          ;
lda      $4D,x                         ; 0x1f296 $F286 B5 4D                   ; Link's Current X position (low byte)
clc                                    ; 0x1f298 $F288 18                      ;
adc      LF274,y                       ; 0x1f299 $F289 79 74 F2                ;
sta      L000E                         ; 0x1f29c $F28C 85 0E                   ;
lda      $3B,x                         ; 0x1f29e $F28E B5 3B                   ; Link's Current X position (high byte)
adc      #$00                          ; 0x1f2a0 $F290 69 00                   ;
sta      $0F                           ; 0x1f2a2 $F292 85 0F                   ;
lda      L000E                         ; 0x1f2a4 $F294 A5 0E                   ;
cmp      $072C                         ; 0x1f2a6 $F296 CD 2C 07                ; Scrolling Offset Low Byte
lda      $0F                           ; 0x1f2a9 $F299 A5 0F                   ;
sbc      $072A                         ; 0x1f2ab $F29B ED 2A 07                ; Scrolling Offset High Byte
beq      LF2AF                         ; 0x1f2ae $F29E F0 0F                   ;
sty      $01                           ; 0x1f2b0 $F2A0 84 01                   ;
lda      LF270,y                       ; 0x1f2b2 $F2A2 B9 70 F2                ;
ldy      $00                           ; 0x1f2b5 $F2A5 A4 00                   ;
ora      $C8,y                         ; 0x1f2b7 $F2A7 19 C8 00                ;
sta      $C8,y                         ; 0x1f2ba $F2AA 99 C8 00                ;
ldy      $01                           ; 0x1f2bd $F2AD A4 01                   ;
LF2AF                                                                          ;
dey                                    ; 0x1f2bf $F2AF 88                      ;
bpl      LF286                         ; 0x1f2c0 $F2B0 10 D4                   ;
ldy      $00                           ; 0x1f2c2 $F2B2 A4 00                   ;
lda      $29,x                         ; 0x1f2c4 $F2B4 B5 29                   ; Link's Y Position
clc                                    ; 0x1f2c6 $F2B6 18                      ;
adc      #$10                          ; 0x1f2c7 $F2B7 69 10                   ;
lda      $19,x                         ; 0x1f2c9 $F2B9 B5 19                   ;;fall_or_invisible (0=invisible, 1=normal, 2~FF=fall in hole)
adc      #$00                          ; 0x1f2cb $F2BB 69 00                   ;
cmp      #$01                          ; 0x1f2cd $F2BD C9 01                   ;
beq      LF2C9                         ; 0x1f2cf $F2BF F0 08                   ;
lda      #$F0                          ; 0x1f2d1 $F2C1 A9 F0                   ; A = F0
ora      $C8,y                         ; 0x1f2d3 $F2C3 19 C8 00                ;
sta      $C8,y                         ; 0x1f2d6 $F2C6 99 C8 00                ;
LF2C9                                                                          ;
lda      $4D,x                         ; 0x1f2d9 $F2C9 B5 4D                   ; Link's X Position (low byte)
sec                                    ; 0x1f2db $F2CB 38                      ;
sbc      $072C                         ; 0x1f2dc $F2CC ED 2C 07                ; Scrolling Offset Low Byte
sta      $CC,y                         ; 0x1f2df $F2CF 99 CC 00                ;
rts                                    ; 0x1f2e2 $F2D2 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LF2D3                                                                          ;
lda      #$00                          ; 0x1f2e3 $F2D3 A9 00                   ; A = 00
sta      $02                           ; 0x1f2e5 $F2D5 85 02                   ;
ldy      #$07                          ; 0x1f2e7 $F2D7 A0 07                   ; Y = 07
LF2D9                                                                          ;
lda      $4D,x                         ; 0x1f2e9 $F2D9 B5 4D                   ; Link's X Position (low byte)
clc                                    ; 0x1f2eb $F2DB 18                      ;
adc      LF274,y                       ; 0x1f2ec $F2DC 79 74 F2                ;
sta      L000E                         ; 0x1f2ef $F2DF 85 0E                   ;
lda      $3B,x                         ; 0x1f2f1 $F2E1 B5 3B                   ; Link's X position (high byte)
adc      #$00                          ; 0x1f2f3 $F2E3 69 00                   ;
sta      $0F                           ; 0x1f2f5 $F2E5 85 0F                   ;
lda      L000E                         ; 0x1f2f7 $F2E7 A5 0E                   ;
cmp      $072C                         ; 0x1f2f9 $F2E9 CD 2C 07                ; Scrolling Offset Low Byte
lda      $0F                           ; 0x1f2fc $F2EC A5 0F                   ;
sbc      $072A                         ; 0x1f2fe $F2EE ED 2A 07                ; Scrolling Offset High Byte
beq      LF2FA                         ; 0x1f301 $F2F1 F0 07                   ;
lda      $02                           ; 0x1f303 $F2F3 A5 02                   ;
ora      bank7_Tables_for_Various_Bitmasks2,y; 0x1f305 $F2F5 19 6C F2          ;
sta      $02                           ; 0x1f308 $F2F8 85 02                   ;
LF2FA                                                                          ;
dey                                    ; 0x1f30a $F2FA 88                      ;
bpl      LF2D9                         ; 0x1f30b $F2FB 10 DC                   ;
lda      $02                           ; 0x1f30d $F2FD A5 02                   ;
rts                                    ; 0x1f30f $F2FF 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_UNKNOWN2                                                                 ;
.byt    $55,$AB,$D5,$AA,$5A,$4B,$95,$4A; 0x1f310 $F300 55 AB D5 AA 5A 4B 95 4A ;
.byt    $55,$A9,$54,$D5,$D6,$AA,$A4,$35; 0x1f318 $F308 55 A9 54 D5 D6 AA A4 35 ;
.byt    $4B,$89,$52,$55,$D9,$5B,$5F,$57; 0x1f320 $F310 4B 89 52 55 D9 5B 5F 57 ;
.byt    $75,$2A,$49,$42,$92,$22,$4D,$D5; 0x1f328 $F318 75 2A 49 42 92 22 4D D5 ;
.byt    $76,$DB,$D7,$2A,$A5,$24,$92,$28; 0x1f330 $F320 76 DB D7 2A A5 24 92 28 ;
.byt    $52,$A9,$7F,$DF,$DB,$6D,$4F,$89; 0x1f338 $F328 52 A9 7F DF DB 6D 4F 89 ;
.byt    $20,$24,$82,$88,$D2,$7B,$77,$AD; 0x1f340 $F330 20 24 82 88 D2 7B 77 AD ;
.byt    $AA,$54,$8A,$41,$48,$FF,$7F,$57; 0x1f348 $F338 AA 54 8A 41 48 FF 7F 57 ;
.byt    $7B,$5F,$12,$02,$92,$22,$02,$6A; 0x1f350 $F340 7B 5F 12 02 92 22 02 6A ;
.byt    $7B,$57,$AA,$6A,$A5,$48,$10,$FF; 0x1f358 $F348 7B 57 AA 6A A5 48 10 FF ;
.byt    $FF,$77,$73,$7F,$45,$20,$40,$89; 0x1f360 $F350 FF 77 73 7F 45 20 40 89 ;
.byt    $08,$2A,$B5,$53,$95,$AA,$AA,$24; 0x1f368 $F358 08 2A B5 53 95 AA AA 24 ;
.byt    $6A,$FF,$FF,$BF,$D6,$57,$82,$00; 0x1f370 $F360 6A FF FF BF D6 57 82 00 ;
.byt    $28,$49,$88,$A8,$D6,$AC,$A4,$D2; 0x1f378 $F368 28 49 88 A8 D6 AC A4 D2 ;
.byt    $8C,$DA,$FF,$FF,$BF,$D6,$B5,$08; 0x1f380 $F370 8C DA FF FF BF D6 B5 08 ;
.byt    $08,$20,$29,$82,$90,$D6,$56,$25; 0x1f388 $F378 08 20 29 82 90 D6 56 25 ;
.byt    $A9,$A6,$DD,$FF,$FF,$AF,$DA,$35; 0x1f390 $F380 A9 A6 DD FF FF AF DA 35 ;
.byt    $22,$80,$A0,$A2,$80,$A0,$5A,$A7; 0x1f398 $F388 22 80 A0 A2 80 A0 5A A7 ;
.byt    $94,$4A,$5B,$FD,$FF,$FF,$CD,$7A; 0x1f3a0 $F390 94 4A 5B FD FF FF CD 7A ;
.byt    $8B,$02,$01,$8A,$04,$22,$88,$76; 0x1f3a8 $F398 8B 02 01 8A 04 22 88 76 ;
.byt    $55,$52,$4A,$DB,$FF,$FF,$D7,$76; 0x1f3b0 $F3A0 55 52 4A DB FF FF D7 76 ;
.byt    $3F,$2A,$20,$48,$49,$20,$08,$75; 0x1f3b8 $F3A8 3F 2A 20 48 49 20 08 75 ;
.byt    $97,$8A,$AC,$56,$FA,$CA,$8A,$A8; 0x1f3c0 $F3B0 97 8A AC 56 FA CA 8A A8 ;
.byt    $A5,$4A,$01,$02,$95,$22,$08,$A0; 0x1f3c8 $F3B8 A5 4A 01 02 95 22 08 A0 ;
.byt    $4A,$52,$55,$B5,$55,$33,$95,$4A; 0x1f3d0 $F3C0 4A 52 55 B5 55 33 95 4A ;
.byt    $55,$AB,$55,$A9,$2A,$55,$55,$DD; 0x1f3d8 $F3C8 55 AB 55 A9 2A 55 55 DD ;
.byt    $37,$2A,$09,$4A,$AB,$6D,$57,$4A; 0x1f3e0 $F3D0 37 2A 09 4A AB 6D 57 4A ;
.byt    $29,$AA,$B5,$D5,$9A,$4A,$A5,$54; 0x1f3e8 $F3D8 29 AA B5 D5 9A 4A A5 54 ;
.byt    $AB,$5A,$A5,$52,$55,$AA,$FD,$17; 0x1f3f0 $F3E0 AB 5A A5 52 55 AA FD 17 ;
.byt    $A5,$00,$69,$6B,$7B,$93,$A2,$92; 0x1f3f8 $F3E8 A5 00 69 6B 7B 93 A2 92 ;
.byt    $74,$5B,$6D,$8D,$A2,$92,$5A,$5B; 0x1f400 $F3F0 74 5B 6D 8D A2 92 5A 5B ;
.byt    $AA,$2A,$4A,$DD,$FF,$98,$04,$20; 0x1f408 $F3F8 AA 2A 4A DD FF 98 04 20 ;
.byt    $B7,$76,$AF,$48,$89,$64,$77,$75; 0x1f410 $F400 B7 76 AF 48 89 64 77 75 ;
.byt    $AD,$88,$94,$B2,$B6,$4A,$8B,$A2; 0x1f418 $F408 AD 88 94 B2 B6 4A 8B A2 ;
.byt    $FF,$8F,$29,$00,$74,$CB,$FF,$08; 0x1f420 $F410 FF 8F 29 00 74 CB FF 08 ;
.byt    $2A,$22,$FD,$AD,$5D,$09,$64,$49; 0x1f428 $F418 2A 22 FD AD 5D 09 64 49 ;
.byt    $DD,$2A,$25,$EA,$FF,$D3,$08,$00; 0x1f430 $F420 DD 2A 25 EA FF D3 08 00 ;
.byt    $7E,$F6,$3D,$02,$25,$52,$FF,$D3; 0x1f438 $F428 7E F6 3D 02 25 52 FF D3 ;
.byt    $2D,$00,$35,$5A,$9F,$88,$D6,$FF; 0x1f440 $F430 2D 00 35 5A 9F 88 D6 FF ;
.byt    $B3,$00,$80,$7D,$FE,$0F,$80,$0A; 0x1f448 $F438 B3 00 80 7D FE 0F 80 0A ;
.byt    $ED,$DF,$BA,$02,$90,$A6,$ED,$0A; 0x1f450 $F440 ED DF BA 02 90 A6 ED 0A ;
.byt    $F2,$FF,$D3,$20,$00,$FD,$FC,$2F; 0x1f458 $F448 F2 FF D3 20 00 FD FC 2F ;
.byt    $00,$0C,$DE,$7F,$D3,$02,$C0,$9A; 0x1f460 $F450 00 0C DE 7F D3 02 C0 9A ;
.byt    $BE,$08,$FD,$BF,$0E,$01,$F0,$4F; 0x1f468 $F458 BE 08 FD BF 0E 01 F0 4F ;
.byt    $FF,$02,$40,$D2,$FF,$1D,$0D,$00; 0x1f470 $F460 FF 02 40 D2 FF 1D 0D 00 ;
.byt    $EE,$D1,$23,$F8,$FF,$1C,$08,$E0; 0x1f478 $F468 EE D1 23 F8 FF 1C 08 E0 ;
.byt    $3F,$FF,$03,$00,$C3,$FF,$37,$20; 0x1f480 $F470 3F FF 03 00 C3 FF 37 20 ;
.byt    $00,$FD,$C3,$42,$FF,$3F,$03,$00; 0x1f488 $F478 00 FD C3 42 FF 3F 03 00 ;
.byt    $FC,$DF,$F3,$00,$C0,$F5,$FF,$09; 0x1f490 $F480 FC DF F3 00 C0 F5 FF 09 ;
.byt    $00,$E0,$7F,$20,$F4,$FF,$37,$00; 0x1f498 $F488 00 E0 7F 20 F4 FF 37 00 ;
.byt    $C0,$FF,$3F,$03,$00,$D7,$FF,$13; 0x1f4a0 $F490 C0 FF 3F 03 00 D7 FF 13 ;
.byt    $00,$50,$7F,$03,$F8,$FF,$3B,$00; 0x1f4a8 $F498 00 50 7F 03 F8 FF 3B 00 ;
.byt    $C0,$FF,$3F,$01,$C0,$E7,$FF,$03; 0x1f4b0 $F4A0 C0 FF 3F 01 C0 E7 FF 03 ;
.byt    $00,$B0,$BF,$00,$FD,$FF,$0E,$00; 0x1f4b8 $F4A8 00 B0 BF 00 FD FF 0E 00 ;
.byt    $F8,$FF,$8B,$00,$F0,$F7,$3F,$00; 0x1f4c0 $F4B0 F8 FF 8B 00 F0 F7 3F 00 ;
.byt    $00,$F7,$07,$E0,$FF,$F3,$00,$C0; 0x1f4c8 $F4B8 00 F7 07 E0 FF F3 00 C0 ;
.byt    $FF,$3F,$08,$C0,$EF,$FF,$02,$00; 0x1f4d0 $F4C0 FF 3F 08 C0 EF FF 02 00 ;
.byt    $F0,$3F,$00,$FF,$CF,$03,$80,$FF; 0x1f4d8 $F4C8 F0 3F 00 FF CF 03 80 FF ;
.byt    $F7,$00,$00,$FF,$FF,$03,$00,$D0; 0x1f4e0 $F4D0 F7 00 00 FF FF 03 00 D0 ;
.byt    $BF,$00,$FF,$3F,$0F,$00,$FD,$EF; 0x1f4e8 $F4D8 BF 00 FF 3F 0F 00 FD EF ;
.byt    $03,$00,$FC,$FD,$0F,$00,$C0,$FF; 0x1f4f0 $F4E0 03 00 FC FD 0F 00 C0 FF ;
.byt    $00,$FC,$3F,$0F,$00,$FE,$DF,$03; 0x1f4f8 $F4E8 00 FC 3F 0F 00 FE DF 03 ;
.byt    $00,$FC,$FF,$0F,$00,$40,$FF,$02; 0x1f500 $F4F0 00 FC FF 0F 00 40 FF 02 ;
.byt    $FC,$3F,$0F,$00,$FC,$FF,$03,$00; 0x1f508 $F4F8 FC 3F 0F 00 FC FF 03 00 ;
.byt    $FC,$FF,$0F,$00,$40,$FF,$01,$FC; 0x1f510 $F500 FC FF 0F 00 40 FF 01 FC ;
.byt    $3F,$0F,$00,$FC,$FF,$03,$00,$FC; 0x1f518 $F508 3F 0F 00 FC FF 03 00 FC ;
.byt    $FF,$2F,$00,$00,$FF,$03,$F8,$BF; 0x1f520 $F510 FF 2F 00 00 FF 03 F8 BF ;
.byt    $2E,$00,$FC,$DF,$0F,$00,$F0,$F7; 0x1f528 $F518 2E 00 FC DF 0F 00 F0 F7 ;
.byt    $3F,$00,$00,$FF,$03,$F0,$FF,$BC; 0x1f530 $F520 3F 00 00 FF 03 F0 FF BC ;
.byt    $00,$F0,$FF,$3E,$00,$C0,$DF,$FF; 0x1f538 $F528 00 F0 FF 3E 00 C0 DF FF ;
.byt    $00,$00,$FC,$3F,$00,$FF,$CF,$03; 0x1f540 $F530 00 00 FC 3F 00 FF CF 03 ;
.byt    $00,$FF,$FF,$02,$00,$7E,$FF,$07; 0x1f548 $F538 00 FF FF 02 00 7E FF 07 ;
.byt    $00,$C0,$FF,$02,$F0,$FF,$BB,$00; 0x1f550 $F540 00 C0 FF 02 F0 FF BB 00 ;
.byt    $C0,$FF,$3F,$00,$80,$FF,$FF,$00; 0x1f558 $F548 C0 FF 3F 00 80 FF FF 00 ;
.byt    $00,$FD,$0F,$08,$C1,$FF,$BF,$00; 0x1f560 $F550 00 FD 0F 08 C1 FF BF 00 ;
.byt    $C0,$FF,$3F,$00,$C0,$FF,$5F,$00; 0x1f568 $F558 C0 FF 3F 00 C0 FF 5F 00 ;
.byt    $D0,$DD,$9D,$08,$A2,$FF,$FF,$00; 0x1f570 $F560 D0 DD 9D 08 A2 FF FF 00 ;
.byt    $00,$FC,$FF,$08,$00,$FF,$77,$09; 0x1f578 $F568 00 FC FF 08 00 FF 77 09 ;
.byt    $A0,$D6,$B7,$89,$A4,$62,$FF,$3F; 0x1f580 $F570 A0 D6 B7 89 A4 62 FF 3F ;
.byt    $00,$A0,$FD,$55,$0A,$62,$DD,$55; 0x1f588 $F578 00 A0 FD 55 0A 62 DD 55 ;
.byt    $75,$FF,$07,$00,$C0,$FF,$0F,$40; 0x1f590 $F580 75 FF 07 00 C0 FF 0F 40 ;
.byt    $D0,$FF,$0F,$02,$E8,$DF,$A8,$20; 0x1f598 $F588 D0 FF 0F 02 E8 DF A8 20 ;
.byt    $C8,$FF,$FF,$04,$00,$FC,$FF,$03; 0x1f5a0 $F590 C8 FF FF 04 00 FC FF 03 ;
.byt    $00,$FC,$FF,$0F,$00,$D0,$FF,$03; 0x1f5a8 $F598 00 FC FF 0F 00 D0 FF 03 ;
.byt    $00,$D0,$FF,$FF,$00,$00,$FF,$FF; 0x1f5b0 $F5A0 00 D0 FF FF 00 00 FF FF ;
.byt    $00,$00,$FF,$FF,$03,$00,$FC,$BF; 0x1f5b8 $F5A8 00 00 FF FF 03 00 FC BF ;
.byt    $00,$F0,$FF,$3F,$00,$C0,$FF,$BF; 0x1f5c0 $F5B0 00 F0 FF 3F 00 C0 FF BF ;
.byt    $00,$00,$FD,$FF,$00,$00,$F0,$0F; 0x1f5c8 $F5B8 00 00 FD FF 00 00 F0 0F ;
.byt    $FC,$FF,$3C,$00,$F0,$FF,$3F,$00; 0x1f5d0 $F5C0 FC FF 3C 00 F0 FF 3F 00 ;
.byt    $F0,$FF,$3F,$00,$00,$C0,$F2,$FF; 0x1f5d8 $F5C8 F0 FF 3F 00 00 C0 F2 FF ;
.byt    $DF,$00,$00,$FF,$FF,$00,$00,$FF; 0x1f5e0 $F5D0 DF 00 00 FF FF 00 00 FF ;
.byt    $FF,$01,$00,$00,$FC,$FF,$FF,$00; 0x1f5e8 $F5D8 FF 01 00 00 FC FF FF 00 ;
.byt    $C0,$FF,$7F,$00,$80,$FF,$FF,$00; 0x1f5f0 $F5E0 C0 FF 7F 00 80 FF FF 00 ;
.byt    $00,$00,$FF,$FF,$0F,$30,$FC,$FF; 0x1f5f8 $F5E8 00 00 FF FF 0F 30 FC FF ;
.byt    $0F,$00,$F0,$FF,$0F,$00,$00,$F0; 0x1f600 $F5F0 0F 00 F0 FF 0F 00 00 F0 ;
.byt    $FF,$3F,$F0,$C3,$FF,$3F,$F0,$80; 0x1f608 $F5F8 FF 3F F0 C3 FF 3F F0 80 ;
.byt    $FF,$0F,$00,$00,$F0,$FF,$0F,$F0; 0x1f610 $F600 FF 0F 00 00 F0 FF 0F F0 ;
.byt    $C3,$FF,$2F,$FC,$03,$FC,$03,$F0; 0x1f618 $F608 C3 FF 2F FC 03 FC 03 F0 ;
.byt    $0F,$FC,$FF,$00,$FF,$C0,$FF,$00; 0x1f620 $F610 0F FC FF 00 FF C0 FF 00 ;
.byt    $3F,$00,$2C,$00,$FF,$C0,$FF,$0F; 0x1f628 $F618 3F 00 2C 00 FF C0 FF 0F ;
.byt    $FC,$03,$FC,$2F,$00,$00,$F0,$03; 0x1f630 $F620 FC 03 FC 2F 00 00 F0 03 ;
.byt    $FC,$C0,$FF,$2F,$FC,$00,$F0,$3F; 0x1f638 $F628 FC C0 FF 2F FC 00 F0 3F ;
.byt    $00,$00,$C0,$0B,$3C,$FC,$FF,$0F; 0x1f640 $F630 00 00 C0 0B 3C FC FF 0F ;
.byt    $3F,$00,$FC,$0F,$00,$00,$FE,$03; 0x1f648 $F638 3F 00 FC 0F 00 00 FE 03 ;
.byt    $0F,$FF,$FF,$03,$3F,$70,$FF,$0F; 0x1f650 $F640 0F FF FF 03 3F 70 FF 0F ;
.byt    $00,$00,$F8,$C0,$0F,$FF,$FF,$C3; 0x1f658 $F648 00 00 F8 C0 0F FF FF C3 ;
.byt    $0F,$10,$FF,$03,$00,$00,$FF,$C0; 0x1f660 $F650 0F 10 FF 03 00 00 FF C0 ;
.byt    $C3,$FF,$FF,$C2,$0F,$C0,$FF,$03; 0x1f668 $F658 C3 FF FF C2 0F C0 FF 03 ;
.byt    $00,$00,$3F,$C0,$C3,$FF,$FF,$C0; 0x1f670 $F660 00 00 3F C0 C3 FF FF C0 ;
.byt    $03,$CC,$FF,$03,$00,$00,$BF,$C0; 0x1f678 $F668 03 CC FF 03 00 00 BF C0 ;
.byt    $C3,$FF,$FF,$C3,$03,$CC,$FF,$03; 0x1f680 $F670 C3 FF FF C3 03 CC FF 03 ;
.byt    $00,$00,$FD,$00,$03,$FF,$FF,$07; 0x1f688 $F678 00 00 FD 00 03 FF FF 07 ;
.byt    $0F,$F0,$FF,$0F,$00,$00,$FC,$03; 0x1f690 $F680 0F F0 FF 0F 00 00 FC 03 ;
.byt    $00,$FC,$FF,$3F,$3C,$C0,$FF,$3F; 0x1f698 $F688 00 FC FF 3F 3C C0 FF 3F ;
.byt    $00,$00,$F0,$2F,$00,$00,$FF,$FF; 0x1f6a0 $F690 00 00 F0 2F 00 00 FF FF ;
.byt    $0F,$3F,$F0,$FF,$0F,$00,$00,$FE; 0x1f6a8 $F698 0F 3F F0 FF 0F 00 00 FE ;
.byt    $0F,$00,$00,$FF,$FF,$0F,$00,$F0; 0x1f6b0 $F6A0 0F 00 00 FF FF 0F 00 F0 ;
.byt    $FF,$2F,$00,$00,$FF,$0F,$00,$00; 0x1f6b8 $F6A8 FF 2F 00 00 FF 0F 00 00 ;
.byt    $FE,$FF,$FF,$03,$00,$FF,$0F,$00; 0x1f6c0 $F6B0 FE FF FF 03 00 FF 0F 00 ;
.byt    $00,$FD,$FF,$03,$40,$B6,$FF,$F7; 0x1f6c8 $F6B8 00 FD FF 03 40 B6 FF F7 ;
.byt    $FF,$47,$09,$00,$01,$F0,$2D,$94; 0x1f6d0 $F6C0 FF 47 09 00 01 F0 2D 94 ;
.byt    $22,$77,$6B,$57,$A0,$FD,$DB,$FF; 0x1f6d8 $F6C8 22 77 6B 57 A0 FD DB FF ;
.byt    $21,$29,$CA,$26,$80,$02,$ED,$A9; 0x1f6e0 $F6D0 21 29 CA 26 80 02 ED A9 ;
.byt    $56,$52,$B7,$DA,$2A,$D6,$AD,$FD; 0x1f6e8 $F6D8 56 52 B7 DA 2A D6 AD FD ;
.byt    $09,$D9,$52,$B7,$08,$88,$A9,$4A; 0x1f6f0 $F6E0 09 D9 52 B7 08 88 A9 4A ;
.byt    $73,$29,$AA,$B6,$55,$A9,$AA,$55; 0x1f6f8 $F6E8 73 29 AA B6 55 A9 AA 55 ;
.byt    $5B,$CB,$54,$6D,$55,$AD,$4A,$35; 0x1f700 $F6F0 5B CB 54 6D 55 AD 4A 35 ;
.byt    $55,$93,$2A,$55,$55,$95,$4A,$55; 0x1f708 $F6F8 55 93 2A 55 55 95 4A 55 ;
.byt    $36,$89,$52,$D5,$AD,$8A,$4A,$D5; 0x1f710 $F700 36 89 52 D5 AD 8A 4A D5 ;
.byt    $75,$95,$48,$5A,$5B,$55,$4A,$55; 0x1f718 $F708 75 95 48 5A 5B 55 4A 55 ;
.byt    $6A,$F7,$1F,$00,$88,$FD,$3F,$24; 0x1f720 $F710 6A F7 1F 00 88 FD 3F 24 ;
.byt    $80,$F7,$AF,$09,$82,$FD,$AD,$88; 0x1f728 $F718 80 F7 AF 09 82 FD AD 88 ;
.byt    $50,$AB,$5A,$23,$FB,$FF,$00,$00; 0x1f730 $F720 50 AB 5A 23 FB FF 00 00 ;
.byt    $FC,$FF,$14,$00,$FC,$3F,$8F,$00; 0x1f738 $F728 FC FF 14 00 FC 3F 8F 00 ;
.byt    $FD,$CA,$2A,$80,$2D,$D9,$FF,$BF; 0x1f740 $F730 FD CA 2A 80 2D D9 FF BF ;
.byt    $00,$00,$FC,$FF,$0A,$00,$FC,$FF; 0x1f748 $F738 00 00 FC FF 0A 00 FC FF ;
.byt    $03,$40,$BD,$3E,$0A,$40,$D1,$FF; 0x1f750 $F740 03 40 BD 3E 0A 40 D1 FF ;
.byt    $FF,$00,$00,$FC,$FF,$0F,$00,$F8; 0x1f758 $F748 FF 00 00 FC FF 0F 00 F8 ;
.byt    $FF,$07,$00,$3D,$BD,$02,$80,$F6; 0x1f760 $F750 FF 07 00 3D BD 02 80 F6 ;
.byt    $FF,$5F,$00,$C0,$FF,$7F,$00,$00; 0x1f768 $F758 FF 5F 00 C0 FF 7F 00 00 ;
.byt    $FF,$FF,$03,$00,$F8,$9F,$00,$F0; 0x1f770 $F760 FF FF 03 00 F8 9F 00 F0 ;
.byt    $FF,$FF,$00,$00,$FF,$FF,$00,$00; 0x1f778 $F768 FF FF 00 00 FF FF 00 00 ;
.byt    $FF,$FF,$03,$00,$E0,$3F,$00,$FE; 0x1f780 $F770 FF FF 03 00 E0 3F 00 FE ;
.byt    $FF,$1D,$00,$F0,$FF,$0F,$00,$F0; 0x1f788 $F778 FF 1D 00 F0 FF 0F 00 F0 ;
.byt    $FF,$3F,$00,$00,$FC,$0F,$C0,$FF; 0x1f790 $F780 FF 3F 00 00 FC 0F C0 FF ;
.byt    $7F,$03,$00,$FD,$FF,$00,$00,$FE; 0x1f798 $F788 7F 03 00 FD FF 00 00 FE ;
.byt    $FF,$0F,$00,$80,$FF,$00,$F8,$FF; 0x1f7a0 $F790 FF 0F 00 80 FF 00 F8 FF ;
.byt    $3F,$00,$C0,$FF,$3F,$00,$C0,$FF; 0x1f7a8 $F798 3F 00 C0 FF 3F 00 C0 FF ;
.byt    $FF,$00,$00,$F0,$3F,$00,$FD,$FF; 0x1f7b0 $F7A0 FF 00 00 F0 3F 00 FD FF ;
.byt    $0F,$00,$F8,$FF,$03,$00,$F8,$FF; 0x1f7b8 $F7A8 0F 00 F8 FF 03 00 F8 FF ;
.byt    $3F,$00,$00,$FC,$07,$C0,$FF,$FF; 0x1f7c0 $F7B0 3F 00 00 FC 07 C0 FF FF ;
.byt    $03,$00,$FC,$FF,$01,$00,$FC,$FF; 0x1f7c8 $F7B8 03 00 FC FF 01 00 FC FF ;
.byt    $0F,$00,$C0,$FF,$02,$80,$FF,$FF; 0x1f7d0 $F7C0 0F 00 C0 FF 02 80 FF FF ;
.byt    $03,$00,$FE,$FF,$02,$00,$FC,$FF; 0x1f7d8 $F7C8 03 00 FE FF 02 00 FC FF ;
.byt    $0F,$00,$C0,$FF,$21,$00,$FC,$FF; 0x1f7e0 $F7D0 0F 00 C0 FF 21 00 FC FF ;
.byt    $2F,$00,$F0,$FF,$0F,$00,$F0,$FF; 0x1f7e8 $F7D8 2F 00 F0 FF 0F 00 F0 FF ;
.byt    $3F,$00,$80,$FF,$0F,$00,$60,$FF; 0x1f7f0 $F7E0 3F 00 80 FF 0F 00 60 FF ;
.byt    $FF,$00,$00,$FE,$FF,$03,$00,$FC; 0x1f7f8 $F7E8 FF 00 00 FE FF 03 00 FC ;
.byt    $FF,$07,$00,$FE,$DD,$22,$40,$AD; 0x1f800 $F7F0 FF 07 00 FE DD 22 40 AD ;
.byt    $FD,$FF,$0B,$00,$D8,$DD,$22,$24; 0x1f808 $F7F8 FD FF 0B 00 D8 DD 22 24 ;
.byt    $D5,$6D,$55,$4A,$55,$6B,$A5,$B2; 0x1f810 $F800 D5 6D 55 4A 55 6B A5 B2 ;
.byt    $54,$D5,$B5,$6C,$AB,$A9,$24,$55; 0x1f818 $F808 54 D5 B5 6C AB A9 24 55 ;
.byt    $95,$54,$4B,$AD,$4A,$55,$55,$AB; 0x1f820 $F810 95 54 4B AD 4A 55 55 AB ;
.byt    $56,$A9,$B2,$6A,$AD,$4A,$AD,$AA; 0x1f828 $F818 56 A9 B2 6A AD 4A AD AA ;
.byt    $56,$49,$A9,$6A,$2B,$4A,$55,$B5; 0x1f830 $F820 56 49 A9 6A 2B 4A 55 B5 ;
.byt    $A6,$A5,$52,$75,$AD,$4A,$CA,$5A; 0x1f838 $F828 A6 A5 52 75 AD 4A CA 5A ;
.byt    $AB,$2A,$69,$55,$B5,$2A,$A9,$AA; 0x1f840 $F830 AB 2A 69 55 B5 2A A9 AA ;
.byt    $56,$55,$2A,$55,$AD,$55,$A5,$AA; 0x1f848 $F838 56 55 2A 55 AD 55 A5 AA ;
.byt    $59,$95,$65,$95,$A9,$9A,$AA,$AA; 0x1f850 $F840 59 95 65 95 A9 9A AA AA ;
.byt    $AA,$69,$AA,$A6,$AA,$6A,$D5,$2D; 0x1f858 $F848 AA 69 AA A6 AA 6A D5 2D ;
.byt    $89,$52,$55,$B7,$2A,$A9,$94,$75; 0x1f860 $F850 89 52 55 B7 2A A9 94 75 ;
.byt    $6D,$A5,$48,$6A,$AD,$55,$A5,$54; 0x1f868 $F858 6D A5 48 6A AD 55 A5 54 ;
.byt    $A5,$DA,$FD,$17,$00,$88,$FE,$BF; 0x1f870 $F860 A5 DA FD 17 00 88 FE BF ;
.byt    $50,$20,$F0,$7F,$AB,$09,$82,$F5; 0x1f878 $F868 50 20 F0 7F AB 09 82 F5 ;
.byt    $B7,$8A,$40,$D5,$AA,$56,$49,$FB; 0x1f880 $F870 B7 8A 40 D5 AA 56 49 FB ;
.byt    $FF,$02,$00,$E0,$FF,$0F,$0B,$00; 0x1f888 $F878 FF 02 00 E0 FF 0F 0B 00 ;
.byt    $F7,$5F,$2F,$02,$D8,$2F,$B5,$0A; 0x1f890 $F880 F7 5F 2F 02 D8 2F B5 0A ;
.byt    $60,$4B,$DA,$FF,$FF,$00,$00,$D0; 0x1f898 $F888 60 4B DA FF FF 00 00 D0 ;
.byt    $FF,$AF,$02,$00,$FD,$FF,$07,$00; 0x1f8a0 $F890 FF AF 02 00 FD FF 07 00 ;
.byt    $D6,$E7,$95,$00,$52,$E1,$FF,$FF; 0x1f8a8 $F898 D6 E7 95 00 52 E1 FF FF ;
.byt    $03,$00,$C0,$FF,$FF,$01,$00,$FC; 0x1f8b0 $F8A0 03 00 C0 FF FF 01 00 FC ;
.byt    $FF,$0F,$00,$F0,$E3,$AB,$00,$A0; 0x1f8b8 $F8A8 FF 0F 00 F0 E3 AB 00 A0 ;
.byt    $F6,$FF,$3F,$01,$00,$FC,$FF,$3F; 0x1f8c0 $F8B0 F6 FF 3F 01 00 FC FF 3F ;
.byt    $00,$00,$FF,$FF,$07,$00,$A0,$7F; 0x1f8c8 $F8B8 00 00 FF FF 07 00 A0 7F ;
.byt    $07,$00,$FC,$FF,$FF,$00,$00,$FC; 0x1f8d0 $F8C0 07 00 FC FF FF 00 00 FC ;
.byt    $FF,$0F,$00,$C0,$FF,$FF,$03,$00; 0x1f8d8 $F8C8 FF 0F 00 C0 FF FF 03 00 ;
.byt    $00,$FF,$07,$C0,$FF,$FF,$0E,$00; 0x1f8e0 $F8D0 00 FF 07 C0 FF FF 0E 00 ;
.byt    $C0,$FF,$FF,$00,$00,$FC,$FF,$3F; 0x1f8e8 $F8D8 C0 FF FF 00 00 FC FF 3F ;
.byt    $00,$00,$F8,$3F,$00,$FC,$FF,$F7; 0x1f8f0 $F8E0 00 00 F8 3F 00 FC FF F7 ;
.byt    $00,$00,$FF,$FF,$03,$00,$E0,$FF; 0x1f8f8 $F8E8 00 00 FF FF 03 00 E0 FF ;
.byt    $FF,$02,$00,$C0,$FF,$02,$C0,$FF; 0x1f900 $F8F0 FF 02 00 C0 FF 02 C0 FF ;
.byt    $FF,$03,$00,$F0,$FF,$3F,$00,$00; 0x1f908 $F8F8 FF 03 00 F0 FF 3F 00 00 ;
.byt    $FF,$FF,$0F,$00,$00,$FD,$0F,$00; 0x1f910 $F900 FF FF 0F 00 00 FD 0F 00 ;
.byt    $FF,$FF,$3D,$00,$C0,$FF,$FF,$00; 0x1f918 $F908 FF FF 3D 00 C0 FF FF 00 ;
.byt    $00,$FC,$FF,$3F,$00,$00,$F0,$BF; 0x1f920 $F910 00 FC FF 3F 00 00 F0 BF ;
.byt    $00,$F0,$FF,$FF,$01,$00,$F8,$FF; 0x1f928 $F918 00 F0 FF FF 01 00 F8 FF ;
.byt    $0F,$00,$C0,$FF,$FF,$07,$00,$00; 0x1f930 $F920 0F 00 C0 FF FF 07 00 00 ;
.byt    $FF,$07,$02,$F0,$FF,$FF,$00,$00; 0x1f938 $F928 FF 07 02 F0 FF FF 00 00 ;
.byt    $FF,$FF,$03,$00,$E0,$FF,$FF,$03; 0x1f940 $F930 FF FF 03 00 E0 FF FF 03 ;
.byt    $00,$C0,$FF,$83,$00,$E0,$FF,$FF; 0x1f948 $F938 00 C0 FF 83 00 E0 FF FF ;
.byt    $03,$00,$F0,$FF,$3F,$00,$00,$FF; 0x1f950 $F940 03 00 F0 FF 3F 00 00 FF ;
.byt    $FF,$2F,$00,$80,$FF,$8F,$00,$00; 0x1f958 $F948 FF 2F 00 80 FF 8F 00 00 ;
.byt    $F7,$FF,$3F,$00,$00,$FE,$FF,$0B; 0x1f960 $F950 F7 FF 3F 00 00 FE FF 0B ;
.byt    $00,$E0,$FF,$FF,$00,$00,$7F,$77; 0x1f968 $F958 00 E0 FF FF 00 00 7F 77 ;
.byt    $0B,$40,$55,$DB,$FF,$BF,$02,$00; 0x1f970 $F960 0B 40 55 DB FF BF 02 00 ;
.byt    $74,$77,$8D,$82,$52,$6D,$5B,$95; 0x1f978 $F968 74 77 8D 82 52 6D 5B 95 ;
.byt    $52,$55,$AD,$55,$2A,$53,$55,$6D; 0x1f980 $F970 52 55 AD 55 2A 53 55 6D ;
.byt    $2D,$6D,$AB,$A9,$A2,$A8,$55,$4A; 0x1f988 $F978 2D 6D AB A9 A2 A8 55 4A ;
.byt    $55,$55,$D5,$52,$55,$55,$AD,$6A; 0x1f990 $F980 55 55 D5 52 55 55 AD 6A ;
.byt    $96,$2A,$AB,$56,$AB,$4A,$B5,$AA; 0x1f998 $F988 96 2A AB 56 AB 4A B5 AA ;
.byt    $56,$25,$95,$AA,$D6,$8A,$52,$55; 0x1f9a0 $F990 56 25 95 AA D6 8A 52 55 ;
.byt    $B5,$A6,$AA,$8A,$6A,$5B,$AB,$A2; 0x1f9a8 $F998 B5 A6 AA 8A 6A 5B AB A2 ;
.byt    $D2,$5A,$AD,$2A,$A5,$66,$55,$AB; 0x1f9b0 $F9A0 D2 5A AD 2A A5 66 55 AB ;
.byt    $52,$AA,$AA,$56,$55,$A9,$54,$B5; 0x1f9b8 $F9A8 52 AA AA 56 55 A9 54 B5 ;
.byt    $5A,$55,$A9,$B4,$6A,$55,$65,$AA; 0x1f9c0 $F9B0 5A 55 A9 B4 6A 55 65 AA ;
.byt    $55,$55,$55,$55,$AA,$56,$55,$55; 0x1f9c8 $F9B8 55 55 55 55 AA 56 55 55 ;
.byt    $D7,$56,$A5,$48,$6A,$AD,$55,$55; 0x1f9d0 $F9C0 D7 56 A5 48 6A AD 55 55 ;
.byt    $4A,$55,$A5,$DA,$FF,$95,$80,$80; 0x1f9d8 $F9C8 4A 55 A5 DA FF 95 80 80 ;
.byt    $E8,$FF,$2D,$92,$20,$F0,$FD,$AD; 0x1f9e0 $F9D0 E8 FF 2D 92 20 F0 FD AD ;
.byt    $16,$22,$68,$F7,$AD,$8A,$08,$55; 0x1f9e8 $F9D8 16 22 68 F7 AD 8A 08 55 ;
.byt    $AB,$6A,$55,$D2,$FE,$FF,$00,$00; 0x1f9f0 $F9E0 AB 6A 55 D2 FE FF 00 00 ;
.byt    $40,$FF,$FF,$70,$80,$80,$FF,$37; 0x1f9f8 $F9E8 40 FF FF 70 80 80 FF 37 ;
.byt    $BD,$08,$C0,$FD,$4A,$AD,$02,$62; 0x1fa00 $F9F0 BD 08 C0 FD 4A AD 02 62 ;
.byt    $4B,$A9,$FF,$FF,$2F,$00,$00,$F0; 0x1fa08 $F9F8 4B A9 FF FF 2F 00 00 F0 ;
.byt    $FF,$2F,$0A,$00,$F0,$FF,$DF,$01; 0x1fa10 $FA00 FF 2F 0A 00 F0 FF DF 01 ;
.byt    $00,$DB,$A7,$37,$0A,$A0,$34,$F4; 0x1fa18 $FA08 00 DB A7 37 0A A0 34 F4 ;
.byt    $FF,$FF,$03,$00,$00,$FE,$FF,$3F; 0x1fa20 $FA10 FF FF 03 00 00 FE FF 3F ;
.byt    $00,$00,$FC,$FF,$3F,$00,$40,$5F; 0x1fa28 $FA18 00 00 FC FF 3F 00 40 5F ;
.byt    $F9,$2A,$00,$A1,$DA,$FF,$FF,$12; 0x1fa30 $FA20 F9 2A 00 A1 DA FF FF 12 ;
.byt    $00,$00,$FF,$FF,$3F,$00,$00,$FC; 0x1fa38 $FA28 00 00 FF FF 3F 00 00 FC ;
.byt    $FF,$7F,$02,$00,$A8,$FD,$1D,$00; 0x1fa40 $FA30 FF 7F 02 00 A8 FD 1D 00 ;
.byt    $D0,$FF,$FF,$3F,$00,$00,$FC,$FF; 0x1fa48 $FA38 D0 FF FF 3F 00 00 FC FF ;
.byt    $3F,$00,$00,$F8,$FF,$FF,$01,$00; 0x1fa50 $FA40 3F 00 00 F8 FF FF 01 00 ;
.byt    $00,$FD,$3F,$20,$F0,$FF,$FF,$2C; 0x1fa58 $FA48 00 FD 3F 20 F0 FF FF 2C ;
.byt    $00,$00,$FF,$FF,$0F,$00,$00,$FD; 0x1fa60 $FA50 00 00 FF FF 0F 00 00 FD ;
.byt    $FF,$DF,$00,$00,$40,$FF,$1D,$00; 0x1fa68 $FA58 FF DF 00 00 40 FF 1D 00 ;
.byt    $FD,$FF,$3F,$03,$00,$E0,$FF,$FF; 0x1fa70 $FA60 FD FF 3F 03 00 E0 FF FF ;
.byt    $03,$00,$C0,$FF,$FF,$3B,$00,$00; 0x1fa78 $FA68 03 00 C0 FF FF 3B 00 00 ;
.byt    $C0,$FF,$0B,$00,$FF,$FF,$CF,$02; 0x1fa80 $FA70 C0 FF 0B 00 FF FF CF 02 ;
.byt    $00,$F0,$FF,$FF,$00,$00,$E0,$FF; 0x1fa88 $FA78 00 F0 FF FF 00 00 E0 FF ;
.byt    $FF,$2F,$00,$00,$E0,$FF,$02,$40; 0x1fa90 $FA80 FF 2F 00 00 E0 FF 02 40 ;
.byt    $FF,$FF,$F3,$00,$00,$FC,$FF,$3F; 0x1fa98 $FA88 FF FF F3 00 00 FC FF 3F ;
.byt    $00,$00,$F4,$FF,$FF,$03,$00,$00; 0x1faa0 $FA90 00 00 F4 FF FF 03 00 00 ;
.byt    $F6,$BF,$00,$D0,$FF,$FF,$37,$00; 0x1faa8 $FA98 F6 BF 00 D0 FF FF 37 00 ;
.byt    $00,$FC,$FF,$1F,$00,$00,$FC,$FF; 0x1fab0 $FAA0 00 FC FF 1F 00 00 FC FF ;
.byt    $FF,$03,$00                    ; 0x1fab8 $FAA8 FF 03 00                ;
bank7_UNKNOWN3                                                                 ;
.byt    $00,$FD,$3F,$00,$40,$D7,$56,$A5; 0x1fabb $FAAB 00 FD 3F 00 40 D7 56 A5 ;
.byt    $48,$6A,$AD,$55,$55,$4A,$55,$A5; 0x1fac3 $FAB3 48 6A AD 55 55 4A 55 A5 ;
.byt    $DA,$FF,$95,$80,$80,$E8,$FF,$2D; 0x1facb $FABB DA FF 95 80 80 E8 FF 2D ;
.byt    $92,$20,$F0,$FD,$AD,$16,$22,$68; 0x1fad3 $FAC3 92 20 F0 FD AD 16 22 68 ;
.byt    $F7,$AD,$8A,$08,$55,$AB,$6A,$55; 0x1fadb $FACB F7 AD 8A 08 55 AB 6A 55 ;
.byt    $D2,$FE,$FF,$00,$00,$40,$FF,$FF; 0x1fae3 $FAD3 D2 FE FF 00 00 40 FF FF ;
.byt    $70,$80,$80,$FF,$37,$BD,$08,$C0; 0x1faeb $FADB 70 80 80 FF 37 BD 08 C0 ;
.byt    $FD,$4A,$AD,$02,$62,$4B,$A9,$FF; 0x1faf3 $FAE3 FD 4A AD 02 62 4B A9 FF ;
.byt    $FF,$2F,$00,$00,$F0,$FF,$2F,$0A; 0x1fafb $FAEB FF 2F 00 00 F0 FF 2F 0A ;
.byt    $00,$F0,$FF,$DF,$01,$00,$DB,$A7; 0x1fb03 $FAF3 00 F0 FF DF 01 00 DB A7 ;
.byt    $37,$0A,$A0,$34,$F4,$FF,$FF,$03; 0x1fb0b $FAFB 37 0A A0 34 F4 FF FF 03 ;
.byt    $00,$00,$FE,$FF,$3F,$00,$00,$FC; 0x1fb13 $FB03 00 00 FE FF 3F 00 00 FC ;
.byt    $FF,$3F,$00,$40,$5F,$F9,$2A,$00; 0x1fb1b $FB0B FF 3F 00 40 5F F9 2A 00 ;
.byt    $A1,$DA,$FF,$FF,$12,$00,$00,$FF; 0x1fb23 $FB13 A1 DA FF FF 12 00 00 FF ;
.byt    $FF,$3F,$00,$00,$FC,$FF,$7F,$02; 0x1fb2b $FB1B FF 3F 00 00 FC FF 7F 02 ;
.byt    $00,$A8,$FD,$1D,$00,$D0,$FF,$FF; 0x1fb33 $FB23 00 A8 FD 1D 00 D0 FF FF ;
.byt    $3F,$00,$00,$FC,$FF,$3F,$00,$00; 0x1fb3b $FB2B 3F 00 00 FC FF 3F 00 00 ;
.byt    $F8,$FF,$FF,$01,$00,$00,$FD,$3F; 0x1fb43 $FB33 F8 FF FF 01 00 00 FD 3F ;
.byt    $20,$F0,$FF,$FF,$2C,$00,$00,$FF; 0x1fb4b $FB3B 20 F0 FF FF 2C 00 00 FF ;
.byt    $FF,$0F,$00,$00,$FD,$FF,$DF,$00; 0x1fb53 $FB43 FF 0F 00 00 FD FF DF 00 ;
.byt    $00,$40,$FF,$1D,$00,$FD,$FF,$3F; 0x1fb5b $FB4B 00 40 FF 1D 00 FD FF 3F ;
.byt    $03,$00,$E0,$FF,$FF,$03,$00,$C0; 0x1fb63 $FB53 03 00 E0 FF FF 03 00 C0 ;
.byt    $FF,$FF,$3B,$00,$00,$C0,$FF,$0B; 0x1fb6b $FB5B FF FF 3B 00 00 C0 FF 0B ;
.byt    $00,$FF,$FF,$CF,$02,$00,$F0,$FF; 0x1fb73 $FB63 00 FF FF CF 02 00 F0 FF ;
.byt    $FF,$00,$00,$E0,$FF,$FF,$2F,$00; 0x1fb7b $FB6B FF 00 00 E0 FF FF 2F 00 ;
.byt    $00,$E0,$FF,$02,$40,$FF,$FF,$F3; 0x1fb83 $FB73 00 E0 FF 02 40 FF FF F3 ;
.byt    $00,$00,$FC,$FF,$3F,$00,$00,$F4; 0x1fb8b $FB7B 00 00 FC FF 3F 00 00 F4 ;
.byt    $FF,$FF,$03,$00,$00,$F6,$BF,$00; 0x1fb93 $FB83 FF FF 03 00 00 F6 BF 00 ;
.byt    $D0,$FF,$FF,$37,$00,$00,$FC,$FF; 0x1fb9b $FB8B D0 FF FF 37 00 00 FC FF ;
.byt    $1F,$00,$00,$FC,$FF,$FF,$03,$00; 0x1fba3 $FB93 1F 00 00 FC FF FF 03 00 ;
.byt    $00,$FD,$3F,$00,$40,$D7,$56,$A5; 0x1fbab $FB9B 00 FD 3F 00 40 D7 56 A5 ;
.byt    $48,$6A,$AD,$55,$55,$4A,$55,$A5; 0x1fbb3 $FBA3 48 6A AD 55 55 4A 55 A5 ;
.byt    $DA,$FF,$95,$80,$80,$E8,$FF,$2D; 0x1fbbb $FBAB DA FF 95 80 80 E8 FF 2D ;
.byt    $92,$20,$F0,$FD,$AD,$16,$22,$68; 0x1fbc3 $FBB3 92 20 F0 FD AD 16 22 68 ;
.byt    $F7,$AD,$8A,$08,$55,$AB,$6A,$55; 0x1fbcb $FBBB F7 AD 8A 08 55 AB 6A 55 ;
.byt    $D2,$FE,$FF,$00,$00,$40,$FF,$FF; 0x1fbd3 $FBC3 D2 FE FF 00 00 40 FF FF ;
.byt    $70,$80,$80,$FF,$37,$BD,$08,$C0; 0x1fbdb $FBCB 70 80 80 FF 37 BD 08 C0 ;
.byt    $FD,$4A,$AD,$02,$62,$4B,$A9,$FF; 0x1fbe3 $FBD3 FD 4A AD 02 62 4B A9 FF ;
.byt    $FF,$2F,$00,$00,$F0,$FF,$2F,$0A; 0x1fbeb $FBDB FF 2F 00 00 F0 FF 2F 0A ;
.byt    $00,$F0,$FF,$DF,$01,$00,$DB,$A7; 0x1fbf3 $FBE3 00 F0 FF DF 01 00 DB A7 ;
.byt    $37,$0A,$A0,$34,$F4,$FF,$FF,$03; 0x1fbfb $FBEB 37 0A A0 34 F4 FF FF 03 ;
.byt    $00,$00,$FE,$FF,$3F,$00,$00,$FC; 0x1fc03 $FBF3 00 00 FE FF 3F 00 00 FC ;
.byt    $FF,$3F,$00,$40,$5F,$F9,$2A,$00; 0x1fc0b $FBFB FF 3F 00 40 5F F9 2A 00 ;
.byt    $A1,$DA,$FF,$FF,$12,$00,$00,$FF; 0x1fc13 $FC03 A1 DA FF FF 12 00 00 FF ;
.byt    $FF,$3F,$00,$00,$FC,$FF,$7F,$02; 0x1fc1b $FC0B FF 3F 00 00 FC FF 7F 02 ;
.byt    $00,$A8,$FD,$1D,$00,$D0,$FF,$FF; 0x1fc23 $FC13 00 A8 FD 1D 00 D0 FF FF ;
.byt    $3F,$00,$00,$FC,$FF,$3F,$00,$00; 0x1fc2b $FC1B 3F 00 00 FC FF 3F 00 00 ;
.byt    $F8,$FF,$FF,$01,$00,$00,$FD,$3F; 0x1fc33 $FC23 F8 FF FF 01 00 00 FD 3F ;
.byt    $20,$F0,$FF,$FF,$2C,$00,$00,$FF; 0x1fc3b $FC2B 20 F0 FF FF 2C 00 00 FF ;
.byt    $FF,$0F,$00,$00,$FD,$FF,$DF,$00; 0x1fc43 $FC33 FF 0F 00 00 FD FF DF 00 ;
.byt    $00,$40,$FF,$1D,$00,$FD,$FF,$3F; 0x1fc4b $FC3B 00 40 FF 1D 00 FD FF 3F ;
.byt    $03,$00,$E0,$FF,$FF,$03,$00,$C0; 0x1fc53 $FC43 03 00 E0 FF FF 03 00 C0 ;
.byt    $FF,$FF,$3B,$00,$00,$C0,$FF,$0B; 0x1fc5b $FC4B FF FF 3B 00 00 C0 FF 0B ;
.byt    $00,$FF,$FF,$CF,$02,$00,$F0,$FF; 0x1fc63 $FC53 00 FF FF CF 02 00 F0 FF ;
.byt    $FF,$00,$00,$E0,$FF,$FF,$2F,$00; 0x1fc6b $FC5B FF 00 00 E0 FF FF 2F 00 ;
.byt    $00,$E0,$FF,$02,$40,$FF,$FF,$F3; 0x1fc73 $FC63 00 E0 FF 02 40 FF FF F3 ;
.byt    $00,$00,$FC,$FF,$3F,$00,$00,$F4; 0x1fc7b $FC6B 00 00 FC FF 3F 00 00 F4 ;
.byt    $FF,$FF,$03,$00,$00,$F6,$BF,$00; 0x1fc83 $FC73 FF FF 03 00 00 F6 BF 00 ;
.byt    $D0,$FF,$FF,$37,$00,$00,$FC,$FF; 0x1fc8b $FC7B D0 FF FF 37 00 00 FC FF ;
.byt    $1F,$00,$00,$FC,$FF,$FF,$03,$00; 0x1fc93 $FC83 1F 00 00 FC FF FF 03 00 ;
.byt    $00,$FD,$3F,$00,$40,$D7,$56,$A5; 0x1fc9b $FC8B 00 FD 3F 00 40 D7 56 A5 ;
.byt    $48,$6A,$AD,$55,$55,$4A,$55,$A5; 0x1fca3 $FC93 48 6A AD 55 55 4A 55 A5 ;
.byt    $DA,$FF,$95,$80,$80,$E8,$FF,$2D; 0x1fcab $FC9B DA FF 95 80 80 E8 FF 2D ;
.byt    $92,$20,$F0,$FD,$AD,$16,$22,$68; 0x1fcb3 $FCA3 92 20 F0 FD AD 16 22 68 ;
.byt    $F7,$AD,$8A,$08,$55,$AB,$6A,$55; 0x1fcbb $FCAB F7 AD 8A 08 55 AB 6A 55 ;
.byt    $D2,$FE,$FF,$00,$00,$40,$FF,$FF; 0x1fcc3 $FCB3 D2 FE FF 00 00 40 FF FF ;
.byt    $70,$80,$80,$FF,$37,$BD,$08,$C0; 0x1fccb $FCBB 70 80 80 FF 37 BD 08 C0 ;
.byt    $FD,$4A,$AD,$02,$62,$4B,$A9,$FF; 0x1fcd3 $FCC3 FD 4A AD 02 62 4B A9 FF ;
.byt    $FF,$2F,$00,$00,$F0,$FF,$2F,$0A; 0x1fcdb $FCCB FF 2F 00 00 F0 FF 2F 0A ;
.byt    $00,$F0,$FF,$DF,$01,$00,$DB,$A7; 0x1fce3 $FCD3 00 F0 FF DF 01 00 DB A7 ;
.byt    $37,$0A,$A0,$34,$F4,$FF,$FF,$03; 0x1fceb $FCDB 37 0A A0 34 F4 FF FF 03 ;
.byt    $00,$00,$FE,$FF,$3F,$00,$00,$FC; 0x1fcf3 $FCE3 00 00 FE FF 3F 00 00 FC ;
.byt    $FF,$3F,$00,$40,$5F,$F9,$2A,$00; 0x1fcfb $FCEB FF 3F 00 40 5F F9 2A 00 ;
.byt    $A1,$DA,$FF,$FF,$12,$00,$00,$FF; 0x1fd03 $FCF3 A1 DA FF FF 12 00 00 FF ;
.byt    $FF,$3F,$00,$00,$FC,$FF,$7F,$02; 0x1fd0b $FCFB FF 3F 00 00 FC FF 7F 02 ;
.byt    $00,$A8,$FD,$1D,$00,$D0,$FF,$FF; 0x1fd13 $FD03 00 A8 FD 1D 00 D0 FF FF ;
.byt    $3F,$00,$00,$FC,$FF,$3F,$00,$00; 0x1fd1b $FD0B 3F 00 00 FC FF 3F 00 00 ;
.byt    $F8,$FF,$FF,$01,$00,$00,$FD,$3F; 0x1fd23 $FD13 F8 FF FF 01 00 00 FD 3F ;
.byt    $20,$F0,$FF,$FF,$2C,$00,$00,$FF; 0x1fd2b $FD1B 20 F0 FF FF 2C 00 00 FF ;
.byt    $FF,$0F,$00,$00,$FD,$FF,$DF,$00; 0x1fd33 $FD23 FF 0F 00 00 FD FF DF 00 ;
.byt    $00,$40,$FF,$1D,$00,$FD,$FF,$3F; 0x1fd3b $FD2B 00 40 FF 1D 00 FD FF 3F ;
.byt    $03,$00,$E0,$FF,$FF,$03,$00,$C0; 0x1fd43 $FD33 03 00 E0 FF FF 03 00 C0 ;
.byt    $FF,$FF,$3B,$00,$00,$C0,$FF,$0B; 0x1fd4b $FD3B FF FF 3B 00 00 C0 FF 0B ;
.byt    $00,$FF,$FF,$CF,$02,$00,$F0,$FF; 0x1fd53 $FD43 00 FF FF CF 02 00 F0 FF ;
.byt    $FF,$00,$00,$E0,$FF,$FF,$2F,$00; 0x1fd5b $FD4B FF 00 00 E0 FF FF 2F 00 ;
.byt    $00,$E0,$FF,$02,$40,$FF,$FF,$F3; 0x1fd63 $FD53 00 E0 FF 02 40 FF FF F3 ;
.byt    $00,$00,$FC,$FF,$3F,$00,$00,$F4; 0x1fd6b $FD5B 00 00 FC FF 3F 00 00 F4 ;
.byt    $FF,$FF,$03,$00,$00,$F6,$BF,$00; 0x1fd73 $FD63 FF FF 03 00 00 F6 BF 00 ;
.byt    $D0,$FF,$FF,$37,$00,$00,$FC,$FF; 0x1fd7b $FD6B D0 FF FF 37 00 00 FC FF ;
.byt    $1F,$00,$00,$FC,$FF,$FF,$03,$00; 0x1fd83 $FD73 1F 00 00 FC FF FF 03 00 ;
.byt    $00,$FD,$3F,$00,$40            ; 0x1fd8b $FD7B 00 FD 3F 00 40          ;
LFD80                                                                          ;
.byt    $03,$01                        ; 0x1fd90 $FD80 03 01                   ;
; ---------------------------------------------------------------------------- ;
bank7_code52                                                                   ;
lda      $0720                         ; 0x1fd92 $FD82 AD 20 07                ;
lsr                                    ; 0x1fd95 $FD85 4A                      ;
tax                                    ; 0x1fd96 $FD86 AA                      ;
lda      $071E                         ; 0x1fd97 $FD87 AD 1E 07                ;
and      #$1F                          ; 0x1fd9a $FD8A 29 1F                   ; keep bits ...x xxxx
sec                                    ; 0x1fd9c $FD8C 38                      ;
sbc      LFD80,x                       ; 0x1fd9d $FD8D FD 80 FD                ;
lsr                                    ; 0x1fda0 $FD90 4A                      ;
lsr                                    ; 0x1fda1 $FD91 4A                      ;
clc                                    ; 0x1fda2 $FD92 18                      ;
adc      #$C0                          ; 0x1fda3 $FD93 69 C0                   ;
sta      $01                           ; 0x1fda5 $FD95 85 01                   ;
lda      $071D                         ; 0x1fda7 $FD97 AD 1D 07                ;
ora      #$03                          ; 0x1fdaa $FD9A 09 03                   ; set bits  .... ..xx
sta      $00                           ; 0x1fdac $FD9C 85 00                   ;
ldx      #$00                          ; 0x1fdae $FD9E A2 00                   ; X = 00
stx      $07AE                         ; 0x1fdb0 $FDA0 8E AE 07                ;
LFDA3                                                                          ;
lda      $2002                         ; 0x1fdb3 $FDA3 AD 02 20                ;
lda      $00                           ; 0x1fdb6 $FDA6 A5 00                   ;
sta      $2006                         ; 0x1fdb8 $FDA8 8D 06 20                ;
lda      $01                           ; 0x1fdbb $FDAB A5 01                   ;
clc                                    ; 0x1fdbd $FDAD 18                      ;
adc      #$08                          ; 0x1fdbe $FDAE 69 08                   ;
sta      $2006                         ; 0x1fdc0 $FDB0 8D 06 20                ;
sta      $01                           ; 0x1fdc3 $FDB3 85 01                   ;
lda      $0471,x                       ; 0x1fdc5 $FDB5 BD 71 04                ;
sta      $2007                         ; 0x1fdc8 $FDB8 8D 07 20                ;
lda      #$00                          ; 0x1fdcb $FDBB A9 00                   ; A = 00
sta      $0471,x                       ; 0x1fdcd $FDBD 9D 71 04                ;
inx                                    ; 0x1fdd0 $FDC0 E8                      ;
cpx      #$07                          ; 0x1fdd1 $FDC1 E0 07                   ;
bcc      LFDA3                         ; 0x1fdd3 $FDC3 90 DE                   ;
lda      #$FF                          ; 0x1fdd5 $FDC5 A9 FF                   ; A = FF
sty      $03A3                         ; 0x1fdd7 $FDC7 8C A3 03                ;
rts                                    ; 0x1fdda $FDCA 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Continue_Save_Screen_Tile_Mappings                                       ;
.byt    $23,$D8,$7F,$FF                ; 0x1fddb $FDCB 23 D8 7F FF             ;
                                                                               ;
.byt    $23,$F7,$01,$FF                ; 0x1fddf $FDCF 23 F7 01 FF             ;
                                                                               ;
.byt    $20,$CA,$0A,$FA,$F4,$DC,$E8,$E7; 0x1fde3 $FDD3 20 CA 0A FA F4 DC E8 E7 ;CONTINUE (FA = Magic Bag Tile)
.byt    $ED,$E2,$E7,$EE,$DE            ; 0x1fdeb $FDDB ED E2 E7 EE DE          ;
                                                                               ;
.byt    $21,$0C,$04,$EC,$DA,$EF,$DE    ; 0x1fdf0 $FDE0 21 0C 04 EC DA EF DE    ;SAVE
                                                                               ;
.byt    $21,$83,$5A,$CB                ; 0x1fdf7 $FDE7 21 83 5A CB             ;
                                                                               ;
.byt    $23,$03,$5A,$CB                ; 0x1fdfb $FDEB 23 03 5A CB             ;
                                                                               ;
.byt    $21,$A3,$CB,$CC                ; 0x1fdff $FDEF 21 A3 CB CC             ;
                                                                               ;
.byt    $21,$BC,$CB,$CC                ; 0x1fe03 $FDF3 21 BC CB CC             ;
                                                                               ;
.byt    $21,$83,$01,$CA                ; 0x1fe07 $FDF7 21 83 01 CA             ;
                                                                               ;
.byt    $21,$9C,$01,$CA                ; 0x1fe0b $FDFB 21 9C 01 CA             ;
                                                                               ;
.byt    $23,$03,$01,$CA                ; 0x1fe0f $FDFF 23 03 01 CA             ;
                                                                               ;
.byt    $23,$1C,$01,$CA                ; 0x1fe13 $FE03 23 1C 01 CA             ;
                                                                               ;
.byt    $21,$CC,$07,$DC,$DA,$EE,$ED,$E2; 0x1fe17 $FE07 21 CC 07 DC DA EE ED E2 ;CAUTION
.byt    $E8,$E7                        ; 0x1fe1f $FE0F E8 E7                   ;
                                                                               ;
.byt    $22,$05,$16,$ED,$E8,$F4,$DA,$EF; 0x1fe21 $FE11 22 05 16 ED E8 F4 DA EF ;
.byt    $E8,$E2,$DD,$F4,$DD,$DA,$E6,$DA; 0x1fe29 $FE19 E8 E2 DD F4 DD DA E6 DA ;
.byt    $E0,$E2,$E7,$E0,$F4,$E0,$DA,$E6; 0x1fe31 $FE21 E0 E2 E7 E0 F4 E0 DA E6 ;
.byt    $DE                            ; 0x1fe39 $FE29 DE                      ;
                                                                               ;
.byt    $22,$45,$16,$E2,$E7,$DF,$E8,$F4; 0x1fe3a $FE2A 22 45 16 E2 E7 DF E8 F4 ;
.byt    $F4,$EC,$DA,$EF,$DE,$DD,$9C,$F4; 0x1fe42 $FE32 F4 EC DA EF DE DD 9C F4 ;
.byt    $F4,$E1,$E8,$E5,$DD,$F4,$F4,$E2; 0x1fe4a $FE3A F4 E1 E8 E5 DD F4 F4 E2 ;
.byt    $E7                            ; 0x1fe52 $FE42 E7                      ;
                                                                               ;
.byt    $22,$85,$16,$EB,$DE,$EC,$DE,$ED; 0x1fe53 $FE43 22 85 16 EB DE EC DE ED ;
.byt    $F4,$F4,$DB,$EE,$ED,$ED,$E8,$E7; 0x1fe5b $FE4B F4 F4 DB EE ED ED E8 E7 ;
.byt    $F4,$F4,$DA,$EC,$F4,$F4,$F2,$E8; 0x1fe63 $FE53 F4 F4 DA EC F4 F4 F2 E8 ;
.byt    $EE                            ; 0x1fe6b $FE5B EE                      ;
                                                                               ;
.byt    $22,$C5,$16,$ED,$EE,$EB,$E7,$F4; 0x1fe6c $FE5C 22 C5 16 ED EE EB E7 F4 ;
.byt    $E9,$E8,$F0,$DE,$EB,$F4,$E8,$DF; 0x1fe74 $FE64 E9 E8 F0 DE EB F4 E8 DF ;
.byt    $DF,$CF,$F4,$F4,$F4,$F4,$F4,$F4; 0x1fe7c $FE6C DF CF F4 F4 F4 F4 F4 F4 ;
.byt    $F4                            ; 0x1fe84 $FE74 F4                      ;
                                                                               ;
.byt    $FF                            ; 0x1fe85 $FE75 FF                      ;End Byte
; ---------------------------------------------------------------------------- ;
bank7_code53                                                                   ;
jsr      LD15C                         ; 0x1fe86 $FE76 20 5C D1                ;
jsr      bank7_PullAddrFromTableFollowingThisJSR_withIndexOfA_then_JMP; 0x1fe89 $FE79 20 85 D3;
bank7_pointer_table                                                            ;
.word    bank7_code54__Flash_Text_QUIT_Red_and_White; 0x1fe8c $FE7C 87 FE      ;
.word    LCF21_SaveGameWhenChooseSAVEwhenDead__maybe; 0x1fe8e $FE7E 21 CF      ;
.word    LCF05                         ; 0x1fe90 $FE80 05 CF                   ;
.word    LD323                         ; 0x1fe92 $FE82 23 D3                   ;
; ---------------------------------------------------------------------------- ;
bank7_table32                                                                  ;
.byt    $01,$00,$FF                    ; 0x1fe94 $FE84 01 00 FF                ;
; ---------------------------------------------------------------------------- ;
bank7_code54__Flash_Text_QUIT_Red_and_White                                    ;
lda      $07B0                         ; 0x1fe97 $FE87 AD B0 07                ;;timer used on GameOverScreen for flashing "SAVE" red and white
beq      LFEA6                         ; 0x1fe9a $FE8A F0 1A                   ;
dec      $07B0                         ; 0x1fe9c $FE8C CE B0 07                ;;timer used on GameOverScreen for flashing "SAVE" red and white
pha                                    ; 0x1fe9f $FE8F 48                      ;
ldx      #$04                          ; 0x1fea0 $FE90 A2 04                   ; X = 04
LFE92                                                                          ;
lda      bank7_pointer_table+$06,x     ; 0x1fea2 $FE92 BD 82 FE                ;
sta      L0302,x                       ; 0x1fea5 $FE95 9D 02 03                ;
dex                                    ; 0x1fea8 $FE98 CA                      ;
bpl      LFE92                         ; 0x1fea9 $FE99 10 F7                   ;
pla                                    ; 0x1feab $FE9B 68                      ;
and      #$04                          ; 0x1feac $FE9C 29 04                   ; keep bits .... .x..
beq      LFEA5                         ; 0x1feae $FE9E F0 05                   ;
lda      #$FF                          ; 0x1feb0 $FEA0 A9 FF                   ; A = FF
sta      $0305                         ; 0x1feb2 $FEA2 8D 05 03                ;; Empty Row Space Character
LFEA5                                                                          ;
rts                                    ; 0x1feb5 $FEA5 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LFEA6                                                                          ;
inc      $0738                         ; 0x1feb6 $FEA6 EE 38 07                ;
rts                                    ; 0x1feb9 $FEA9 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_UNUSED_FEAA                                                              ;
.byt    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF; 0x1feba $FEAA FF FF FF FF FF FF FF FF ;
.byt    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF; 0x1fec2 $FEB2 FF FF FF FF FF FF FF FF ;
.byt    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF; 0x1feca $FEBA FF FF FF FF FF FF FF FF ;
.byt    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF; 0x1fed2 $FEC2 FF FF FF FF FF FF FF FF ;
.byt    $FF,$FF,$FF,$FF,$FF,$FF        ; 0x1feda $FECA FF FF FF FF FF FF       ;
; ---------------------------------------------------------------------------- ;
bank7_code55                                                                   ;
jsr      bank7_Load_Bank_769_at_0x8000 ; 0x1fee0 $FED0 20 C9 FF                ; Load Bank $0769
LFED3                                                                          ;
stx      $01                           ; 0x1fee3 $FED3 86 01                   ;
lda      $0464,x                       ; 0x1fee5 $FED5 BD 64 04                ;
and      #$C0                          ; 0x1fee8 $FED8 29 C0                   ; keep bits xx.. ....
sta      $03                           ; 0x1feea $FEDA 85 03                   ;
asl                                    ; 0x1feec $FEDC 0A                      ;
rol                                    ; 0x1feed $FEDD 2A                      ;
rol                                    ; 0x1feee $FEDE 2A                      ;
asl                                    ; 0x1feef $FEDF 0A                      ;
tay                                    ; 0x1fef0 $FEE0 A8                      ;
lda      L8500,y                       ; 0x1fef1 $FEE1 B9 00 85                ;
sta      L000E                         ; 0x1fef4 $FEE4 85 0E                   ;
lda      L8501,y                       ; 0x1fef6 $FEE6 B9 01 85                ;
sta      $0F                           ; 0x1fef9 $FEE9 85 0F                   ;
lda      $0464,x                       ; 0x1fefb $FEEB BD 64 04                ;
and      #$3F                          ; 0x1fefe $FEEE 29 3F                   ; keep bits ..xx xxxx
asl                                    ; 0x1ff00 $FEF0 0A                      ;
asl                                    ; 0x1ff01 $FEF1 0A                      ;
sta      $02                           ; 0x1ff02 $FEF2 85 02                   ;
lda      $0740                         ; 0x1ff04 $FEF4 AD 40 07                ;
and      #$01                          ; 0x1ff07 $FEF7 29 01                   ; keep bits .... ...x
eor      #$01                          ; 0x1ff09 $FEF9 49 01                   ; flip bits .... ...x
asl                                    ; 0x1ff0b $FEFB 0A                      ;
adc      $02                           ; 0x1ff0c $FEFC 65 02                   ;
tay                                    ; 0x1ff0e $FEFE A8                      ;
ldx      $00                           ; 0x1ff0f $FEFF A6 00                   ;
lda      (L000E),y                     ; 0x1ff11 $FF01 B1 0E                   ;
sta      $03A7,x                       ; 0x1ff13 $FF03 9D A7 03                ;
iny                                    ; 0x1ff16 $FF06 C8                      ;
lda      (L000E),y                     ; 0x1ff17 $FF07 B1 0E                   ;
sta      $03A8,x                       ; 0x1ff19 $FF09 9D A8 03                ;
ldy      $04                           ; 0x1ff1c $FF0C A4 04                   ;
lda      $05                           ; 0x1ff1e $FF0E A5 05                   ;
bne      LFF20                         ; 0x1ff20 $FF10 D0 0E                   ;
lda      $01                           ; 0x1ff22 $FF12 A5 01                   ;
lsr                                    ; 0x1ff24 $FF14 4A                      ;
bcs      LFF30                         ; 0x1ff25 $FF15 B0 19                   ;
rol      $03                           ; 0x1ff27 $FF17 26 03                   ;
rol      $03                           ; 0x1ff29 $FF19 26 03                   ;
rol      $03                           ; 0x1ff2b $FF1B 26 03                   ;
jmp      LFF36                         ; 0x1ff2d $FF1D 4C 36 FF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LFF20                                                                          ;
lda      $01                           ; 0x1ff30 $FF20 A5 01                   ;
lsr                                    ; 0x1ff32 $FF22 4A                      ;
bcs      LFF34                         ; 0x1ff33 $FF23 B0 0F                   ;
lsr      $03                           ; 0x1ff35 $FF25 46 03                   ;
lsr      $03                           ; 0x1ff37 $FF27 46 03                   ;
lsr      $03                           ; 0x1ff39 $FF29 46 03                   ;
lsr      $03                           ; 0x1ff3b $FF2B 46 03                   ;
jmp      LFF36                         ; 0x1ff3d $FF2D 4C 36 FF                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
LFF30                                                                          ;
lsr      $03                           ; 0x1ff40 $FF30 46 03                   ;
lsr      $03                           ; 0x1ff42 $FF32 46 03                   ;
LFF34                                                                          ;
inc      $04                           ; 0x1ff44 $FF34 E6 04                   ;
LFF36                                                                          ;
lda      $0471,y                       ; 0x1ff46 $FF36 B9 71 04                ;
ora      $03                           ; 0x1ff49 $FF39 05 03                   ;
sta      $0471,y                       ; 0x1ff4b $FF3B 99 71 04                ;
inc      $00                           ; 0x1ff4e $FF3E E6 00                   ;
inc      $00                           ; 0x1ff50 $FF40 E6 00                   ;
ldx      $01                           ; 0x1ff52 $FF42 A6 01                   ;
inx                                    ; 0x1ff54 $FF44 E8                      ;
cpx      #$0D                          ; 0x1ff55 $FF45 E0 0D                   ;
bcc      LFED3                         ; 0x1ff57 $FF47 90 8A                   ;
jmp      bank7_Load_Bank_0_at_0x8000   ; 0x1ff59 $FF49 4C C5 FF                ; Load Bank 0
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_UNUSED_FF4C                                                              ;
.byt    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF; 0x1ff5c $FF4C FF FF FF FF FF FF FF FF ;
.byt    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF; 0x1ff64 $FF54 FF FF FF FF FF FF FF FF ;
.byt    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF; 0x1ff6c $FF5C FF FF FF FF FF FF FF FF ;
.byt    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF; 0x1ff74 $FF64 FF FF FF FF FF FF FF FF ;
.byt    $FF,$FF,$FF,$FF                ; 0x1ff7c $FF6C FF FF FF FF             ;
; ---------------------------------------------------------------------------- ;
bank7_reset                                                                    ;
sei                                    ; 0x1ff80 $FF70 78                      ;
cld                                    ; 0x1ff81 $FF71 D8                      ;
ldx      #$00                          ; 0x1ff82 $FF72 A2 00                   ; X = 00
stx      $2000                         ; 0x1ff84 $FF74 8E 00 20                ;
inx                                    ; 0x1ff87 $FF77 E8                      ;
LFF78                                                                          ;
lda      $2002                         ; 0x1ff88 $FF78 AD 02 20                ;
bpl      LFF78                         ; 0x1ff8b $FF7B 10 FB                   ;
dex                                    ; 0x1ff8d $FF7D CA                      ;
beq      LFF78                         ; 0x1ff8e $FF7E F0 F8                   ;
txs                                    ; 0x1ff90 $FF80 9A                      ;
stx      Tables_for_Game_Over_screen_text; 0x1ff91 $FF81 8E 00 80              ;
stx      LA000                         ; 0x1ff94 $FF84 8E 00 A0                ;
stx      bank7_PowerON_code            ; 0x1ff97 $FF87 8E 00 C0                ;
stx      LE000                         ; 0x1ff9a $FF8A 8E 00 E0                ;
lda      #$0F                          ; 0x1ff9d $FF8D A9 0F                   ; A = 0F
jsr      bank7_Config_Register         ; 0x1ff9f $FF8F 20 9D FF                ;
jsr      bank7_chr_bank_switch__load_A ; 0x1ffa2 $FF92 20 B1 FF                ;
lda      #$07                          ; 0x1ffa5 $FF95 A9 07                   ; A = 07
jsr      LFFCC                         ; 0x1ffa7 $FF97 20 CC FF                ;
jmp      bank7_PowerON_code            ; 0x1ffaa $FF9A 4C 00 C0                ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Config_Register                                                          ;
sta      Tables_for_Game_Over_screen_text; 0x1ffad $FF9D 8D 00 80              ;
lsr                                    ; 0x1ffb0 $FFA0 4A                      ;
sta      Tables_for_Game_Over_screen_text; 0x1ffb1 $FFA1 8D 00 80              ;
lsr                                    ; 0x1ffb4 $FFA4 4A                      ;
sta      Tables_for_Game_Over_screen_text; 0x1ffb5 $FFA5 8D 00 80              ;
lsr                                    ; 0x1ffb8 $FFA8 4A                      ;
sta      Tables_for_Game_Over_screen_text; 0x1ffb9 $FFA9 8D 00 80              ;
lsr                                    ; 0x1ffbc $FFAC 4A                      ;
sta      Tables_for_Game_Over_screen_text; 0x1ffbd $FFAD 8D 00 80              ;
rts                                    ; 0x1ffc0 $FFB0 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_chr_bank_switch__load_A                                                  ;
sta      LA000                         ; 0x1ffc1 $FFB1 8D 00 A0                ;
lsr                                    ; 0x1ffc4 $FFB4 4A                      ;
sta      LA000                         ; 0x1ffc5 $FFB5 8D 00 A0                ;
lsr                                    ; 0x1ffc8 $FFB8 4A                      ;
sta      LA000                         ; 0x1ffc9 $FFB9 8D 00 A0                ;
lsr                                    ; 0x1ffcc $FFBC 4A                      ;
sta      LA000                         ; 0x1ffcd $FFBD 8D 00 A0                ;
lsr                                    ; 0x1ffd0 $FFC0 4A                      ;
sta      LA000                         ; 0x1ffd1 $FFC1 8D 00 A0                ;
rts                                    ; 0x1ffd4 $FFC4 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_Load_Bank_0_at_0x8000                                                    ;
lda      #$00                          ; 0x1ffd5 $FFC5 A9 00                   ; A = 00
beq      LFFCC                         ; 0x1ffd7 $FFC7 F0 03                   ;
bank7_Load_Bank_769_at_0x8000                                                  ;
lda      $0769                         ; 0x1ffd9 $FFC9 AD 69 07                ;; Bank to switch to (other than 0 or 7)
LFFCC                                                                          ;
sta      LE000                         ; 0x1ffdc $FFCC 8D 00 E0                ;
lsr                                    ; 0x1ffdf $FFCF 4A                      ;
sta      LE000                         ; 0x1ffe0 $FFD0 8D 00 E0                ;
lsr                                    ; 0x1ffe3 $FFD3 4A                      ;
sta      LE000                         ; 0x1ffe4 $FFD4 8D 00 E0                ;
lsr                                    ; 0x1ffe7 $FFD7 4A                      ;
sta      LE000                         ; 0x1ffe8 $FFD8 8D 00 E0                ;
lsr                                    ; 0x1ffeb $FFDB 4A                      ;
sta      LE000                         ; 0x1ffec $FFDC 8D 00 E0                ;
rts                                    ; 0x1ffef $FFDF 60                      ;
                                                                               ;
; ---------------------------------------------------------------------------- ;
bank7_table33                                                                  ;
.byt    $4C,$45,$47,$45,$4E,$44,$20,$4F; 0x1fff0 $FFE0 4C 45 47 45 4E 44 20 4F ;
.byt    $46,$20,$5A,$45,$4C,$44,$41,$32; 0x1fff8 $FFE8 46 20 5A 45 4C 44 41 32 ;
.byt    $98,$F2,$DD,$DB,$33,$04,$01,$0F; 0x20000 $FFF0 98 F2 DD DB 33 04 01 0F ;
.byt    $01,$00,$7B,$C0,$70,$FF,$F0,$FF; 0x20008 $FFF8 01 00 7B C0 70 FF F0 FF ;
