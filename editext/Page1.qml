import QtQuick 2.7
import QtQuick.LocalStorage 2.0
import "Fonks.js" as FonkDepo

Page1Form {
    textField.onTextChanged: {
        button1.opacity=1
        button1.enabled=true
    }
    textAlan.onTextChanged: {
        button1.opacity=1
        button1.enabled=true
    }

    comboBox1.onCurrentIndexChanged: {
        textAlan.font.family = comboBox1.textAt(comboBox1.currentIndex)
    }

    comboBox.onCurrentIndexChanged: {
        textAlan.font.pointSize = comboBox.textAt(comboBox.currentIndex)
    }

    comboBox2.onActivated: {

        if (comboBox2.currentIndex == 0) {
            textAlan.font.italic = false
            textAlan.font.bold = false
        } else if (comboBox2.currentIndex == 1) {
            if (textAlan.font.italic) {
                textAlan.font.italic = false
            } else {
                textAlan.font.italic = true
            }
        } else if (comboBox2.currentIndex == 2) {
            if (textAlan.font.bold) {
                textAlan.font.bold = false
            } else {
                textAlan.font.bold = true
            }
        }


    }
    messageDialog1.onRejected: {
        console.log("close 1 dedin")

    }
    messageDialog1.onAccepted: {
        FonkDepo.kaydet_ayni_isim(textField.text.toString(),textAlan.text.toString())
        textAlan.text=""
        button1.enabled=false;
        button1.opacity=0.4;
    }

    messageDialog.onRejected: {
        console.log("close dedin")
        textAlan.text=""
        button1.enabled=false;
        button1.opacity=0.4;
    }

    messageDialog.onAccepted:{
        console.log("ok dedin");
        FonkDepo.kaydet(textField.text.toString(),textAlan.text.toString())
    }

    button2.onClicked: {//yeni buton  
        //if yeni açarken kayıtlı değilse
        //messageDialog.visible=true;

        if(button1.enabled){
            messageDialog.visible=true
        }else{
            textAlan.text=""

        }

        //else değişiklik yoksa



}
    button1.onClicked: {//kaydet buton

        if(Component.onCompleted){
            FonkDepo.kaydet(textField.text.toString(),textAlan.text.toString());
        }
    }

}
