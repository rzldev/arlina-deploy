#!/bin/bash

# Input .env file
input_file=".env"

# Read the input file line by line
while IFS= read -r line || [ -n "$line" ]; do
    # Check if the line contains a section name
    if [[ $line == "## "* ]]; then
        # Extract the section name
        section_name=$(echo "$line" | sed -n 's/^## \(.*\)/\1/p')

        # Output file for the current section
        output_file=".env.$(echo "$section_name" | tr '[:upper:]' '[:lower:]')"  # Convert to lowercase for the filename

        # Reset the output file
        > "$output_file"

        # Write the section line to the output file
        echo "$line" >> "$output_file"
    else
        # Write the line to the current output file
        echo "$line" >> "$output_file"
    fi
done < "$input_file"

echo "Separation completed. Check .env.* files for each section."
