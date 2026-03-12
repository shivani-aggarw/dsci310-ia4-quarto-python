# author: Jordan Bourak & Tiffany Timbers
# date: 2021-11-22

all: results/horse_pop_plot_largest_sd.png \
	results/horse_pops_plot.png \
	results/horses_spread.csv \
	docs/index.html \
	docs/index.pdf



# generate figures and objects for report
results/horse_pop_plot_largest_sd.png results/horse_pops_plot.png results/horses_spread.csv: source/generate_figures.py
	python source/generate_figures.py --input_dir="data/00030067-eng.csv" \
		--out_dir="results"

# render quarto report in HTML and PDF
docs/index.html: results reports/index.qmd
	quarto render reports/index.qmd --to html --output-dir ../docs

docs/index.pdf: results reports/index.qmd
	quarto render reports/index.qmd --to pdf --output-dir ../docs

# clean
clean:
	rm -rf results
	rm -rf docs/index.html \
		docs/index.pdf \
		docs/index_files
	rm -rf docs