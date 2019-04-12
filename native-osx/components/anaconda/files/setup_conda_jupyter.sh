#!/bin/bash
set -x
set -v
set -e

conda install jupyter nb_conda nbpresent -y --quiet
conda install nbbrowserpdf -y --quiet
# The following line should work, but downgrades everything to py2.7 !?
# conda install --channel anaconda-nb-extensions anaconda-nb-extensions
# thus better use the jupyter extensions:

# either let conda do everything
conda install --channel conda-forge jupyter_contrib_nbextensions -y --quiet
# or, manually install both packages and css&js
# pip install jupyter_contrib_nbextensions already done using conda
#jupyter contrib nbextension install

# toc2 didn't work, this did:
# jupyter nbextension install --system https://rawgithub.com/minrk/ipython_extensions/master/nbextensions/toc.js
# curl -L https://rawgithub.com/minrk/ipython_extensions/master/nbextensions/toc.css > $(jupyter --data-dir)/nbextensions/toc.css
# jupyter nbextension enable toc
jupyter nbextension enable toc2/main --sys-prefix

# notebook diff
conda install nbdime nodejs -y --quiet
nbdime reg-extensions
jupyter nbextension enable nbdime --py --sys-prefix

# other extensions
jupyter nbextension enable freeze/main --sys-prefix
jupyter nbextension enable hide_input/main --sys-prefix
jupyter nbextension enable hide_input_all/main --sys-prefix
jupyter nbextension enable printview/main --sys-prefix
jupyter nbextension enable codefolding/main --sys-prefix
jupyter nbextension enable varInspector/main --sys-prefix

# code prettify
conda install yapf -y --quiet
jupyter nbextension enable code_prettify/code_prettify --sys-prefix

# should already be done by the full contrib
# pip install jupyter_nbextensions_configurator
jupyter nbextensions_configurator enable --sys-prefix

# disable annoying extensions
jupyter nbextension disable toc
jupyter nbextension disable toc --sys-prefix
jupyter nbextension disable nbpresent/js/nbpresent.min

# fix duplicate installs
jupyter contrib nbextension uninstall --user

