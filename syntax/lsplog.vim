syntax match lsplogError /^\[ERROR\]/
syntax match lsplogWarn /^\[WARN\]/
syntax match lsplogInfo /^\[INFO\]/
syntax match lsplogStart /^\[START\]/
syntax match lsplogTimestamp /\[\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}:\d\{2}\]/
syntax match lsplogDashLine /---\+/

syntax include @Lua syntax/lua.vim
syntax region lsplogLuaTable start=/\n{\n/ end=/\n}\n/ contains=@Lua,lsplogError,lsplogWarn,lsplogInfo,lsplogStart,lsplogTimestamp containedin=ALL

highlight default link lsplogError DiagnosticVirtualTextError
highlight default link lsplogWarn DiagnosticVirtualTextWarn
highlight default link lsplogInfo DiagnosticVirtualTextInfo
highlight default link lsplogStart DiagnosticVirtualTextHint
highlight default link lsplogTimestamp Special
highlight default link lsplogDashLine Comment
