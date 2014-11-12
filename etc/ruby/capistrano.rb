#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

# Copyright (c) 2014 cagayakemiracl All Rights Reserved.
# $Mail: <cagayakemiracl@gmail.com>
require 'dir'

module Capistrano
  CAP_FILE_DIR = File.expand_path '../cap/', Dir::THIS_DIR

  def call_cap(command, dir)
    puts "#{command} start"
    FileUtils.cd dir
    system "cap production #{command}"
    puts "#{command} end"
  end

  def setting(dir)
    call_cap 'setting', dir
  end

  def build(dir)
    call_cap 'build', dir
  end

  def refresh(dir)
    call_cap 'refresh', dir
  end

  def go(dir)
    call_cap 'go', dir
  end

  module_function :call_cap, :setting, :build, :refresh, :go
end
