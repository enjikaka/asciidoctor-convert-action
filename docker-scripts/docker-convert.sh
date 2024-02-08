#!/usr/bin/bash

source /docker-scripts/docker-convert-util.sh

input_dir="$INPUT_INPUTDIR"
output_dir="$INPUT_OUTPUTDIR"
generate_epub="$INPUT_GENERATEEPUB"
generate_pdf="$INPUT_GENERATEPDF"

mkdir "$output_dir"

if [ "$generate_epub" = true ]; then
    convert_folder_to "epub" "$input_dir" "$output_dir"
fi


if [ "$generate_pdf" = true ]; then
    convert_folder_to "pdf" "$input_dir" "$output_dir"
fi
