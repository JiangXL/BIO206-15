#!/bin/bash

## Book info
bookname="Cell Biology"                                                        
nowtime="`date +%Y-%m-%d`"                                                      
newbookname=$bookname" ("$nowtime")"""
author="Yuejian Mo(collete)"

## add pandoc tag 
echo "%"$newbookname > title.txt
echo "%"$author >> title.txt

## markdown to epub
pandoc -o CellBiology.epub title.txt \
README.md \
1.Introduction.md \
2.VisualizingCells.md \
3.MethodtoStudyCell.md \
4.MembraneStructure.md \
5.MembraneTransport.md \
6.TransportofMacromoleculesI.md \
7.TransportofMacromoleculesII.md \
8.MitochrondrimChloroplast.md \
9.RegulationofProtein.md \
10.CellCommunicationI.md \
11.CellCommunicationII.md \
12.Cytoskeleton+CellMovementI.md \
13.Cytoskeleton+CellMovementII.md \
14.CellCycle_I.md \
15.CellCycle_II.md \
16.Apoptosis.md \
17.Autophagy.md \
18.IntergratingCellintoTissuesI.md \
19.IntergratingCellintoTissuesII.md \
21.CancerI.md \

echo "Markdown to epub done"

## epub ==> mobi
kindlegen CellBiology.epub > /dev/null
rm CellBiology.epub
echo "Epub to mobi done"

## send book to kindle mailbox
echo $newbookname | neomutt -s "$newbookname"  976602663@kindle.cn -a CellBiology.mobi
echo "Sent done"
rm title.txt

# Refer
#[epub to mobi]-http://hshsh.me/post/2014-01-13-make-beautiful-ebooks-with-pandoc/

