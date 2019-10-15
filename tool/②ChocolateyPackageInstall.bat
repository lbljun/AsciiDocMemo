@echo off

rem バッチファイルの内容を管理者権限で実行させる
cd /d %~dp0
for /f "tokens=3 delims=\ " %%i in ('whoami /groups^|find "Mandatory"') do set LEVEL=%%i
if NOT "%LEVEL%"=="High" (
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "Start-Process %~f0 -Verb runas"
exit
)

rem OSのバージョン確認
set /p selected="OSのバージョンはWindows10ですか(y/n)?"
if /i "%selected%"=="y" (goto yes)

:no
echo Toolフォルダ内の「ndp48-web.exe」を実行して.net Frame Work 4.8をインストールします。
echo Windowsの更新がかかるのでPC再起動後に、もう一度、本バッチファイルを再実行してください。
echo 再実行時に、もう一度、OSのバージョンを確認されますが、Windows10ではなくてもYESで答えてください。
goto exitlabel

:yes
goto nextlabel

:exitlabel
pause
exit

:nextlabel
rem chocolateyのリポジトリから各種パッケージをインストールする
cinst ruby -y
cinst graphviz -y
cinst jdk8 -y
cinst maven -y
cinst vscode -y
cinst winmerge -y
cinst sourcetree --version 2.5.5 -y

rem sourcetreeのサインイン成功確認
set /p selected="atlassianアカウントを作成してsourcetreeのサインインに成功しましたか(y/n)?"
if /i "%selected%"=="y" (goto yes)

:no
echo "sourcetreeのサインインに成功した後に自分でsourcetreeのアップグレードを実施してね！"
goto exitlabel

:yes
choco upgrade all -y

:exitlabel
exit