import fontforge

NAME = "simfang"

f = fontforge.open(f"{NAME}.ttf")

f.selection.all()

f.os2_weight = 700

f.changeWeight(10).generate(f"{NAME}-Bold.ttf")
