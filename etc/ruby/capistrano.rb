#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

# Copyright (c) 2014 cagayakemiracl All Rights Reserved.
# $Mail: <cagayakemiracl@gmail.com>
require 'dir'

module Capistrano
  CAP_FILE_DIR = File.expand_path '../cap/', Dir::THIS_DIR

  def call_cap(command)
    FileUtils.cd Dir::ROOT_DIR
    system "cap production #{command}"
  end

  def config
    call_cap('config')
  end

  def build
    call_cap('build')
  end

  def clean
    call_cap('clean')
  end

  module_function :config, :build, :clean
end
