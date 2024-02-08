#!/usr/bin/bash

source /docker-scripts/docker-convert-util.sh

input_books="$INPUT_INPUTBOOKS"
input_book="$INPUT_INPUTBOOK"
output_name="$INPUT_OUTPUTNAME"
output_dir="$INPUT_OUTPUTDIR"
generate_epub="$INPUT_GENERATEEPUB"
generate_pdf="$INPUT_GENERATEPDF"

mkdir "$output_dir"

if [ -n "$input_book" ]
    then
    if [ "$generate_epub" = true ]
    then
        convert_asciidoc_to "epub" "$input_book" "$output_dir/$output_name.epub"
    fi


    if [ "$generate_pdf" = true ]
    then
        convert_asciidoc_to "pdf" "$input_book" "$output_dir/$output_name.pdf"
    fi
fi

if [ -n "$input_books" ]
    then
    if [ "$generate_epub" = true ]
    then
        convert_folder_to "epub" "$input_books" "$output_dir"
    fi


    if [ "$generate_pdf" = true ]
    then
        convert_folder_to "pdf" "$input_books" "$output_dir"
    fi
fi
