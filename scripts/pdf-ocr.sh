#!/bin/sh
# Implements a multithreaded PDF OCR system using GNU parallel and
# tesseract. Supply one argument, the name of the pdf file to process.
tess='tesseract-ocr'
temp_dir="$PWD/ocr_temp_dir"

# Parse args
source_file="$1"
source_name=$(echo $1 | awk -F . '{print $1}')
dest_name="$2"
page_low="$3"
page_high="$4"
out="$5"

# Create a range over all pages or low-high if given
if [ "$page_high" -gt 0 ]; then
	echo "parsed page args..."
else
	pages=$(pdfinfo $1 | grep -i pages | awk '{print $2}')
	let pages=$pages-1
	page_low="0"
	page_high="$pages"
fi
range="seq $page_low $page_high"
echo "Using pages $page_low - $page_high"

# Make temp dir
mkdir -p $temp_dir

# Create list of array indexed files
temp_file='ocr_dump_temp'
cmd="convert -density 300 \"$PWD/$source_file[{}]\" -background white -alpha Off -depth 8 tiff:- |
	$tess stdin $temp_dir/$temp_name{} txt"

$range | parallel -j+0 "$cmd" || exit 1


# Cleanup
rm $temp_name*.pdf
