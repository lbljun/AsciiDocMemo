@echo off

rem asciidoc関連ツールをインストール
call gem install asciidoctor
call gem install --pre asciidoctor-pdf
call gem install asciidoctor-pdf-cjk
call gem install asciidoctor-diagram
call gem install coderay