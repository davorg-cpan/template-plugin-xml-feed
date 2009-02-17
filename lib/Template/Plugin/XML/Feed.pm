package Template::Plugin::XML::RSS;

use strict;
use warnings;
use base 'Template::Plugin';
use XML::Feed;

our $VERSION = 0.01;

sub new {
  my ($class, $context, $filename) = @_;

  return $class->fail('No filename specified')
    unless $filename;
    
  my $rss = XML::Feed->new
    or return $class->fail('failed to create XML::RSS');

  # Attempt to determine if $filename is an XML string or
  # a filename.  Based on code from the XML.XPath plugin.
  eval {
    if ($filename =~ /\</) {
      $rss->parse($filename);
    } else {
      $rss->parsefile($filename)
    }
  }

  $@ && return $class->fail("failed to parse $filename: $@");
    
  return $rss;
}

1;

__END__

=head1 NAME

Template::Plugin::XML::Feed - Plugin interface to XML::Feed

=head1 SYNOPSIS

    [% USE news = XML.Feed('news.rdf') %]
   
    [% FOREACH item IN news.items %]
       [% item.title %]
       [% item.link  %]
    [% END %]

=head1 DESCRIPTION

This Template Toolkit plugin provides a simple interface to the
XML::Feed module.

    [% USE news = XML.Feed('mysite.rdf') %]

It creates an XML::Feed object, which is then used to parse the RSS or Atom
file specified as a parameter in the USE directive.  A reference to
the XML::Feed object is then returned.

The attributes of the channel and image elements can be retrieved directly
from the plugin object using the familiar dotted compound notation:

    [% news.channel.title  %]
    [% news.channel.link   %]
    [% news.channel.etc... %]  

    [% news.image.title    %]
    [% news.image.url      %]
    [% news.image.link     %]
    [% news.image.etc...   %]  

The list of news items can be retrieved using the 'items' method:

    [% FOREACH item IN news.items %]
       [% item.title %]
       [% item.link  %]
    [% END %]

=head1 AUTHORS

This plugin was written by Dave Cross and was heavily based on the code
for L<Template::Plugin::XML::RSS> by Andy Wardley.

The XML::Feed module, which implements all of the functionality that
this plugin delegates to, was written by Benjamin Trott and is now maintained
by Simon Wardley.

=head1 COPYRIGHT

Copyright (C) 2009 Magnum Solutions Ltd.  All Rights Reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=head1 SEE ALSO

L<Template::Plugin>, L<XML::Feed>

