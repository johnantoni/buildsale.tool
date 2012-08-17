## About

Simple command-line tool to build all the SKU directories needed for a
particular sale

## Requirements

* Ruby 1.9.3

## How to

To use simply fire up the terminal and type 'buildsale' a prompt will
appear asking you to enter the name of your sale, e.g. "Simply
Cushions", the number of SKU directories you require and the prefix you
want to use for those SKU directories, e.g. "SSA". After which it will
create directories in the format below ready for the relevant images to
be dropped in.

Simply Cushions/
  Main Image
  Skinny Image
  SSA1
    Main Image
    Other Images
  SSA2
    ...
  ...

These will be placed in the "Flash Sales" directory in your home folder,
if one doesn't exist then one will be created for you.

If you already sale created and simply want to add extra SKU's to it
then make sure it's in the "Flash Sales" directory and run the buildsale
script. At the prompt enter the same name of your sale directory & the
same prefix then enter the from & to numbers you want for the SKU's to
be created.

The tool is designed to create directories and doesn't delete any if
they already exist, this way the chances of human error are minimised.

Happy sales,

