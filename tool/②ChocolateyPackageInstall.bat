@echo off

rem �o�b�`�t�@�C���̓��e���Ǘ��Ҍ����Ŏ��s������
cd /d %~dp0
for /f "tokens=3 delims=\ " %%i in ('whoami /groups^|find "Mandatory"') do set LEVEL=%%i
if NOT "%LEVEL%"=="High" (
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "Start-Process %~f0 -Verb runas"
exit
)

rem chocolatey�̃��|�W�g������e��p�b�P�[�W���C���X�g�[������
cinst ruby -y
cinst graphviz -y
cinst jdk8 -y
cinst maven -y
cinst vscode -y
cinst winmerge -y
cinst sourcetree --version 2.5.5 -y

rem sourcetree�̃T�C���C�������m�F
set /p selected="atlassian�A�J�E���g���쐬����sourcetree�̃T�C���C���ɐ������܂�����(y/n)?"
if /i "%selected%"=="y" (goto yes)

:no
echo "sourcetree�̃T�C���C���ɐ���������Ɏ�����sourcetree�̃A�b�v�O���[�h�����{���ĂˁI"
goto exitlabel

:yes
choco upgrade all -y

:exitlabel
pause
exit