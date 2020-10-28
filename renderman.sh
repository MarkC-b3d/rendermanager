blenderpath="/home/mac/Blender/blender"

init(){
clear
echo "Where is the blend file you would like rendered?"
echo ""
echo "Please enter full path and file extension..."
getFile
}

getFile(){
read BLENDFILE

echo ""
echo "You entered $BLENDFILE is this correct?"
echo ""

echo ""
echo "Enter y/n"
echo ""

read YNV1

if [ $YNV1 = y ]; then
  renderimage
fi

if [ $YNV1 = n ]; then
  renderimage
fi
}

renderimage(){
  $blenderpath -b $BLENDFILE -o /home/mac/render -f 1
}


init
