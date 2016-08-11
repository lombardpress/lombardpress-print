# Lbp::Print

This is a command line gem designed to be used with a separately installed saxon processor, a compatible xslt transformation package, and LaTeX processor.

## Pre-Reqs

Install saxon with brew as follows:

    $ brew install saxon

Make sure you have LaTeX installed. For a Mac, we suggest installing MacTex

## Installation

To install the lbp-print cli from soucrce, follow these steps:

Clone the repo

    $ git clone https://github.com/lombardpress/lbp-print.git

Enter the cloned repo

    $ cd lbp-print

Build the gem with either:

    $ rake build

or

    $ gem build lbp-print.gemspec

If you built with rake install as follows

    $ gem install pkg/lbp-print-0.1.0.gem

If you built with gem install as follows

    $ gem install lbp-print-0.1.0.gem

Once built, run bin/setup as followss

    $ bin/setup

Set up will create a `~/.lbp-print` with the global config file aptly named `config.yaml`

In the newly created config file, you need to set two key value pairs, `output_base` and `xslt_base`.

`output_base` should point to the main directory in which you want to your tex files to be saved.

`xslt_base` should point to the main directory where you will install available xslt packages.

For example you can use the `lbp-print-xslt` for the generic lbp renderings.

These stylesheets should be cloned into `xslt_base` like so

    cd <xslt_base>
    git clone git@github.com:jeffreycwitt/lbp-print-xslt.git

Anyone else can make their own stylesheets and these can then be used by the community via lbp-print.

## Usage

Once set up, you can invoke a transformation as follows:

`cd` into the directory containing the file you wish to convert, then run `lbp-print tex` with the appropriate parameters. The require parameters are just the name of the file to be converted:

    lbp-print tex <filename>

The script also takes the following optional parameters:

```
Options:
  [--pdf-output], [--no-pdf-output]  # If this is given, the tex-file will be
                                     # compiled with pdflatex.
                                     # Default: false
  [--output-parent=OUTPUT_PARENT]    # A directory name inside the `output_base`
                                     # directory where the files will be put.
                                     # Default: examples
  [--package=PACKAGE]                # The xslt package used for processing the
                                     # XML file. This package must be a
                                     # directory in the `xslt_base` directory.
                                     # Default: lbp-print-xslt
  [--type=TYPE]                      # Indicate whether the processor converts a
                                     # file encoded according to the diplomatic
                                     # of critical LBP schema.
                                     # Default: critical
  [--schema=SCHEMA]                  # Indicate which version of the LBP schema
                                     # the XML is compliant with.
                                     # Default: 1.0.0
```

So a minimal real world example would be:

    lbp-print tex penn_wdr-l4d18

An example with some of the optional parameters specified would look like this:

    lbp-print tex penn_wdr-l4d18 --output-parent=rothwellcommentary \\
        --package=lbp-print-xslt --type=diplomatic --schema=0.0.0

The precedence of defining the optional parameters are the following:

1. If the optional parameters have a value, use that.
2. If the value can be indicated in the XML-file, get them. That is the case for:
  * `--type`, which is given in the `/TEI/text[1]/@type` attribute, i.e. the `@type` attribute of the first `text`-element (the highest level text element, sibling of `teiHeader`)
  * `--schema`, which is given as the numeric value after the last dash in `/TEI/teiHeader/encodingDesc[1]/schemaRef/@n`. So for example `lbp-critical-1.0.0` would yield `1.0.0`.
3. If the value is given in the config file (~/.lbp-print/config.yaml), use that.
4. If no optional parameter is given, use the default.

The defaults in the config-file are set up as follows:

    default_params:
      output_parent: examples
      package: lbp-print-xslt
      type: critical
      schema: 1.0.0

## Known Available XSLT packages

* [https://github.com/lombardpress/lbp-print-xslt.git](https://github.com/lombardpress/lbp-print-xslt.git)

## Development

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lombardpress/lbp-print.

Anyone can create custom xslt-latex packages that can be used by this command line tool. If you created such a package, please add it to the list of Known Available XSLT packages via a pull request. An xslt package should be divided in folders named for the version of the XML schema they are designed for, and each folder should contain a file called critical.xslt or diplomatic.xslt or may include one of each.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
