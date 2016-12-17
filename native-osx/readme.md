# Setting up your python environment with spark

First install ansible, using which we install all our tools like conda, and spark binaries. 

     ./install_ansible.sh
     ./provision.sh

Using conda, create your project environments, like for example:

     conda env create -f environment.yml
     
But what if you want spark in that environment, named for example 'myenv'. Run:

     ./spark_kernel.sh myenv
     
This will 

* create jupyter kernels for all spark clients for that environment.
* add a shell script `load_env_spark_version.sh` to your environment's bin folder,
allowing you to easily set the required environment variables.

Thus to set the environment variables in your `conda` environement `myenv`
* SPARK_HOME
* PYSPARK_PYTHON
* PYTHONPATH
* PYTHONSTARTUP
* PYSPARK_SUBMIT_ARGS

All you have to do is to run within your conda environment (thus after running `source activate myenv`):
```bash
load_env_spark_2.0.0-hadoop-2.7.sh
```
To unload the environment var's, simpl run:
```
unload_env
```

If you run jupyter (from any conda or other environment), you will see your newly added kernels
Thus just run:

     jupyter notebook
     
The contab will autodetect the conda environments.
If you've run `spark_kernel.sh` for a specific environment, you will see additional kernels for that environment, one for each installed spark version. Activating those kernels give you that specific spark environment using that specific conda environment.

