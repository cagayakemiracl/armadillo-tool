require 'yaml'
require 'pathname'

THIS_DIR = File.expand_path File.dirname Pathname.new(__FILE__).realpath
# ./src/hoge/config/deplay
ROOT_DIR = File.expand_path '../../../../', THIS_DIR
CONFIG_YAML_FILE = File.expand_path './config.yaml', ROOT_DIR

config = YAML.load_file CONFIG_YAML_FILE
ip = config['ip']

server ip, user: 'guest', roles: 'armadillo'
