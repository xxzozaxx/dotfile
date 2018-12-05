#!/usr/bin/python3

__author__ = "Ahmed Khaled"
"""
This script use translation-shell 'trans command'
to formate the and latex dictionary entry.

LaTeX entry macro
    \newcommand{\entry}[4]{\textbf{#1}\markboth{#1}{#1}\ {(#2)}\ \textit{#3}\ $\bullet$\ {#4}}

You can find LaTeX code in (I hope I write url well)
    https://www.latexexample.com/template/dictionary
"""

from string import Template
import pprint  # For debugging list
import re
import subprocess
import sys

pp = pprint.PrettyPrinter(indent=2)


def getAr(word):
    """
    Take a word as string and return list of
    capitalize word and its Arabic translation
    """
    pro = subprocess.run(["trans", ":ar", word], stdout=subprocess.PIPE)
    _out = pro.stdout.decode('utf-8')
    out = _out.splitlines()
    return ([
        out[0].capitalize(),
        re.sub("\x1b.*?m", '', out[-1].replace(" ", ""))
    ])


def getEn(word):
    """
    Take a word as string and return list of
    capitalize word and its English translation
    """
    pro = subprocess.run(["trans", word], stdout=subprocess.PIPE)
    _out = pro.stdout.decode('utf-8')
    out = _out.splitlines()
    outDict = [out[0].capitalize()]
    # it may print the word's pronounce is second line
    if out[2] == "":
        outDict.extend((
            out[3].capitalize(),  # First Type
            re.sub("\x1b.*?m", '', out[4].replace("  ", "")),
            re.sub('\x1b.*?m', '',
                   out[5].replace('\"', "").replace("-", "").strip())))
    else:
        outDict.extend((out[2].capitalize(),
                        re.sub("\x1b.*?m", '', out[3].replace("  ", "")),
                        re.sub(
                            '\x1b.*?m', '', out[4].replace('\"', "").replace(
                                "-", "").strip())))

    return outDict


def latexPrint(word):
    arTrans = getAr(word)
    enTrans = getEn(word)

    lat = Template(
        "\entry{$en}{\\textarabic{$ar}}{$ty}{$tr. \\textit{e.g: $eg}}")

    return (lat.substitute(
        en=enTrans[0],
        ar="",  # FIXME arabic print well in terminal, but reversied in editor
        ty=enTrans[1],
        tr=enTrans[2],
        eg=enTrans[3]))


def test():
    pro = subprocess.run(["trans", "object"], stdout=subprocess.PIPE)
    _out = pro.stdout.decode('utf-8')
    out = _out.splitlines()
    # pp.pprint(out)
    print(out[0].capitalize())  # Word
    print(out[2].capitalize())  # First Type
    print(out[3])  # first Translation
    print(out[4])  # Example
    return 0


# pp.pprint(getEn("Joyous"))
# pp.pprint(getAr("Joyous"))
# print(latexPrint("Joyous"))
for word in sys.argv[1:]:
    # print(word)
    # print(type(word))
    print(latexPrint(word))
