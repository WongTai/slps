all:
	make build
	make run

extract:
	../../../extraction/antlr/antlrpp.py java.rsc.g java.prepared.g
	java -cp ${CLASSPATH}:../../../../download/antlrworks-1.1.7.jar:../../../extraction/antlr slps.antlr2bgf.Tool java.prepared.g raw.bgf
	../../../../shared/tools/xbgf post-extraction.xbgf raw.bgf ext.bgf
	../../../../shared/tools/subgrammar ext.bgf compilationUnit grammar.bgf

build:
	java -cp ../../../../download/antlr-3.2.jar antlr.Tool java.g java.tree.g
	javac -cp $$CLASSPATH:../../../../download/antlr-3.2.jar TestIO.java

run:
	java -cp $$CLASSPATH:../../../../download/antlr-3.2.jar TestIO TestIO.java

clean:
	rm -f Java*.java *.class JavaTokenTypes.txt *.smap
