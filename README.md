# グーグルログイン機能

グーグルログイン機能を実装したい際に、 GoogleSignInMethod().googleSignIn(); とonPressed関数内に記述してください。
<br>また、下記のように、色々な情報を得られます。

* GoogleSignInMethod().currentUser.displayName =>ユーザーの名前
* GoogleSignInMethod().currentUser.email =>ユーザーのメールアドレス
* GoogleSignInMethod().currentUser.uid =>ユーザーのID
* GoogleSignInMethod().currentUser.phoneNumber =>ユーザーの電話番号
* GoogleSignInMethod().currentUser.photoURL =>ユーザーのアイコン画像