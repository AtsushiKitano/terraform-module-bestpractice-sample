Terraform ModuleのBestPractice
===

# 概要
公式で紹介している下記3つのBestPracticeのサンプルコード

- Dependency Inversion
- Multi-cloud Abstractions
- Data-only Modules

# Dependency Inversion
GCPのVPCネットワーク上にGCEを作るコードのサンプル  
開発環境(dev)では既存のVPC上に作成し、本番環境(prd)ではVPCを作成し、そのVPC上にGCEを作成する。  

実行方法は以下の通りとなっている。
```
cd src/dependency_inversion
export TF_VAR_project = $(gcloud config get-value core/project)
terraform init
terraform workspace new [prd/dev]
terraform workspace select [prd/dev]
terraform apply
terraform destroy
```

# Multi-cloud Abstractions
GCP,AWS上にVPCを作成するコード  

実行方法は以下の通りとなっている。
```
cd src/multi-cloud_abstractions
terraform init
terraform workspace new [aws/gcp]
terraform workspace select [aws/gcp]
terraform apply
terraform destroy
```
実行に合わせて、main.tfのsourceをコメントアウトする。

# Data-only Modules
GCPのKMSを使い暗号化した文字列を復号化した文字列を出力するモジュール  

実行方法は以下の通りとなっている。
```
cd src/secret
terraform init
terraform apply
terraform destroy
```
