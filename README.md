vagrant-oracle11.2
==================

Vagrant + Oralce Linux 7.3 + Oracle Database 11g Release 2 (11.2.0.4) Enteprise Edition シングル環境の簡易セットアップ。

## ダウンロード

Oracle Database 11g Release 2 (11.2.0.4) Enteprise EditionのソフトウェアをMy Oracle Supportからダウンロードし、Vagrantfileと同じディレクトリに展開。展開すると"database"というサブディレクトリになるはず。

* p13390677_112040_Linux-x86-64_1of7.zip
* p13390677_112040_Linux-x86-64_2of7.zip

## Vagrant設定

プロキシを利用する必要がある場合、まずvagrant-proxyconfをインストールし、vagrant-proxyconf用の環境変数を設定しておく。

ホストがMacOS X or Linuxの場合:
```
export http_proxy=http://proxy.example.com:80
export https_proxy=http://proxy.example.com:80
vagrant plugin install vagrant-proxyconf

export VAGRANT_HTTP_PROXY=http://proxy.example.com:80
export VAGRANT_HTTPS_PROXY=http://proxy.example.com:80
export VAGRANT_FTP_PROXY=http://proxy.example.com:80
export VAGRANT_NO_PROXY=localhost,127.0.0.1
```

ホストがWindowsの場合:
```
SET http_proxy=http://proxy.example.com:80
SET https_proxy=http://proxy.example.com:80
vagrant plugin install vagrant-proxyconf

SET VAGRANT_HTTP_PROXY=http://proxy.example.com:80
SET VAGRANT_HTTPS_PROXY=http://proxy.example.com:80
SET VAGRANT_FTP_PROXY=http://proxy.example.com:80
SET VAGRANT_NO_PROXY=localhost,127.0.0.1
```

## セットアップ

`vagrant up`を実行すると、内部的に以下が動く。

* Oracle Linux 7.3のダウンロードと起動
* Oracle Preinstallation RPMのインストール
* ディレクトリの作成
* 環境変数の設定
* oracleユーザーのパスワード設定
* Oracle Databaseのインストール
* リスナーの作成
* データベースの作成

```
vagrant up
```

## 動作確認

ゲストOSに接続する。

```
vagrant ssh
```

DBに接続する。

```
su - oracle
sqlplus system/oracle
```

## Author ##

[Shinichi Akiyama](https://github.com/shakiyam)

## License ##

[MIT License](http://www.opensource.org/licenses/mit-license.php)
