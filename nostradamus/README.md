#######################################################################
~~~Nostradamus is a simple shell-script used for scheduling commands~~~
#######################################################################
You can use it for timing your commands when to happen (time and date)

For help information; how to use it. Just type in 'nostradamus -h'

If you want to implement 'Nostradamus' into your bash shell you can follow these instructions:

1) cd ~ --navigate to home directory
2) mkdir bin --creates bin folder in home directory 
--you can skip step 3 if you already have .bash_profile
3*) touch .bash_profile --creates hidden file in home directory(NO EXTENSION)
4) gedit .bash_profile --or u can use your preffered text editor
5) paste 'export PATH=$PATH:~/bin' into '.bash_profile' and save it
6) restart your terminal window
7) navigate to nostradamus.sh and use this command 'chmod +x nostradamus.sh' to give permissions
8) move the file with 'sudo mv nostradamus.sh ~/bin/nostradamus'(note that you are not using extension when you move because of redundancy; sudo is used because you are working in home directory)

