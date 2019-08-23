@echo off

asciidoctor-pdf -r asciidoctor-diagram -r asciidoctor-pdf-cjk -o dist/test.pdf test.adoc