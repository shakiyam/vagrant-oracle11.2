vagrant-oracle11.2
==================

Vagrant + Oracle Linux 7 + Oracle Database 11g Release 2 (11.2.0.4) | Simple setup of a single instance database.

Download
--------

Download Oracle Database 11g Release 2 (11.2.0.4) software from [My Oracle Support](https://support.oracle.com/). Then place downloaded files in the same directory as the Vagrantfile.

* p13390677_112040_Linux-x86-64_1of7.zip
* p13390677_112040_Linux-x86-64_2of7.zip

Configuration
-------------

Copy the file `dotenv.sample` to a file named `.env` and rewrite the contents as needed.

```shell
ORACLE_BASE=/u01/app/oracle
ORACLE_CHARACTERSET=AL32UTF8
ORACLE_EDITION=EE
ORACLE_HOME=/u01/app/oracle/product/11.2.0.4/dbhome_1
ORACLE_PASSWORD=oracle
ORACLE_SAMPLESCHEMA=TRUE
ORACLE_SID=orcl
```

Vagrant up
----------

When you run `vagrant up`, the following will work internally.

* Download and boot Oracle Linux 7
* Install Oracle Preinstallation RPM and unzip
* Create directories
* Set environment variables
* Set password for oracle user
* Unzip downloaded files
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

Connect to the database and browse to the sample table.

```console
sudo su - oracle
sqlplus system/oracle
SELECT * FROM scott.emp;
-- If you have sample schemas installed
SELECT * FROM hr.employees WHERE rownum <= 10;
```

Author
------

[Shinichi Akiyama](https://github.com/shakiyam)

License
-------

[MIT License](https://opensource.org/licenses/MIT)
