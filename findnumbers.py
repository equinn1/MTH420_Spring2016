# -*- coding: utf-8 -*-
"""
Created on Tue Feb 16 13:27:44 2016

@author: gquinn
"""

with open('test.txt','r') as f:
    for line in f:
        print(line)
        words=line.split()
        for j in range(0,len(words)):
            print(words[j])
            print(not set(words[j]).isdisjoint(set("0123456789,")))
f.close()