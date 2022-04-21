
# gettext APIs

텍스트 메시지를 지역화 하기 위해서는 응용프로그램의 소스코드와 다른 파일에 분리 되어야 한다. 이들 파일은 message bundles, message catalog, portable message 파일로 불리운다. 모든 프로그래밍 언어는 이들 파일과 작업할 수 있는 세트나 툴을 제공한다. 예를 들어, C, Python 그리고Perl 과 같은 언어들 에서 메시지 번역을 위한 gettext 함수를 제공한다
gettext 유틸리티를 사용하여 portable message를 생성할 수 있다. 이들 파일은 텍스트 파일이고, 확장자는 po 이다. 번역을 위해 번역가에게 portable message 파일을 보내고, 번역가는 텍스트를 번역한다. po 파일은 message ID와 대응하는 번역된 텍스트를 가지고 있다 예를 들어
```bash
$ cat cs.po   
.
.
#: code.c:37
#,c-format
msgid "My hovercraft is full of eels.\n"
msgstr "Moje vznášedlo je plné úhořů.\n"
```
portable object 파일을 message object 파일로 변경하여 시스템속도를 향상 시킬 수 있다. 메시지 오브젝트 파일은 .mo 확장자를 가진다. portable object 파일을 message object 파일로 변경하는데 msgfmt 가 사용된다.

주 - 만약 메시지들이 gettext 함수로 포장되어 있다면, 번역은  현재 locale 에 의존하여 이루어진다. 이 방법은 원래의 문자열 메시지들이 메시지 카탈로그의 키로 사용된다.

## 쉘스크립트를 위한 지역화된 메시지 생성하는 방법


1. /usr/gnu/bin 디렉토리를 환경변수 PATH 의 제일앞에 추가하여 GNU 버전의 gettext 툴을 사용할 수 있도록 한다.
2. xgettext 명령을 사용하여 쉘스크립트의 메시지들을 meessage file template 로 뽑아낸다.
3. msginit 명령을 사용하여 특정 언어의 번역본의 potable message(.po) 파일을 생성한다.
4. .po 파일에 생성된 메시지들을 번역한다
5. 환경변수 TEXTDOMAINDIR 이 지정하는 디렉토리 내에서 LC_MESSAGES 디렉토리를 생성한다
6. 심볼릭링크를 생성하거나, LANGUAGE 변수를 설정한다
7. 메시지 오브젝트 파일(.mo) 를 생성한다.

예제  2-7  쉘 스크립트를 위한 지역화 된 메시지 생성하기

이 예제는 쉘 스크립트를 위한 지역화 된 메시지를 어떻게 생성하는지 보여준다. gettext 함수를 호출하는 다음의 스크립트를 가지고 있다고 간주한다.
``` bash
#!/usr/bin/bash
#
# set TEXTDOMAIN and TEXTDOMAINDIR as per the gettext(1) manual page
TEXTDOMAIN=test_gettext_sh
export TEXTDOMAIN
TEXTDOMAINDIR=/home/xxxxx/lib/locale
export TEXTDOMAINDIR
PATH=/usr/gnu/bin:/usr/bin
export PATH
# source gettext.sh for using eval_gettext and eval_ngettext
. gettext.sh
f="filename.dat"
# Use eval_gettext or eval_ngettext if it refers to shell variables
# TRANSLATORS: $f is replaced with a file name
eval_gettext "\$f not found"; echo
gettext "file not found"; echo
echo "`eval_gettext "\\\$f not found"`"
echo "`gettext "file not found"`"
```
이 쉘 스크립트 에서, 다음의 단계를 사용하여 지역화 된 메시지 오브젝트들을 생성 할 수 있다. 

1. GNU 버전의 gettext 도구를 사용하기 위해 환경변수 Path 에 /usr/gnu/bin 을 맨 앞에 붙인다.
$ PATH=/usr/gnu/bin:$PATH
2. xgettext 명령을 사용하여 셀스크립트에서 메시지 파일 템플릿으로 메시지들을 추출한다.
    ```bash
    $ xgettext -c"TRANSLATORS:" -L"Shell" test_gettext.sh
    ```
    message.po 파일이 생성되며, 이 파일은 쉘 스크립트의 헤더 정보와 메시지 문자열을 포함하고 있다. 또한 번역가를 위한 설명적인 주석을 포함한다. 다음의 예제는 message.po 파일의 인용을 보여준다:
    ```
    #. TRANSLATORS: $f is replaced with a file name
    #: test_gettext.sh:18 test_gettext.sh:21
    #, sh-format
    msgid "$f not found"
    msgstr ""

    #: test_gettext.sh:19 test_gettext.sh:22
    msgid "file not found"
    msgstr ""
    ```
3. msginit 명령을 사용하여 번역할 언어를 명시할 portable message (.po) 파일을 생성한다. 다음의 명령을 사용하여 일본의 ja_JP.UTF-8 로케일을 위한 .po 파일을 생성한다:
    ```
    $ msginit --no-translator --locale=ja_JP.UTF-8 --input=message.po
    ```
4. ja.po 파일의 메시지들을 번역한다
5. 환경변수 TEXTDOMAINDIR 이 명시 하는 디렉토리 내에 LC_MESSAGES 디렉토리를 생성한다.
    ```
    $ mkdir -p lib/locale/ja/LC_MESSAGES
    ```
6. 심볼릭 링크를 생성하거나, LANGUAGE 변수를 설정한다.
    * 심볼릭 링크를 생성한다
        ```
        $ ln -s ja lib/locale/ja_JP.UTF-8
        ```
    * LANGUAGE 변수를 설정한다.

        ```
        $ LANGUAGE=ja_JP.UTF-8:ja
        $ export LANGUAGE
        ```
7. 메시지 오브젝트 (.mo) 파일을 생성한다.

    ```
    $ msgfmt -o lib/locale/ja/LC_MESSAGES/test_gettext_sh.mo ja.po
    ```

