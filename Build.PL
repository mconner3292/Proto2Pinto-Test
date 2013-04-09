#!/usr/bin/perl

use strict;
use warnings;

use Module::Build;

Module::Build->new(
  module_name        => 'Proto2Pinto::Test',
  dist_abstract      => 'A test distro to add Protocol Buffers dists to Pinto',
  dist_author        => 'Montgomery Conner <montgomery.conner@gmail.com>',
  dist_version_from  => 'lib/Proto2Pinto/Test.pm',
  needs_compiler     => 1,
  meta_merge         => {
    provides                => {
      'Proto2Pinto::Test::Common::Cookie' => {
        file    => 'lib/Proto2Pinto/Test/Common/Cookie.pm',
        version => '1.0',
      },
      'Proto2Pinto::Test::Common::Status' => {
        file    => 'lib/Proto2Pinto/Test/Common/Status.pm',
        version => '1.0',
      },
      'Proto2Pinto::Test::Common::NameValue' => {
        file    => 'lib/Proto2Pinto/Test/Common/NameValue.pm',
        version => '1.0',
      },
    },
  },
  configure_requires => { 
    'Module::Build'         => 0.40
  },
  add_to_cleanup      => [ 'Proto2Pinto-Test-*' ],
  # We likely need some mechanism for saying that
  # this depends on protobuf and perlxs...
  # even if just specifying the compiler flags
  # explicitly. At present this is all handled by
  # an arcane custom (darkpan) subclass of Module::Build.
  requires           => { }
)->create_build_script;

