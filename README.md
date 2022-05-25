
# 쉘 스크립트 다국어 지원 


다국어 지원하는 쉘 스크립트를 작성하고 싶다. 하지만 시스템 locale 디렉토리를 수정하지않고 내 스크립트에만 동작하는 locale 을 만들고 싶다.

다국어 지원 스크립트 구현

1. 내 스크립트를 만든다
2. xgettext 로 내스크립트에서 번역템플리트를 생성한다
3. msginit 로 번역하길 원하는 언어의 메시지 사본을 생성한다
4. 생성된 메시지 사본을 번역한다
5. msgfmt 로 번역된 메시지를 스크립트의 번역문 저장 위치에 저장한다

TEXTDOMAIN: 스크립트의 이름

TEXTDOMAINDIR: 스크립트의 번역문 저장위치

``` bash
# 번역템플리트 생성
$ xgettext -c"TRANSLATORS:" -L"Shell" test_gettext.sh

# 한국어용 번역사본 ko.po 생성
$ msginit --no-translator --locale=ko_KR.UTF-8 --input=message.po

# 번역하기

# 번역본 설치
$ msgfmt -o lib/locale/ja/LC_MESSAGES/test_gettext_sh.mo ko.po
```

테스트


```
$bash test.sh
filename.dat를 찾을수 없습니다
파일을 찾을수 없습니다
filename.dat를 찾을수 없습니다
파일을 찾을수 없습니다
filename.dat not found
file not found
filename.dat not found
file not found
```




출처: <https://docs.oracle.com/cd/E36784_01/html/E39536/gnkbn.html>

[번역](reference.md)

참고자료:

https://tldp.org/LDP/abs/html/localization.html
http://mywiki.wooledge.org/BashFAQ/098 
https://www.linuxjournal.com/content/internationalizing-those-bash-scripts 
https://github.com/yabuki/gettext-sandbox  
https://stackoverflow.com/questions/2221562/using-gettext-in-bash
https://www.linuxtopia.org/online_books/advanced_bash_scripting_guide/localization.html
https://askubuntu.com/questions/264283/switch-command-output-language-from-native-language-to-english
https://unix.stackexchange.com/questions/87745/what-does-lc-all-c-do
https://stackoverflow.com/questions/2221562/using-gettext-in-bash 
