# Alicloud容器注册表Terraform模块
这是一个使用 ACR 和几个 Repositories 创建 RAM user 的模块。

**注意**：此模块需要安装和配置软件 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation)。

***提供其他语言:*** [English](https://github.com/roura356a/terraform-alicloud-cr/blob/master/README.md),
[Español](https://github.com/roura356a/terraform-alicloud-cr/blob/master/README.es-ES.md),
[简体中文](https://github.com/roura356a/terraform-alicloud-cr/blob/master/README.zh-CN.md).

----------------------


## 架构图
使用此模块后，将会创建以下资源：

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

运行示例后，证书将会被储存于文件 `cr-{namespace}-ak.json` 中。


### 输入
| 名称 | 描述 | 类型 | 默认 | 需要 |
|-----|------|-----|-----|-----|
| region | 用于启动此模块资源的区域 | string | "" | 没有 |
| profile | 如果没有输入，它将从 `ALICLOUD_PROFILE` 获取值 | string | "default" | 没有 |
| shared_credentials_file | 这是共享凭据文件的路径。如果未设置此参数并指定了配置文件，则将使用 `$HOME/.aliyun/config.json` | string | "" | 没有 |
| skip_region_validation | 跳过区域验证 | bool | false | 没有 |
| namespace | 容器注册表名称空间的名称 | string | - | 是 |
| repositories | 应用时要创建的可选存储库列表 | list(string) | ["default"] | 没有 |
| repo_autocreate | 当变量设置为 `true` 时，推送新映像时将自动创建存储库。 如果设置为 `false`，则需要在推送之前为图像创建存储库 | bool | true | 没有 |

通过填充变量 `repositories` 来创建存储库。


### 输出
| 名称 | 描述 |
|-----|-----|
| cr_namespace | CR命名空间的ID |
| cr_access_key | CR命名空间的访问密钥 |
| cr_user | CR命名空间的用户 |
| cr_endpoint | 注册表的端点 |
| ram_user | RAM用户 |
| ram_policy_name | RAM方针 |
| repository_ids | 创建的存储库ID列表 |
| ram_console_username | 控制台登录用户名 |
| disposable_password | 一次性密码 |
| access_key_status | Access Key的状态 |
| ram_policy_type | RAM方针类型 |
| ram_policy_attachment | RAM方针附件ID |


### Docker 登录
您需要先登录 [Container Registry Console](https://cr.console.aliyun.com/)，然后按照说明进行操作。

之后，您可以使用 `AccessKey` 来调用 *API* `aliyun cr GetAuthorizationToken`。


## Terraform 版本
Terraform 0.12.0+.


## 创建者
由 Alberto Roura 创建和维护 ([@roura356a](https://github.com/roura356a), [albertoroura.com](https://albertoroura.com/))。如有任何建议，请您随时贡献。


## 例子
- [基本](https://github.com/roura356a/terraform-alicloud-cr/tree/master/examples/basic)


## 测试
该模块使用 [terratest](https://github.com/gruntwork-io/terratest) 测试。运行命令 `go mod init cr`，然后 `mod tidy`，然后 `go test`。


## 执照
Apache 2许可证。[LICENSE](https://github.com/roura356a/terraform-alicloud-cr/tree/master/LICENSE)


## 参考
* [Terraform Alicloud Provider Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform Alicloud Provider Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform Alicloud Provider Docs](https://www.terraform.io/docs/providers/alicloud/)
