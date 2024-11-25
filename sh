#!/bin/bash


# Output file for extracted affinities
output_file="./affinity_values.txt"

# Ensure the output file is empty
> "$output_file"

# Loop through each file in the directory
for input_file in *.txt; do

# Check if the file exists
if [[ ! -f "$input_file" ]]; then
  echo "File not found: $input_file"
  exit 1

fi

# Extract and print characters 13-18 from line 28
line_number=28
char_start=13
char_end=18
   # Use sed to extract line 28, then cut to get the desired characters
    affinity=$(sed -n "${line_number}p" "$input_file" | cut -c${char_start}-${char_end})
    
    if [[ -n "$affinity" ]]; then
        echo "File: $input_file -> Affinity: $affinity" >> "$output_file"
    else
        echo "File: $input_file -> No affinity value found" >> "$output_file"
    fi
done

echo "Affinity values have been extracted to $output_file"

grep "Affinity:" affinity_values.txt | sort -k5 -n -o Sortedresult | cat <(grep "No affinity" affinity_values.txt) -
