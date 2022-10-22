#!/usr/bin/bash

set -e

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

cat <<EOD > out/index.html
<html><head><title>Sphinx Translate Test</title></head>
<body><ul>
<li><a href="en/html">en</a></li>
<li><a href="de/html">de</a></li>
<li><a href="ja/html">ja</a></li>
</ul></body></html>
EOD

touch out/.nojekyll
