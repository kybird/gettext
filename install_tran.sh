# usage
# install_tran.sh ko KR
# install translation
# example: 
# japan
# install_tran.sh ja
# china
# install_tran.sh zh

msgfmt -o locale/$1/LC_MESSAGES/test_gettext_sh.mo $1.po
    