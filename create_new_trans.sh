#this is refernce, modify locale for using
# usage
# create_new_trans.sh ko KR
# will make locale ko_KR.UTF8 and ko
# example: 
# japan
# create_new_trans.sh ja JP
# china
# create_new_trans.sh zh CN
msginit --no-translator --locale=$1_$2.UTF-8 --input=messages.po
mkdir -p locale/$1/LC_MESSAGES


ln -s $1 locale/$1_$2.UTF-8 
LANGUAGE=$1_$2.UTF-8:$1
export LANGUAGE
