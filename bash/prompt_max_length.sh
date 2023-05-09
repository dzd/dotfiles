pwd_length=14
pwd_symbol="..."
newPWD="${PWD/#$HOME/~}"
#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

if [ $(echo -n $newPWD | wc -c | tr -d " ") -gt $pwd_length ]
then
   newPWD=$(echo -n $newPWD | awk -F '/' '{
   print $1 "/" $2 "/.../" $(NF-1) "/" $(NF)}')
fi
PS1='${newPWD}$ '
