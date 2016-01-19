당연히 git이 깔린 상태여야 한다.  
mac os 위주의 설정이다.(특히 vim)  
reg 파일은 윈도우에서 실행하는 파일이다.

mac에서는 brew로 어플리케이션을 관리한다.  
http://brew.sh 참고  

brew로 제일 처음 할 일은 git을 설치하는 일  
그리고 해당 git 프로젝트를 clone한 후  
git clone https://github.com/woodtalk/config-for-dev  

mac이라면 아래의 명령을 입력한다.  

```
ln -s ~/git-workspace/config-for-dev/bash_profile ~/.bash_profile
ln -s ~/git-workspace/config-for/dev/vimrc ~/.vimrc
```

vim의 경우 예전에는 macvim이라는 것을 써야 했는데  
현재는 vim을 설치하여도 최신 버전의 vim이 설치되는 것 같다.  

```
brew install vim
```

vim으로 실행하면 새로 설치된 vim이 실행되는데, vi는 예전의 vim이 실행된다.  
그 이유는 명령어 연결 부분인데 그 처리는 이 프로젝트의 bash_profile을 통하여 해결했다.  

```
which vim
which vi
```

를 실행하면 이유를 알 수 있다.

vim 에서 vundle이라는 plugin manager를 사용한다.  
이것에 대한 정보는 http://github.com/gmarik/vundle 에서 확인해보자.  

vundle 윈도우에서 써보자
git은 당연히 깔린 상태여야 한다.
그리고 왠지 path에 등록해야할 꺼 같다.
https://github.com/gmarik/Vundle.vim/wiki/vundle-for-windows
여기에 설정하는 것이 있는데, windows에는 .vim 폴더가 없어서 거기에 대한 보안이 있는 것 같다.

```
mklink /d vimfiles d:\Users\woodtalk\vimfiles
```

위는 내가 .vim 폴더 대신 만든 vimfiles에 대한 심볼릭 링크 만드는 방법이다.

맥에서 터미널에서 vim에서 esc로 영어로 빠져나올라면 아래의 과정을 거쳐야하고 그리고 같이 커밋된 vimrc 파일을 확인해보면 됩니다.

```
git clone https://github.com/vovkasm/input-source-switcher.git
cd input-source-switcher
mkdir build
cd build
cmake ..
make
make install
```

이상 현재까지 생각나는 것을 적어 보았다.

------------------------------------------------

# vi 단축키 관련
## insert mode에서... 
* ctrl + [ 은 esc
* ctrl + h 은 backspace
* ctrl + w 은 이전 단어 지우기


## 그냥 모드에서 insert mode로 전환하는 다양한 방법
* i : 현재 커서에서 insert
* a : 현재 커서 다음 글자에서 insert
* I : 줄 앞단에서 insert
* A : 줄 맨 끝에서 insert
* o : 현재 커서의 아래 쪽에 줄 추가 후 insert
* O : 현재 커서의 윗 쪽에 줄 추가 후 insert


## 빨리 이동하기 위한 팁
* f문자 : 문자의 위치로 이동 ; 를 누르면 계속 이동
* F문자 : 백워드로 문자의 위치로 이동
* e or w : 단어 단위 앞으로 이동
* b : 단어 단위 뒤로 이동
* t문자 : 문자의 앞위치로 이동
* T문자 : 백워드방향으로 문자의 앞위치로 이동


## 만약에 binary로 파일을 보고 싶으면

```
:%!xxd
```

다시 reverse하려면(되돌리려면)

```
:%!xxd -r
```

추가로 ```setlocal binary```나 ```setlcoal diplay=uhex``` , ```setlocal wrap``` 기타 등등이 있는데 자세한 건 [http://vim.wikia.com/wiki/Hex_dump] 참조


## 인코딩이 변경하고 싶다

```
:e ++enc=\현재 파일 encoding\
:w ++enc=\변경할 파일 encoding\
```

현재 파일의 인코딩 확인은


```
set fenc
```

vim에서 파일을 읽을 때 인코딩 우선순위 설정 및 확인은

```
set fileencoings
```

추가로

```
:set bomb
:set nobomb
```

위의 명령으로 BOM을 추가 제거할 수 있다.


## JSON pretty formatting

```
:%!python -m json.tool
```

추가로 현재 특정 파일로 syntax변경하여 보고 싶으면

```
:set syntax=json
```

## ```^M```(carriage returns)을 확인하고 싶다?

```
:e ++ff=unix
:e ++fileformat=unix
```

## ```^M```(carriage returns)을 제거하고 싶다?

```
:%s/^M//g
:%s/{ctrl+v}{ctrl+m}//g
```



## 기타

ctrl + v 를 할 경우 수평 선택이 가능하다.  
I는 그 상태에서 입력 가능 입력한 후 esc를 누르면 수평 입력이 가능하다.

visual mode에서 복사(y)한 내용을 search mode(/)에서 사용하는 방법은 ctrl + r + 0를 하면 된다.  
ctrl + r에는 기타 다른 것도 사용할 수 있다. % # / : 등등  
기타 자세한 내용은 :help c_CTRL-R로 알 수 있다.  
출처 : [http://seorenn.blogspot.kr/2011/04/vim.html?m=1]


## git

git에서 clone 및 pull에서 자꾸 ```^M```(carriage returns)을 붙혀서 배포한다?
```.gitattributes```에 다음을 넣어 커밋하자

```
*.sh text eol=lf
```

