#!/usr/bin/bash

source /docker-scripts/docker-convert-util.sh

inputDir="$INPUT_INPUTDIR"
outputDir="$INPUT_OUTPUTDIR"
epub="$INPUT_GENERATEEPUB"
pdf="$INPUT_GENERATEPDF"

mkdir $outputPath

if [ $epub = true ]; then
    convertFolderTo "epub" "$inputDir" "$outputDir"
fi


if [ $pdf = true ]; then
    convertFolderTo "pdf" "$inputDir" "$outputDir"
fi
