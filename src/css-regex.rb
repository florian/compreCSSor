macros = {
  :unicode => /\\\\[0-9a-f]{1,6}(?:\\r\\n|[ \\n\\r\\t\\f])/,
  :nonascii => /[^\\0-\\237]/,
  :num => /(?:[0-9]+|[0-9]*\\.[0-9]+)/,
  :nl => /(?:\n|\r\n|\r|\f)/,
  :badcomment => /\\/\\*[^*]*\\*+([^/*][^*]*\\*+)*/,
  :badcomment_2 => /\\/\\*[^*]*(\\*+[^/*][^*]*)*/,
  :w => /[ \t\r\n\f]*/,
  
}

macros[:escape]      = /(?:#{macros[:unicode]}|\\\\[^\\n\\r\\f0-9a-f])/
macros[:nmstart]     = /(?:[_a-z]|#{macros[:nonascii]}|#{macros[:escape]})/
macros[:nmchar]      = /(?:[_a-z0-9\\-]|#{macros[:nonascii]}|#{macros[:escape]}/
macros[:ident]       = /[-]?#{macros["nmstart"]}#{macros["nmchar"]}*/
macros[:string1]     = /\\\"([^\n\r\f\\\"]|\\#{matches[:nl]}|#{matches[:escape]})*\\\"/
macros[:string2]     = /\\'([^\n\r\f\\']|\\#{matches[:nl]}|#{matches[:escape]})*\\'/
macros[:string]      = /(?:#{matches[:string1]}|#{matches[:string2]})/
macros[:badstring1]  = /\\\"([^\n\r\f\\\"]|\\#{matches[:nl]}|#{matches[:escape]})*\\?/
macros[:badstring2]  = /\\'([^\n\r\f\\']|\\#{matches[:nl]}|#{matches[:escape]})*\\?/
macros[:badstring]   = /(?:#{matches[:badstring1]}|#{matches[:badstring2]})/
macros[:badcomment]  = /(?:#{matches[:badcomment1]}|#{matches[:badcomment2]})/
macros[:baduri1]     = /url\\(#{matches[:w]}(?:[!#\$%&*-~]|#{matches[:nonascii]}|#{matches[:escape]})*#{matches[:w]}/
macros[:baduri2]     = /url\\(#{matches[:w]}#{matches[:string]}#{matches[:w]}/
macros[:baduri3]     = /url\\(#{matches[:w]}#{matches[:badstring]}/
macros[:baduri]      = /(?:#{matches[:baduri1]}|#{matches[:baduri2]}|#{matches[:baduri3]})/
