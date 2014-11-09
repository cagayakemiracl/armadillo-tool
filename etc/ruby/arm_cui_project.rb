#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

# Copyright (c) 2014 cagayakemiracl All Rights Reserved.
# $Mail: <cagayakemiracl@gmail.com>
require 'fileutils'
require 'dir'

class ArmCuiProject
  CMAKE_LIST = 'CMakeLists.txt'
  MAIN_C = 'main.c'

  ROOT_DIR = File.expand_path '../../', Dir::THIS_DIR # program on ./etc/ruby/
  ETC_MAIN_C_FILE = File.expand_path './etc/' + MAIN_C, ROOT_DIR
  SRC_CMAKE_LIST_FILE = File.expand_path './src/' + CMAKE_LIST, ROOT_DIR

  CMAKE_LIST_DATA = File.read File.expand_path '../' + CMAKE_LIST, Dir::THIS_DIR

  def initialize(target = 'hoge')
    @target = target

    @target_dir =  File.expand_path './src/' + @target, ROOT_DIR
    @target_main_c_file = File.expand_path MAIN_C, @target_dir
    @target_cmake_list_file = File.expand_path CMAKE_LIST, @target_dir

    @cmake_add_dir_data = "add_subdirectory(#{@target})"
  end

  def create
    exit 0 if File.exist? @target_dir

    Dir.mkdir @target_dir
    FileUtils.cp ETC_MAIN_C_FILE, @target_main_c_file
    open(@target_cmake_list_file, 'w') { |f| f.printf CMAKE_LIST_DATA, @target }
    open(SRC_CMAKE_LIST_FILE, 'a') { |f| f.puts @cmake_add_dir_data }

    config ROOT_DIR
  end

  def delete
    exit 0 unless File.exist? @target_dir

    FileUtils.rm_rf @target_dir
    delete_file_data SRC_CMAKE_LIST_FILE, @cmake_add_dir_data

    config ROOT_DIR
  end

  private

  def config(dir)
    FileUtils.cd dir
    system 'cap production config'
  end

  def delete_file_data(file, data)
    file_line = []

    IO.foreach(file) { |line| file_line << line.chomp }
    file_line.delete data
    open(file, 'w') do |f|
      file_line.each { |line| f.puts line }
    end
  end
end
