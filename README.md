Terraform ModuleのBestPractice
===

# 概要
公式で紹介している下記3つのBestPracticeのサンプルコード

- Dependency Inversion
- Multi-cloud Abstractions
- Data-only Modules

# Dependency Inversion
GCP

# Multi-cloud Abstractions

# Data-only Modules
GCPのKMSを使い暗号化した文字列を復号化した文字列を出力するモジュール
利用方法は、以下のように実施する。

```
cd src/secret
terraform init
terraform apply
```
