# Typo-Detector
The program performs typo detection and correction for any sentence containing a set of linux commands from the dictionary file.
The program gives suggestions for suspect typos on the basis of least edit distance i.e. words from the dictionary that have the least possible edit distance from the input will be suggested


PERL VERSION: v5.30.0
COMMANDS: ./spellcheck.pl

Examples :   ./spellcheck.pl
             (press enter)
             lx cay whicj
             
             You can interactively select each words correction BY TYPING Y or N if required . 	     In this case the correct sentence could be(based on your choices) : ls cat which 
