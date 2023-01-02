#!/bin/bash
clear
echo -e "PHLOG untuk server SDF Unix\nSeri Genshin Impact\n\
 v0.1 -- bahasa Indonesia\n\
================================"
echo "Hati-hati dalam menggunakan skrip ini..."
read -p "Tekan [RETRUN/ENTER] untuk eksekusi"
clear

GOPHERDIR=$HOME/gopher
PHLOG=$GOPHERDIR/phlog
GOPHERMAP1=$PHLOG/gophermap
PHLOGDATEDIR=`date +%Y-%m-%d_%H%M`
POSTDATE=`date "+%Y-%m-%d %H.%M"`
POSTDIR=$PHLOG/$PHLOGDATEDIR
GOPHERMAP2=$POSTDIR/gophermap
if [[ ! -d "$GOPHERDIR" ]]; then
  ln -sf /ftp/pub/users/$USER $GOPHERDIR && chmod 755 $GOPHERDIR
else
  echo "Periksa direktori $GOPHERDIR" && ls -la $GOPHERDIR/
fi
if [[ ! -d "$PHLOG" ]]; then
  echo -n "Kamisato Ayaka mau bikin direktori phlog gak? (y/n *) "
  read CPHLOG
  case $CPHLOG in
    y | Y ) clear && mkdir $PHLOG 
      chmod 755 $PHLOG && echo "Direktori phlog sudah dibuat";;
    n | N | * ) clear && echo "Nggak jadi bikin direktori phlog."; exit 0;;
  esac
else
  echo "Gorou ngasih tau kalau dir phlog sudah ada."
fi
if [[ ! -f "$GOPHERMAP1" ]]; then
  echo -e "Nahida mau bikin gophermap di phlog dir.\n\
  Yakin? Nahida gak maksa kok. (y/t *)"
  read CGOPHERMAP1
  case $CGOPHERMAP1 in
    y | Y ) clear && touch $GOPHERMAP1 && chmod 644 $GOPHERMAP1
      echo "OK, Nahida udah buat gophermap di dir phlog";;
    n | N | * ) clear && echo "Kagak jadi buat. Sekarang Nahida ngeArchon."; exit 0;;
  esac
else
  echo "Aether kan Traveler. Emang Lumine kagak ngingetin."
fi
echo "Baku hantam dengan lain. Sekarang bikin postingan phlog."
echo -n "Judul phlog: "
read TitleSayuPost
echo -n "Pembuat: "
read Tighnari
echo -e "Kalaupun itu sudah siap, tinggal yakin dulu ngepost.\n\
Paimon bilang gak keburu ngepost soalnya nanggung.\n\
Oklah Razor mau nulis/ngetik dulu...."
read -p "Tekan [RETURN/ENTER] untuk lanjut"
echo -n "Yakin? Razor mau nulis nih kalau yakin...(y/n *) "
read CPHLOGPOST
case $CPHLOGPOST in
  y | Y ) mkdir $POSTDIR && chmod 755 $POSTDIR
    touch $GOPHERMAP2 
    echo $TitleSayuPost >> $GOPHERMAP2 && echo $POSTDATE >> $GOPHERMAP2
    echo >> $GOPHERMAP2 && echo -e "$Tighnari \n\n" >> $GOPHERMAP2
    chmod 644 $GOPHERMAP2 && nano $GOPHERMAP2
    echo -e "1$TitleSayuPost\t$PHLOGDATEDIR" | cat - $GOPHERMAP1 > temp && mv temp $GOPHERMAP1
    chmod 644 $GOPHERMAP2 $GOPHERMAP1;;
  n | N | * ) echo "Razor kagak jadi ngetik."; exit;;
esac
# clear
echo "Razor sudah ngetik, Venti yang nyebarin. Sudah selesai."
