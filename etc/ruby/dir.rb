#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

# Copyright (c) 2014 cagayakemiracl All Rights Reserved.
# $Mail: <cagayakemiracl@gmail.com>
require 'pathname'

class Dir
  THIS_DIR = File.expand_path File.dirname Pathname.new(__FILE__).realpath
  ROOT_DIR = File.expand_path '../../', THIS_DIR # program on ./etc/ruby/
end
