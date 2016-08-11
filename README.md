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

`cd` into the directory containing the file you wish to convert, then run `lbp-print tex` with the appropriate parameters.

    lbp-print tex <filename> <output_parent> <package> <type> <schema> 

So a real world example would be: 

    lbp-print tex penn_wdr-l4d18 rothwellcommentary lbp-print-xslt diplomatic 0.0.0 

You can add the optin `-p` if you want to also run the `pdflatex` as part of the same command. This is useful if you want an pdf program like skim to auto update after every transformation.

    lbp-print tex -p penn_wdr-l4d18 rothwellcommentary lbp-print-xslt diplomatic 0.0.0 

Defaults are also set for every paramater but the first. These are: 

    output_parent="examples", package="lbp-print-xslt", type="critical", schema="1.0.0"

Thus, using existing defaults, it is possible to run a conversion with something as simple as:

    lbp-print tex -p wdr-l4d18

Personal defaults can be set in the `config.yaml` file as follows:

    default_params: 
      output_parent: examples
      package: lbp-print-xslt
      type: critical
      schema: 1.0.0

Note that type and schema will first attempt to be to retrieved from the source document. If not type or schema designation is found, these values will then be retrieved from the `default_params` key

## Known Available XSLT packages

* [https://github.com/lombardpress/lbp-print-xslt.git](https://github.com/lombardpress/lbp-print-xslt.git)

## Development

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lombardpress/lbp-print.

Anyone can create custom xslt-latex packages that can be used by this command line tool. If you created such a package, please add it to the list of Known Available XSLT packages via a pull request. An xslt package should be divided in folders named for the version of the XML schema they are designed for, and each folder should contain a file called critical.xslt or diplomatic.xslt or may include one of each.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

