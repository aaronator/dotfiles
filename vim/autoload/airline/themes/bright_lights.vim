" Color palette
let s:dark_gray = { 'cterm': 236, 'gui': '#303030' }
let s:med_gray_hi = { 'cterm': 238, 'gui': '#444444' }
let s:med_gray_lo = { 'cterm': 237, 'gui': '#3a3a3a' }
let s:light_gray = { 'cterm': 249, 'gui': '#b2b2b2' }
let s:green = { 'cterm': 150, 'gui': '#afd787' }
let s:blue = { 'cterm': 117, 'gui': '#86DCFF' }
let s:purple = { 'cterm': 177, 'gui': '#C88FEC' }
let s:orange = { 'cterm': 179, 'gui': '#d7af5f' }
let s:red = { 'cterm': 203, 'gui': '#FF506E' }
let s:pink = { 'cterm': 182, 'gui': '#d7afd7' }

let g:airline#themes#bright_lights#palette = {}

" Normal mode
let s:N1 = [s:dark_gray.gui, s:blue.gui, s:dark_gray.cterm, s:blue.cterm]
let s:N2 = [s:light_gray.gui, s:med_gray_lo.gui, s:light_gray.cterm, s:med_gray_lo.cterm]
let s:N3 = [s:blue.gui, s:med_gray_hi.gui, s:blue.cterm, s:med_gray_hi.cterm]
let g:airline#themes#bright_lights#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#bright_lights#palette.normal_modified = {
      \ 'airline_c': [s:orange.gui, s:med_gray_hi.gui, s:orange.cterm, s:med_gray_hi.cterm, ''],
      \ }

" Insert mode
let s:I1 = [s:med_gray_hi.gui, s:green.gui, s:med_gray_hi.cterm, s:green.cterm]
let s:I3 = [s:green.gui, s:med_gray_hi.gui, s:green.cterm, s:med_gray_hi.cterm]
let g:airline#themes#bright_lights#palette.insert = airline#themes#generate_color_map(s:I1, s:N2, s:I3)
let g:airline#themes#bright_lights#palette.insert_modified = copy(g:airline#themes#bright_lights#palette.normal_modified)
let g:airline#themes#bright_lights#palette.insert_paste = {
      \ 'airline_a': [s:dark_gray.gui, s:orange.gui, s:dark_gray.cterm, s:orange.cterm, ''],
      \ }

" Replace mode
let g:airline#themes#bright_lights#palette.replace = {
      \ 'airline_a': [s:dark_gray.gui, s:red.gui, s:dark_gray.cterm, s:red.cterm, ''],
      \ 'airline_c': [s:red.gui, s:med_gray_hi.gui, s:red.cterm, s:med_gray_hi.cterm, ''],
      \ }
let g:airline#themes#bright_lights#palette.replace_modified = copy(g:airline#themes#bright_lights#palette.insert_modified)

" Visual mode
let s:V1 = [s:dark_gray.gui, s:purple.gui, s:dark_gray.cterm, s:purple.cterm]
let s:V3 = [s:purple.gui, s:med_gray_hi.gui, s:purple.cterm, s:med_gray_hi.cterm]
let g:airline#themes#bright_lights#palette.visual = airline#themes#generate_color_map(s:V1, s:N2, s:V3)
let g:airline#themes#bright_lights#palette.visual_modified = copy(g:airline#themes#bright_lights#palette.insert_modified)

" Inactive window
let s:IA = [s:light_gray.gui, s:med_gray_hi.gui, s:light_gray.cterm, s:med_gray_hi.cterm, '']
let g:airline#themes#bright_lights#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#bright_lights#palette.inactive_modified = {
      \ 'airline_c': [s:orange.gui, '', s:orange.cterm, '', ''],
      \ }

" CtrlP
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#bright_lights#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ s:orange.gui, s:med_gray_hi.gui, s:orange.cterm, s:med_gray_hi.cterm, '' ] ,
      \ [ s:orange.gui, s:med_gray_lo.gui, s:orange.cterm, s:med_gray_lo.cterm, '' ] ,
      \ [ s:dark_gray.gui, s:blue.gui, s:dark_gray.cterm, s:blue.cterm, 'bold' ] )
