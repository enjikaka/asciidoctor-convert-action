#!/usr/bin/bash

source /docker-scripts/docker-convert-util.sh

inputPath="$INPUT_INPUTPATH"
outputDir="$INPUT_OUTPUTDIR"
epub="$INPUT_GENERATEEPUB"
pdf="$INPUT_GENERATEPDF"

mkdir $outputPath

if [ $epub = true ]; then
    convertFolderToEpub "$inputPath" "$outputDir"
fi


if [ $pdf = true ]; then
    convertFolderToPdf "$inputPath" "$outputDir"
fi
