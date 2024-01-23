# Template::Plugin::XML::Feed - Template Toolkit plugin for XML::Feed

[![Build Status](https://github.com/davorg-cpan/template-plugin-xml-feed/actions/workflows/perltest.yml/badge.svg?branch=master)](https://github.com/davorg-cpan/template-plugin-xml-feed/actions/workflows/perltest.yml) [![Coverage Status](https://coveralls.io/repos/github/davorg-cpan/template-plugin-xml-feed/badge.svg?branch=master)](https://coveralls.io/github/davorg-cpan/template-plugin-xml-feed?branch=master)

This [Template Toolkit](http://www.template-toolkit.org/) plugin provides a
simple interface to the `XML::Feed` module and hence allows information from
an Atom or RSS feed to be used within a Template Toolkit template.

## Installation

The simplest way to install this module is to use
[cpanm](https://metacpan.org/pod/App::cpanminus):

```
$ cpanm Template::Plugin::XML::Feed
```

However, if you downloaded the tarball directly, then you can install the
module in the traditional manner:

```
$ tar -xvzf Template-Plugin-XML-Feed-vx.y.z.tar.gz
$ cd Template-Plugin-XML-Feed-vx.y.z
$ perl Makefile.PL
$ make
$ make test
$ make install
```

## Usage

```
[% USE news = XML.Feed('news.rdf') %]

[% FOREACH item IN news.items %]
   [% item.title %]
   [% item.link  %]
[% END %]
```

In this example, the RSS feed file `news.rdf` is read into the `news` variable
and then for each news item within the feed, the title and link for that item
are added to the rendered output of the template.

For more information about `Template::Plugin::XML::Feed` see its documentation
by running `perldoc`:

```
$ perldoc Template::Plugin::XML::Feed
```

For more information about how to use the [Template
Toolkit](http://www.template-toolkit.org/), see its [online
documentation](http://www.template-toolkit.org/docs/index.html).

## Development

If you want to help development of `Template::Plugin::XML::Feed`, then you'll
first need to fork the [project on
GitHub](https://github.com/davorg/template-plugin-xml-feed).  Then, you can
clone your fork via git:

```
$ git clone git@github.com:<your-github-username>/template-plugin-xml-feed.git
```

To build and test the software locally, you'll need to ensure that
[Module::Build](https://metacpan.org/pod/Module::Build) is installed:

```
$ cpanm Module::Build
```

Then, you can create the `Build` program and build the module:

```
$ perl Build.PL
$ ./Build
```

To run the test suite, simply use the `Build` program's `test` argument:

```
$ ./Build test
```
