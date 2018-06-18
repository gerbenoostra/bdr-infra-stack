#!/bin/bash
conda install jupyter nb_conda nbpresent -y --quiet
conda install nbbrowserpdf -y --quiet
conda install --channel anaconda-nb-extensions anaconda-nb-extensions

conda install -c conda-forge jupyter_contrib_nbextensions

jupyter nbextension install --user https://rawgithub.com/minrk/ipython_extensions/master/nbextensions/toc.js
curl -L https://rawgithub.com/minrk/ipython_extensions/master/nbextensions/toc.css > $(jupyter --data-dir)/nbextensions/toc.css
jupyter nbextension enable toc

# notebook diff
pip install nbdime
nbdime reg-extensions --user
jupyter nbextension enable nbdime --user --py

# pip install jupyter_contrib_nbextensions already done using conda
jupyter contrib nbextension install --user
jupyter nbextension enable freeze/main  --user
#jupyter nbextension enable toc2/main --user
jupyter nbextension enable hide_input_all/main --user
jupyter nbextension enable printview/main --user

pip install yapf
jupyter nbextension enable code_prettify/code_prettify --user

pip install jupyter_nbextensions_configurator
jupyter nbextensions_configurator enable --user

