# Firebase

Firebase Cloud Firestore の設定のブランチです

* 基本的な手順
https://flutternyumon.com/configuring-firebase-for-android-app/#index_id5

* メソッド数エラー
https://qiita.com/ruckyriver4655/items/4e091ce325e2d34429e6

* kotlinのバージョンエラー
https://stackoverflow.com/questions/43848845/errorexecution-failed-for-task-appcompiledebugkotlin-compilation-error

* 公式URL
https://firebase.flutter.dev/docs/firestore/usage/

## Use

1.type.dartのTypesクラスのように扱うデータの定義を行ってください。
2.getFromFirebaseの受け取るデータ型を1で作ったクラスに変更してください。
3.mainModel.dartのinit()のように1で作ったクラスの変数を作成し、代入して使ってください。
