#!/bin/bash

JAD_OPTS=" -lnc -nonlb -ff -r -s .java -o "
CLEAR_CLASS_FILES_AFTERWARDS="true"

function usage {
  echo "Usage: massjad.sh [some_file.jar]"
}

if [ "x$1" == "x" ]; then
  usage;
  exit 1;
fi

echo "Massjadding jar file: $1"

unzip $1

for i in `find . -name "*.class"`; do
  echo $i; 
  jad $JAD_OPTS $i; 
done

if [ $CLEAR_CLASS_FILES_AFTERWARDS == "true" ]; then
    echo "Clearing class files...";
    for i in `find . -name "*.class"`; do
	rm $i;
    done
fi
