    function ls --description 'List directory (local override)'
      ls -la $argv
    end

    function la --description 'List contents of directory, including hidden files in directory using long format'
        ls -lah $argv
    end
