echo "Which mobile operator to you use?"

read answer

case $answer in 
  Beeline) echo "You are as cool as a bee!";;
  MTS) echo "You are kinda shady with your names, aren't you?";;
  Megaphone) echo "You are as loud as a train!";;
  *) echo "I do not know your operator but you are nontheless cool!";;
esac

