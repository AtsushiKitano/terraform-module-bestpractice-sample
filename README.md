Terraform ModuleのBestPractice
===

# 概要
公式で紹介している下記3つのBestPracticeのサンプルコード

- Dependency Inversion
- Multi-cloud Abstractions
- Data-only Modules

# Dependency Inversion
GCP

```
cd src/dependency_inversion
export TF_VAR_project = $(gcloud config get-value core/project)
terraform init
terraform workspace new prd
terraform workspace new dev
terraform workspace select [prd/dev]
terraform apply
```

# Multi-cloud Abstractions

# Data-only Modules
GCPのKMSを使い暗号化した文字列を復号化した文字列を出力するモジュール
利用方法は、以下のように実施する。

```
cd src/secret
terraform init
terraform apply
```
