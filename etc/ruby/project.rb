#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

# Copyright (c) 2014 cagayakemiracl All Rights Reserved.
# $Mail: <cagayakemiracl@gmail.com>

require 'pathname'
$LOAD_PATH.unshift File.dirname Pathname.new(__FILE__).realpath

require 'arm_cui_project'
require 'capistrano'
require 'optparse'

params = ARGV.getopts(
  '',
  'build',
  'create',
  'delete',
  'ftp',
  'ip:10.134.31.100',
  'name:hoge',
  'refresh',
  'setting')

project = ArmCuiProject.new params['name']

project.delete if params['delete']
project.create if params['create']
Capistrano.setting if params['setting']
Capistrano.refresh if params['refresh']
Capistrano.build if params['build']
project.ftp params['ip'] if params['ftp']
