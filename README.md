# Admin管理

后台管理项目模板

## 介绍

- 本项目是一个Flutter Admin项目
- 示例: [licheng1013.github.io/admin-flutter/](https://licheng1013.github.io/admin-flutter/)


## flutter版本

- 3.22.0+

## 支持平台

- 完成: 🆗 , 未开始: ❌ , 进行中: 🚧

| 平台      | 支持状态 | 描述  |
|---------|------|-----|
| Windows | 🆗   |     |
| Web     | 🆗   |     |
| Android | ❌    |     |
| Ios     | ❌    |     |
| MacOS   | ❌    | 需测试 |
| Linux   | ❌    | 需测试 |


## 主题

- 内置主题体验，更容易的主题定制

## 推荐

- flutter开发插件推荐
- 增强包裹器功能
- https://plugins.jetbrains.com/plugin/24537-flutter-kit/


## 打包

### web

- flutter build web --web-renderer html --base-href /admin-flutter/
- flutter build web --web-renderer skwasm --base-href /admin-flutter/
- flutter build web --web-renderer canvaskit --base-href /admin-flutter/

### windows

- dart run msix:create