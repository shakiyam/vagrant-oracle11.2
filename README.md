vagrant-oracle11.2
==================

Vagrant + Oracle Linux 7 + Oracle Database 11g Release 2 (11.2.0.4) | Simple setup of a single instance database.

Download
--------

Download the Oracle Database 11g Release 2 (11.2.0.4) software from My Oracle Support and extract it to the same directory as the Vagrantfile. It should be a subdirectory named `database`.

* p13390677_112040_Linux-x86-64_1of7.zip
* p13390677_112040_Linux-x86-64_2of7.zip

Set environment variables
-------------------------

Copy the file `dotenv.sample` to a file named `.env` and rewrite the contents as needed.

```shell
ORACLE_BASE=/u01/app/oracle
ORACLE_CHARACTERSET=AL32UTF8
ORACLE_EDITION=EE
ORACLE_HOME=/u01/app/oracle/product/11.2.0.4/dbhome_1
ORACLE_PASSWORD=oracle
ORACLE_SID=orcl
```

Vagrant up
----------

When you run `vagrant up`, the following will work internally.

* Download and boot Oracle Linux 7
* Install the Oracle Preinstallation RPM
* Create directories
* Set environment variables
* Set password for oracle user
* Install Oracle Database
* Create a listener
* Create a database

```console
vagrant up
```

Example of use
--------------

Connect to the guest OS.

```console
vagrant ssh
```

Connect to the database and access the sample table.

```console
sudo su - oracle
sqlplus system/oracle
SELECT * FROM scott.emp;
```

Author
------

[Shinichi Akiyama](https://github.com/shakiyam)

License
-------

[MIT License](https://opensource.org/licenses/MIT)
