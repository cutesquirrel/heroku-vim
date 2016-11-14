require 'heroku/helpers'
require 'heroku/command'
require 'heroku/command/run'

class Heroku::Command::Vim < Heroku::Command::Run

  # vim
  # 
  # Run bash on heroku with vim
  #  
  def index
    run_attached(vim_cmd)
  end

  protected

  def vim_cmd
    <<-CMD
mkdir vim
curl https://s3.amazonaws.com/heroku-vim/vim-7.3.tar.gz --location --silent | tar xz -C vim
export PATH=$PATH:/app/vim/bin
ln -s /app/vim/bin/vim /app/vim/bin/vi
printf "set nocompatible\nset backspace=2" > ~/.vimrc

printf "alias l='ls -alh'" >> ~/.bashrc

bash
    CMD
  end

end
