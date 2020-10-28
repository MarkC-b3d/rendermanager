################################################################################
#Requires user intervention, you need to replace the path to where you have
#blender installed on your system I use the tarballs because
#I can specify the exact path
blenderpath="/home/mac/Blender/blender"
################################################################################


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
  getDir
fi

if [ $YNV1 = n ]; then
  init
fi
}

getDir(){
  echo ""
  echo "Where do you want the image saved to?"
  echo "Please enter full path..."
  read DIRECTORY


  echo ""
  echo "You entered $DIRECTORY is this correct?"
  echo ""

  read YNV2

  if [ $YNV2 = y]; then
    renderimage
  fi

  if [ $YNV2 = n]; then
    getDir
  fi


}

#Requires user intervention, you need to replace the path to where you have
#blender installed on your system I use the tarballs because
#I can specify the exact path
renderimage(){
  $blenderpath -b $BLENDFILE -o $DIRECTORY -f 1
}


init
