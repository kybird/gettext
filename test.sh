# zh_CN.UTF-8 china
# ja_JP.UTF-8 japan
# ko_KR.UTF-8 korea
# en_US.UTF-8 America
echo "한국어"
LANGUAGE=ko_KR.UTF8
export LANGUAGE

# how to return oridinal
#unset LANGUAGE
#export LANGUAGE

bash test_gettext.sh

echo "영어"
LANGUAGE=en_US.UTF8
export LANGUAGE

bash test_gettext.sh


echo "일본어"
LANGUAGE=ja_JP.UTF8
export LANGUAGE

bash test_gettext.sh

echo "중국어"
LANGUAGE=zh_CN.UTF8
export LANGUAGE

bash test_gettext.sh