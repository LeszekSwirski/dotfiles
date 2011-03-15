if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

syn keyword msgStructure  message group lazy
syn keyword msgRepeat     list map

syn keyword msgType      int8 int16 int32 uint8 uint16 uint32
syn keyword msgType      float bool string byte
syn keyword msgTypedef   struct enum variant

syn match   msgInt     /-\?\<\d\+\>/

if version >= 508 || !exists("did_msg_syn_inits")
  if version < 508
    let did_msg_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink msgStructure    Structure
  HiLink msgRepeat       Repeat
  HiLink msgType         Type
  HiLink msgTypedef      Typedef
  HiLink msgBool         Boolean

  HiLink msgInt          Number

  delcommand HiLink
endif

let b:current_syntax = "msg"
