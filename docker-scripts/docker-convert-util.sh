#!/usr/bin/bash

convertFolderToEpub() {
    inputPath=$1
    outputDir=$2

    echo "=== Compiling ePUB  ==="

    i=1
    for subdir in $(find "$inputPath" -type d -maxdepth 1); do
        convertAdocToEpub "$f" "$outputDir"

        i=$((i+1))
    done
}

convertAdocToEpub() {
  file=$1
  outputDir=$2
  dir="${file%/}"
  subdir="${dir##*/}"
  outputPath="${outputDir}/${subdir}.epub"

  echo "Writing $filename to $outputPath"

  asciidoctor-epub3 "$file" -o "$outputPath"
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
  file=$1
  outputDir=$2
  dir="${file%/}"
  subdir="${dir##*/}"
  outputPath="${outputDir}/${subdir}.pdf"

  echo "Writing $filename to $outputPath"

  asciidoctor-pdf "$file" -o "$outputPath"
}
