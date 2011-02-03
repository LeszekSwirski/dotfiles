" Vimball Archiver by Charles E. Campbell, Jr., Ph.D.
UseVimball
finish
plugin/RainbowPlugin.vim	[[[1
28
" RainbowPlugin.vim
"   Author: Charles E. Campbell, Jr.
"   Date:   Oct 28, 2009
"   Version: 2n	ASTRO-ONLY
" ---------------------------------------------------------------------
"  Load Once: {{{1
if &cp || exists("g:loaded_Rainbow")
 finish
endif
let g:loaded_Rainbow= "v2g"
let s:keepcpo       = &cpo
set cpo&vim

" ---------------------------------------------------------------------
"  Public Interface: {{{1
com! -nargs=? -bang Rainbow	call Rainbow#Rainbow(<bang>1,<q-args>)

" ---------------------------------------------------------------------
" Default: {{{1
if !exists("g:hlrainbow")
 let g:hlrainbow= "{("
endif

" ---------------------------------------------------------------------
"  Restore: {{{1
let &cpo= s:keepcpo
unlet s:keepcpo
" vim: ts=4 fdm=marker
autoload/Rainbow.vim	[[[1
59
" Rainbow.vim
"   Author: Charles E. Campbell, Jr.
"   Date:   Nov 18, 2009
"   Version: 2n	ASTRO-ONLY
" ---------------------------------------------------------------------
"  Load Once: {{{1
if &cp || !exists("g:loaded_Rainbow")
 finish
endif
let g:loaded_Rainbow = "v2n"
let s:keepcpo        = &cpo
set cpo&vim

" ---------------------------------------------------------------------
" Rainbow#Rainbow: enable/disable rainbow highlighting for C/C++ {{{2
fun! Rainbow#Rainbow(enable,hlrainbow)
  if !exists("s:rainbowlevel")
   let s:rainbowlevel= 1
  else
   let s:rainbowlevel= s:rainbowlevel + 1
  endif

"  call Dfunc("Rainbow#Rainbow(enable=".a:enable." hlrainbow<".a:hlrainbow.">) rainbowlevel=".s:rainbowlevel)

  if s:rainbowlevel > 1
   let s:rainbowlevel= s:rainbowlevel - 1
"   call Dret("Rainbow#Rainbow : preventing Rainbow nesting")
   return
  endif

  " set filetype to clear out rainbow highlighting; remove any commands in the AuRainbowColor autocmd group
  augroup AugroupRainbow
   au!
  augroup END
  silent! augroup! AugroupRainbow
  exe "set ft=".&ft

  " set global g:hlrainbow to the new user's selection (if any)
  if a:hlrainbow != ""
   let g:hlrainbow= a:hlrainbow
  endif

  if a:enable
"  call Decho("sourcing rainbow.vvim")
   augroup AugroupRainbow
	au BufNewFile,BufReadPost *.c,*.cpp,*.cxx,*.c++,*.C,*.h,*.hpp,*.hxx,*.h++,*.H	Rainbow
	augroup END
   exe "so ".fnameescape(substitute(&rtp,',.*$','',''))."/after/syntax/c/rainbow.vvim"
  endif

  let s:rainbowlevel= s:rainbowlevel - 1
"  call Dret("Rainbow#Rainbow")
endfun

" ---------------------------------------------------------------------
"  Restore: {{{1
let &cpo= s:keepcpo
unlet s:keepcpo
" vim: ts=4 fdm=marker
after/syntax/c/rainbow.vvim	[[[1
181
" rainbow.vvim : provides "rainbow-colored" curly braces and parentheses
"               C/C++ language version
"   Author: 	Charles E. Campbell, Jr.
"   Date:		Nov 01, 2009
"   Associated Files:  plugin/RainbowPlugin.vim autoload/Rainbow.vim doc/Rainbow.txt
" ---------------------------------------------------------------------
" non-compatible only: {{{1
if &cp
 finish
endif
let keepcpo= &cpo
let s:work = ''
set cpo&vim

" ---------------------------------------------------------------------
" Default Settings: {{{1
if !exists("g:hlrainbow")
 let g:hlrainbow= '{}()'
endif
"call Decho("g:hlrainbow<".g:hlrainbow.">")

syn clear cParen cCppParen cBracket cCppBracket cBlock cParenError

" Clusters {{{1
syn cluster cParenGroup		contains=cBlock,cCharacter,cComment,cCommentError,cCommentL,cConditional,cConstant,cDefine,cInclude,cLabel,cMulti,cNumbers,cOperator,cPreProc,cRepeat,cSpaceError,cSpecialCharacter,cSpecialError,cStatement,cStorageClass,cString,cStructure,cType
syn cluster cCppParenGroup	contains=cBlock,cCharacter,cComment,cCommentError,cCommentL,cConditional,cConstant,cCppBracket,cCppString,cDefine,cInclude,cLabel,cMulti,cNumbers,cOperator,cPreProc,cRepeat,cSpaceError,cSpecialCharacter,cSpecialError,cStatement,cStorageClass,cStructure,cType
syn cluster cCurlyGroup		contains=cConditional,cConstant,cLabel,cOperator,cRepeat,cStatement,cStorageClass,cStructure,cType,cBitField,cCharacter,cCommentError,cInclude,cNumbers,cPreCondit,cSpaceError,cSpecialCharacter,cSpecialError,cUserCont,cBlock,cComment,cCommentL,cCppOut,cCppString,cDefine,cMulti,cPreCondit,cPreProc,cString,cFoldSpec
if &ft == "cpp"
 syn cluster cCurlyGroup add=cppStatement,cppAccess,cppType,cppExceptions,cppOperator,cppCast,cppStorageClass,cppStructure,cppNumber,cppBoolean,cppMinMax
endif

" Error Syntax {{{1
syn clear cErrInBracket
syn match	cErrInBracket	display contained "[{}]\|<%\|%>"
syn match	cParenError		display ')'
syn match	cBracketError	display ']'
if &ft == "cpp"
 syn cluster cCppBracketGroup	add=cParenError,cErrInBracket,cCurly,cCppParen,cCppBracket
 syn cluster cCppParenGroup		add=cBracketError,cErrInBracket,cCurly,cCppParen,cCppBracket
 syn cluster cBracketGroup		add=cParenError,cErrInBracket,cCurly,cCppParen,cCppBracket
 syn cluster cParenGroup		add=cBracketError,cErrInBracket,cCurly,cCppParen,cCppBracket
 syn cluster cCurlyGroup		add=cParenError,cBracketError,cCurly,cCppParen,cCppBracket
else
 syn cluster cBracketGroup		add=cParenError,cErrInBracket,cCurly,cParen,cBracket
 syn cluster cParenGroup		add=cBracketError,cErrInBracket,cCurly,cParen,cBracket
 syn cluster cCurlyGroup		add=cParenError,cBracketError,cCurly,cParen,cBracket
endif

" ---------------------------------------------------------------------
" supports {} highlighting, too many } error detection, and {{{1
" function folding (when fdm=syntax)
if g:hlrainbow =~ '[{}]'

" call Decho("enabling {} rainbow")
 syn match  cCurlyError	display '}'
 syn region cCurly  fold matchgroup=hlLevel0 start='{' end='}' 			 contains=@cCurlyGroup,cCurly1
 syn region cCurly1		 matchgroup=hlLevel1 start='{' end='}' contained contains=@cCurlyGroup,cCurly2
 syn region cCurly2		 matchgroup=hlLevel2 start='{' end='}' contained contains=@cCurlyGroup,cCurly3
 syn region cCurly3		 matchgroup=hlLevel3 start='{' end='}' contained contains=@cCurlyGroup,cCurly4
 syn region cCurly4		 matchgroup=hlLevel4 start='{' end='}' contained contains=@cCurlyGroup,cCurly5
 syn region cCurly5		 matchgroup=hlLevel5 start='{' end='}' contained contains=@cCurlyGroup,cCurly6
 syn region cCurly6		 matchgroup=hlLevel6 start='{' end='}' contained contains=@cCurlyGroup,cCurly7
 syn region cCurly7		 matchgroup=hlLevel7 start='{' end='}' contained contains=@cCurlyGroup,cCurly8
 syn region cCurly8		 matchgroup=hlLevel8 start='{' end='}' contained contains=@cCurlyGroup,cCurly9
 syn region cCurly9		 matchgroup=hlLevel9 start='{' end='}' contained contains=@cCurlyGroup,cCurly
else
 syn region cCurly	fold start='{' end='}'	contains=@cCurlyGroup
endif

" ---------------------------------------------------------------------
" supports () highlighting and error detection {{{1
if g:hlrainbow =~ '[()]'

 if &ft == "cpp"
"  call Decho("enabling () rainbow for C++")
  syn region	cCppParen	transparent matchgroup=hlLevel0	start='(' end=')' 			contains=@cCppParenGroup,cCppParen1 
  syn region	cCppParen1	transparent matchgroup=hlLevel1	start='(' end=')' contained contains=@cCppParenGroup,cCppParen2 
  syn region	cCppParen2	transparent matchgroup=hlLevel2	start='(' end=')' contained contains=@cCppParenGroup,cCppParen3 
  syn region	cCppParen3	transparent matchgroup=hlLevel3	start='(' end=')' contained contains=@cCppParenGroup,cCppParen4 
  syn region	cCppParen4	transparent matchgroup=hlLevel4	start='(' end=')' contained contains=@cCppParenGroup,cCppParen5 
  syn region	cCppParen5	transparent matchgroup=hlLevel5	start='(' end=')' contained contains=@cCppParenGroup,cCppParen6 
  syn region	cCppParen6	transparent matchgroup=hlLevel6	start='(' end=')' contained contains=@cCppParenGroup,cCppParen7 
  syn region	cCppParen7	transparent matchgroup=hlLevel7	start='(' end=')' contained contains=@cCppParenGroup,cCppParen8 
  syn region	cCppParen8	transparent matchgroup=hlLevel8	start='(' end=')' contained contains=@cCppParenGroup,cCppParen9 
  syn region	cCppParen9	transparent matchgroup=hlLevel9	start='(' end=')' contained contains=@cCppParenGroup,cCppParen
 else
"  call Decho("enabling () rainbow for C")
  syn region	cParen		transparent matchgroup=hlLevel0	start='(' end=')' 			contains=@cParenGroup,cParen1
  syn region	cParen1		transparent matchgroup=hlLevel1	start='(' end=')' contained contains=@cParenGroup,cParen2
  syn region	cParen2		transparent matchgroup=hlLevel2	start='(' end=')' contained contains=@cParenGroup,cParen3
  syn region	cParen3		transparent matchgroup=hlLevel3	start='(' end=')' contained contains=@cParenGroup,cParen4
  syn region	cParen4		transparent matchgroup=hlLevel4	start='(' end=')' contained contains=@cParenGroup,cParen5
  syn region	cParen5		transparent matchgroup=hlLevel5	start='(' end=')' contained contains=@cParenGroup,cParen6
  syn region	cParen6		transparent matchgroup=hlLevel6	start='(' end=')' contained contains=@cParenGroup,cParen7
  syn region	cParen7		transparent matchgroup=hlLevel7	start='(' end=')' contained contains=@cParenGroup,cParen8
  syn region	cParen8		transparent matchgroup=hlLevel8	start='(' end=')' contained contains=@cParenGroup,cParen9
  syn region	cParen9		transparent matchgroup=hlLevel9	start='(' end=')' contained contains=@cParenGroup,cParen
 endif
else
 if &ft == "cpp"
  syn region	cCppParen	start='(' end=')' contains=@cParenGroup
 else
  syn region	cParen		start='(' end=')' contains=@cParenGroup
 endif
endif

" ---------------------------------------------------------------------
" supports [] highlighting and error detection {{{1
if g:hlrainbow =~ '[[\]]'
 syn clear   cBracket cCppBracket
 syn cluster cBracketGroup		contains=cBlock,cBracket,cCharacter,cComment,cCommentError,cCommentL,cConditional,cConstant,cDefine,cInclude,cLabel,cMulti,cNumbers,cOperator,cPreProc,cRepeat,cSpaceError,cSpecialCharacter,cSpecialError,cStatement,cStorageClass,cString,cStructure,cType

 if &ft == "cpp"
"  call Decho("enabling [] rainbow for C++")
  syn cluster cCppBracketGroup	contains=cBlock,cCharacter,cComment,cCommentError,cCommentL,cConditional,cConstant,cCppBracket,cCppParen,cCppString,cDefine,cInclude,cLabel,cMulti,cNumbers,cOperator,cPreProc,cRepeat,cSpaceError,cSpecialCharacter,cSpecialError,cStatement,cStorageClass,cStructure,cType
  syn region cCppBracket  fold	matchgroup=hlLevel0 start='\[' end=']' 			 contains=@cCppBracketGroup,cCppBracket1
  syn region cCppBracket1		matchgroup=hlLevel1 start='\[' end=']' contained contains=@cCppBracketGroup,cCppBracket2
  syn region cCppBracket2		matchgroup=hlLevel2 start='\[' end=']' contained contains=@cCppBracketGroup,cCppBracket3
  syn region cCppBracket3		matchgroup=hlLevel3 start='\[' end=']' contained contains=@cCppBracketGroup,cCppBracket4
  syn region cCppBracket4		matchgroup=hlLevel4 start='\[' end=']' contained contains=@cCppBracketGroup,cCppBracket5
  syn region cCppBracket5		matchgroup=hlLevel5 start='\[' end=']' contained contains=@cCppBracketGroup,cCppBracket6
  syn region cCppBracket6		matchgroup=hlLevel6 start='\[' end=']' contained contains=@cCppBracketGroup,cCppBracket7
  syn region cCppBracket7		matchgroup=hlLevel7 start='\[' end=']' contained contains=@cCppBracketGroup,cCppBracket8
  syn region cCppBracket8		matchgroup=hlLevel8 start='\[' end=']' contained contains=@cCppBracketGroup,cCppBracket9
  syn region cCppBracket9		matchgroup=hlLevel9 start='\[' end=']' contained contains=@cCppBracketGroup,cCppBracket
 else
"  call Decho("enabling [] rainbow for C")
  syn region cBracket  fold	matchgroup=hlLevel0 start='\[' end=']' 			 contains=@cBracketGroup,cBracket1
  syn region cBracket1		matchgroup=hlLevel1 start='\[' end=']' contained contains=@cBracketGroup,cBracket2
  syn region cBracket2		matchgroup=hlLevel2 start='\[' end=']' contained contains=@cBracketGroup,cBracket3
  syn region cBracket3		matchgroup=hlLevel3 start='\[' end=']' contained contains=@cBracketGroup,cBracket4
  syn region cBracket4		matchgroup=hlLevel4 start='\[' end=']' contained contains=@cBracketGroup,cBracket5
  syn region cBracket5		matchgroup=hlLevel5 start='\[' end=']' contained contains=@cBracketGroup,cBracket6
  syn region cBracket6		matchgroup=hlLevel6 start='\[' end=']' contained contains=@cBracketGroup,cBracket7
  syn region cBracket7		matchgroup=hlLevel7 start='\[' end=']' contained contains=@cBracketGroup,cBracket8
  syn region cBracket8		matchgroup=hlLevel8 start='\[' end=']' contained contains=@cBracketGroup,cBracket9
  syn region cBracket9		matchgroup=hlLevel9 start='\[' end=']' contained contains=@cBracketGroup,cBracket
 endif
else
 if &ft == "cpp"
  syn region	cCppBracket	start='\[' end=']' contains=@cCppBracketGroup
 else
  syn region	cBracket	start='\[' end=']' contains=@cBracketGroup
 endif
endif

" don't use {{{# patterns in curly brace matching
syn match cFoldSpec	'{{{\d\+'
syn match cFoldSpec	'}}}\d\+'

" highlighting: {{{1
hi link cCurlyError		cError
hi link cBracketError	cError
if &bg == "dark"
 hi default   hlLevel0 ctermfg=red         guifg=red1
 hi default   hlLevel1 ctermfg=yellow      guifg=orange1      
 hi default   hlLevel2 ctermfg=green       guifg=yellow1      
 hi default   hlLevel3 ctermfg=cyan        guifg=gold
 hi default   hlLevel4 ctermfg=magenta     guifg=hotpink
 hi default   hlLevel5 ctermfg=red         guifg=PeachPuff1
 hi default   hlLevel6 ctermfg=yellow      guifg=cyan1        
 hi default   hlLevel7 ctermfg=green       guifg=slateblue1   
 hi default   hlLevel8 ctermfg=cyan        guifg=magenta1     
 hi default   hlLevel9 ctermfg=magenta     guifg=purple1
else
 hi default   hlLevel0 ctermfg=red         guifg=red3
 hi default   hlLevel1 ctermfg=darkyellow  guifg=orangered3
 hi default   hlLevel2 ctermfg=darkgreen   guifg=orange2
 hi default   hlLevel3 ctermfg=blue        guifg=yellow3
 hi default   hlLevel4 ctermfg=darkmagenta guifg=olivedrab4
 hi default   hlLevel5 ctermfg=red         guifg=green4
 hi default   hlLevel6 ctermfg=darkyellow  guifg=paleturquoise3
 hi default   hlLevel7 ctermfg=darkgreen   guifg=deepskyblue4
 hi default   hlLevel8 ctermfg=blue        guifg=darkslateblue
 hi default   hlLevel9 ctermfg=darkmagenta guifg=darkviolet
endif

" ---------------------------------------------------------------------
"  Modelines: {{{1
let &cpo= keepcpo
" vim: fdm=marker ft=vim ts=4
doc/Rainbow.txt	[[[1
80
*rainbow.txt*	The Rainbow Tool			Nov 01, 2009

Author:    Charles E. Campbell, Jr.  <NdrOchip@ScampbellPfamily.AbizM>
           (remove NOSPAM from Campbell's email first)
Copyright: (c) 2004-2009 by Charles E. Campbell, Jr.	*Rainbow-copyright*
           The VIM LICENSE applies to Rainbow.vim, RainbowPlugin.vim, and
	   Rainbow.txt (see |copyright|) except use "Rainbow" instead of
	   "Vim".
	   NO WARRANTY, EXPRESS OR IMPLIED.  USE AT-YOUR-OWN-RISK.

==============================================================================
1. Contents					*rainbow* *rainbow-contents* {{{1

	1. Contents.....................................: |rainbow-contents|
	2. Usage........................................: |rainbow-usage|
	3. History......................................: |rainbow-history|

==============================================================================
2. Usage						*rainbow-usage*   {{{1

INSTALL
	vim rainbow.vba.gz
	:so %
	:q

MANUAL							*:Rainbow*
	:Rainbow~
	This command will enable rainbow highlighting for C and C++.
	One may also pass the desired set of delimiters to be
	rainbow'd via this command: >
		:Rainbow {[(
		:Rainbow {(
		:Rainbow {[
		:Rainbow [(
		:Rainbow {
		:Rainbow [
		:Rainbow (
<
	These forms of the :Rainbow command alter the g:hlrainbow
	variable value.

							*:Rainbow!*
	:Rainbow!~
	This command will disable rainbow highlighting for C and C++.

	This plugin provides a "rainbow" of colors for matching brackets
	( [] () {} ) depending upon their nesting level; it is intended to
	provide support the C and C++ languages.

							*g:hlrainbow*
	g:hlrainbow~
	This global variable holds characters such as "(){}[]"; by default
	it holds "{(".  It enables rainbow highlighting as follows:
	  "(" or ")":  ( and ) rainbow highlighting
	  "{" or "}":  { and } rainbow highlighting
	  "[" or "]":  [ and ] rainbow highlighting


==============================================================================
3. History						*rainbow-history* {{{1

 v2	Oct 20, 2009	* supports Rainbow command to turn rainbow
			  highlighting on/off.
			* (Greg Klein) pointed out that "contained" seemed to
			  be missing from the cParenXX definitions.
			* I've commented out the cCppParen definitions,
			  letting cParenXX work.  I noticed a problem with
			  these: (the following closing parenthesis got
			  highlighted as an error)
			    int f(int x,
			          int y)
			  and I'm afraid I don't remember why there was
			  a separate set of definitions for C++.  If anyone
			  sees a problem -- please give me an example (short
			  is good)
	Nov 01, 2009	* :Rainbow {[( and variants supported.

==============================================================================
Modelines: {{{1
vim:tw=78:ts=8:ft=help:fdm=marker:
