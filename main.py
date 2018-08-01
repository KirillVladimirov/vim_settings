import os


def main():
    f = open(os.path.join(os.path.expanduser('~'), '.vimrc'), 'w')
    f.write('set runtimepath+=~/vimrcn\n')
    f.write('source ~/vimrc/vimrc_scripts/basic.vim\n')
    f.write('source ~/vimrc/vimrc_scripts/plugins_config.vim\n')
    f.write('source ~/vimrc/vimrc_scripts/map.vim\n')
    f.close()
    print('Installed the Vim configuration successfully! Enjoy :-)')


main()
