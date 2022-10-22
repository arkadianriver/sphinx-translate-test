#!/bin/bash

make html
make gettext
export SPHINXINTL_LANGUAGE=en,de,ja
sphinx-intl update -p _build/gettext
mkdir translate-src
cp -r locale translate-src/
python translate.py

for lang in ($SPHINXINTL_LANGUAGE); do
  SPHINXOPTS=-Dlanguage=$lang
  mkdir -p out/$lang
  sphinx-build -M html . out/$lang -Dlanguage=$lang
done

