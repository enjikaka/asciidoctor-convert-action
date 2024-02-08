#!/usr/bin/bash

function convert_folder_to {
    format=$1
    input_dir=$2
    output_dir=$3

    sub_directories=$(find "$input_dir" -type d -maxdepth 1)

    echo "=== Compiling $format  ==="

    i=1
    for sub_directory in $sub_directories
    do
        input_file="$sub_directory/index.adoc"

        if [ -f "$input_file" ]
        then
            echo "Compiling book $sub_directory to $format..."

            directory="${sub_directory%/}"
            sub_directory_name="${directory##*/}"
            output_file="${output_dir}/${sub_directory_name}.${format}"


            convert_asciidoc_to "$format" "$input_file" "$output_file"
        fi

        i=$((i+1))
    done
}

function convert_asciidoc_to {
    format=$1
    input=$2
    output=$3

    echo "Writing $input to $output"

    if [ "$format" = "epub" ]
    then
        asciidoctor-epub3 "$input" -o "$output"
    elif [ "$format" = "pdf" ]
    then
        asciidoctor-pdf "$input" --theme default-for-print -a media=print -o "print-$output"
        asciidoctor-pdf "$input" --theme default-for-print -a media=press -o "press-$output"
    else
        echo "Unsupported format $format".
        exit 1;
    fi
}
