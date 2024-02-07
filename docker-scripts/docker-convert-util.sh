#!/usr/bin/bash

convertFolderToEpub() {
    inputPath=$1
    outputDir=$1

    echo "=== Compiling ePUB  ==="

    i=1
    numberOfFiles=$(find "$inputPath" -type f -name "*.adoc" | wc -l)
    for f in $(find "$inputPath" -type f -name "*.adoc"); do
        echo "[$((i*100 / numberOfFiles)) %] Compiling $f"
        convertAdocToEpub "$f" "$outputDir"

        i=$((i+1))
    done
}

convertAdocToEpub() {
  file=$1
  outputDir=$2
  fullname="${file##*/}"
  filename="${fullname%.*}"
  outputPath="${outputDir}/${filename}.epub"

  echo "Writing $filename to $outputPath"

  asciidoctor-epub3 "$file" -o "$outputPath"
}

convertFolderToPdf() {
    inputPath=$1
    outputDir=$1

    echo "=== Compiling PDF  ==="

    i=1
    numberOfFiles=$(find "$inputPath" -type f -name "*.adoc" | wc -l)
    for f in $(find "$inputPath" -type f -name "*.adoc"); do
        echo "[$((i*100 / numberOfFiles)) %] Compiling $f"
        convertAdocToPdf "$f" "$outputDir"

        i=$((i+1))
    done
}

convertAdocToPdf() {
  file=$1
  outputDir=$2
  fullname="${file##*/}"
  filename="${fullname%.*}"
  outputPath="${outputDir}/${filename}.pdf"

  echo "Writing $filename to $outputPath"

  asciidoctor-pdf "$file" -o "$outputPath"
}