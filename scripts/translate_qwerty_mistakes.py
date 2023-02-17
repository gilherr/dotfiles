import sys

query = sys.argv[1]


en = ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '[', ']', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\'', '\\', 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/']
he = ['/', '׳', 'ק', 'ר', 'א', 'ט', 'ו', 'ן', 'ם', 'פ', ']', '[', 'ש', 'ד', 'ג', 'כ', 'ע', 'י', 'ח', 'ל', 'ך', 'ף', ',',  '',   'ז', 'ס', 'ב', 'ה', 'נ', 'מ', 'צ', 'ת', 'ץ', '.']

res = []

if query[0] in en:
    src, dest = en, he
else:
    src, dest = he, en

for c in query:
    try:
        idx = src.index(c)
        res.append(dest[idx])
    except ValueError:
        res.append(c)


sys.stdout.write("".join(res))
