" Remove the keywords. We'll re-add them below. Use silent in case the group
" doesn't exist.
" silent! syntax clear rubyOperator

" XXX least specific cases at the top, since the match rules seem to be
" cumulative.

syntax keyword Repeat while conceal cchar=⥁
syntax keyword Repeat for conceal cchar=∀
syntax match rubyStatement '\v<in>' conceal cchar=∈

syntax match rubyOperator '\s\*\s'ms=s+1,me=e-1 conceal cchar=∙

syntax match rubyOperator '<=' conceal cchar=≤
syntax match rubyOperator '>=' conceal cchar=≥
syntax match rubyOperator '\v[^-=+*/]\zs\=\ze[^=]' conceal cchar=←
syntax match rubyOperator "=>" conceal cchar=⇒
syntax match rubyOperator '\v\=@<!\=\=\=@!' conceal cchar=≝
syntax match rubyOperator '!=' conceal cchar=≠
syntax match rubyOperator '===' conceal cchar=⇿

syntax match rubyOperator '->' conceal cchar=→
syntax keyword rubyKeyword lambda LAMBDA lambda_ _lambda conceal cchar=λ

syntax keyword rubyConstant nil conceal cchar=∅
syntax keyword Boolean true conceal cchar=✔
syntax keyword Boolean false conceal cchar=✗

" http://www.fileformat.info/info/unicode/block/geometric_shapes/images.htm
syntax keyword rubyKeyword break conceal cchar=◁
syntax keyword rubyKeyword next conceal cchar=↻
syntax keyword rubyKeyword return conceal cchar=↩

" syntax match Normal '\v^(\s*)if' conceal cchar=▸
syntax keyword Conditional if conceal cchar=▸
syntax keyword Conditional then conceal cchar=↦
syntax keyword Conditional elsif conceal cchar=▹
syntax keyword Conditional else conceal cchar=▪
syntax keyword Conditional end


call matchadd('Conceal', '\<def\>', 10, -1, { 'conceal': '※' })
syntax match rubyIdentifier '\v<self>' conceal cchar=⚕
syntax match rubyIdentifier '\v<self>\.' conceal cchar=“


" XXX These have to be after all the float{16,32} stuff to avoid accidental
" capture. Use @! to ensure that type casts are not concealed, since that's
" hard to read._
"
" [^\s)] is to avoid the edge case of (x: int) where the right paren would
" override the int conceal.
syntax match rubyType '\v<integer(\(|[^\s)\],:])@!' conceal cchar=ℤ
syntax match rubyType '\v<float(\(|[^\s)\],:])@!' conceal cchar=ℝ
syntax match rubyType '\v<complex(\(|[^\s)\],:])@!' conceal cchar=ℂ
syntax match rubyType '\v<string(\(|[^\s)\],:])@!' conceal cchar=𝐒
syntax match rubyType '\v<boolean(\(|[^\s)\],:])@!' conceal cchar=𝔹

highlight! link Conceal Identifier
