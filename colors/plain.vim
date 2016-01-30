"
" A Vim colorscheme by Giovanni Cavallanti.
"
" Available at http://github.com/gcavn/trafficlights/
"

" Supporting code ------------------------------------------------------------- {{{
" Preamble {{{
if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

if exists("syntax_on")
    syntax reset
endif


let colors_name = "plain"
" }}}

" Palette {{{
let s:bwc = {}
let s:bwc.gray25  = ['#ffffff', 231]
let s:bwc.gray24  = ['#eeeeee', 255]
let s:bwc.gray23  = ['#e4e4e4', 254] "
let s:bwc.gray22  = ['#dadada', 253] "
let s:bwc.gray21  = ['#d0d0d0', 252]
let s:bwc.gray20  = ['#c6c6c6', 251]
let s:bwc.gray19  = ['#bcbcbc', 250]
let s:bwc.gray18  = ['#b2b2b2', 249]
let s:bwc.gray17  = ['#a8a8a8', 248] "
let s:bwc.gray16  = ['#9e9e9e', 247]
let s:bwc.gray15  = ['#949494', 246] "
let s:bwc.gray14  = ['#8a8a8a', 245]
let s:bwc.gray13  = ['#808080', 244] "
let s:bwc.gray12  = ['#767676', 243] "
let s:bwc.gray11  = ['#6c6c6c', 242]
let s:bwc.gray10  = ['#626262', 241]
let s:bwc.gray09  = ['#585858', 240] "
let s:bwc.gray08  = ['#4e4e4e', 239]
let s:bwc.gray07  = ['#444444', 238]
let s:bwc.gray06  = ['#3a3a3a', 237] "
let s:bwc.gray05  = ['#303030', 236]
let s:bwc.gray04  = ['#262626', 235]
let s:bwc.gray03  = ['#1c1c1c', 234] "
let s:bwc.gray02  = ['#121212', 233]
let s:bwc.gray01  = ['#080808', 232]
let s:bwc.gray00  = ['#000000', 16]

let s:bwc.nred     = ['#ff5f87', 1]  "1
let s:bwc.bred     = ['#af0000', 9]  "9
let s:bwc.ngreen   = ['#87ff5f', 2]  "2
let s:bwc.bgreen   = ['#008700', 10] "10
let s:bwc.nyellow  = ['#ffd75f', 3]  "3
let s:bwc.byellow  = ['#af5f00', 11] "11
let s:bwc.nblue    = ['#5f87ff', 4]  "4
let s:bwc.bblue    = ['#0000af', 12] "12
let s:bwc.nmagenta = ['#af5fff', 5]  "5
let s:bwc.bmagenta = ['#870087', 13] "13
let s:bwc.ncyan    = ['#5fd7ff', 6]  "6
let s:bwc.bcyan    = ['#0087af', 14] "14

let s:bwc.background       = ['#232323', 235]
let s:bwc.cursor       = ['#8700ff', 5]
if &background == 'dark'

    let s:bwc.lcontrast  = ['#494949', 0]
    let s:bwc.vlcontrast  = ['#3d3d3d', 8]
    let s:bwc.hcontrast  = ['#7d7d7d', 15]
    let s:bwc.vhcontrast  = ['#d4d4d4', 7]

    " let s:bwc.lcontrast = s:bwc.gray07
else

    let s:bwc.lcontrast  = ['#999999', 7]
    let s:bwc.vlcontrast  = ['#f7f7f7', 15]
    let s:bwc.hcontrast  = ['#595959', 8]
    let s:bwc.vhcontrast  = ['#2d2d2d', 0]

let s:bwc.background       = ['#ffffff', 232]
    " let s:bwc.lcontrast = s:bwc.gray11
endif

" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg/ctermfg, guibg/ctermbg, gui/ctermbg, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        elseif a:fg == 'none'
            let histring .= 'guifg=fg ctermfg=NONE '
        else
            let c = get(s:bwc, a:fg)
            let histring .= 'guifg=' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        elseif a:1 == 'none'
            let histring .= 'guibg=NONE ctermbg=NONE '
        elseif a:1 == 'fg'
            let histring .= 'guibg=fg ctermbg=fg '
        else
            let c = get(s:bwc, a:1)
            let histring .= 'guibg=' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:bwc, a:3)
        let histring .= 'guisp=' . c[0] . ' '
    endif

    execute histring
endfunction
" }}}

let has_gutter = 0
if exists('g:has_gutter') && g:has_gutter
  let s:gutter = 'vlcontrast'
else
  let s:gutter = 'none'
endif

" }}}

" Actual colorscheme ---------------------------------------------------------- {{{
" Vim {{{

" General/UI {{{

if has('gui_running')
    call s:HL('Normal', 'gray18', 'background', 'none')
else
    " if &background == 'dark'
    "     call s:HL('Normal', 'gray17', 'none', 'none')
    " else
    "     call s:HL('Normal', 'gray07', 'none', 'none')
    " endif
endif




call s:HL('Folded', 'lcontrast', 'none', 'none')
call s:HL('CursorLine', 'none', 'vlcontrast', 'none')
call s:HL('CursorColumn', 'none', 'vlcontrast', 'none')
call s:HL('ColorColumn', 'none', 'vlcontrast', 'none')
call s:HL('Visual', 'hcontrast', 'lcontrast', 'none')
call s:HL('VisualNOS', 'hcontrast', 'lcontrast', 'none')

" GUI
call s:HL('TabLine', 'hcontrast', 'vlcontrast', 'none')
call s:HL('TabLineFill', 'none', 'vlcontrast', 'none')
call s:HL('TabLineSel', 'lcontrast', 'vhcontrast', 'none')

call s:HL('NonText', 'vlcontrast', 'none', 'none')
call s:HL('SpecialKey', 'lcontrast', 'none', 'none')

call s:HL('Search', 'ncyan', 'none', 'none')
" call s:HL('Search', 'vhcontrast', 'lcontrast', 'none')
call s:HL('IncSearch', 'vhcontrast', 'bcyan', 'none')
call s:HL('Underlined', 'none', 'none', 'underline')

call s:HL('Directory', 'nblue', 'none', 'none')

call s:HL('Title', 'ngreen')

call s:HL('ErrorMsg', 'nred', 'none', 'none')
call s:HL('WarningMsg', 'nyellow', 'none', 'none')
call s:HL('MoreMsg', 'hcontrast', 'none', 'none')
call s:HL('ModeMsg', 'hcontrast', 'none', 'none')
call s:HL('Question', 'hcontrast', 'none', 'none')
call s:HL('Delimiter', 'none', 'none', 'none')

call s:HL('Tag', 'none', 'none', 'underline')

call s:HL('WildMenu', 'gray25', 'gray07', 'none')

call s:HL('VertSplit', 'vlcontrast', 'none', 'none')
call s:HL('StatusLine', 'vlcontrast', 'vhcontrast', 'none')
call s:HL('StatusLineNC', 'vhcontrast', 'lcontrast', 'none')
call s:HL('User1', 'vlcontrast', 'vhcontrast', 'bold')
call s:HL('User2', 'gray25', 'lcontrast', 'none')
call s:HL('User3', 'lcontrast', 'vhcontrast', 'none' )
call s:HL('User4', 'gray04', 'gray21', 'none')
call s:HL('User5', 'gray09', 'gray21', 'none')
call s:HL('User6', 'gray09', 'gray21', 'none')
call s:HL('User7', 'gray04', 'gray21', 'none')
call s:HL('User8', 'gray05', 'gray21', 'none')
call s:HL('User9', 'gray04', 'gray21', 'none')
call s:HL('User0', 'gray25', 'gray05', 'none')

" Gutter {{{
call s:HL('CursorLineNr', 'ngreen', s:gutter, 'none')
call s:HL('LineNr', 'vlcontrast', s:gutter, 'none')
call s:HL('FoldColumn', 'lcontrast', s:gutter, 'none')
call s:HL('SignColumn', 'lcontrast', s:gutter, 'none')
" }}}

call s:HL('Pmenu', 'vlcontrast', 'hcontrast', 'none')
call s:HL('PmenuSel', 'gray25', 'nblue', 'none')
call s:HL('PmenuSbar', 'none', 'vhcontrast', 'none')
call s:HL('PmenuThumb', 'none', 'lcontrast', 'none')
 
" Cursor {{{
call s:HL('Cursor', 'gray25', 'cursor', 'none')
call s:HL('vCursor', 'gray00', 'ngreen', 'none')
call s:HL('iCursor', 'gray00', 'ngreen', 'none')
" }}}

" Syntax highlighting {{{
call s:HL('Special', 'vhcontrast', 'none', 'none')

call s:HL('MatchParen', 'nblue', 'none', 'bold')

call s:HL('Comment', 'lcontrast', 'none', 'none')
call s:HL('Todo', 'nmagenta', 'none', 'none')
call s:HL('SpecialComment', 'nred', 'none', 'bold')

call s:HL('Statement', 'vhcontrast', 'none', 'bold')
call s:HL('Keyword', 'vhcontrast', 'none', 'bold')
call s:HL('Conditional', 'vhcontrast', 'none', 'bold')
call s:HL('Operator', 'vhcontrast', 'none', 'bold')
call s:HL('Label', 'vhcontrast', 'none', 'bold')
call s:HL('Repeat', 'vhcontrast', 'none', 'bold')

call s:HL('Identifier', 'none', 'none', 'none')
call s:HL('Function', 'none', 'none', 'none')

call s:HL('PreProc', 'hcontrast', 'none', 'none')
call s:HL('Macro', 'hcontrast', 'none', 'none')
call s:HL('Define', 'hcontrast', 'none', 'none')
call s:HL('PreCondit', 'hcontrast', 'none', 'none')

call s:HL('Constant', 'hcontrast', 'none', 'none')
call s:HL('Character', 'hcontrast', 'none', 'none')
call s:HL('Boolean', 'hcontrast', 'none', 'none')

call s:HL('Number', 'hcontrast', 'none', 'none')
call s:HL('Float', 'hcontrast', 'none', 'none')

call s:HL('String', 'hcontrast', 'none', 'none')

call s:HL('SpecialChar', 'vhcontrast', 'none', 'none')

call s:HL('Type', 'vhcontrast', 'none', 'bold')
call s:HL('Typedef', 'vhcontrast', 'none', 'bold')
call s:HL('StorageClass', 'vhcontrast', 'none', 'bold')
call s:HL('Structure', 'vhcontrast', 'none', 'bold')

call s:HL('Exception', 'nred', 'none', 'bold')

call s:HL('Error', 'nred', 'none', 'underline')
call s:HL('Debug', 'gray25', 'none', 'bold')
call s:HL('Ignore', 'hcontrast', 'none', 'none')
" }}}

" Help {{{
call s:HL('helpHyperTextEntry', 'vhcontrast', 'none', 'bold')
call s:HL('helpHyperTextJump', 'nblue', 'none', 'underline')
call s:HL('helpTag', 'nblue', 'none', 'underline')
call s:HL('helpSectionDelim', 'vhcontrast', 'none', 'bold')
call s:HL('helpSpecial', 'hcontrast', 'vlcontrast', 'none')
call s:HL('helpExample', 'hcontrast', 'none', 'none')
call s:HL('helpHeader', 'vhcontrast', 'none', 'bold')
call s:HL('helpCommand', 'vhcontrast', 'none', 'underline')
call s:HL('helpNotVi', 'lcontrast', 'none', 'none')
call s:HL('helpNote', 'lcontrast', 'none', 'none')
" }}}

" Undotree {{{
call s:HL('UndotreeNode', 'lcontrast', 'none', 'none')
call s:HL('UndotreeCurrent', 'nred', 'none', 'bold')
call s:HL('UndotreeNodeCurrent', 'nred', 'none', 'bold')
call s:HL('UndotreeSavedSmall', 'lcontrast', 'none', 'bold')
call s:HL('UndotreeSavedBig', 'vhcontrast', 'none', 'bold')
" }}}
" Diffs {{{
call s:HL('DiffDelete', 'vlcontrast', 'none', 'none')
call s:HL('DiffAdd', 'gray25', 'nblue', 'none')
call s:HL('DiffChange', 'nblue', 'bblue', 'none')
call s:HL('DiffText', 'gray25', 'nblue', 'none')
" }}}

" GitGutter {{{
call s:HL('GitGutterDelete', 'hcontrast', s:gutter, 'none')
call s:HL('GitGutterAdd', 'hcontrast', s:gutter, 'none')
call s:HL('GitGutterChange', 'hcontrast', s:gutter, 'none')
call s:HL('GitGutterChangeDelete', 'hcontrast', s:gutter, 'none')
call s:HL('GitGutterDeleteLine', 'nred', 'bred', 'none')
call s:HL('GitGutterAddLine', 'ngreen', 'bgreen', 'none')
call s:HL('GitGutterChangeLine', 'nblue', 'bblue', 'none')
call s:HL('GitGutterChangeDeleteLine', 'gray24', 'nblue', 'none')
" }}}

" Netrw {{{
call s:HL('netrwSymLink', 'ncyan', 'none', 'none')
call s:HL('netrwDir', 'nblue', 'none', 'none')
call s:HL('netrwExe', 'ngreen', 'none', 'none')
call s:HL('netrwTreeBar', 'none', 'none', 'none')
call s:HL('netrwClassify', 'none', 'none', 'none')
call s:HL('netrwCmdSep', 'none', 'none', 'none')
call s:HL('netrwHelpCmd', 'hcontrast', 'none', 'none')
" }}}

" Spelling {{{
if has("spell")
    call s:HL('SpellCap', 'nyellow', 'none', 'none')
    call s:HL('SpellBad', 'none', 'none', 'underline')
    call s:HL('SpellLocal', 'none', 'none', 'undercurl', 'nyellow')
    call s:HL('SpellRare', 'none', 'none', 'undercurl', 'nyellow')
endif
" }}}

" quickfix {{{
call s:HL('CtrlPNVName', 'none', 'none', 'none')
call s:HL('CtrlPNVDate', 'lcontrast', 'none', 'none')
call s:HL('CtrlPNVContent', 'hcontrast', 'none', 'none')
call s:HL('qfFilename', 'hcontrast', 'none', 'none')
call s:HL('qfSeparator', 'none', 'none', 'none')
call s:HL('qfLineNr', 'hcontrast', 'none', 'none')
call s:HL('qfError', 'none', 'none', 'none')
" }}}

" }}}

" Plugins {{{

" CtrlP {{{
call s:HL('CtrlPMatch', 'vhcontrast', 'none', 'bold')
call s:HL('CtrlPLinePre', 'lcontrast', 'none', 'none')
call s:HL('CtrlPPrtBase', 'lcontrast', 'none', 'none')
call s:HL('CtrlPPrtText', 'none', 'none', 'none')
call s:HL('CtrlPPrtCursor', 'gray25', 'gray17', 'none')
call s:HL('CtrlPNoEntries', 'nred', 'none', 'none')
call s:HL('CtrlPMode1', 'vlcontrast', 'vhcontrast', 'none')
call s:HL('CtrlPMode2', 'vlcontrast', 'vhcontrast', 'none')
call s:HL('CtrlPStats', 'lcontrast', 'vhcontrast', 'none')
" }}}

" TagBar {{{
call s:HL('TagBarScope', 'vhcontrast', 'none', 'bold')
call s:HL('TagBarSignature', 'lcontrast', 'none', 'bold')
call s:HL('TagBarKind', 'vhcontrast', 'none', 'bold')
call s:HL('TagBarNestedKind', 'hcontrast', 'none', 'none')
call s:HL('TagBarType', 'hcontrast', 'none', 'none')
call s:HL('TagBarFoldIcon', 'vhcontrast', 'none', 'none')
call s:HL('TagBarVisibilityPublic', 'vlcontrast', 'none', 'none')
call s:HL('TagBarVisibilityProtected', 'vlcontrast', 'none', 'none')
call s:HL('TagBarVisibilityPrivate', 'vlcontrast', 'none', 'none')
" }}}

" }}}

" Filetype-specific {{{

" CSS {{{
call s:HL('cssVendor', 'none', 'none', 'none')
call s:HL('cssProp', 'none', 'none', 'none')
call s:HL('cssFontAttr', 'none', 'none', 'none')
call s:HL('cssAttrComma', 'none', 'none', 'none')
call s:HL('cssAttr', 'hcontrast', 'none', 'none')
call s:HL('cssAttributeSelector', 'none', 'none', 'none')
call s:HL('cssInclude', 'none', 'none', 'none')
call s:HL('cssIncludeKeyword', 'none', 'none', 'none')
call s:HL('cssUnitDecorators', 'hcontrast', 'none', 'none')
call s:HL('cssColor', 'hcontrast', 'none', 'none')
call s:HL('cssBraces', 'none', 'none', 'none')
call s:HL('cssSelectorOp', 'none', 'none', 'none')
call s:HL('cssSelectorOp2', 'none', 'none', 'none')
call s:HL('cssIdentifier', 'hcontrast', 'none', 'none')
call s:HL('cssClassName', 'hcontrast', 'none', 'none')
call s:HL('cssClassNameDot', 'hcontrast', 'none', 'none')
call s:HL('cssFunctionName', 'none', 'none', 'none')
call s:HL('cssFontDescriptor', 'vhcontrast', 'none', 'bold')
call s:HL('cssFunctionComma', 'none', 'none', 'none')
call s:HL('cssTagName', 'vhcontrast', 'none', 'bold')
call s:HL('cssPseudoClassId', 'none', 'none', 'none')
call s:HL('cssPseudoClassFn', 'none', 'none', 'none')
call s:HL('cssImportant', 'none', 'none', 'none')
" }}}

" Spelling {{{
" call s:HL('SpellBad', 'nred', 'nblue', 'underline')
" }}}
" Syntastic {{{
" Whole error/warning lines are colored.  Specific error/warning spots are
" underlined and more brightly colored
call s:HL('SyntasticError', 'none', 'none', 'underline')
call s:HL('SyntasticWarning', 'none', 'none', 'underline')
call s:HL('SyntasticStyleError', 'none', 'none', 'underline')
call s:HL('SyntasticStyleWarning', 'none', 'none', 'underline')
call s:HL('SyntasticErrorSign', 'nred', s:gutter, 'none')
call s:HL('SyntasticWarningSign', 'nyellow', s:gutter, 'none')
call s:HL('SyntasticStyleErrorSign', 'nred', s:gutter, 'none')
call s:HL('SyntasticStyleWarningSign', 'nyellow', s:gutter, 'none')
call s:HL('SyntasticErrorLine', 'none', 'none', 'none')
call s:HL('SyntasticWarningLine', 'none', 'none', 'none')
call s:HL('SyntasticStyleErrorLine', 'none', 'none', 'none')
call s:HL('SyntasticStyleWarningLine', 'none', 'none', 'none')
" }}}

" javascript {{{
call s:HL('scalaPackage', 'vhcontrast', 'none', 'bold')
call s:HL('scalaImport', 'vhcontrast', 'none', 'bold')
call s:HL('scalaConstructor', 'none', 'none', 'none')
call s:HL('scalaClassname', 'none', 'none', 'none')
" }}}

" javascript {{{
call s:HL('javaScriptIdentifier', 'none', 'none', 'bold')
call s:HL('javaScriptBoolean', 'hcontrast', 'none', 'none')
call s:HL('javaScriptNumber', 'hcontrast', 'none', 'none')
call s:HL('javaScriptFunction', 'none', 'none', 'bold')
call s:HL('javaScriptBraces', 'none', 'none', 'none')
call s:HL('javaScriptMember', 'hcontrast', 'none', 'none')
" }}}

" Diff {{{
call s:HL('diffAdded', 'ngreen', 'none', 'none')
call s:HL('diffRemoved', 'nred', 'none',)
call s:HL('diffChanged', 'nyellow', 'none', 'none')
call s:HL('diffFile', 'nmagenta', 'none', 'none')
call s:HL('diffLine', 'ncyan', 'none', 'none')
call s:HL('diffNewFile', 'nmagenta', 'none', 'none')
call s:HL('diffOldFile', 'none', 'none', 'none')
call s:HL('diffSubname', 'none', 'none', 'none')
" }}}

" Git {{{
call s:HL('gitDate', 'none', 'none', 'none')
call s:HL('gitDiff', 'none', 'none', 'none')
call s:HL('gitEmail', 'none', 'none', 'none')
call s:HL('gitIdentity', 'none', 'none', 'none')
" }}}

" fugitive {{{
call s:HL('gitcommitDiscardedFile', 'nred', 'none',)
call s:HL('gitcommitSelectedFile', 'ngreen', 'none',)
call s:HL('gitcommitUntrackedFile', 'nyellow', 'none',)
call s:HL('gitcommitBranch', 'none', 'none',)

" }}}

" indentline {{{
call s:HL('Conceal', 'vlcontrast', 'none',)
" }}}

" XML {{{
call s:HL('xmlTag', 'none', 'none', 'none')
call s:HL('xmlEndTag', 'none', 'none', 'none')
call s:HL('xmlTagName', 'none', 'none', 'none')
" }}}

" HTML {{{
call s:HL('htmlTag', 'none', 'none', 'none')
call s:HL('htmlEndTag', 'none', 'none', 'none')
call s:HL('htmlTagName', 'vhcontrast', 'none', 'bold')
call s:HL('htmlTagN', 'none', 'none', 'none')
call s:HL('htmlItalic', 'none', 'none', 'none')
call s:HL('htmlBold', 'none', 'none', 'none')
call s:HL('htmlSpecialTagName', 'vhcontrast', 'none', 'none')
call s:HL('htmlSpecialChar', 'vhcontrast', 'none', 'none')
call s:HL('htmlArg', 'none', 'none', 'none')
call s:HL('htmlTitle', 'none', 'none', 'none')
call s:HL('htmlH1', 'none', 'none', 'none')
call s:HL('htmlH2', 'none', 'none', 'none')
call s:HL('htmlH3', 'none', 'none', 'none')
call s:HL('htmlH4', 'none', 'none', 'none')
call s:HL('htmlH5', 'none', 'none', 'none')
call s:HL('htmlH6', 'none', 'none', 'none')
call s:HL('htmlLink', 'none', 'none', 'none')
call s:HL('htmlError', 'none', 'none', 'none')
call s:HL('htmlString', 'hcontrast', 'none', 'none')
call s:HL('javaScript', 'none', 'none', 'none')
call s:HL('javaScriptMember', 'none', 'none', 'none')
" }}} 

" Java {{{
call s:HL('javaClassDecl', 'vhcontrast', 'none', 'bold')
call s:HL('javaScopeDecl', 'vhcontrast', 'none', 'bold')
call s:HL('javaCommentTitle', 'lcontrast', 'none', 'none')
call s:HL('javaDocTags', 'hcontrast', 'vlcontrast', 'none')
call s:HL('javaDocParam', 'hcontrast', 'none', 'none')
call s:HL('javaStorageClass', 'vhcontrast', 'none', 'bold')
call s:HL('javaAnnotation', 'hcontrast', 'vlcontrast', 'none')
call s:HL('javaTypedef', 'hcontrast', 'none', 'none')
call s:HL('javaType', 'vhcontrast', 'none', 'bold')
call s:HL('javaBraces', 'none', 'none', 'none')
call s:HL('javaExternal', 'vhcontrast', 'none', 'bold')
call s:HL('javaExceptions', 'vhcontrast', 'none', 'bold')
call s:HL('javaSpecialChar', 'vhcontrast', 'none', 'none')
" }}}

" Vimscript {{{
call s:HL('VimMapModKey', 'none', 'none', 'bold')
call s:HL('VimCommand', 'vhcontrast', 'none', 'bold')
call s:HL('VimFuncSID', 'none', 'none', 'none')
call s:HL('VimCommentTitle', 'lcontrast', 'none', 'none')
call s:HL('VimHiGroup', 'none', 'none', 'none')
call s:HL('VimMapMod', 'none', 'none', 'none')
call s:HL('VimNotation', 'none', 'none', 'none')
call s:HL('VimBracket', 'none', 'none', 'none')
call s:HL('VimParenSep', 'none', 'none', 'none')
call s:HL('VimFunction', 'hcontrast', 'none', 'none')
call s:HL('VimFuncName', 'vhcontrast', 'none', 'bold')
call s:HL('VimFuncSID', 'hcontrast', 'none', 'none')
call s:HL('vimLineComment', 'lcontrast', 'none', 'none')
" }}}

" sh {{{
call s:HL('shDerefSimple', 'none', 'none', 'none')
call s:HL('shFunctionKey', 'none', 'none', 'bold')
call s:HL('shFunction', 'none', 'none', 'none')
call s:HL('shCommandSub', 'none', 'none', 'none')
call s:HL('shCmdSubRegion', 'none', 'none', 'none')
call s:HL('shSpecial', 'none', 'none', 'none')
call s:HL('shDeref', 'none', 'none', 'none')
" }}}

" zsh {{{
call s:HL('zshDeref', 'hcontrast', 'none', 'none')
call s:HL('zshQuoted', 'hcontrast', 'none', 'none')
call s:HL('zshPrecommand', 'hcontrast', 'none', 'none')
call s:HL('zshTypes', 'none', 'none', 'none')
call s:HL('zshSubst', 'hcontrast', 'none', 'none')
" }}}

" LaTeX {{{
call s:HL('texStatement', 'vhcontrast', 'none', 'bold')
call s:HL('texZone', 'none', 'none', 'none')
call s:HL('texBeginEndName', 'none', 'none', 'none')
call s:HL('texDefParm', 'none', 'none', 'none')
call s:HL('texMatcher', 'none', 'none', 'none')
call s:HL('texOption', 'none', 'none', 'none')
call s:HL('texMathZoneX', 'none', 'none', 'none')
call s:HL('texMathZoneA', 'none', 'none', 'none')
call s:HL('texMathZoneB', 'none', 'none', 'none')
call s:HL('texMathZoneC', 'none', 'none', 'none')
call s:HL('texMathZoneD', 'none', 'none', 'none')
call s:HL('texMathZoneE', 'none', 'none', 'none')
call s:HL('texMathZoneV', 'none', 'none', 'none')
call s:HL('texMathZoneW', 'none', 'none', 'none')
call s:HL('texMathZoneX', 'none', 'none', 'none')
call s:HL('texMath', 'none', 'none', 'none')
call s:HL('texMathMatcher', 'none', 'none', 'none')
call s:HL('texRefLabel', 'hcontrast', 'none', 'none')
call s:HL('texRefZone', 'none', 'none', 'none')
call s:HL('texSection', 'none', 'none', 'bold')
call s:HL('texSubSectionZone', 'none', 'none', 'none')
call s:HL('texInputCurlies', 'none', 'none', 'none')
call s:HL('plaintexControlSequence', 'none', 'none', 'none')
call s:HL('texDelimiter', 'none', 'none', 'none')
call s:HL('texMathZoneX', 'hcontrast', 'none', 'none')
call s:HL('texSpecialChar', 'vhcontrast', 'none', 'bold')
call s:HL('texInputfile', 'none', 'none', 'none')
call s:HL('texBoldStyle', 'none', 'none', 'none')
call s:HL('texItalStyle', 'hcontrast', 'vlcontrast', 'none')
" }}}

" Markdown {{{
call s:HL('markdownHeadingRule', 'none', 'none', 'bold')
call s:HL('markdownRule', 'none', 'none', 'bold')
call s:HL('markdownHeadingDelimiter', 'vhcontrast', 'none', 'bold')
call s:HL('markdownOrderedListMarker', 'hcontrast', 'none', 'none')
call s:HL('markdownListMarker', 'hcontrast', 'none', 'none')
call s:HL('markdownBlockQuote', 'hcontrast', 'none', 'none')
call s:HL('markdownItalic', 'hcontrast', 'none', 'none')
call s:HL('markdownBold', 'vhcontrast', 'none', 'bold')
call s:HL('markdownH1', 'vhcontrast', 'none', 'bold')
call s:HL('markdownH2', 'vhcontrast', 'none', 'bold')
call s:HL('markdownH3', 'vhcontrast', 'none', 'bold')
call s:HL('markdownH4', 'vhcontrast', 'none', 'bold')
call s:HL('markdownH5', 'vhcontrast', 'none', 'bold')
call s:HL('markdownH6', 'vhcontrast', 'none', 'bold')
call s:HL('markdownLinkText', 'vhcontrast', 'none', 'none')
call s:HL('markdownLinkTextDelimiter', 'vhcontrast', 'none', 'none')
call s:HL('markdownError', 'nred', 'none', 'underline')
call s:HL('markdownIdDeclaration', 'hcontrast')
call s:HL('markdownAutomaticLink', 'nblue', 'none', 'none')
call s:HL('markdownFootnote', 'hcontrast', 'none', 'none')
call s:HL('markdownUrl', 'hcontrast', 'none', 'underline')
call s:HL('markdownLinkDelimiter', 'hcontrast', 'none', 'none')
call s:HL('markdownUrldelimiter', 'hcontrast', 'none', 'none')
call s:HL('markdownCodeDelimiter', 'hcontrast', 'none', 'none')
call s:HL('markdownCode', 'hcontrast', 'none', 'none')
call s:HL('markdownCodeBlock', 'hcontrast', 'none', 'none')
" }}}

" Python {{{
" call s:HL('rainbowParensShell16', 'nred', 'none', 'none')
" call s:HL('rainbowParensShell15', 'none', 'none', 'none')
" call s:HL('rainbowParensShell14', 'ngreen', 'none', 'none')
" call s:HL('rainbowParensShell13', 'nyellow', 'none', 'none')
" call s:HL('rainbowParensShell12', 'nred', 'none', 'none')
" call s:HL('rainbowParensShell11', 'nmagenta', 'none', 'none')
" call s:HL('rainbowParensShell10', 'nblue', 'none', 'none')
" call s:HL('rainbowParensShell9', 'ncyan', 'none', 'none')
" }}}

" Python {{{
call s:HL('pythonBuiltin', 'hcontrast', 'none', 'none')
call s:HL('pythonBuiltinObj', 'hcontrast')
call s:HL('pythonBuiltinFunc', 'hcontrast')
call s:HL('pythonFunction', 'none', 'none', 'none')
call s:HL('pythonEscape', 'hcontrast', 'vlcontrast')
call s:HL('pythonException', 'none', 'none', 'bold')
call s:HL('pythonExceptions', 'none', 'none', 'bold')
call s:HL('pythonPrecondit', 'hcontrast', 'none', 'none')
call s:HL('pythonInclude', 'vhcontrast', 'none', 'bold')
call s:HL('pythonDecorator', 'none', 'none', 'none')
call s:HL('pythonRun', 'hcontrast', 'none', 'bold')
call s:HL('pythonCoding', 'hcontrast', 'none', 'bold')
call s:HL('pythonDocTest', 'none', 'none', 'none')
" }}}

" Ruby {{{
call s:HL('rubyComment', 'lcontrast', 'none', 'none')
call s:HL('rubyBlock', 'vhcontrast', 'none', 'bold')
call s:HL('rubyClass', 'vhcontrast', 'none', 'bold')
call s:HL('rubyModule', 'vhcontrast', 'none', 'bold')
call s:HL('rubyInclude', 'none', 'none', 'none')
call s:HL('rubyDefine', 'vhcontrast', 'none', 'bold')
call s:HL('rubyRegexp', 'hcontrast', 'vlcontrast', 'none')
call s:HL('rubyRegexpCharClass', 'hcontrast', 'vlcontrast', 'none')
call s:HL('rubyRegexpAnchor', 'hcontrast', 'vlcontrast', 'none')
call s:HL('rubyRegexpQuantifier', 'hcontrast', 'vlcontrast', 'none')
call s:HL('rubyRegexpDelimiter', 'hcontrast', 'vlcontrast', 'none')
call s:HL('rubyStringDelimiter', 'hcontrast', 'vlcontrast', 'none')
call s:HL('rubySymbol', 'none', 'none', 'none')
call s:HL('rubyPseudoVariable', 'hcontrast', 'none', 'none')
call s:HL('rubyBlockParameter', 'none', 'none', 'none')
call s:HL('rubyInstanceVariable', 'none', 'none', 'none')
call s:HL('rubyModuleDeclaration', 'hcontrast', 'none', 'none')
call s:HL('rubyFunction', 'none', 'none', 'none')
call s:HL('rubyConstant', 'none', 'none', 'none')
call s:HL('rubyAccess', 'vhcontrast', 'none', 'bold')
call s:HL('rubyAttribute', 'vhcontrast', 'none', 'bold')
" }}}

" }}}

" }}}

