# install packages
RUN echo 'install.packages(c("rvest", "plyr", "purrr", "googlesheets", "stringr", "dplyr", "httr"), repos="http://cran.us.r-project.org", dependencies=TRUE)' > /tmp/packages.R \
    && Rscript /tmp/packages.R

# create an R user
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
    && chown -R user:user $HOME

WORKDIR $HOME
USER user

# set the command
CMD ["R"]