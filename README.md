Upgrade emacs to version 24 if you havent already.
https://launchpad.net/~cassou/+archive/emacs

Add these lines to your bash.rc
````
alias emacs="env TERM=xterm-256color emacs -nw"
export TERM=xterm-256color
````
Do this from the repo dir then
````
cp .emacs ~
cp -r .emacs.d/ ~
````

   
