#!/usr/bin/bash

source /docker-scripts/docker-convert-util.sh

inputPath="$INPUT_INPUTPATH"
outputPath="$INPUT_OUTPUTPATH"
epub="$INPUT_GENERATEEPUB"
pdf="$INPUT_GENERATEPDF"

mkdir $outputPath

if [ $epub = true ]; then
    convertFolderToEpub "$inputPath" "$outputPath"
fi


if [ $pdf = true ]; then
    convertFolderToPdf "$inputPath" "$outputPath"
fi
