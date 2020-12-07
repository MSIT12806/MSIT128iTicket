git hub 使用手冊：

相關資訊參閱：https://cloud.tencent.com/developer/article/1355182

依照上述網址創建在地版本庫、github雲端版本庫，並將二者關聯以後：

1. 在在地版本庫進行程式撰寫
2. 可以透過"git status"指令碼看目前資料夾和git中間的差異，如，有無新增檔案、檔案內容有無更動。
   "git add XXX"可將資料夾中還不在git版本庫的檔案存入版本庫中。→上傳新版本專案到暫存區："git add 正在進行中的專案"
3. " git commit -m "" "指令碼可以將目前資料夾的異動同步到git之中，後面雙引號可以註記文字。上傳新版本專案到版本庫："git commit -m "在這裡輸入新版本的改動""
4. "git push origin master"  把本機版本庫的檔案更新到github上。
5. "git pull"  把github 雲端版本庫的版本更新到本機當中。
6. "git log" 可以看歷史紀錄
7. "git reset -hard HEAD^" 幾個^就退回幾個版本之前，"-hard HEAD~n"，退回到n個版本之前

11111111111111111111111111
6. "
