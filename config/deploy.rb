# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'my_app_name'
set :repo_url, 'git@example.com:me/my_repo.git'

project_dir = 'cd /media/sf_armadillo-tool && '

task :build do
  on roles(:atde) do
    execute project_dir + 'make'
  end
end

task :refresh do
  on roles(:atde) do
    execute project_dir + 'make clean'
  end
end

task :setting do
  on roles(:atde) do
    execute project_dir + 'cmake .'
  end
end
