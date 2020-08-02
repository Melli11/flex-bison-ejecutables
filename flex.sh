#!/bin/bash

if [ -n "$2" ]; then
    EJECUTABLE=$2
else
    EJECUTABLE="a.out"
fi

if [ -n "$1" ]; then
    [ -f $EJECUTABLE ] && rm $EJECUTABLE
    echo "generando codigo c..."
    flex $1
    if [ -f lex.yy.c ]; then
        echo "lex.yy.c creado."
        echo "compilando y enlazando con libfl.a..."
        gcc lex.yy.c -lfl -o $EJECUTABLE
        if [ -f $EJECUTABLE ]; then
            echo "$EJECUTABLE creado."
            echo "abriendo $EJECUTABLE..."
            ./$EJECUTABLE        
        else
            rm lex.yy.c        
        fi
    fi
else
    echo "se esperaba archivo de especificacion"
fi