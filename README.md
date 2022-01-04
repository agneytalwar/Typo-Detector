# Typo-Detector
The program performs typo detection and correction for any sentence containing a set of linux commands from the dictionary file.
The program gives suggestions for suspect typos on the basis of least edit distance i.e. words from the dictionary that have the least possible edit distance from the input will be suggested<br/>


PERL VERSION: v5.30.0<br/>
COMMANDS: ./spellcheck.pl<br/>

Examples :   ./spellcheck.pl<br/>
             (press enter)<br/>
             lx cay whicj<br/>
             You can interactively select each words correction BY TYPING Y or N if required.<br/>
             In this case the correct sentence could be(based on your choices) : ls cat which <br/>
