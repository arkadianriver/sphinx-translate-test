@echo off

if exist locale rmdir /q /s locale
if exist translate-src rmdir /q /s translate-src
call make html
call make gettext
set SPHINXINTL_LANGUAGE=en,de,ja
sphinx-intl update -p _build/gettext
mkdir translate-src
robocopy locale translate-src\locale /mir /s
python translate.py

for %%i in (%SPHINXINTL_LANGUAGE%) do call :f1 %%i
goto :eof

:f1
@echo off
set SPHINXOPTS=-Dlanguage=%1
mkdir out\%1
sphinx-build -M html . out/%1 -Dlanguage=%1
