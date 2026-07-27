target=$(basename $1 .pdf)
pdfcrop ${target}.pdf
crop="${target}-crop.pdf"

pdftk ${crop} burst output ${target}_%02d.pdf

for i in ${target}_[0-9][0-9].pdf; do
	convert -density 100 $i png:$(basename $i .pdf).png
	rm -rf $i
done
