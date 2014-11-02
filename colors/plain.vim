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
let s:bwc.gray24  = ['#ffffff', 231]
let s:bwc.gray23  = ['#eeeeee', 255]
let s:bwc.gray22  = ['#e4e4e4', 254] "
let s:bwc.gray21  = ['#dadada', 253] "
let s:bwc.gray20  = ['#d0d0d0', 252]
let s:bwc.gray19  = ['#c6c6c6', 251]
let s:bwc.gray18  = ['#bcbcbc', 250]
let s:bwc.gray17  = ['#b2b2b2', 249]
let s:bwc.gray16  = ['#a8a8a8', 248] "
let s:bwc.gray15  = ['#9e9e9e', 247]
let s:bwc.gray14  = ['#949494', 246] "
let s:bwc.gray13  = ['#8a8a8a', 245]
let s:bwc.gray12  = ['#808080', 244] "
let s:bwc.gray11  = ['#767676', 243] "
let s:bwc.gray10  = ['#6c6c6c', 242]
let s:bwc.gray09  = ['#626262', 241]
let s:bwc.gray08  = ['#585858', 240] "
let s:bwc.gray07  = ['#4e4e4e', 239]
let s:bwc.gray06  = ['#444444', 238]
let s:bwc.gray05  = ['#3a3a3a', 237] "
let s:bwc.gray04  = ['#303030', 236]
let s:bwc.gray03  = ['#262626', 235]
let s:bwc.gray02  = ['#1c1c1c', 234] "
let s:bwc.gray01  = ['#121212', 233]
let s:bwc.gray00  = ['#080808', 232]
let s:bwc.grayminus1  = ['#080808', 16]

let s:bwc.nred     = ['#ff5f87', 1]  "1
let s:bwc.bred     = ['#87005f', 9]  "9
let s:bwc.ngreen   = ['#87d700', 2]  "2
let s:bwc.bgreen   = ['#008700', 10] "10
let s:bwc.nyellow  = ['#ffd757', 3]  "3
let s:bwc.byellow  = ['#ff8700', 11] "11
let s:bwc.nblue    = ['#5f87ff', 4]  "4
let s:bwc.bblue    = ['#005fd7', 12] "12
let s:bwc.nmagenta = ['#875fff', 5]  "5
let s:bwc.bmagenta = ['#5f00af', 13] "13
let s:bwc.ncyan    = ['#5fafff', 6]  "6
let s:bwc.bcyan    = ['#0087d7', 14] "14

let s:bwc.background       = ['#f2f2f2', 232]

if &background == 'dark'

    let s:bwc.lcontrast  = ['#080808', 0]
    let s:bwc.vlcontrast  = ['#080808', 8]
    let s:bwc.hcontrast  = ['#080808', 15]
    let s:bwc.vhcontrast  = ['#080808', 7]

    let s:bwc.lcontrast = s:bwc.gray11
else

    let s:bwc.lcontrast  = ['#080808', 7]
    let s:bwc.vlcontrast  = ['#080808', 15]
    let s:bwc.hcontrast  = ['#080808', 8]
    let s:bwc.vhcontrast  = ['#080808', 0]

    let s:bwc.lcontrast = s:bwc.gray11
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

" }}}

" Actual colorscheme ---------------------------------------------------------- {{{
" Vim {{{

" General/UI {{{

if has('gui_running')
    call s:HL('Normal', 'gray17', 'background', 'none')
else
    " if &background == 'dark'
    "     call s:HL('Normal', 'gray17', 'none', 'none')
    " else
    "     call s:HL('Normal', 'gray07', 'none', 'none')
    " endif
endif

call s:HL('VertSplit', 'gray14', 'gray14', 'none')

call s:HL('Folded', 'lcontrast', 'none', 'none')
call s:HL('CursorLine', 'none', 'bgreen', 'none')
call s:HL('CursorColumn', 'none', 'vlcontrast', 'none')
call s:HL('ColorColumn', 'none', 'vlcontrast', 'none')
call s:HL('Visual', 'lcontrast', 'vlcontrast', 'none')
call s:HL('VisualNOS', 'lcontrast', 'vlcontrast', 'none')

" GUI
call s:HL('TabLine', 'gray00', 'gray06', 'none')
call s:HL('TabLineFill', 'gray18', 'none', 'none')
call s:HL('TabLineSel', 'gray00', 'gray12', 'none')

call s:HL('NonText', 'vlcontrast', 'none', 'none')
call s:HL('SpecialKey', 'lcontrast', 'none', 'none')

call s:HL('Search', 'vhcontrast', 'vlcontrast', 'none')
call s:HL('IncSearch', 'vlcontrast', 'vhcontrast', 'none')
call s:HL('Underlined', 'none', 'none', 'underline')

call s:HL('Directory', 'nblue', 'none', 'none')

call s:HL('Title', 'ngreen')

call s:HL('ErrorMsg', 'nred', 'none', 'none')
call s:HL('MoreMsg', 'nyellow', 'none', 'none')
call s:HL('ModeMsg', 'ngreen', 'none', 'none')
call s:HL('Question', 'nblue', 'none', 'none')
call s:HL('WarningMsg', 'nmagenta', 'none', 'none')
call s:HL('Delimiter', 'lcontrast', 'none', 'none')

call s:HL('Tag', 'none', 'none', 'bold')

call s:HL('WildMenu', 'gray24', 'gray06', 'none')

call s:HL('StatusLine', 'gray02', 'gray17', 'none')
call s:HL('StatusLineNC', 'gray02', 'gray14', 'none')
call s:HL('User1', 'vlcontrast', 'ngreen', 'none')
call s:HL('User2', 'gray06', 'gray18', 'none')
call s:HL('User3', 'gray24', 'gray03', 'none' )
call s:HL('User4', 'gray00', 'gray18', 'bold')
call s:HL('User5', 'none', 'none', 'none')
call s:HL('User6', 'none', 'none', 'none')
call s:HL('User7', 'none', 'none', 'none')
call s:HL('User8', 'none', 'none', 'none')
call s:HL('User9', 'none', 'none', 'none')
call s:HL('User0', 'none', 'none', 'none')

" Gutter {{{
call s:HL('CursorLineNr', 'lcontrast', 'none', 'none')
call s:HL('LineNr', 'vlcontrast', 'none', 'none')
call s:HL('FoldColumn', 'lcontrast', 'none', 'none')
call s:HL('SignColumn', 'none', 'none', 'none')
" }}}

call s:HL('Pmenu', 'gray00', 'gray18', 'none')
call s:HL('PmenuSel', 'gray24', 'gray06', 'none')
call s:HL('PmenuSbar', 'none', 'gray12', 'none')
call s:HL('PmenuThumb', 'gray06', 'gray06', 'none')
 
" Cursor {{{
call s:HL('Cursor', 'gray24', 'bred', 'none')
call s:HL('vCursor', 'gray24', 'bred', 'none')
call s:HL('iCursor', 'gray24', 'bred', 'none')
" }}}

" Syntax highlighting {{{
call s:HL('Special', 'nyellow', 'none', 'none')

call s:HL('MatchParen', 'vhcontrast', 'vlcontrast', 'bold')

call s:HL('Comment', 'vlcontrast', 'none', 'none')
call s:HL('Todo', 'gray12', 'none', 'none')
call s:HL('SpecialComment', 'gray12', 'none', 'bold')

call s:HL('Statement', 'none', 'none', 'bold')
call s:HL('Keyword', 'none', 'none', 'bold')
call s:HL('Conditional', 'none', 'none', 'bold')
call s:HL('Operator', 'none', 'none', 'bold')
call s:HL('Label', 'none', 'none', 'bold')
call s:HL('Repeat', 'none', 'none', 'bold')

call s:HL('Identifier', 'none', 'none', 'none')
call s:HL('Identifier', 'none', 'none', 'none')
call s:HL('Function', 'nred', 'none', 'none')

call s:HL('PreProc', 'lcontrast', 'none', 'none')
call s:HL('Macro', 'lcontrast', 'none', 'none')
call s:HL('Define', 'lcontrast', 'none', 'none')
call s:HL('PreCondit', 'lcontrast', 'none', 'none')

call s:HL('Constant', 'lcontrast', 'none', 'none')
call s:HL('Character', 'lcontrast', 'none', 'none')
call s:HL('Boolean', 'lcontrast', 'none', 'none')

call s:HL('Number', 'lcontrast', 'none', 'none')
call s:HL('Float', 'lcontrast', 'none', 'none')

call s:HL('String', 'nmagenta', 'none', 'none')

call s:HL('SpecialChar', 'nyellow', 'none', 'none')

call s:HL('Type', 'lcontrast', 'none', 'none')
call s:HL('Typedef', 'lcontrast', 'none', 'none')
call s:HL('StorageClass', 'lcontrast', 'none', 'none')
call s:HL('Structure', 'lcontrast', 'none', 'none')

call s:HL('Exception', 'ngreen', 'none', 'bold')

call s:HL('Error', 'gray24', 'bred', 'bold')
call s:HL('Debug', 'gray24', 'none', 'bold')
call s:HL('Ignore', 'gray12', 'none', 'none')
" }}}

" Help {{{
call s:HL('helpHyperTextEntry', 'nred', 'none', 'none')
call s:HL('helpSectionDelim', 'nred', 'none', 'none')
call s:HL('helpSpecial', 'nblue', 'none', 'none')
call s:HL('helpExample', 'nmagenta', 'none', 'none')
" }}}

" Diffs {{{
call s:HL('DiffDelete', 'nred', 'bred', 'none')
call s:HL('DiffAdd', 'ngreen', 'bgreen', 'none')
call s:HL('DiffChange', 'nblue', 'bblue', 'none')
call s:HL('DiffText', 'gray23', 'nblue', 'none')

" Netrw {{{
call s:HL('netrwSymLink', 'ncyan', 'none', 'none')
call s:HL('netrwClassify', 'none', 'none', 'none')
call s:HL('netrwCmdSep', 'none', 'none', 'none')
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
call s:HL('qfFilename', 'nmagenta', 'none', 'none')
call s:HL('qfSeparator', 'none', 'none', 'none')
call s:HL('qfLineNr', 'nyellow', 'none', 'none')
" }}}

" }}}

" Plugins {{{

" CtrlP {{{
call s:HL('CtrlPMatch', 'none', 'none', 'bold')
call s:HL('CtrlPLinePre', 'gray12', 'none', 'none')
call s:HL('CtrlPPrtBase', 'gray12', 'none', 'none')
call s:HL('CtrlPPrtText', 'none', 'none', 'none')
call s:HL('CtrlPPrtCursor', 'gray24', 'gray18', 'none')
call s:HL('CtrlPNoEntries', 'gray24', 'bred', 'none')
call s:HL('CtrlPMode1', 'gray02', 'gray17', 'none')
call s:HL('CtrlPMode2', 'gray02', 'gray17', 'none')
call s:HL('CtrlPStats', 'gray02', 'gray17', 'none')
" }}}

" EasyMotion {{{
call s:HL('EasyMotionTarget', 'nblue', 'none', 'bold')
call s:HL('EasyMotionShade', 'gray12', 'none', 'none')
" }}}

" ShowMarks {{{
call s:HL('IndentGuidesOdd', 'gray12', 'none', 'none')
call s:HL('IndentGuidesEven', 'gray00', 'gray06', 'none')
" }}}

" TagBar {{{
call s:HL('TagBarScope', 'nmagenta', 'none', 'none')
call s:HL('TagBarKind', 'nred', 'none', 'none')
call s:HL('TagBarNestedKind', 'nred', 'none', 'none')
call s:HL('TagBarType', 'bmagenta', 'none', 'none')
call s:HL('TagBarFoldIcon', 'gray12', 'none', 'none')
call s:HL('TagBarVisibilityPublic', 'ngreen', 'none', 'none')
call s:HL('TagBarVisibilityProtected', 'nyellow', 'none', 'none')
call s:HL('TagBarVisibilityPrivate', 'nred', 'none', 'none')
" }}}

" }}}

" Filetype-specific {{{

" CSS {{{
call s:HL('cssVendor', 'none', 'none', 'none')
call s:HL('cssProp', 'none', 'none', 'none')
call s:HL('cssFontAttr', 'none', 'none', 'none')
call s:HL('cssAttrComma', 'none', 'none', 'none')
call s:HL('cssAttr', 'ncyan', 'none', 'none')
call s:HL('cssAttributeSelector', 'none', 'none', 'none')
call s:HL('cssInclude', 'none', 'none', 'none')
call s:HL('cssIncludeKeyword', 'none', 'none', 'none')
call s:HL('cssUnitDecorators', 'ncyan', 'none', 'none')
call s:HL('cssColor', 'ncyan', 'none', 'none')
call s:HL('cssBraces', 'none', 'none', 'none')
call s:HL('cssSelectorOp', 'none', 'none', 'none')
call s:HL('cssSelectorOp2', 'none', 'none', 'none')
call s:HL('cssIdentifier', 'nred', 'none', 'none')
call s:HL('cssClassName', 'nmagenta', 'none', 'none')
call s:HL('cssClassNameDot', 'nmagenta', 'none', 'none')
call s:HL('cssFunctionName', 'none', 'none', 'none')
call s:HL('cssFunctionComma', 'none', 'none', 'none')
call s:HL('cssTagName', 'nblue', 'none', 'none')
call s:HL('cssPseudoClassId', 'none', 'none', 'none')
call s:HL('cssPseudoClassFn', 'nblue', 'none', 'none')
call s:HL('cssImportant', 'none', 'none', 'none')
" }}}

" " Syntastic {{{
" call s:HL('SyntasticError', 'none', 'none', 'none')
" call s:HL('SyntasticWarning', 'none', 'none', 'none')
" call s:HL('SyntasticStyleError', 'none', 'none', 'none')
" call s:HL('SyntasticStyleWarning', 'none', 'none', 'none')
" " }}}

" javascript {{{
call s:HL('javaScriptIdentifier', 'none', 'none', 'bold')
call s:HL('javaScriptBoolean', 'ncyan', 'none', 'none')
call s:HL('javaScriptNumber', 'ncyan', 'none', 'none')
call s:HL('javaScriptFunction', 'none', 'none', 'bold')
call s:HL('javaScriptBraces', 'none', 'none', 'none')
call s:HL('javaScriptMember', 'ngreen', 'none', 'none')
" }}}

" Diff {{{
call s:HL('gitDiff', 'gray12', 'none',)
call s:HL('diffRemoved', 'nred', 'none',)
call s:HL('diffAdded', 'ngreen', 'none',)
call s:HL('diffFile', 'nyellow', 'none', 'none')
call s:HL('diffNewFile', 'nyellow', 'none', 'none')
call s:HL('diffLine', 'nyellow', 'none', 'none')
call s:HL('diffSubname', 'byellow', 'none', 'none')
" }}}

" HTML {{{
call s:HL('htmlTag', 'none', 'none', 'none')
call s:HL('htmlEndTag', 'none', 'none', 'none')
call s:HL('htmlTagName', 'nblue', 'none', 'none')
call s:HL('htmlTagN', 'none', 'none', 'none')
call s:HL('htmlItalic', 'none', 'none', 'none')
call s:HL('htmlBold', 'none', 'none', 'none')
call s:HL('htmlSpecialTagName', 'nblue', 'none', 'none')
call s:HL('htmlSpecialChar', 'nred', 'none', 'none')
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
" call s:HL('htmlString', 'nmagenta', 'none', 'none')
call s:HL('javaScript', 'none', 'none', 'none')
call s:HL('javaScriptMember', 'none', 'none', 'none')
" }}} 

" Java {{{
call s:HL('javaClassDecl', 'lcontrast', 'none', 'none')
call s:HL('javaScopeDecl', 'none', 'none', 'bold')
call s:HL('javaCommentTitle', 'vlcontrast', 'none', 'none')
call s:HL('javaDocTags', 'lcontrast', 'none', 'none')
call s:HL('javaDocParam', 'none', 'none', 'none')
call s:HL('javaStorageClass', 'nred', 'none', 'none')
call s:HL('javaAnnotation', 'lcontrast', 'none', 'none')
call s:HL('javaTypedef', 'lcontrast', 'none', 'none')
call s:HL('javaType', 'lcontrast', 'none', 'none')
call s:HL('javaBraces', 'none', 'none', 'none')
call s:HL('javaExternal', 'lcontrast', 'none', 'none')
call s:HL('javaSpecialChar', 'ngreen', 'none', 'none')
" }}}

" Vimscript {{{
call s:HL('VimMapModKey', 'none', 'none', 'bold')
call s:HL('VimCommand', 'none', 'none', 'bold')
call s:HL('VimFuncSID', 'none', 'none', 'none')
call s:HL('VimCommentTitle', 'gray12', 'none', 'bold')
call s:HL('VimMapMod', 'none', 'none', 'none')
call s:HL('VimNotation', 'none', 'none', 'none')
call s:HL('VimBracket', 'none', 'none', 'none')
call s:HL('VimParenSep', 'none', 'none', 'none')
call s:HL('VimOption', 'lcontrast', 'none', 'none')
call s:HL('VimFunction', 'lcontrast', 'none', 'none')
call s:HL('VimFuncName', 'lcontrast', 'none', 'none')
call s:HL('VimFuncSID', 'none', 'none', 'none')
call s:HL('vimLineComment', 'vlcontrast', 'none', 'none')
" }}}

" sh {{{
call s:HL('shDerefSimple', 'none', 'none', 'none')
call s:HL('shFunctionKey', 'none', 'none', 'bold')
call s:HL('shFunction', 'nmagenta', 'none', 'none')
call s:HL('shCommandSub', 'none', 'none', 'none')
call s:HL('shCmdSubRegion', 'ngreen', 'none', 'none')
call s:HL('shSpecial', 'none', 'none', 'none')
call s:HL('shDeref', 'none', 'none', 'none')
" }}}

" zsh {{{
call s:HL('zshDeref', 'lcontrast', 'none', 'none')
call s:HL('zshQuoted', 'ngreen', 'none', 'none')
" call s:HL('zshCommands', 'lcontrast', 'none', 'none')
call s:HL('zshPrecommand', 'lcontrast', 'none', 'none')
call s:HL('zshTypes', 'none', 'none', 'none')
call s:HL('zshSubst', 'lcontrast', 'none', 'none')
" }}}

" LaTeX {{{
call s:HL('texStatement', 'none', 'none', 'bold')
call s:HL('texZone', 'none', 'none', 'none')
call s:HL('texMathZoneX', 'byellow', 'none', 'none')
call s:HL('texMathZoneA', 'byellow', 'none', 'none')
call s:HL('texMathZoneB', 'byellow', 'none', 'none')
call s:HL('texMathZoneC', 'byellow', 'none', 'none')
call s:HL('texMathZoneD', 'byellow', 'none', 'none')
call s:HL('texMathZoneE', 'byellow', 'none', 'none')
call s:HL('texMathZoneV', 'byellow', 'none', 'none')
call s:HL('texMathZoneX', 'byellow', 'none', 'none')
call s:HL('texMath', 'byellow', 'none', 'none')
call s:HL('texMathMatcher', 'byellow', 'none', 'none')
call s:HL('texRefLabel', 'byellow', 'none', 'none')
call s:HL('texRefZone', 'ngreen', 'none', 'none')
call s:HL('texSection', 'nred', 'none', 'none')
call s:HL('texComment', 'gray12', 'none', 'none')
call s:HL('plaintexControlSequence', 'gray12', 'none', 'none')
call s:HL('texDelimiter', 'nblue', 'none', 'none')
call s:HL('texMathZoneX', 'lcontrast', 'none', 'none')
call s:HL('texSpecialChar', 'ngreen', 'none', 'none')
augroup trafficlights_tex
    au!
    au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
    au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END
" }}}

" Markdown {{{
call s:HL('markdownHeadingRule', 'none', 'none', 'bold')
call s:HL('markdownRule', 'none', 'none', 'bold')
call s:HL('markdownHeadingDelimiter', 'none', 'none', 'bold')
call s:HL('markdownOrderedListMarker', 'none', 'none', 'bold')
call s:HL('markdownListMarker', 'none', 'none', 'bold')
call s:HL('markdownBlockQuote', 'none', 'none', 'bold')
call s:HL('markdownItalic', 'nyellow', 'none', 'none')
call s:HL('markdownBold', 'nyellow', 'none', 'none')
call s:HL('markdownH1', 'none', 'none', 'bold')
call s:HL('markdownH2', 'none', 'none', 'bold')
call s:HL('markdownH3', 'none', 'none', 'bold')
call s:HL('markdownH4', 'none', 'none', 'bold')
call s:HL('markdownH5', 'none', 'none', 'bold')
call s:HL('markdownH6', 'none', 'none', 'bold')
call s:HL('markdownLinkText', 'ncyan', 'none', 'none')
call s:HL('markdownIdDeclaration', 'nmagenta')
call s:HL('markdownAutomaticLink', 'nblue', 'none', 'none')
call s:HL('markdownUrl', 'nblue', 'none', 'none')
call s:HL('markdownUrldelimiter', 'gray12', 'none', 'none')
call s:HL('markdownLinkTextDelimiter', 'gray12', 'none', 'none')
call s:HL('markdownCodeDelimiter', 'nmagenta', 'none', 'none')
call s:HL('markdownCode', 'nmagenta', 'none', 'none')
call s:HL('markdownCodeBlock', 'nmagenta', 'none', 'none')
" }}}

" Python {{{
call s:HL('pythonBuiltin', 'lcontrast')
call s:HL('pythonBuiltinObj', 'nblue')
call s:HL('pythonBuiltinFunc', 'nblue')
call s:HL('pythonFunction', 'lcontrast')
call s:HL('pythonEscape', 'nblue')
call s:HL('pythonException', 'ngreen', 'none', 'none')
call s:HL('pythonExceptions', 'ngreen', 'none', 'none')
call s:HL('pythonPrecondit', 'ngreen', 'none', 'none')
call s:HL('pythonInclude', 'none', 'none', 'bold')
" call s:HL('pythonString', 'nmagenta', 'none', 'none')
call s:HL('pythonDecorator', 'ngreen', 'none', 'none')
call s:HL('pythonRun', 'gray12', 'none', 'bold')
" call s:HL('pythonRepeat', 'gray18', 'none', 'bold')
call s:HL('pythonCoding', 'gray12', 'none', 'bold')
" }}}

" Ruby {{{
call s:HL('rubyComment', 'vlcontrast', 'none', 'none')
call s:HL('rubyBlock', 'none', 'none', 'bold')
call s:HL('rubyClass', 'none', 'none', 'bold')
call s:HL('rubyModule', 'none', 'none', 'bold')
call s:HL('rubyInclude', 'none', 'none', 'none')
call s:HL('rubyDefine', 'none', 'none', 'bold')
call s:HL('rubyRegexp', 'ngreen', 'none', 'none')
call s:HL('rubyRegexpCharClass', 'ngreen', 'none', 'none')
call s:HL('rubyRegexpAnchor', 'ngreen', 'none', 'none')
call s:HL('rubyRegexpQuantifier', 'ngreen', 'none', 'none')
call s:HL('rubyRegexpDelimiter', 'ngreen', 'none', 'none')
call s:HL('rubyStringDelimiter', 'ngreen', 'none', 'none')
" call s:HL('rubyString', 'ngreen', 'none', 'none')
call s:HL('rubySymbol', 'none', 'none', 'none')
call s:HL('rubyTodo', 'lcontrast', 'vlcontrast', 'bold')
call s:HL('rubyPseudoVariable', 'lcontrast', 'none', 'none')
call s:HL('rubyBlockParameter', 'none', 'none', 'none')
call s:HL('rubyInstanceVariable', 'none', 'none', 'none')
call s:HL('rubyModuleDeclaration', 'lcontrast', 'none', 'none')
call s:HL('rubyFunction', 'lcontrast', 'none', 'none')
call s:HL('rubyConstant', 'lcontrast', 'none', 'none')
call s:HL('rubyAccess', 'none', 'none', 'bold')
call s:HL('rubyAttribute', 'none', 'none', 'bold')
" }}}

" Clojure {{{
call s:HL('clojureSpecial', 'nred', 'none', 'none')
call s:HL('clojureDefn', 'nred', 'none', 'none')
call s:HL('clojureDefMacro', 'nred', 'none', 'none')
call s:HL('clojureDefine', 'nred', 'none', 'none')
call s:HL('clojureMacro', 'nred', 'none', 'none')
call s:HL('clojureCond', 'nred', 'none', 'none')
call s:HL('clojureKeyword', 'byellow', 'none', 'none')
call s:HL('clojureFunc', 'bmagenta', 'none', 'none')
call s:HL('clojureRepeat', 'bmagenta', 'none', 'none')
call s:HL('clojureParen0', 'gray12', 'none', 'none')
call s:HL('clojureAnonArg', 'none', 'none', 'none')
" }}}

" Django Templates {{{
call s:HL('djangoArgument', 'byellow', 'none', 'none')
call s:HL('djangoTagBlock', 'byellow', 'none', 'none')
call s:HL('djangoVarBlock', 'byellow', 'none', 'none')
" }}}

" LessCSS {{{
call s:HL('lessVariable', 'ngreen', 'none', 'none')
" }}}

" }}}

" }}}

