# Alicloud容器注册表Terraform模块
这是一个使用 ACR 和几个 Repositories 创建 RAM user 的模块。

**注意**：注意：此模块需要安装和配置软件 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation)。

***提供其他语言:*** [English](https://github.com/roura356a/terraform-alicloud-cr/blob/master/README.md),
[Español](https://github.com/roura356a/terraform-alicloud-cr/blob/master/README.es-ES.md),
[简体中文](https://github.com/roura356a/terraform-alicloud-cr/blob/master/README.zh-CN.md).

----------------------


## 架构图
使用此模块后，将创建以下资源：

![terraform-alicloud-cr diagram](https://raw.githubusercontent.com/roura356a/terraform-alicloud-cr/master/diagram.png "架构图")


## 用法
```hcl
provider "alicloud" {}

module "cr" {
  source  = "roura356a/cr/alicloud"
  version = "1.3.0"
  
  namespace = "cr_repo_namespace"
}
```

运行示例后，凭据将位于文件 `cr-{namespace}-ak.json` 中。


### 输入项
| 名称 | 描述 | 类型 | 默认 | 需要 |
|-----|------|-----|-----|-----|
| region | 用于启动此模块资源的区域 | string | -- | 没有 |
| profile | 在共享凭据文件中设置的配置文件名称。如果未设置，它将来自 `ALICLOUD_PROFILE` 环境变量 | string | -- | 没有 |
| shared_credentials_file | 这是共享凭据文件的路径。如果未设置此参数并指定了配置文件，则将使用 `$HOME/.aliyun/config.json` | string | -- | 没有 |
| skip_region_validation | 跳过区域ID的静态验证。由其他类似AlibabaCloud的API的用户使用，或可访问尚未公开的区域的用户（尚未） | bool | -- | 没有 |
| namespace | 容器注册表名称空间的名称 | string | -- | 是 |
| repositories | 应用时要创建的可选存储库列表 | list(string) | -- | 没有 |
| repo_autocreate | 布尔值，如果设置为 `true`，则在推送新图像时会自动创建存储库。如果设置为 `false`，则在推送之前为图像创建存储库 | bool | -- | 没有 |

通过填充变量 `repositories` 来创建存储库。


### 产出
| 名称 | 描述 |
|-----|-----|
| cr_namespace | CR命名空间的ID |
| cr_access_key | CR命名空间的访问密钥 |
| cr_user | CR命名空间的用户 |
| cr_endpoint | 注册表的公共端点 |
| ram_user | RAM用户 |
| ram_policy_name | RAM策略名称 |
| repository_ids | 创建的存储库ID列表 |
| ram_console_username | 控制台登录用户名 |
| disposable_password | 密码以激活控制台登录配置文件，强制将其重置 |
| access_key_status | 创建的AccessKey的状态 |
| ram_policy_type | RAM策略类型 |
| ram_policy_attachment | RAM策略附件ID |


### Docker Login
您需要先登录 [Container Registry Console](https://cr.console.aliyun.com/)，然后按照说明进行操作。

之后，您可以使用 `AccessKey` 来调用 *API* `aliyun cr GetAuthorizationToken`。


## Terraform version
Terraform 0.12.0+。


## Authors
由 Alberto Roura 特创建和维护 ([@roura356a](https://github.com/roura356a), [albertoroura.com](https://albertoroura.com/))。随时贡献。


## 例子
- [基本的](https://github.com/roura356a/terraform-alicloud-cr/tree/master/examples/basic)


## 测试中
该模块使用 [terratest](https://github.com/gruntwork-io/terratest) 进行测试。运行命令 `go mod init cr`，然后 `mod tidy`，然后 `go test`。


## 执照
Apache 2许可证。[LICENSE](https://github.com/roura356a/terraform-alicloud-cr/tree/master/LICENSE)


## 参考
* [Terraform Alicloud Provider Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform Alicloud Provider Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform Alicloud Provider Docs](https://www.terraform.io/docs/providers/alicloud/)
