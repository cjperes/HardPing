@echo off
title HARD PING! JoePing
color 0C
Setlocal EnableExtensions
mode con: lines=20 
echo.
echo  �    �  ����  �����  �����          �����   ����� ��   �  �����
echo  �    � �    � �    � �    �         �    �    �   � �  � �     
echo  ������ ������ �����  �    �         �����     �   �  � � �  �� 
echo  �    � �    � �   �  �    �         �         �   �   �� �    �
echo  �    � �    � �    � �����          �       ����� �    �  ���� 
echo.
echo.
echo.
echo Vamos estressar o servidor com pacotes gigantes! (60000kb / 30pcts) 
echo.
echo Deseja continuar? (y/n)
set /p go=^>
rem /i faz deixar de ser casesensitive
IF /i "%go%"=="y" goto:ini
If /i "%go%"=="n" goto exit

:ini
mode con: lines=10
cls
set /p server=Digite o servidor:
if not defined server goto erro
cls
goto resultado

:erro
cls
color 0F
echo Especifique um servidor para prosseguir!
echo.
ping -n 3 127.0.0.1>nul
cls
color 0C
set /p server=Digite o servidor:
if not defined server goto erro


:resultado
cls
Title Carregando...
echo Aguarde. Isso pode demorar alguns minutos!
call :obterPing ping
cls
Title HARD PING! - joedev.com.br
echo Ping: %ping%
echo JoePing :: %date% %time% >> hardlog.txt
echo %server% :: %ping% >> hardlog.txt
echo ================ >> hardlog.txt
echo Realizar outro Ping? (y/n)
set /p new=^>
rem /i faz deixar de ser casesensitive
IF /i "%new%"=="y" goto:ini
IF /i "%new%"=="n" goto:exit
cls

:exit
cls
title HARD PING ;D
echo Obrigado! joedev.com.br and bbcreative.org
ping -n 3 127.0.0.1>nul
exit


:obterPing
set var_name=%~1
set %var_name%=Erro! N�o foi poss�vel completar o Ping.
set comando_ping=Ping %server% -l 60000 -n 30

for /f "tokens=* delims=*" %%a in ('%comando_ping%') do (set "a=%%a")
   :obterPing_loop
      set "a=%a:~1%"
      echo.%a%|find "=" >nul
   if %errorlevel%==0 goto obterPing_loop

set %var_name%=%a:~1%
