#!/bin/bash
gcc -w -lefence -g -DDEBUG -static -lpthread -pthread -O3 src/*.c -o loader.dbg
