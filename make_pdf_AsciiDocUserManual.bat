@echo off

chcp 65001
asciidoctor-pdf -r asciidoctor-diagram -r asciidoctor-pdf-cjk -o AsciiDocUserManual.pdf AsciiDocUserManual.adoc