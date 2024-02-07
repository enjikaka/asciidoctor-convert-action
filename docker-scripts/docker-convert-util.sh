#!/usr/bin/bash

convertFolderToEpub() {
    inputPath=$1
    outputDir=$2

    echo "=== Compiling ePUB  ==="

    i=1
    for subdir in $(find "$inputPath" -type d -maxdepth 1); do
        convertAdocToEpub "$subdir" "$outputDir"

        i=$((i+1))
    done
}

convertAdocToEpub() {
  subdir=$1
  outputDir=$2
  dir="${subdir%/}"
  subdir="${dir##*/}"
  outputPath="${outputDir}/${subdir}.epub"
  inputFile="$subdir/index.adoc"

  echo "Writing $inputFile to $outputPath"

  asciidoctor-epub3 "$inputFile" -o "$outputPath"
}

convertFolderToPdf() {
    inputPath=$1
    outputDir=$2

    echo "=== Compiling PDF  ==="

    i=1
    for subdir in $(find "$inputPath" -type d -maxdepth 1); do
        convertAdocToPdf "$f" "$outputDir"

        i=$((i+1))
    done
}

convertAdocToPdf() {
  subdir=$1
  outputDir=$2
  dir="${subdir%/}"
  subdir="${dir##*/}"
  outputPath="${outputDir}/${subdir}.pdf"
  inputFile="$subdir/index.adoc"

  echo "Writing $inputFile to $outputPath"

  asciidoctor-pdf "$inputFile" -o "$outputPath"
}
