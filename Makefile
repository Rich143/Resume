.PHONY: examples

CC = xelatex
OUTPUT_DIR = .
RESUME_DIR = resume
CV_DIR = cv
RESUME_SRCS = $(shell find . -name '*.tex')
CV_SRCS = $(shell find . -name '*.tex')
TEMPLATE_FILE = awesome-cv.cls

all: resume.pdf

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: resume.tex $(RESUME_SRCS) $(TEMPLATE_FILE)
	$(CC) -output-directory=$(OUTPUT_DIR) $<

cv.pdf: cv.tex $(CV_SRCS) $(TEMPLATE_FILE)
	$(CC) -output-directory=$(OUTPUT_DIR) $<

coverletter.pdf: coverletter.tex $(TEMPLATE_FILE)
	$(CC) -output-directory=$(OUTPUT_DIR) $<

clean:
	rm -rf $(OUTPUT_DIR)/*.pdf
