# sed Script

# run using 'sort -k 1,1 -k 2n distros.txt | sed -f distros-nl.sed | nl'

# The number 1 is a sed line address.
# The i means insert, a is append, and c is replace. We are inserting text until the regex.
# The final slash is a line-continuation character.

# nl Syntax
# Logical page header starts at	\:\:\:
# Logical page body starts at		\:\:
# Logical page footer starts at	\:
# Had to escape the \ for sed.
1 i\
\\:\\:\\:\
\
Linux Distributions Report\
\
Name	Ver.	Released\
----	----	--------\
\\:\\:
# Regex replace sed syntax.
s/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\/\([0-9]\{4\}\)$/\3-\1-\2/
# Transliterate from lowercase to UPPERCASE.
#y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/
$ a\
\\:\
\
End Of Report
