#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

# Copyright (c) 2014 cagayakemiracl All Rights Reserved.
# $Mail: <cagayakemiracl@gmail.com>

require 'pathname'
$LOAD_PATH.unshift File.dirname Pathname.new(__FILE__).realpath

require 'arm_cui_project'
require 'capistrano'
require 'dir'
require 'optparse'
require 'yaml'

params = ARGV.getopts(
  '',
  'build',
  'create',
  'delete',
  'ftp',
  'go',
  'ip:not_address',
  'name:hoge',
  'refresh',
  'setting')

project = ArmCuiProject.new params['name']
CONFIG_YAML_FILE = File.expand_path './config.yaml', Dir::ROOT_DIR
config = YAML.load_file CONFIG_YAML_FILE

if params['ip'] != 'not_address'
  config['ip'] = params['ip']
  open(CONFIG_YAML_FILE, 'w') do |f|
    YAML.dump(config, f)
  end
end

project.delete if params['delete']
project.create if params['create']
project.setting if params['setting']
project.refresh if params['refresh']
project.build if params['build']
project.ftp config['ip'] if params['ftp']

project.go if params['go']
