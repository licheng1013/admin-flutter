# Admin管理

后台管理项目模板

## 介绍

- 本项目是一个Flutter Admin项目
- 示例: [licheng1013.github.io/admin-flutter/](https://licheng1013.github.io/admin-flutter/)


## 主题

- 内置主题体验，更容易的主题定制

## 推荐

- flutter开发插件推荐
- 增强包裹器功能
- https://plugins.jetbrains.com/plugin/24537-flutter-kit/

## 增删改查

- 示例已完成。 🆗

## 功能图

- 完成: 🆗 , 未开始: ❌ , 进行中: 🚧

| 功能      | 描述     | 状态 | 文档                                               |
|---------|--------|----|--------------------------------------------------|
| 表格      | 表数据显示  | 🆗 | [table](lib/component/table/README.md)           |
| 表格-多选   |        | 🆗 |                                                  |
| 表格-序号   |        | 🆗 |                                                  |
| 表格-加载动画 |        | 🆗 |                                                  |
| 分页      | 分页请求   | 🆗 | [pagination](lib/component/pagination/README.md) |
| 分页-上下页  | 分页请求   | 🆗 |                                                  |
| 分页-分页数  | 分页请求   | 🆗 |                                                  |
| 表单      | 数据表单   | 🚧 | [form](lib/component/form/README.md)             |
| 表单-字段列  | 数据表单   | 🆗 |                                                  |
| 表单-数据格式 | 数据表单   | 🚧 |                                                  |
| 表单-数据校验 | 数据表单   | ❌  |                                                  |
| 上传组件    | 上传组件封装 | 🆗 | [upload](lib/component/upload/README.md)         |
| 图片预览组件  |        | 🆗 |                                                  |
| 国际化     |        | 🆗 |                                                  |

## 扩展

- `IDEA插件开发` 为此项目构建一个IDEA插件用于生成增删改查代码和管理代码
- 完成: 🆗 , 未开始: ❌ , 进行中: 🚧

| 功能   | 描述      | 状态 |
|------|---------|----|
| 增删改查 | 代码生成    | ❌  |
| 路由导航 | 快速导航到页面 | ❌  |


## 打包

- flutter build web --web-renderer html --base-href /admin-flutter/
- flutter build web --web-renderer skwasm --base-href /admin-flutter/
- flutter build web --web-renderer canvaskit --base-href /admin-flutter/
