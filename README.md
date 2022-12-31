# terraform-demo
## Intro👩‍💻
terraform結合ansible的小玩具，在gcp環境下使用terraform幫我建置好機器，接著使用local exec執行ansible的playbook完成機器的設定

## 資料夾結構
```shell
├───ansible-playbook
│   ├───group_vars
│   │   └───all
│   ├───roles
│   │   ├───instance
│   │   │   └───tasks
│   │   └───ops_agent
│   │       └───tasks
│   └───vars
│       └───instance
├───modules
│   └───main.tf
│   └───variables.tf
└───roles
    └───general
        └───general.tf

```

ansible-playbook：放置ansible相關工具
modules：放置主要使用的resource以及定義好的變數
roles：放置自定義參數

## 使用指南
先建立gcp sa給terraform可以有建立vm的權限，接著可以下
- terraform init        -> 先讓terraform下載相關的repo
- terraform plan      -> 查看terraform會做哪些事情
- terraform apply    -> 建立機器指令
- terraform destroy -> 機器建立完要刪除時下這指令

## TODO
- [ ] 使用terraform建立ELK-stack
- [ ] 研究dynamic
