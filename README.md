# Lbp::Print

This is a command line gem designed to be used with a separately installed saxon processor, a compatible xslt transformation package, and LaTeX processor.

## Pre-Reqs

Install saxon with brew as follows:

    $ brew install saxon

Make sure you have LaTeX installed. For a Mac, we suggest installing MacTex

## Installation

To install the lbp-print cli, run:

    $ gem specific_install https://github.com/lombardpress/lbp-print.git 

Then, 

    $ cd lbp-print
    $ bin/setup

Set up will create a `~/.lbp-print` with the global config file aptly named `config.rb`

In the newly created config file, you need to set two variables, `$output_base` and `$xslt_base`.

`$output_base` should point to the main directory in which you want to your tex files to be saved.

`$output-base` should point to the main directory where you will install available xslt packages.

For example you can use the `lbp-print-xslt` for the generic lbp renderings.

These stylesheets should be cloned into `$xslt_base` like so

    cd <xslt_base>
    git clone git@github.com:jeffreycwitt/lbp-print-xslt.git

Anyone else can make their own stylesheets and these can then be used by the community via lbp-print cli.

## Usage

Once set up, you can invoke a transformation as follows:

`cd` into the directory containing the file you wish to convert, then run `lbp-print tex` with the appropriate parameters.

    lbp-print tex <filename> <diplomatic/critical> <validating-schema-number-such-as0.0.0> <desired-xslt-package> <a-parent-folder-which-defaults-to-examples>

So a real world example would be: 

    lbp-print tex penn_wdr-l4d18 diplomatic 0.0.0 lbp-print-xslt rothwellcommentary

## Known Available XSLT packages

* git@github.com:jeffreycwitt/lbp-print-xslt.git

## Development

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lombardpress/lbp-print.

Anyone can create custom xslt-latex packages that can be used by this command line tool. If you created such a package, please add it to the list of Known Available XSLT packages via a pull request. An xslt package should be divided in folders named for the version of the XML schema they are designed for, and each folder should contain a file called critical.xslt or diplomatic.xslt or may include one of each.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

