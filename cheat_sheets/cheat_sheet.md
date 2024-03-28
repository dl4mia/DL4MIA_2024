# Cheat sheet

# Bash

## Show current directory path

```bash
$ pwd
```

## Print directory content

```bash
$ ls
```

```bash
$ ls -l
```

```bash
$ ll # same as ls -l
```

## Create directory

```bash
$ mkdir <directory name>
```

## Navigate to a directory

```bash
$ cd <directory name>
```

## Navigate backward

```bash
$ cd ..
$ cd ../<other directory>
```

# Conda

## Create new environment

```bash
$ conda create -n <env name> python=<python version>
```

## Activate environment

```bash
$ conda activate <env name>
```

## Deactivate environment

```bash
$ conda deactivate
```

## List environments

```bash
$ conda env list
# or
$ conda info -e
```

## Delete environment

```bash
$ conda env remove -n <package_name>
# or
$ conda remove -n <package_name>

#the previous commands do not remove all packages and links
# add --all at the end to remove everything, as follows:
$ conda remove -n <package_name> --all
```

## Install package (also with pip)

```bash
$ conda install <package>
$ pip install <package>
```

## Install package version

```bash
$ conda install <package>=<version>
$ pip install <package>==<version>
```

## Check installed package version

```bash
$ conda list | grep <package>
# or
$ conda list <package>
```

# SSH tunneling

## Start `ssh` tunneling in the background

```bash
$ ssh -N -f -L <PORT>:localhost:<PORT> <username>@<machine_ip>
# -N: does not execute the remote command, just for forwarding the port
# -f: executes the command in the background
```

## Stopping `ssh` tunnel

For when a process is running in the background and you want to stop it

```bash
$ ps aux | grep ssh
# check the process id of the running ssh command
$ kill <process_id>
```

# Transferring data to and from the VDI

## Cloud storage (GDrive, Dropbox, ownCloud, NextCloud, etc.)

1. In your cloud storage, right-click or open the settings of your folder or file
2. Create a public link and copy this link
3. In your VDI, open the browser (Firefox) and paste the copied link to download you data.
4. Profit!

## Via Command Line Interface

You can directly transfer your data via the terminal using the following commands.

**Important**: you need to have your VPN connected to HT.

```bash
scp /localmachine/path/file <username>@<ip_vdi>:/path/where/to/upload/

#if you want to transfer a whole folder, add -r after scp, as follows
scp -r /localmachine/path/folder_name <username>@<ip_vdi>:/path/where/to/upload/

#example
scp -r /mnt/D/Data/luc_raw_folder nuno.pimpao@10.1.38.XX:/home/DL4MIA/data/
```

**Important**: `scp` overwrites the data if you already copied it there.

If you don’t want to overwrite data and only if there are changes, use the following command, very similar to previous

```bash
rsync -avP /localmachine/path/file <username>@<ip_vdi>:/path/where/to/upload/

# to transfer a folder, do the same, but without the last '/'
rsync -avP /localmachine/path/folder <username>@<ip_vdi>:/path/where/to/upload/

#example
rsync -avP /mnt/D/Data/luc_raw_folder nuno.pimpao@10.1.38.XX:/home/DL4MIA/data/
```

To download data from the VDI to your computer, change the local and vdi arguments so that the vdi comes first, as:

```bash
scp -r <username>@<ip_vdi>:/data/path/in/vdi/ /localmachine/path/to/download/
```

## FTP client

One could use an FTP client such as Filezilla (all OS) , WinSCP (Windows), Cyberduck (MacOS), etc. These allow you connect directly to the machine and upload or download data:

> **Important**: you need an active VPN connection
>

```bash
host: <vdi_ip>
username: <your_username_in_vdi>
password: <your_password>
port: 22
```

Example in Filezilla:

![Screenshot from 2022-07-22 15-14-00.png](cheat_sheet/Screenshot_from_2022-07-22_15-14-00.png)

# Troubleshooting

## Installing `pytorch` packages manually

If you are having *403 Forbidden* problems when trying to install a Pytorch environment, you can try getting the packages manually and installing them localy in conda.

Link to a zip file with some of the most common packages missing is [here](https://cloud.mpi-cbg.de/index.php/s/TdJFqRWKQbSHa6A).

The file is present in `/group/carecourse/`

How to:

1. After downloading the package from thie above link, unzip the package.
    1. If in the VDI gui, right click and *Extract*
    2. via command line:

        ```bash
        $ unzip torch_packages.zip
        ```

2. Copy the packages to the `pkgs` folder in conda: `/home/username/miniconda3/pkgs`

    ```bash
    # via command line
    $ cp /home/<username>/Downloads/torch_packages/<package_name>.tar.bz2 /home/<username>/miniconda3/pkgs/
    ```

3. Browse to the *pkgs* folder

    ```bash
    $ cd /home/<username>/miniconda3/pkgs
    ```

4. Activate the environment where you want to install the package

    ```bash
    $ conda activate pytorchEnv
    ```

5. Install the package manually by

    ```bash
    $ conda install <packagename>.tar.bz2
    ```
