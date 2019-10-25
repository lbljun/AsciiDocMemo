@echo off

rem バッチファイルの内容を管理者権限で実行させる
cd /d %~dp0
for /f "tokens=3 delims=\ " %%i in ('whoami /groups^|find "Mandatory"') do set LEVEL=%%i
if NOT "%LEVEL%"=="High" (
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "Start-Process %~f0 -Verb runas"
exit
)

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
pause
exit