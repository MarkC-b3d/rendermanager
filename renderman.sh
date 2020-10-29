################################################################################
#Requires user intervention, you need to replace the path to where you have
#blender installed on your system I use the tarballs because
#I can specify the exact path
blenderpath="/home/mac/Blender/blender"
################################################################################


init(){
clear
echo "Animation / Single Image"
echo ""
echo "1 = Animation"
echo "2 = Single Image"
imageanim
}

imageanim(){
read IMAGEANIM
if [ $IMAGEANIM = 1 ]; then
animRender
fi

if [ $IMAGEANIM = 2 ]; then
imageRender
fi
}

animRender(){
clear
echo "Where is the blend file you would like rendered?"
echo ""
echo "Please enter full path and file extension..."
getFile_anim
}

getFile_anim(){
read BLENDFILE

echo ""
echo "You entered $BLENDFILE is this correct?"
echo ""

echo ""
echo "Enter y/n"
echo ""

read YNV1

if [ $YNV1 = y ]; then
getDir_anim
fi

if [ $YNV1 = n ]; then
animRender
fi
}

getDir_anim(){
echo ""
echo "Where do you want the image saved to?"
echo "Please enter full path..."
read DIRECTORY


echo ""
echo "You entered $DIRECTORY is this correct?"
echo ""

read YNV2

if [ $YNV2 = y ]; then
renderanim
fi

if [ $YNV2 = n ]; then
getDir_anim
fi
}

imageRender(){
clear
echo "Where is the blend file you would like rendered?"
echo ""
echo "Please enter full path and file extension..."
getFile_image
}

getFile_image(){
read BLENDFILE

echo ""
echo "You entered $BLENDFILE is this correct?"
echo ""

echo ""
echo "Enter y/n"
echo ""

read YNV1

if [ $YNV1 = y ]; then
getDir_image
fi

if [ $YNV1 = n ]; then
init
fi
}

getDir_image(){
echo ""
echo "Where do you want the image saved to?"
echo "Please enter full path..."
read DIRECTORY


echo ""
echo "You entered $DIRECTORY is this correct?"
echo ""

read YNV2

if [ $YNV2 = y ]; then
renderimage
fi

if [ $YNV2 = n ]; then
getDir
fi


}


renderimage(){
$blenderpath -b $BLENDFILE -o $DIRECTORY -f 1
}

renderanim(){
$blenderpath -b $BLENDFILE -E CYCLES -o $DIRECTORY -a
}


init
