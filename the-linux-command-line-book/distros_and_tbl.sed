# sed Script

# run using 'sort -k 1,1 -k 2n distros.txt | sed -f distros_and_tbl.sed | groff -t -T ascii 2>/dev/null'

# The number 1 is a sed line address.
# The i means insert, a is append, and c is replace. We are inserting text until the regex.
# The final slash is a line-continuation character.

# tbl Syntax
# .TS is table start.
# .TE is table end.
# The rest are global parameters for printing the table.
1 i\
.TS\
center box;\
cb s s\
l n c.\
Linux Distributions Report\
=\
Name	Version	Released\

# Regex replace sed syntax.
s/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\/\([0-9]\{4\}\)$/\3-\1-\2/
# Transliterate from lowercase to UPPERCASE.
#y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/
$ a\
.TE
