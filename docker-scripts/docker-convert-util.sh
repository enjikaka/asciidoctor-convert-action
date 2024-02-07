#!/usr/bin/bash

convertFolderToEpub() {
    inputPath=$1
    outputPath=$1

    echo "=== Compiling ePUB  ==="

    i=1
    numberOfFiles=$(find "$inputPath" -type f -name "*.adoc" | wc -l)
    for f in $(find "$inputPath" -type f -name "*.adoc"); do
        echo "[$((i*100 / numberOfFiles)) %] compiling $f"
        convertAdocToEpub "$f" "$outputPath"

        i=$((i+1))
    done
}

convertAdocToEpub() {
  file=$1
  outputPath=$2
  filename="${file%.*}"

  echo "Writing ${filename}.epub to ${outputPath}/${filename}"

  asciidoctor-epub3 "$file" -o "${outputPath}/${filename}"
}

convertFolderToPdf() {
    inputPath=$1
    outputPath=$1

    echo "=== Compiling ePUB  ==="

    i=1
    numberOfFiles=$(find "$inputPath" -type f -name "*.adoc" | wc -l)
    for f in $(find "$inputPath" -type f -name "*.adoc"); do
        echo "[$((i*100 / numberOfFiles)) %] Compiling $f"
        convertAdocToPdf "$f" "$outputPath"

        i=$((i+1))
    done
}

convertAdocToPdf() {
  file=$1
  outputPath=$2
  filename="${file%.*}"

  echo "Writing ${filename}.pdf to ${outputPath}/${filename}"

  asciidoctor-pdf "$file" -o "${outputPath}/${filename}"
}