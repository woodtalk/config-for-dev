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

이상 현재까지 생각나는 것을 적어 보았다.
