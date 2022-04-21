# zh_CN.UTF-8 china
# ja_JP.UTF-8 japan
# ko_KR.UTF-8 korea
# en_US.UTF-8 America
LANGUAGE=ko_KR.UTF8
export LANGUAGE

# how to return oridinal
#unset LANGUAGE
#export LANGUAGE

bash test_gettext.sh

LANGUAGE=en_US.UTF8
export LANGUAGE

bash test_gettext.sh
