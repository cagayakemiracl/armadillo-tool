# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'my_app_name'
set :repo_url, 'git@example.com:me/my_repo.git'

ftp_dir = 'cd /home/ftp/pub && '

set :use_sudo, true
set :sudo, 'sudo -u root -i'

task :go do
  on roles(:armadillo) do
    execute ftp_dir + "#{sudo} chmod +x %s && #{sudo} ./%s"
  end
end
