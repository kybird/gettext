#!/usr/bin/bash
#
# set TEXTDOMAIN and TEXTDOMAINDIR as per the gettext(1) manual page
TEXTDOMAIN=test_gettext_sh
export TEXTDOMAIN
TEXTDOMAINDIR=$(pwd)/locale
export TEXTDOMAINDIR
# source gettext.sh for using eval_gettext and eval_ngettext
. gettext.sh
f="filename.dat"
# Use eval_gettext or eval_ngettext if it refers to shell variables
# TRANSLATORS: $f is replaced with a file name
#eval_gettext "\$f not found"; echo
#gettext "file not found"; echo
echo "`eval_gettext "\\\$f not found"`"
echo "`gettext "file not found"`"
