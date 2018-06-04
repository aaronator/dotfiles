" Vim colorscheme template file
" Author: Gerardo Galindez <gerardo.galindez@gmail.com>
" Maintainer: Gerardo Galindez <gerardo.galindez@gmail.com>
" Notes: To check the meaning of the highlight groups, :help 'highlight'

set background=dark

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="bright_lights"

if !exists("g:bright_lights_termcolors")
  let g:bright_lights_termcolors = 256
endif

" Not all terminals support italics properly. If yours does, opt-in.
if !exists("g:bright_lights_terminal_italics")
  let g:bright_lights_terminal_italics = 0
endif

" This function is based on one from FlatColor: https://github.com/MaxSt/FlatColor/
" Which in turn was based on one found in hemisu: https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  if g:bright_lights_terminal_italics == 0
    if has_key(a:style, "cterm") && a:style["cterm"] == "italic"
      unlet a:style.cterm
    endif
    if has_key(a:style, "gui") && a:style["gui"] == "italic"
      unlet a:style.gui
    endif
  endif
  if g:bright_lights_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  endif
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

if has("nvim")
  let g:terminal_color_0  = "#212121"
  let g:terminal_color_1  = "#ff506e"
  let g:terminal_color_2  = "#c2e989"
  let g:terminal_color_3  = "#ffcc63"
  let g:terminal_color_4  = "#86dcff"
  let g:terminal_color_5  = "#c88fec"
  let g:terminal_color_6  = "#7cc9c2"
  let g:terminal_color_7  = "#cdd3df"
  let g:terminal_color_8  = "#212121"
  let g:terminal_color_9  = "#ff506e"
  let g:terminal_color_10 = "#c2e989"
  let g:terminal_color_11 = "#ffcc63"
  let g:terminal_color_12 = "#86ddff"
  let g:terminal_color_13 = "#c88fec"
  let g:terminal_color_14 = "#7cc9c2"
  let g:terminal_color_15 = "#cdd3df"
else
  let g:terminal_ansi_colors = [
    \ "#212121", "#ff506e", "#c2e989", "#ffcc63",
    \ "#86dcff", "#c88fec", "#7cc9c2", "#cdd3df",
    \ "#212121", "#ff506e", "#c2e989", "#ffcc63",
    \ "#86dcff", "#c88fec", "#7cc9c2", "#cdd3df"
  \]
endif

let s:overrides = get(g:, "bright_lights_color_overrides", {})
let s:colors = {
      \ "black": get(s:overrides, "black", { "gui": "#212121", "cterm": "16", "cterm16": "0" }),
      \ "red": get(s:overrides, "red", { "gui": "#FF506E", "cterm": "203", "cterm16": "1" }),
      \ "light_red": get(s:overrides, "light_red", { "gui": "#FF506E", "cterm": "203", "cterm16": "1" }),
      \ "dark_red": get(s:overrides, "dark_red", { "gui": "#FF506E", "cterm": "203", "cterm16": "9" }),
      \ "green": get(s:overrides, "green", { "gui": "#C2E989", "cterm": "150", "cterm16": "2" }),
      \ "yellow": get(s:overrides, "yellow", { "gui": "#FFCC63", "cterm": "221", "cterm16": "3" }),
      \ "dark_yellow": get(s:overrides, "dark_yellow", { "gui": "#FFCC63", "cterm": "221", "cterm16": "11" }),
      \ "orange": get(s:overrides, "orange", { "gui": "#F86200", "cterm": "202", "cterm16": "3" }),
      \ "blue": get(s:overrides, "blue", { "gui": "#86DCFF", "cterm": "117", "cterm16": "4" }),
      \ "purple": get(s:overrides, "purple", { "gui": "#C88FEC", "cterm": "177", "cterm16": "5" }),
      \ "cyan": get(s:overrides, "cyan", { "gui": "#7CC9C2", "cterm": "115", "cterm16": "6" }),
      \ "white": get(s:overrides, "white", { "gui": "#CDD3DF", "cterm": "188", "cterm16": "7" }),
      \ "visual_black": get(s:overrides, "visual_black", { "gui": "NONE", "cterm": "NONE", "cterm16": "0" }),
      \ "comment_grey": get(s:overrides, "comment_grey", { "gui": "#6B6B6B", "cterm": "59", "cterm16": "15" }),
      \ "gutter_fg_grey": get(s:overrides, "gutter_fg_grey", { "gui": "#4B4B4B", "cterm": "59", "cterm16": "15" }),
      \ "cursor_grey": get(s:overrides, "cursor_grey", { "gui": "#2C323C", "cterm": "236", "cterm16": "8" }),
      \ "visual_grey": get(s:overrides, "visual_grey", { "gui": "#3E4452", "cterm": "237", "cterm16": "15" }),
      \ "menu_grey": get(s:overrides, "menu_grey", { "gui": "#3E4452", "cterm": "237", "cterm16": "8" }),
      \ "special_grey": get(s:overrides, "special_grey", { "gui": "#3B4048", "cterm": "238", "cterm16": "15" }),
      \ "vertsplit": get(s:overrides, "vertsplit", { "gui": "#181A1F", "cterm": "59", "cterm16": "15" }),
      \ "med_grey": get(s:overrides, "med_grey", { "gui": "#848484", "cterm": "102", "cterm16": "15" }),
      \ "status_grey": get(s:overrides, "status_grey", { "gui": "#444444", "cterm": "238", "cterm16": "15" }),
      \}

let s:red = s:colors.red
let s:light_red = s:colors.light_red
let s:dark_red = s:colors.dark_red
let s:green = s:colors.green
let s:yellow = s:colors.yellow
let s:dark_yellow = s:colors.dark_yellow
let s:orange = s:colors.orange
let s:blue = s:colors.blue
let s:purple = s:colors.purple
let s:cyan = s:colors.cyan
let s:white = s:colors.white
let s:black = s:colors.black
let s:visual_black = s:colors.visual_black " Black out selected text in 16-color visual mode
let s:comment_grey = s:colors.comment_grey
let s:gutter_fg_grey = s:colors.gutter_fg_grey
let s:cursor_grey = s:colors.cursor_grey
let s:visual_grey = s:colors.visual_grey
let s:menu_grey = s:colors.menu_grey
let s:special_grey = s:colors.special_grey
let s:vertsplit = s:colors.vertsplit
let s:status_grey = s:colors.status_grey
let s:med_grey = s:colors.med_grey


"----------------------------------------------------------------
" General settings                                              |
"----------------------------------------------------------------

" --------------------------------
" Editor settings
" --------------------------------
call s:h("Normal", { "fg": s:white, "bg": s:black })
call s:h("Cursor", {})
call s:h("CursorLine", {})
call s:h("CursorLineNr", { "fg": s:orange })
call s:h("LineNr", { "fg": s:gutter_fg_grey })

" -----------------
" - Number column -
" -----------------
hi CursorColumn    ctermfg=none    ctermbg=none    cterm=none
hi FoldColumn      ctermfg=none    ctermbg=none    cterm=none
hi SignColumn      ctermfg=none    ctermbg=none    cterm=none
hi Folded          ctermfg=none    ctermbg=none    cterm=none

" -------------------------
" - Window/Tab delimiters -
" -------------------------
"call s:h("VertSplit", { "fg": s:vertsplit })
call s:h("VertSplit", { "fg": s:gutter_fg_grey })
hi ColorColumn     ctermfg=none    ctermbg=none    cterm=none
hi TabLine         ctermfg=none    ctermbg=none    cterm=none
hi TabLineFill     ctermfg=none    ctermbg=none    cterm=none
hi TabLineSel      ctermfg=none    ctermbg=none    cterm=none

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
call s:h("Directory", { "fg": s:blue })
hi Search          ctermfg=none    ctermbg=none    cterm=none
hi IncSearch       ctermfg=none    ctermbg=none    cterm=none
call s:h("NERDTreeClosable", { "fg": s:blue })
call s:h("NERDTreeOpenable", { "fg": s:menu_grey })
call s:h("NERDTreeCWD", { "fg": s:purple })
call s:h("NERDTreeDirSlash", { "fg": s:blue })
call s:h("NERDTreeHelp", { "fg": s:green })
call s:h("NERDTreeLinkDir", { "fg": s:purple })
call s:h("NERDTreeLinkTarget", { "fg": s:white })
call s:h("NERDTreeLinkTarget", { "fg": s:white })

" -----------------
" - Prompt/Status -
" -----------------
call s:h("StatusLine", { "bg": s:status_grey, "fg": s:white })
call s:h("StatusLineNC", { "bg": s:status_grey, "fg": s:med_grey })
hi WildMenu        ctermfg=none    ctermbg=none    cterm=none
hi Question        ctermfg=none    ctermbg=none    cterm=none
call s:h("Title", { "fg": s:red })
hi ModeMsg         ctermfg=none    ctermbg=none    cterm=none
hi MoreMsg         ctermfg=none    ctermbg=none    cterm=none

" --------------
" - Visual aid -
" --------------
hi MatchParen      ctermfg=none    ctermbg=none    cterm=none
hi Visual          ctermfg=none    ctermbg=none    cterm=none
hi VisualNOS       ctermfg=none    ctermbg=none    cterm=none
call s:h("NonText", { "fg": s:gutter_fg_grey })
hi Todo            ctermfg=none    ctermbg=none    cterm=none
hi Underlined      ctermfg=none    ctermbg=none    cterm=none
hi Error           ctermfg=none    ctermbg=none    cterm=none
hi ErrorMsg        ctermfg=none    ctermbg=none    cterm=none
hi WarningMsg      ctermfg=none    ctermbg=none    cterm=none
hi Ignore          ctermfg=none    ctermbg=none    cterm=none
hi SpecialKey      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Variable types
" --------------------------------
call s:h("Constant", { "fg": s:purple })
call s:h("String", { "fg": s:green })
hi Character       ctermfg=none    ctermbg=none    cterm=none
hi Number          ctermfg=none    ctermbg=none    cterm=none
hi Boolean         ctermfg=none    ctermbg=none    cterm=none
hi Float           ctermfg=none    ctermbg=none    cterm=none

call s:h("Identifier", { "fg": s:yellow })
call s:h("Function", { "fg": s:yellow })

" --------------------------------
" Language constructs
" --------------------------------
call s:h("Statement", { "fg": s:red })
call s:h("Conditional", { "fg": s:purple })
hi Repeat          ctermfg=none    ctermbg=none    cterm=none
hi Label           ctermfg=none    ctermbg=none    cterm=none
hi Operator        ctermfg=none    ctermbg=none    cterm=none
hi Keyword         ctermfg=none    ctermbg=none    cterm=none
hi Exception       ctermfg=none    ctermbg=none    cterm=none
call s:h("Comment", { "fg": s:comment_grey })

hi Special         ctermfg=none    ctermbg=none    cterm=none
hi SpecialChar     ctermfg=none    ctermbg=none    cterm=none
hi Tag             ctermfg=none    ctermbg=none    cterm=none
call s:h("Delimiter", { "fg": s:blue })
hi SpecialComment  ctermfg=none    ctermbg=none    cterm=none
hi Debug           ctermfg=none    ctermbg=none    cterm=none

" ----------
" - C like -
" ----------
call s:h("PreProc", { "fg": s:purple })
hi PreProc         ctermfg=none    ctermbg=none    cterm=none
call s:h("Include", { "fg": s:purple })
call s:h("Define", { "fg": s:purple })
hi Macro           ctermfg=none    ctermbg=none    cterm=none
call s:h("PreCondit", { "fg": s:yellow })

call s:h("Type", { "fg": s:yellow })
call s:h("StorageClass", { "fg": s:purple })
call s:h("Structure", { "fg": s:yellow })
call s:h("Typedef", { "fg": s:yellow })

" --------------------------------
" Diff
" --------------------------------
call s:h("DiffAdd", { "fg": s:green })
call s:h("DiffChange", { "fg": s:yellow })
call s:h("DiffDelete", { "fg": s:red })
hi DiffText        ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Completion menu
" --------------------------------
hi Pmenu           ctermfg=none    ctermbg=none    cterm=none
hi PmenuSel        ctermfg=none    ctermbg=none    cterm=none
hi PmenuSbar       ctermfg=none    ctermbg=none    cterm=none
hi PmenuThumb      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Spelling
" --------------------------------
hi SpellBad        ctermfg=none    ctermbg=none    cterm=none
hi SpellCap        ctermfg=none    ctermbg=none    cterm=none
hi SpellLocal      ctermfg=none    ctermbg=none    cterm=none
hi SpellRare       ctermfg=none    ctermbg=none    cterm=none

"--------------------------------------------------------------------
" Specific settings                                                 |
"--------------------------------------------------------------------

call s:h("GitGutterAdd", { "fg": s:green })
call s:h("GitGutterChange", { "fg": s:yellow })
call s:h("GitGutterDelete", { "fg": s:red })
call s:h("GitGutterChangeDelete", { "fg": s:yellow })
