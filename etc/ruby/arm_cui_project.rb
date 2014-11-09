#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

# Copyright (c) 2014 cagayakemiracl All Rights Reserved.
# $Mail: <cagayakemiracl@gmail.com>
require 'fileutils'
require 'dir'
require 'capistrano'

class ArmCuiProject
  include Capistrano

  CMAKE_LIST = 'CMakeLists.txt'
  MAIN_C = 'main.c'

  ETC_MAIN_C_FILE = File.expand_path MAIN_C, Dir::ETC_DIR
  SRC_CMAKE_LIST_FILE = File.expand_path CMAKE_LIST, Dir::SRC_DIR

  CMAKE_LIST_DATA = File.read File.expand_path CMAKE_LIST, Dir::ETC_DIR

  def initialize(target = 'hoge')
    @target = target

    @target_dir =  File.expand_path './' + @target + '/', Dir::SRC_DIR
    @target_main_c_file = File.expand_path MAIN_C, @target_dir
    @target_cmake_list_file = File.expand_path CMAKE_LIST, @target_dir

    @cmake_add_dir_data = "add_subdirectory(#{@target})"
  end

  def create
    if File.exist? @target_dir
      puts 'Already file exists'
      exit 0
    end

    Dir.mkdir @target_dir
    FileUtils.cp ETC_MAIN_C_FILE, @target_main_c_file
    open(@target_cmake_list_file, 'w') { |f| f.printf CMAKE_LIST_DATA, @target }
    open(SRC_CMAKE_LIST_FILE, 'a') { |f| f.puts @cmake_add_dir_data }

    finalize 'create'
  end

  def delete
    unless File.exist? @target_dir
      puts 'not found file'
      exit 0
    end

    FileUtils.rm_rf @target_dir
    delete_file_data SRC_CMAKE_LIST_FILE, @cmake_add_dir_data

    finalize 'delete'
  end

  private

  def finalize(command)
    puts "#{@target} #{command} success!!"
    config
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
