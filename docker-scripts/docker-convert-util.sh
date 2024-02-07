#!/usr/bin/bash

convertFolderToEpub() {
    inputPath=$1
    outputDir=$2

    echo "=== Compiling ePUB  ==="

    i=1
    for subdir in $(find "$inputPath" -type d -maxdepth 1); do
        convertAdocToEpub "$inputPath" "$subdir" "$outputDir"

        i=$((i+1))
    done
}

convertAdocToEpub() {
  inputPath=$1
  subdir=$2
  outputDir=$3
  dir="${subdir%/}"
  subdirname="${dir##*/}"
  outputPath="${outputDir}/${subdirname}.epub"
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
        convertAdocToPdf "$inputPath" "$subdir" "$outputDir"

        i=$((i+1))
    done
}

convertAdocToPdf() {
  inputPath=$1
  subdir=$2
  outputDir=$3
  dir="${subdir%/}"
  subdirname="${dir##*/}"
  outputPath="${outputDir}/${subdirname}.pdf"
  inputFile="$subdir/index.adoc"

  echo "Writing $inputFile to $outputPath"

  asciidoctor-pdf "$inputFile" -o "$outputPath"
}
