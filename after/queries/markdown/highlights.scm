; extends

; Conceal curly braces in code block delimiters
(fenced_code_block 
  (fenced_code_block_delimiter)
  (info_string) @conceal
  (#set! conceal ""))

; Highlight include command
((paragraph) @paragraph
  (#match? @paragraph "^\\{\\{\\< ")
  ) @include @nospell
