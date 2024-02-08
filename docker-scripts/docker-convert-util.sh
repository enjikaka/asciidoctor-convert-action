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

    if [ "$format" = "epub" ]
    then
        echo "Writing $input to $output"
        asciidoctor-epub3 "$input" -o "$output"
    elif [ "$format" = "pdf" ]
    then
        print_output=${output/.pdf/.print.pdf}
        prepress_output=${output/.pdf/.prepress.pdf}

        echo "Writing $input to $print_output"
        asciidoctor-pdf --theme default-for-print -a media=print -o "$print_output" "$input"

        echo "Writing $input to $prepress_output"
        asciidoctor-pdf --theme default-for-print -a media=prepress -o "$prepress_output" "$input"
    else
        echo "Unsupported format $format".
        exit 1;
    fi
}
