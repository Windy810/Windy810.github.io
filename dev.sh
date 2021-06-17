docker run --rm -v $(pwd):/srv/jekyll -v $(pwd)/_site:/srv/jekyll/_site -p 80:4000 --privileged jekyll/jekyll:latest /bin/bash -c "chmod 777 /srv/jekyll/ && jekyll serve --watch --force_polling"