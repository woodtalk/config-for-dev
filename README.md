당연히 git이 깔린 상태여야 한다.  
mac os 위주의 설정이다.(특히 vim)  
reg 파일은 윈도우에서 실행하는 파일이다.

mac에서는 brew로 어플리케이션을 관리한다.  
http://brew.sh 참고  

brew로 제일 처음 할 일은 git을 설치하는 일  
그리고 해당 git 프로젝트를 clone한 후  
git clone https://github.com/woodtalk/config-for-dev  

mac이라면 아래의 명령을 입력한다.  
~~~~
ln -s ~/git-workspace/config-for-dev/bash_profile ~/.bash_profile
ln -s ~/git-workspace/config-for/dev/vimrc ~/.vimrc
~~~~

vim의 경우 예전에는 macvim이라는 것을 써야 했는데  
현재는 vim을 설치하여도 최신 버전의 vim이 설치되는 것 같다.  
~~~~
brew install vim
~~~~

vim으로 실행하면 새로 설치된 vim이 실행되는데, vi는 예전의 vim이 실행된다.  
그 이유는 명령어 연결 부분인데 그 처리는 이 프로젝트의 bash_profile을 통하여 해결했다.  
~~~~
which vim
which vi
~~~~
를 실행하면 이유를 알 수 있다.

vim 에서 vundle이라는 plugin manager를 사용한다.  
이것에 대한 정보는 http://github.com/gmarik/vundle 에서 확인해보자.  

vundle 윈도우에서 써보자
git은 당연히 깔린 상태여야 한다.
그리고 왠지 path에 등록해야할 꺼 같다.
https://github.com/gmarik/Vundle.vim/wiki/vundle-for-windows
여기에 설정하는 것이 있는데, windows에는 .vim 폴더가 없어서 거기에 대한 보안이 있는 것 같다.
~~~~
mklink /d vimfiles d:\Users\woodtalk\vimfiles
~~~~
위는 내가 .vim 폴더 대신 만든 vimfiles에 대한 심볼릭 링크 만드는 방법이다.

이상 현재까지 생각나는 것을 적어 보았다.

****

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


ctrl + v 를 할 경우 수평 선택이 가능하다.  
I는 그 상태에서 입력 가능 입력한 후 esc를 누르면 수평 입력이 가능하다.

visual mode에서 복사(y)한 내용을 search mode(/)에서 사용하는 방법은 ctrl + r + 0를 하면 된다.  
ctrl + r에는 기타 다른 것도 사용할 수 있다. % # / : 등등  
기타 자세한 내용은 :help c_CTRL-R로 알 수 있다.  
출처 : http://seorenn.blogspot.kr/2011/04/vim.html?m=1

