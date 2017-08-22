import QtQuick 2.6
import QtQuick.Window 2.2

Window
{
 visible : true
 width   : 640
 height  : 480
 title   : qsTr("QQML for nya pake keyword loop")

 MainForm{
          anchors.fill: parent
          mouseArea.onClicked:
           {
            console.log(qsTr('QQML for nya pake keyword loop' + textEdit.text))
           }
         }

 Item{
      id     : container
      width  : 320
      height : 120

      Rectangle
       {
        id     : rect
        color  : "red"
        width  : 120
        height : 120

        MouseArea
         {
          anchors.fill: parent
          //untuk mouse dipencet gerak / screen di-tap
          //onClicked: container.state == 'other' ? container.state = '' : container.state = 'other'
         }

        //Untuk membuat Animasi
        NumberAnimation on x
         {
          id       : rectanim;
          from     :    0
          to       :  500
          duration : 5000 //milisecond

          //ini untuk loop berulang terus balik lagi dari x = 0
          loops    : Animation.Infinite

          //false untuk tidak memulai animasi,
          //buat di-call id nya ntar lewat function_id.start)
          running  : false;
         }

        NumberAnimation on y
         {
          id       : rectanimy
          from     : 0
          to       : 400
          duration : 10000
          loops    : Animation.Infinite;
          running  : true;
         }
       }
    }

 Component.onCompleted:
 {
  rectanim.start()
 }
}


//Animation.Sequential
  //Dieksekusi per line animasi nya giliran

//Animation.Pararell
  //Dieksekusi semua line sekaligus kaya multi_threading
