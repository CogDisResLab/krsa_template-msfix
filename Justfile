# Justfile for R Analysis Project with renv Integration

# Default target when no specific target is specified
default: all

# Render all Rmd files
render:
    #!/usr/bin/env bash
    # Find Rmd files in the top-level directory, excluding those starting with underscore
    /usr/bin/env find . -maxdepth 1 -type f -name "*.Rmd" ! -name "_*" | while read -r rmd_file; do
        if [ -f "$rmd_file" ]; then
            echo "Rendering $rmd_file"
            quarto render "$rmd_file"
        fi
    done

# Run specific R script analyses
uka:
    Rscript uka_analysis.R
    Rscript uka_analysis_single_sample.R

creeden:
    Rscript creedenzymatic_analysis.R
    Rscript generate_quartile_plots.R

# Workflow for statistical analysis
analysis: uka creeden

# Utility to generate new analysis from template
new-analysis NAME chiptype='STK' prefix='kinome':
    #!/usr/bin/env bash
    # Copy template
    cp _template.Rmd "{{NAME}}.Rmd"

    # Update chip_type parameter
    perl -pi -e "s/chip_type:.*$/chip_type: {{chiptype}}/" "{{NAME}}.Rmd"

    # Update prefix parameter
    perl -pi -e "s/prefix:.*$/prefix: {{prefix}}/" "{{NAME}}.Rmd"


# Clean up generated files and artifacts
clean:
    #!/usr/bin/env bash
    # Use full path to find to bypass potential aliases
    /usr/bin/env find . -type f \( -name "*.html" -o -name "*.docx" -o -name "*.pdf" \) -delete
    /usr/bin/env find results/ -type f -name "*.csv" -delete
    /usr/bin/env find figures/ -type f \( -name "*.png" -o -name "*.svg" \) -delete
    /usr/bin/env find datastore/ -type f -name "*.RData" -delete

    # Remove cache and freeze directories
    rm -rf _cache/
    rm -rf _freeze/

# List available targets
list:
    @just --list

# Run all tasks in sequence
all: restore render analysis

# Aliases for common tasks
alias a := all
alias c := clean
alias n := new-analysis
alias u := update
alias s := snapshot
