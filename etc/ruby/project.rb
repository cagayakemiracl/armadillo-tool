#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

# Copyright (c) 2014 cagayakemiracl All Rights Reserved.
# $Mail: <cagayakemiracl@gmail.com>

require 'pathname'
$LOAD_PATH.unshift File.dirname Pathname.new(__FILE__).realpath

require 'arm_cui_project'
require 'capistrano'
require 'optparse'

params = ARGV.getopts('', 'build', 'create', 'delete', 'name:hoge', 'refresh')
project = ArmCuiProject.new params['name']

Capistrano.build if params['build']
project.create if params['create']
project.delete if params['delete']
Capistrano.refresh if params['refresh']
