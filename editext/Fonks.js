function testfunc() {

    console.log("asdasdas")

}
function kaydet_ayni_isim(isim,metin){
    var db = LocalStorage.openDatabaseSync("NotlarDatabase", "1.0", "The Example QML SQL!", 1000000);
    db.transaction(
        function(tx) {
            var sorgu='UPDATE Notlar SET ENTRY="'+metin+'",'+ 'DT="'+Date().toString()+'"'+'Where Name=="'+isim+'"'
            var rs=tx.executeSql(sorgu)
         }
     )

}

function kaydet(isim,metin){

    var db = LocalStorage.openDatabaseSync("NotlarDatabase", "1.0", "The Example QML SQL!", 1000000);

    db.transaction(
        function(tx) {
            try{
                tx.executeSql('CREATE TABLE IF NOT EXISTS Notlar(Name TEXT, Entry TEXT)');
            }catch(err){
                console.log("kaydet create table hata"+err)
            }

            try{
                var sorgu='SELECT * FROM Notlar Where Name=="'+isim+'"';
                var rs=tx.executeSql(sorgu)
            }catch(err){
                console.log("kaydet select hata"+err)

                //exit gelmeli
            }

            try{
                if(rs.rows.item()){//aynı isimli var
                    messageDialog1.visible=true;

                }else{//yok
                    tx.executeSql('INSERT INTO Notlar VALUES(?,?,?)', [ isim, textAlan.text.toString(),Date().toString() ]);
                    button1.opacity=0.4
                    button1.enabled=false
                }
            }catch(err){
                console.log("kaydet update into hata"+err)

                //exit gelmeli
            }

        }
    )



}

function db1() {
    var tut_p="";

     function findNot() {
                 var db = LocalStorage.openDatabaseSync("NotlarDatabase", "1.0", "The Example QML SQL!", 1000000);

                 db.transaction(
                     function(tx) {
                         // Create the database if it doesn't already exist
                         tx.executeSql('CREATE TABLE IF NOT EXISTS Notlar(Name TEXT, Entry TEXT)');

                         // Add (another) greeting row
                         tx.executeSql('INSERT INTO Notlar VALUES(?,?,?)', [ 'adsiz12', textAlan.text.toString(),Date().toString() ]);

                         // Show all added greetings
                         var rs = tx.executeSql('SELECT * FROM Notlar');

                         var r = ""
                         for(var i = 0; i < rs.rows.length; i++) {
                             r += rs.rows.item(i).NAME + ", " + rs.rows.item(i).ENTRY + "\n"
                         }
                         tut_p = r

                     }
                 )
             }
}
