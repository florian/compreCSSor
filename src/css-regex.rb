# define some macros needed for the tokens
macros = {
  :unicode          => /\\[0-9a-f]{1,6}(?:\r\n|[ \n\r\t\f])/,
  :nonascii         => /[^\0-\237]/,
  :num              => /(?:[0-9]+|[0-9]*\\.[0-9]+)/,
  :nl               => /(?:\n|\r\n|\r|\f)/,
  :badcomment1      => /\/\*[^\*]*\*+([^\/\*][^\*]*\*+)*/,
  :badcomment2      => /\/\*[^\*]*(\*+[^\/\*][^\*]*)*/,
  :w                => /[ \t\r\n\f]*/
}

macros[:escape]      = /(?:#{macros[:unicode].source}|\\[^\n\r\f0-9a-f])/
macros[:nmstart]     = /(?:[_a-z]|#{macros[:nonascii].source}|#{macros[:escape].source})/
macros[:nmchar]      = /(?:[_a-z0-9\-]|#{macros[:nonascii].source}|#{macros[:escape].source})/
macros[:name]        = /#{macros[:nmchar].source}+/
macros[:ident]       = /[-]?#{macros[:nmstart].source}#{macros[:nmchar].source}*/
macros[:string1]     = /"([^\n\r\f\\"]|\\#{macros[:nl].source}|#{macros[:escape].source})*"/
macros[:string2]     = /'([^\n\r\f\\']|\\#{macros[:nl].source}|#{macros[:escape].source})*'/
macros[:string]      = /(?:#{macros[:string1].source}|#{macros[:string2].source})/
macros[:badstring1]  = /"([^\n\r\f"]|\\#{macros[:nl].source}|#{macros[:escape].source})*\?/
macros[:badstring2]  = /'([^\n\r\f']|\\#{macros[:nl].source}|#{macros[:escape].source})*\?/
macros[:badstring]   = /(?:#{macros[:badstring1].source}|#{macros[:badstring2].source})/
macros[:badcomment]  = /(?:#{macros[:badcomment1].source}|#{macros[:badcomment2].source})/
macros[:baduri1]     = /url\(#{macros[:w].source}(?:[!#\$%&*-~]|#{macros[:nonascii].source}|#{macros[:escape].source})*#{macros[:w].source}/
macros[:baduri2]     = /url\(#{macros[:w].source}#{macros[:string].source}#{macros[:w].source}/
macros[:baduri3]     = /url\(#{macros[:w].source}#{macros[:badstring].source}/
macros[:baduri]      = /(?:#{macros[:baduri1].source}|#{macros[:baduri2].source}|#{macros[:baduri3].source})/

# define some tokens of an CSS file
tokens = {}
tokens[:INDENT]      = /#{macros[:ident].source}/
tokens[:ATKEYWORD]   = /@#{macros[:ident].source}/
tokens[:STRING]      = /#{macros[:string].source}/
tokens[:BAD_STRING]  = /#{macros[:badstring].source}/
tokens[:BAD_URI]     = /#{macros[:baduri].source}/
tokens[:BAD_COMMENT] = /#{macros[:badcomment].source}/
tokens[:HASH]        = /##{macros[:name].source}/
tokens[:NUMBER]      = /#{macros[:num].source}/
tokens[:PERCENTAGE]  = /#{macros[:num].source}%/
tokens[:DIMENSION]   = /#{macros[:num].source}#{macros[:ident].source}/
tokens[:URI]         = /(?:url\(#{macros[:w].source}#{macros[:string].source}#{macros[:w].source}\)|url\(#{macros[:w].source}(?:[!#\$%&*-\[\]-~]|#{macros[:nonascii].source}|#{macros[:escape].source})*#{macros[:w].source}\))/
tokens[:UNICODE]     = /u\+[0-9a-f?]{1,6}(?:-[0-9a-f]{1,6})?/
tokens[:CDO]         = /<!--/
tokens[:CDC]         = /-->/
tokens[:COLON]       = /:/
tokens[:SEMICOLON]   = /;/
tokens[:OP_CURLY]    = /\{/
tokens[:CL_CURLY]    = /\}/
tokens[:OP_BRACKETS] = /\(/
tokens[:CL_BRACKETS] = /\)/
tokens[:OP_SQUARE]   = /\[/
tokens[:CL_SQUARE]   = /\]/
tokens[:S]           = /[ \t\r\n\f]+/
tokens[:COMMENT]     = /\/\*[^\*]*\*+([^\/\*][^\*]*\*+)*\//
tokens[:FUNCTION]    = /#{macros[:ident].source}\(/
tokens[:INCLUDES]    = /~=/
tokens[:DASHMATCH]   = /\|=/

# Make the tokens global
$tokens = tokens
