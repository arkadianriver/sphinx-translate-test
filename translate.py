from translate_po.main import run

for lang in ['de', 'ja']:
  run(
    fro="en", to=lang,
    src=f"./translate-src/locale/{lang}/LC_MESSAGES",
    dest=f"./locale/{lang}/LC_MESSAGES",
    recursive=True)

"""
# testing
from googletrans import Translator

translator = Translator()
translated = translator.translate("Welcome!", dest="de", src="en")

print(translated.text)
"""
