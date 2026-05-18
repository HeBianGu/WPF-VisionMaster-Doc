# WPF VisionMaster 4.0 项目介绍和开发文档

[WPF-VisionMaster开发文档](https://hebiangu.github.io/WPF-VisionMaster-Doc/)

`WPF VisionMaster 4.0` 是一个基于 `.NET 8`、`WPF` 和 `OpenCvSharp4` 的机器视觉流程编排解决方案。项目参考 VisionMaster 类产品的交互方式，提供图像、视频、相机、OpenCV 算子、ONNX 推理、检测记录、项目管理、身份权限、主题和通用 WPF 控件等能力，适用于机器视觉流程搭建、验证和桌面端应用开发。

## 主要特性

- 基于 `net8.0-windows` 的 WPF 桌面应用。
- 支持可视化流程图方式组织机器视觉处理节点。
- 集成 OpenCV 图像处理能力和模板匹配、图像矫正等视觉模块。
- 集成 ONNX 推理节点，支持目标检测、分类、语义分割等场景。
- 支持本地图像、本地视频、示例数据集和工业相机数据源。
- 提供项目管理、检测记录、用户身份、权限角色、操作记录和系统设置能力。
- 内置主题、样式、消息、对话框、导航、表单、属性网格、图表、流程图等 WPF 控件和扩展库。
- 采用模块化项目结构，便于按需复用 `H.Controls.*`、`H.Extensions.*`、`H.Modules.*`、`H.Services.*` 和 `H.VisionMaster.*` 组件。

## 技术栈

| 类型 | 技术 |
| --- | --- |
| 运行平台 | Windows |
| 目标框架 | `.NET 8` / `net8.0-windows` |
| UI 框架 | WPF |
| 图像处理 | OpenCvSharp4 / `OpenCvSharp4.Windows` |
| 深度学习推理 | ONNX 相关节点能力 |
| 数据访问 | Entity Framework Core 8 + SQLite / SQL Server 相关模块 |
| 项目序列化 | Newtonsoft.Json |
| 通用序列化 | Newtonsoft.Json / System.Text.Json 相关扩展 |
| 日志 | Log4net 相关扩展 |
| 相机接入 | 海康相机 `MvCameraControl.Net` |
| 架构风格 | 模块化、MVVM、服务与扩展组件分层 |

## 文档导读

本文档已合并 `Source/Apps/H.App.VisionMaster.OpenCV4/README.md` 中的主应用说明，并按“快速上手 → 主应用能力 → 架构模块 → 控件机制 → 二次开发”的顺序整理。

建议阅读顺序：

1. 先阅读“环境要求”“运行主应用”“主应用概览”，快速了解应用用途和运行条件。
2. 再阅读“核心概念与主要模块”，理解 `Project`、`Diagram`、`NodeData`、序列化和路径管理。
3. 如需二次开发，重点阅读 `App.xaml.cs` 配置、`NodeData` 继承体系、`Diagram` 控件体系、`Form`、`IocMessage` 和数据驱动 UI。
4. 遇到运行问题时，优先查看“常见问题”。

## 目录

- [解决方案结构](#解决方案结构)
- [环境要求](#环境要求)
- [快速开始](#快速开始)
- [主应用 `H.App.VisionMaster.OpenCV4` 概览](#主应用-happvisionmasteropencv4-概览)
- [常用模块说明](#常用模块说明)
- [应用启动、依赖注入与配置](#应用启动依赖注入与配置)
- [核心概念与主要模块](#核心概念与主要模块)
  - [AppPaths：应用目录与文件路径管理](#apppaths应用目录与文件路径管理)
  - [Project：项目与工程文件](#project项目与工程文件)
  - [Newtonsoft.Json：项目序列化与反序列化](#newtonsoftjson项目序列化与反序列化)
  - [Diagram：视觉流程图](#diagram视觉流程图)
  - [NodeData：功能节点](#nodedata功能节点)
  - [NodeDataGroup：节点资源分组](#nodedatagroup节点资源分组)
- [绘图、标注与交互模块](#绘图标注与交互模块)
- [Diagram 流程图控件体系](#diagram-流程图控件体系)
- [数据驱动 UI：DataTemplate 与 Presenter](#数据驱动-uidatatemplate-与-presenter)
- [Form 表单组件](#form-表单组件)
- [IocMessage 消息服务](#iocmessage-消息服务)
- [二次开发示例](#二次开发示例)
- [开发建议](#开发建议)
- [许可](#许可)

## 解决方案结构

```text
Source/
├── Apps/
│   └── H.App.VisionMaster.OpenCV4/       # 主 WPF 应用
├── VisionMaster/                         # 机器视觉核心业务模块
│   ├── H.VisionMaster.OpenCV/            # OpenCV 基础能力
│   ├── H.VisionMaster.Camera/            # 相机接入
│   ├── H.VisionMaster.NodeData/          # 视觉节点数据
│   ├── H.VisionMaster.NodeGroup/         # 节点分组
│   ├── H.VisionMaster.Project/           # 项目管理
│   ├── H.VisionMaster.DetectRecord/      # 检测记录
│   └── H.VisionMaster.*                  # 其他视觉相关模块
├── NodeDatas/                            # ONNX / OpenCV 节点数据扩展
├── WPF-Control/                          # 通用 WPF 控件、主题、模块和服务库
│   └── Source/
│       ├── Base/                         # MVVM、附加属性、转换器等基础库
│       ├── Controls/                     # 通用控件库
│       ├── Extensions/                   # 扩展库
│       ├── Modules/                      # 应用模块
│       ├── Services/                     # 通用服务
│       ├── Themes/                       # 主题颜色资源
│       └── Styles/                       # 样式资源
└── Nugets/                               # NuGet 打包相关项目
```

## 环境要求

### 必需环境

- Windows 10/11
- Visual Studio 2022 或更高版本
- .NET 8 SDK
- 支持 WPF 桌面开发的 .NET 工作负载

### 可选环境

- 如需运行 ONNX 示例，请确保模型文件和标签文件路径正确。
- 如需使用海康相机节点，请安装海康机器视觉工业相机 SDK/运行环境，并配置 `MVCAM_COMMON_RUNENV` 环境变量。

海康相机引用路径约定为：

```text
$(MVCAM_COMMON_RUNENV)\DotNet\AnyCpu\MvCameraControl.Net.dll
```

如果不使用相机节点但项目仍需编译，需要保证该引用可解析，或在本地根据实际需求调整项目引用。

## 快速开始

### 1. 获取与还原

```powershell
https://mall.bilibili.com/neul-next/detailuniversal/detail.html?page=detailuniversal_detail&itemsId=40684136#noReffer=true
```

### 2. 构建

```powershell
dotnet build
```

也可以使用 Visual Studio 打开解决方案后执行“还原 NuGet 包”和“生成解决方案”。

### 3. 运行主应用

主应用项目位于：

```text
Source/Apps/H.App.VisionMaster.OpenCV4
```

可通过 Visual Studio 将 `H.App.VisionMaster.OpenCV4` 设置为启动项目后运行，或使用命令行：

```powershell
dotnet run --project Source/Apps/H.App.VisionMaster.OpenCV4/H.App.VisionMaster.OpenCV4.csproj
```

也可以直接在 Visual Studio 中将 `H.App.VisionMaster.OpenCV4` 设置为启动项目后按 `F5` 运行。

## 主应用 `H.App.VisionMaster.OpenCV4` 概览

`H.App.VisionMaster.OpenCV4` 是主 WPF 应用，面向机器视觉流程搭建和演示。应用默认创建 `机器视觉流程`，流程画布尺寸为 `2000 x 1500`，用户可以在流程资源面板中拖拽节点，组合成完整视觉处理链路。

### 主应用目录结构

```text
H.App.VisionMaster.OpenCV4/
├── App.xaml
├── App.xaml.cs
├── MainWindow.xaml
├── MainWindow.xaml.cs
├── MainViewModel.cs
├── H.App.VisionMaster.OpenCV4.csproj
├── VisionIdentifyDataContext.cs
├── Commands/
├── DiagramDatas/
├── Migrations/
├── NodeDatas/
│   └── SrcImages/
└── Projects/
```

### 主要功能

| 功能 | 说明 |
| --- | --- |
| 视觉流程编排 | 通过流程画布组织图像源、视频源、相机源、OpenCV、ONNX、检测记录和网络通信节点 |
| 数据源管理 | 支持本地图像、图像文件夹、本地视频、示例数据集和海康工业相机 |
| OpenCV 能力 | 提供基础图像处理、模板匹配、图像矫正、Zoo 示例数据等模块 |
| ONNX 推理 | 支持目标检测、分类、语义分割等模型推理节点 |
| 项目管理 | 支持新建、打开、保存、编辑、最近项目、从文件打开和查看项目文件 |
| 用户与权限 | 集成身份认证、用户、角色、权限和操作记录 |
| 检测记录 | 默认检测记录数据库为 `drdata.db` |
| 主题与帮助 | 集成主题设置、颜色主题切换、新手引导、版本说明、关于、反馈、联系和授权入口 |

内置节点分组包括：

- 图像数据源、视频数据源、相机数据源。
- OpenCV Zoo 示例数据。
- ONNX 深度学习节点。
- 网络通信节点。
- 检测记录节点。
- 图像矫正节点。
- 模板匹配节点。

### 基本使用流程

1. 启动应用。
2. 登录系统。
3. 新建或打开视觉项目。
4. 在左侧流程资源中选择数据源节点。
5. 添加图像、视频或相机输入。
6. 拖入 OpenCV、ONNX、模板匹配、图像矫正等处理节点。
7. 连接节点形成视觉处理流程。
8. 配置节点参数，例如模型路径、标签文件、阈值、输入尺寸等。
9. 执行流程并查看结果图像、检测框、统计结果或记录数据。
10. 保存项目，便于后续继续编辑或运行。

### OpenCV 与扩展模块

主应用通过 `H.VisionMaster.OpenCV*` 相关模块提供 OpenCV 视觉节点能力，并引入：

- `H.VisionMaster.OpenCVs.TemplateMatch`：模板匹配相关节点。
- `H.VisionMaster.OpenCVs.Rectification`：图像矫正相关节点。
- `H.VisionMaster.Zoo.Images`：图像示例资源。
- `H.VisionMaster.Zoo.Videos`：视频示例资源。
- `H.VisionMaster.Zoo.Halcon`：Halcon 示例资源兼容/演示节点。

### ONNX 模型配置

当前应用内置以下 ONNX 节点：

| 节点 | 说明 |
| --- | --- |
| `Yolov5目标识别` | 基于 YOLOv5 ONNX 模型的目标检测节点 |
| `Yolov5Face` | 人脸检测相关 YOLOv5 节点 |
| `年龄识别` | 年龄推理节点 |
| `性别分类` | 性别分类节点 |
| `人类语义分割` | 像素级语义分割节点 |

ONNX 节点通常需要配置 `ModelPath`、`LabelPath`、`InputSize`、`Threshold`、`NmsThreshold`、`BlobMean`、`BlobStd`、`OutputBoxesIndex`、`OutputClassesIndex` 和 `OutputConfidenceIndex`。

以 `Yolov5目标识别` 为例，默认配置如下：

| 参数 | 默认值 |
| --- | --- |
| 模型 | `yolov5s.onnx` |
| 标签 | `lable_zh_cn.txt` |
| 输入尺寸 | `640 x 640` |
| 检测框输出索引 | `1` |
| 类别输出索引 | `2` |
| 置信度输出索引 | `4` |

如果模型或标签文件不存在，运行节点时会弹出参数编辑窗口，提示用户选择正确的模型文件。

### 用户、权限与运行模式

应用启用了身份认证模块，并初始化了运行模式操作工角色和默认用户：

| 账号 | 密码 | 角色 |
| --- | --- | --- |
| `operator` | `123456` | 运行模式操作工 |

当登录用户属于运行模式操作工角色时，应用会打开运行/设计项目视图，并在关闭后退出主程序。

### 数据库与迁移

项目包含 `VisionIdentifyDataContext` 和 EF Core 迁移文件，用于身份认证相关数据初始化。

| 数据 | 说明 |
| --- | --- |
| 设计时数据库连接 | `Data Source=Migration.db` |
| 检测记录数据库 | `drdata.db` |

如果修改身份模型或初始化数据，可使用 EF Core 工具重新生成迁移。

### 版本信息

| 项 | 值 |
| --- | --- |
| 产品名称 | OpenCV机器视觉通用平台 |
| 标题 | VisionMaster-OpenCV4.0 |
| 版本 | `4.0.0` |
| 公司 | HeBianGu |
| 目标框架 | `net8.0-windows` |

### 常见问题

| 问题 | 处理建议 |
| --- | --- |
| 编译时报 `MvCameraControl.Net` 找不到 | 检查是否安装海康机器视觉 SDK，是否配置 `MVCAM_COMMON_RUNENV`，以及 DLL 是否存在 |
| YOLOv5 节点运行提示模型不存在 | 在节点参数中选择正确的 `onnx` 模型文件和标签文件 |
| 图像源没有显示 | 检查是否已添加图片/文件夹、文件格式是否支持、数据源节点是否正确连接 |
| 登录后界面行为与预期不一致 | 检查用户角色；默认 `operator` 会进入运行模式操作工视图 |
| 检测结果没有框或数量为 0 | 检查模型与标签是否匹配、输入尺寸、阈值、输出张量索引和预处理参数 |

### 相关项目引用

主应用依赖多个本仓库模块，包括 `H.NodeDatas.Onnx.OpenCV`、`H.NodeDatas.Zoo`、`H.VisionMaster.Assets`、`H.VisionMaster.Camera`、`H.VisionMaster.DetectRecord`、`H.VisionMaster.DiagramData`、`H.VisionMaster.Network`、`H.VisionMaster.OpenCVs.Rectification`、`H.VisionMaster.OpenCVs.TemplateMatch`、`H.VisionMaster.Project`、`H.VisionMaster.Zoo.Halcon`、`H.VisionMaster.Zoo.Images`、`H.VisionMaster.Zoo.Videos`、`H.ApplicationBases.Default`、`H.ApplicationBases.Identify` 和 `H.Windows.Main`。

### 主应用开发建议

- 新增视觉节点时，优先复用已有 `VisionMaster` 节点基类和分组接口。
- 新增数据源节点时，应实现对应的数据源分组接口，便于自动出现在流程资源面板。
- 新增 ONNX 节点时，应在 `OpenCVVisionDiagramData.CreateLocalNodeGroups()` 中注册节点或节点分组。
- 修改项目结构、节点类型、命名空间或程序集名后，请验证项目序列化和反序列化兼容性。
- 修改身份认证模型后，请同步更新 EF Core 迁移。
- 实际生产使用时，请根据现场相机、光源、模型、标定参数、数据库和权限要求进行二次配置与验证。

## 常用模块说明

| 模块前缀 | 说明 |
| --- | --- |
| `H.App.*` | 应用入口项目 |
| `H.VisionMaster.*` | 机器视觉业务模块 |
| `H.NodeDatas.*` | 视觉节点数据和推理节点扩展 |
| `H.Controls.*` | WPF 通用控件 |
| `H.Extensions.*` | 通用扩展能力 |
| `H.Modules.*` | 登录、设置、主题、消息、授权、升级等应用模块 |
| `H.Services.*` | 日志、消息、项目、设置、身份等服务 |
| `H.Themes.*` / `H.Style*` | 主题和样式资源 |

## 应用启动、依赖注入与配置

主应用入口位于 `Source/Apps/H.App.VisionMaster.OpenCV4/App.xaml.cs`。`App` 继承自 `ApplicationBase`，应用启动时会完成服务注册、配置加载、启动页、登录、主窗口创建和退出清理等工作。

### ApplicationBase 启动流程

`ApplicationBase` 封装了 WPF 应用的通用启动流程：

```text
App 构造
├── 注册 AppPaths
├── 注册全局异常处理
├── InitServiceCollection()
│   ├── ConfigureServices(IServiceCollection)
│   ├── Ioc.Build(services)
│   └── OnSetting()
└── OnStartup()
    ├── Configure(IApplicationBuilder)
    ├── OnSingleton()              # 单实例检查
    ├── CreateMainWindow()
    ├── OnSplashScreen()           # 启动页与启动加载项
    ├── OnLogin()                  # 登录与登录后加载项
    ├── 加载主窗口状态
    ├── 显示 MainWindow
    └── 启动计划任务
```

因此二次开发时通常只需要在 `App.xaml.cs` 中重写：

- `ConfigureServices(IServiceCollection services)`：注册服务、数据库、模块和业务能力。
- `Configure(IApplicationBuilder app)`：配置选项、主题、设置项和运行时参数。
- `CreateMainWindow(StartupEventArgs e)`：创建主窗口。
- `OnLogin()`：登录后业务逻辑。
- `OnExit(ExitEventArgs e)`：释放运行时资源。

### ConfigureServices：依赖注入注册

`ConfigureServices` 使用 `Microsoft.Extensions.DependencyInjection` 注册应用所需服务。当前主应用注册内容如下：

| 注册代码 | 作用 |
| --- | --- |
| `base.ConfigureServices(services)` | 调用基类预留注册逻辑 |
| `services.AddApplicationServices()` | 注册默认消息、模块、主题和 `log4net` 日志服务 |
| `services.AddIdentifyDefaultServices<VisionIdentifyDataContext>()` | 注册身份认证、用户、角色、权限、操作记录、登录和注册服务，使用 `VisionIdentifyDataContext` 作为身份数据库上下文 |
| `services.AddCamera()` | 注册相机服务 `ICameraService -> CameraService` |
| `services.AddProject<VisionProjectService>(...)` | 注册项目服务，使用 `VisionProjectService` 管理视觉项目，并配置项目扩展名为 `.json` |
| `services.AddLicenseService(...)` | 注册授权服务，当前启用试用模式，试用天数为 `30 * 12`，启动时不提示试用信息 |
| `services.AddSingleton<IReleaseVersionsService, FileReleaseVersionsService>()` | 注册版本发行说明服务，从文件读取发行说明 |
| `services.AddDetectRecordService(...)` | 注册检测记录数据库上下文和仓储，数据库文件名为 `drdata.db` |

当前主应用的项目服务和单个项目都使用 `NewtonsoftJsonSerializerService`，因此项目列表、流程图和节点数据会以 JSON 形式保存。

### Configure：应用选项配置

`Configure` 在服务容器构建完成后执行，用于配置运行时选项和全局设置项。当前主应用配置如下：

| 配置代码 | 作用 |
| --- | --- |
| `base.Configure(app)` | 调用基类预留配置逻辑 |
| `app.UseSplashScreenOptions(...)` | 设置启动页副标题为 `OpenCV4.0版本` |
| `app.UseApplicationOptions(...)` | 加载默认样式、模块、主题和日志配置 |
| `UseThemeModuleOptions(...)` | 配置主题模块 |
| `UseColorThemeOptions(...)` | 默认使用 `WebLightUIColorResource` 浅色 Web 主题 |
| `UseIconFontFamilysOptions(...)` | 默认使用 `Segoe Fluent Icons` 图标字体 |
| `app.UseIdentifyDefaultOptions()` | 配置登录、注册和 SQLite 身份数据库选项 |
| `app.UseSettingDataOptions(...)` | 将 `VisionSettings.Instance` 加入设置中心 |
| `app.UseShapeStyleOptions()` | 注册 ROI、标尺、点、线、圆、卡尺、拾色等图形样式设置 |
| `app.UseShapeBoxSetting()` | 注册 `ShapeBox`、选中、悬停、预览、状态绘制等视图设置 |

`ConfigureServices` 更偏向“注册服务”，`Configure` 更偏向“配置服务实例和全局选项”。新增功能模块时，通常需要同时提供 `AddXxx()` 和 `UseXxxOptions()` 两类扩展方法。

### 登录后的运行模式处理

`OnLogin()` 在基类登录流程完成后执行。当前主应用会检查登录用户是否属于指定角色：

```text
{EFAE3B5B-31EF-41E4-AF08-03D2FAC6E112}
```

如果当前用户属于该角色，并且当前项目是 `VisionProjectItemBase`，应用会打开 `DesignProjectViewWindow` 作为运行模式页面；该窗口关闭后调用 `Shutdown()` 退出主程序。这通常用于“操作工/运行模式”场景，让特定角色直接进入运行界面，而不是完整设计界面。

### 退出清理

`OnExit()` 中主应用会先执行：

```text
CameraManager.Instance.Dispose()
```

用于释放相机管理器、相机句柄等非托管或外部设备资源，然后再调用 `base.OnExit(e)`，由基类停止计划任务、记录退出日志和执行通用退出逻辑。

### 二次开发建议

- 新增业务服务时，优先在独立模块中提供 `services.AddXxx()` 扩展方法，再在 `App.ConfigureServices()` 中注册。
- 新增可配置项时，实现设置对象，并在 `App.Configure()` 中通过 `app.AddSetting(...)` 或模块化 `UseXxxOptions()` 加入设置中心。
- 需要启动加载的数据服务可实现 `ISplashLoadable` 或 `ILoginedSplashLoadable`，由启动页或登录后启动页统一加载。
- 涉及默认模板的数据服务可实现 `IDefaultTemplateable`，应用启动时会尝试加载默认模板。
- 涉及主窗口加载后的服务可实现 `IMainWindowLoadedLoadable`。
- 相机、串口、网络连接、数据库上下文等资源应在退出时显式释放。
- 不建议在 `App.xaml.cs` 中直接写复杂业务逻辑，推荐封装为服务后通过依赖注入注册。

### App.xaml.cs 配置示例

下面示例展示如何在 `App.xaml.cs` 中配置启动页、登录页、产品信息和主题。实际开发时可按需组合，不必全部启用。

#### 示例 1：配置启动页标题、副标题和背景

启动页服务默认由 `services.AddApplicationServices()` 间接注册，内部会注册背景启动页。可在 `Configure()` 中通过 `UseSplashScreenOptions` 配置显示内容：

```csharp
protected override void Configure(IApplicationBuilder app)
{
    base.Configure(app);

    app.UseSplashScreenOptions(x =>
    {
        x.Product = "VisionMaster 机器视觉平台";
        x.Sub = "OpenCV / ONNX / 工业相机版本";
        x.SleepMicroseconds = 80;
        x.Background = "pack://application:,,,/H.App.VisionMaster.OpenCV4;component/Assets/splash.jpg";
    });
}
```

如果需要在注册阶段替换启动页 Presenter，可在 `ConfigureServices()` 中显式注册：

```csharp
protected override void ConfigureServices(IServiceCollection services)
{
    base.ConfigureServices(services);
    services.AddApplicationServices(x =>
    {
        x.UseModuleOptions(m =>
        {
            m.UseSplashScreenOptions(s =>
            {
                s.Product = "VisionMaster 机器视觉平台";
                s.Sub = "正在初始化视觉运行环境";
            });
        });
    });
}
```

> 注意：如果直接在 `ConfigureServices()` 中再次调用 `services.AddSplashScreen<T>()`，由于内部使用 `TryAdd` 注册，已有注册不会被覆盖。需要替换默认实现时，应在默认模块注册前通过 `AddApplicationServices` 的模块选项配置，或手动调整服务注册顺序。

#### 示例 2：配置登录页标题、管理员账号和访客模式

登录页由身份模块注册。当前项目使用：

```csharp
services.AddIdentifyDefaultServices<VisionIdentifyDataContext>();
```

可改为带配置的写法：

```csharp
protected override void ConfigureServices(IServiceCollection services)
{
    base.ConfigureServices(services);
    services.AddApplicationServices();

    services.AddIdentifyDefaultServices<VisionIdentifyDataContext>(x =>
    {
        x.UseLoginOptions(login =>
        {
            login.Product = "VisionMaster 视觉检测系统";
            login.ProductFontSize = 42;
            login.AdminName = "admin";
            login.AdminPassword = "123456";
            login.Remember = true;
            login.UseVisitor = false;
        });
    });
}
```

登录选项也可以在 `Configure()` 中配置运行时默认值：

```csharp
protected override void Configure(IApplicationBuilder app)
{
    base.Configure(app);

    app.UseIdentifyDefaultOptions(x =>
    {
        x.UseLoginOptions(login =>
        {
            login.Product = "VisionMaster 视觉检测系统";
            login.Remember = true;
            login.UseVisitor = false;
        });
    });
}
```

常用登录配置：

| 属性 | 说明 |
| --- | --- |
| `Product` | 登录页标题 |
| `ProductFontSize` | 登录页标题字号 |
| `AdminName` | 默认管理员账号 |
| `AdminPassword` | 默认管理员密码，已标记 `JsonIgnore` / `XmlIgnore` |
| `Remember` | 是否记住登录信息 |
| `UseVisitor` | 是否允许访客模式 |

#### 示例 3：配置身份数据库和登录注册选项

身份模块默认使用 SQLite，可通过 `UseSqliteSettable` 配置数据库名称或连接参数：

```csharp
protected override void ConfigureServices(IServiceCollection services)
{
    base.ConfigureServices(services);
    services.AddApplicationServices();

    services.AddIdentifyDefaultServices<VisionIdentifyDataContext>(x =>
    {
        x.UseSqliteSettable(db =>
        {
            db.InitialCatalog = "identity.db";
        });

        x.UseLoginOptions(login =>
        {
            login.Product = "VisionMaster 登录";
            login.UseVisitor = false;
        });
    });
}
```

如果项目只需要运行模式，不希望开放注册入口，可结合注册模块选项关闭或隐藏注册能力，具体以 `IRegistorOptions` 中可用属性为准。

#### 示例 4：配置产品信息和“关于”页面

产品信息主要来自入口程序集的程序集特性，例如 `AssemblyProduct`、`AssemblyDescription`、`AssemblyCompany`、`AssemblyCopyright`、`AssemblyFileVersion`。

推荐优先在项目文件或公共构建文件中配置：

```xml
<PropertyGroup>
  <Product>VisionMaster</Product>
  <Description>机器视觉流程编排与检测平台</Description>
  <Company>Example Company</Company>
  <Authors>Example Team</Authors>
  <Copyright>Copyright © Example Company 2026</Copyright>
  <Version>4.0.0</Version>
  <FileVersion>4.0.0</FileVersion>
  <AssemblyVersion>4.0.0</AssemblyVersion>
</PropertyGroup>
```

如果需要在 `App.xaml.cs` 中覆盖关于页链接或展示信息，可通过默认模块选项配置：

```csharp
protected override void Configure(IApplicationBuilder app)
{
    base.Configure(app);

    app.UseApplicationOptions(x =>
    {
        x.UseModuleOptions(m =>
        {
            m.UseAboutOptions(about =>
            {
                about.ProductName = "VisionMaster";
                about.ProductDescription = "机器视觉流程编排与检测平台";
                about.Company = "Example Company";
                about.Privacy = "https://example.com/privacy";
                about.Agreement = "https://example.com/agreement";
            });
        });
    });
}
```

也可以直接调用关于模块配置：

```csharp
protected override void Configure(IApplicationBuilder app)
{
    base.Configure(app);

    app.UseAboutOptions(x =>
    {
        x.Privacy = "https://example.com/privacy";
        x.Agreement = "https://example.com/agreement";
    });
}
```

> 注意：`AboutOptions` 中很多产品信息默认从程序集读取，并带有忽略序列化特性。长期稳定的产品名、公司、版本号建议放在项目文件或 `Directory.Build.Props` 中维护。

#### 示例 5：配置默认颜色主题和图标字体

当前主应用默认使用 `WebLightUIColorResource` 和 `Segoe Fluent Icons`：

```csharp
protected override void Configure(IApplicationBuilder app)
{
    base.Configure(app);

    app.UseApplicationOptions(x => x.UseThemeModuleOptions(theme =>
    {
        theme.UseColorThemeOptions(color =>
        {
            color.ColorResource = color.ColorResources
                .OfType<WebLightUIColorResource>()
                .FirstOrDefault();
        });

        theme.UseIconFontFamilysOptions(icon =>
        {
            icon.IconFontFamily = IconFontFamilys.ResourceSegoeFluentIcons;
        });
    }));
}
```

可切换为科技风深色主题：

```csharp
protected override void Configure(IApplicationBuilder app)
{
    base.Configure(app);

    app.UseApplicationOptions(x => x.UseThemeModuleOptions(theme =>
    {
        theme.UseColorThemeOptions(color =>
        {
            color.ColorResource = color.ColorResources
                .OfType<TechnologyBlueDarkColorResource>()
                .FirstOrDefault();
        });

        theme.UseIconFontFamilysOptions(icon =>
        {
            icon.IconFontFamily = IconFontFamilys.ResourceSegoeFluentIcons;
        });
    }));
}
```

默认已注册多套颜色资源，包括 `Purple`、`Gray`、`Blue`、`Accent`、`Technology`、`Industrial`、`Web`、`Solid` 等主题。配置时可通过 `color.ColorResources.OfType<TColorResource>().FirstOrDefault()` 选择默认主题。

#### 示例 6：配置字体、布局和字号

主题配置不仅包含颜色，也包含字体、字号和布局：

```csharp
protected override void Configure(IApplicationBuilder app)
{
    base.Configure(app);

    app.UseApplicationOptions(x => x.UseThemeModuleOptions(theme =>
    {
        theme.UseThemeOptions(t =>
        {
            t.FontFamily = new FontFamily("Microsoft YaHei UI");
            t.FontSize = FontSizeThemeType.Default;
            t.Layout = LayoutThemeType.Default;
        });
    }));
}
```

需要使用该示例时，通常要在 `App.xaml.cs` 顶部引入：

```csharp
using H.Themes.FontSizes;
using H.Themes.Layouts;
using System.Windows.Media;
```

#### 示例 7：组合配置模板

一个常见的完整配置可以写成：

```csharp
protected override void ConfigureServices(IServiceCollection services)
{
    base.ConfigureServices(services);

    services.AddApplicationServices(x =>
    {
        x.UseModuleOptions(m =>
        {
            m.UseSplashScreenOptions(s =>
            {
                s.Product = "VisionMaster";
                s.Sub = "正在加载机器视觉运行环境";
            });
        });
    });

    services.AddIdentifyDefaultServices<VisionIdentifyDataContext>(x =>
    {
        x.UseLoginOptions(login =>
        {
            login.Product = "VisionMaster 登录";
            login.ProductFontSize = 42;
            login.Remember = true;
            login.UseVisitor = false;
        });
        x.UseSqliteSettable(db => db.InitialCatalog = "identity.db");
    });

    services.AddCamera();
    services.AddProject<VisionProjectService>(x => x.Extenstion = ".json");
    services.AddDetectRecordService(x => x.InitialCatalog = "drdata.db");
}

protected override void Configure(IApplicationBuilder app)
{
    base.Configure(app);

    app.UseApplicationOptions(x =>
    {
        x.UseModuleOptions(m =>
        {
            m.UseAboutOptions(about =>
            {
                about.Privacy = "https://example.com/privacy";
                about.Agreement = "https://example.com/agreement";
            });
        });

        x.UseThemeModuleOptions(theme =>
        {
            theme.UseColorThemeOptions(color =>
            {
                color.ColorResource = color.ColorResources
                    .OfType<WebLightUIColorResource>()
                    .FirstOrDefault();
            });
            theme.UseIconFontFamilysOptions(icon =>
            {
                icon.IconFontFamily = IconFontFamilys.ResourceSegoeFluentIcons;
            });
        });
    });

    app.UseIdentifyDefaultOptions();
    app.UseSettingDataOptions(x => x.Add(VisionSettings.Instance));
    app.UseShapeStyleOptions();
    app.UseShapeBoxSetting();
}
```

常用引用命名空间：

```csharp
using H.Extensions.ApplicationBase;
using H.Modules.Identity;
using H.Modules.Login;
using H.Modules.SplashScreen;
using H.Themes.Colors.Web;
using H.Themes.Colors.Technology;
using H.VisionMaster.Camera;
using H.VisionMaster.DetectRecord;
using H.VisionMaster.Project;
using H.VisionMaster.ShapeBox;
using Microsoft.Extensions.DependencyInjection;
using System.Linq;
```

## 核心概念与主要模块

### AppPaths：应用目录与文件路径管理

`AppPaths` 位于 `Source/WPF-Control/Source/Services/H.Services.AppPath`，用于统一管理应用运行过程中需要使用的目录，例如配置、项目、模板、日志、缓存、许可证等。主应用启动时由 `ApplicationBase` 注册默认实现：

```text
ApplicationBase 构造
└── AppPaths.Register(this.CreateAppPathServce())
    └── 默认返回 AppPathServce
```

因此在应用启动完成后，业务代码可以通过 `AppPaths.Instance` 获取统一路径。

#### 主要作用

`AppPaths` 的核心作用是：

- 为项目、设置、日志、模板、缓存等文件提供统一目录。
- 避免在各模块中硬编码绝对路径。
- 支持按应用名、公司名和用户划分目录。
- 支持应用默认目录与登录用户目录分离。
- 在 `AppPathServce` 初始化时自动创建基础目录。
- 便于项目迁移、备份和默认模板初始化。

#### 基础结构

`AppPaths` 本身是一个静态入口：

```csharp
public static class AppPaths
{
    public static IAppPathServce Instance { get; }
    public static void Register(IAppPathServce instance);
}
```

真正的路径计算逻辑在 `IAppPathServce` 的默认实现 `AppPathServce` 中。

默认根目录由以下信息组成：

```text
Document / Company / AppName
```

默认实现中：

- `Document` 默认为系统“我的文档”目录。
- `Company` 默认为 `HeBianGu`。
- `AppName` 来自入口程序集名称 `Assembly.GetEntryAssembly()?.GetName()?.Name`。

因此默认路径通常类似：

```text
我的文档/HeBianGu/H.App.VisionMaster.OpenCV4
```

#### 常用目录

| 属性 | 说明 | 典型用途 |
| --- | --- | --- |
| `AppPath` | 应用根目录 | 应用所有数据的根路径 |
| `Default` | 默认数据目录 | 默认配置、默认项目、公共数据 |
| `Config` | 配置目录 | 全局配置文件 |
| `Data` | 数据目录 | 全局数据文件 |
| `Setting` | 设置目录 | 设置中心保存的配置 |
| `License` | 许可证目录 | 授权文件 |
| `Log` | 日志目录 | 日志文件 |
| `Project` | 项目目录 | 当前主应用视觉项目文件 |
| `Template` | 模板目录 | 流程图模板、项目模板等 |
| `Cache` | 缓存目录 | 临时缓存、运行缓存 |
| `RegistryPath` | 注册表路径 | 注册表配置路径 |

`AppPathServce` 构造时会自动检查并创建这些基础目录：

```text
AppPath
Default
Config
Data
Setting
License
Log
Project
Template
Cache
```

#### 登录用户目录

`AppPathServce` 还提供一组与当前登录用户相关的目录。用户目录会通过 `ILoginService.User.Account` 获取登录账号：

```text
AppPath / UserName
```

如果启用了版本号，则可能是：

```text
AppPath / UserName / Version
```

常用用户目录：

| 属性 | 说明 |
| --- | --- |
| `UserPath` | 当前登录用户根目录 |
| `UserData` | 用户数据目录 |
| `UserSetting` | 用户设置目录 |
| `UserProject` | 用户项目目录 |
| `UserTemplate` | 用户模板目录 |
| `UserCache` | 用户缓存目录 |
| `UserLicense` | 用户许可证目录 |
| `UserLog` | 用户日志目录 |

如果尚未登录，`UserPath` 会回退到 `Default` 目录，避免空用户导致路径不可用。

#### AppDomianPaths：应用随包资源目录

除了用户文档目录，项目还定义了 `AppDomianPaths`，用于描述应用安装目录或运行目录下的固定资源路径：

| 属性 | 说明 |
| --- | --- |
| `Assets` | 资源根目录 |
| `DefaultTemplates` | 默认模板目录，路径为 `Assets/DefaultTemplates` |
| `DefaultProjects` | 默认项目模板目录，路径为 `Assets/DefaultTemplates/Project` |
| `DefaultSettings` | 默认设置模板目录，路径为 `Assets/DefaultTemplates/Setting` |
| `Modules` | 模块目录 |
| `Components` | 组件目录 |
| `Versions` | 版本说明目录 |

典型用途是启动时把应用随包提供的默认模板复制到用户目录。例如项目服务的默认模板加载会检查：

```text
AppDomianPaths.DefaultProjects
```

并复制到 `AppPaths.Instance.Project` 或对应项目目录。

> 代码中类型名为 `AppDomianPaths`，保留了当前项目中的拼写。

#### 项目中的典型使用

项目保存目录：

```csharp
protected override string GetFolderPath()
{
    return AppPaths.Instance.Project;
}
```

用户项目目录：

```csharp
protected virtual string GetFolderPath()
{
    return AppPaths.Instance.UserProject;
}
```

加载默认资源：

```csharp
IEnumerable<string> imagePaths = AppDomianPaths.Assets.GetAllImages();
```

默认项目模板路径：

```csharp
string path = AppDomianPaths.DefaultProjects;
```

#### 自定义 AppPaths

如果需要改变根目录、公司名或按版本隔离数据，可以继承 `AppPathServce` 并在 `App` 中重写 `CreateAppPathServce()`：

```csharp
public class VisionAppPathService : AppPathServce
{
    public override string Company { get; set; } = "MyCompany";
    public override string Document { get; set; } = @"D:\\VisionData";
    public override string Version => "4.0";
}

public partial class App : ApplicationBase
{
    protected override IAppPathServce CreateAppPathServce()
    {
        return new VisionAppPathService();
    }
}
```

这样基础目录会变为：

```text
D:\VisionData\MyCompany\H.App.VisionMaster.OpenCV4\Default\4.0
```

登录用户目录会变为：

```text
D:\VisionData\MyCompany\H.App.VisionMaster.OpenCV4\<UserName>\4.0
```

#### 使用建议

- 项目、设置、日志、缓存等路径优先使用 `AppPaths.Instance`，不要硬编码绝对路径。
- 应用内置模板、示例图片、默认配置优先放到 `Assets/DefaultTemplates` 等 `AppDomianPaths` 约定目录。
- 保存用户个人数据时优先使用 `UserProject`、`UserSetting`、`UserData`。
- 保存全局默认数据时使用 `Project`、`Setting`、`Data`。
- 文件路径写入项目文件时，优先考虑相对路径，方便项目迁移。
- 在服务构造过早阶段访问用户目录时要注意：此时可能尚未登录，`UserPath` 会回退到 `Default`。
- 如果应用需要绿色部署或固定数据盘，推荐自定义 `AppPathServce`。

### Project：项目与工程文件

`Project` 表示一个完整的机器视觉工程，是用户保存、打开和运行的业务单位。主应用中的项目对象基于 `VisionProjectItemBase` 扩展，默认实现位于 `Source/Apps/H.App.VisionMaster.OpenCV4/Projects`。

一个 `Project` 通常包含：

- 项目基础信息，例如名称、描述、文件路径等。
- 一个或多个 `Diagram` 流程图。
- 当前选中的流程图 `SelectedDiagramData`。
- 项目保存、加载、复制、模板管理等操作命令。

默认项目通过 `VisionProjectItem.CreateDiagramData()` 创建 `OpenCVVisionDiagramData`，流程画布默认尺寸为 `2000 x 1500`。项目序列化默认使用 `NewtonsoftJsonSerializerService`，项目文件保存目录来自 `AppPaths.Instance.Project`。

相关模块：

| 模块 | 说明 |
| --- | --- |
| `H.VisionMaster.Project` | 视觉项目抽象、项目项基类、项目相关展示器 |
| `H.Modules.Project` | 通用项目模块 UI 与项目项基础能力 |
| `H.Services.Project` | 项目服务接口与 IoC 注册入口 |
| `Source/Apps/H.App.VisionMaster.OpenCV4/Projects` | 主应用项目实现 |

### Newtonsoft.Json：项目序列化与反序列化

项目保存、打开、复制流程图模板等功能主要依赖 `Newtonsoft.Json`。主应用通过 `NewtonsoftJsonSerializerService` 实现 `ISerializerService`，用于把项目、流程图、节点、连线、节点参数、部分图形数据等保存为 `json` 文件，并在下次启动或打开项目时恢复对象结构。

#### 序列化入口

| 位置 | 作用 |
| --- | --- |
| `VisionProjectService.GetSerializer()` | 项目列表 `projects.json` 的序列化入口，主应用返回 `NewtonsoftJsonSerializerService` |
| `VisionProjectItem.GetSerializer()` | 单个项目文件的序列化入口，主应用返回 `NewtonsoftJsonSerializerService` |
| `VisionProjectItem.Save()` | 保存当前项目的 `DiagramDatas` |
| `VisionProjectItem.Load()` | 从项目文件加载 `ObservableCollection<IVisionDiagramData>` |
| `SaveAsDiagramTemplateCommand` | 将当前流程图保存为流程图模板 |
| `DuplicationDiagramCommand` | 通过 `CloneByNewtonsoftJson()` 深拷贝流程图 |

项目数据通常分为两类文件：

```text
ProjectFolder/
├── projects.json              # 项目索引、最近项目、项目基础信息集合
└── <ProjectName>.json         # 单个项目内容，主要保存 DiagramDatas
```

具体保存目录由 `VisionProjectItem.GetFolderPath()` 和 `VisionProjectService.GetFolderPath()` 决定，当前主应用使用 `AppPaths.Instance.Project`。

#### 当前 Newtonsoft.Json 配置

`NewtonsoftJsonOptions` 默认使用 `CreateReferenceSerializerSettings()`，其核心配置包括：

| 配置 | 当前值 | 作用 |
| --- | --- | --- |
| `NullValueHandling` | `Ignore` | 空值不写入 JSON，减少文件体积 |
| `DefaultValueHandling` | `Ignore` | 默认值不写入 JSON，减少冗余配置 |
| `Formatting` | `Indented` | 输出缩进格式，便于人工查看和排查问题 |
| `ContractResolver` | `CustomContractResolver` | 自定义过滤规则，忽略不应保存的成员 |
| `PreserveReferencesHandling` | `Objects` | 保留对象引用关系，避免同一对象被重复展开 |
| `ReferenceLoopHandling` | `Serialize` | 允许序列化带引用关系的对象图 |
| `TypeNameHandling` | `All` | 保存类型信息，支持接口、抽象类、多态节点反序列化 |

同时注册了多个转换器：

| 转换器 | 作用 |
| --- | --- |
| `TypeConverterJsonConverter` | 使用 `TypeConverter` 读写 `Point`、`Rect`、`Size`、`Brush` 等可转换类型 |
| `EnumConverter` | 枚举以字符串形式保存和恢复 |
| `DateTimeConverter` | 使用 `yyyy-MM-dd HH:mm:ss` 格式保存时间 |
| `JsonableJsonConverter` | 支持项目中自定义 Jsonable 类型的序列化 |

#### 为什么使用 `TypeNameHandling.All`

流程图中大量对象通过接口或抽象类型保存，例如：

- `ObservableCollection<IVisionDiagramData>` 中的实际类型可能是 `OpenCVVisionDiagramData`。
- `NodeDataGroups`、`NodeDatas` 中包含大量不同派生节点。
- 节点参数可能包含不同实现类、图形对象、结果展示对象或状态相关数据。

如果不保存类型信息，反序列化时无法知道接口、抽象类或基类属性应该恢复成哪个具体类型。因此当前配置使用 `TypeNameHandling.All` 保存 `$type` 字段，用于恢复多态对象。

#### 忽略成员规则

`CustomContractResolver` 会在序列化和反序列化时过滤部分成员：

- 标记了 `System.Text.Json.Serialization.JsonIgnoreAttribute` 且没有 `JsonIncludeAttribute` 的成员会被忽略。
- 标记了 `System.Xml.Serialization.XmlIgnoreAttribute` 的成员会被忽略。
- 类型实现 `ICommand` 的属性会被忽略，避免命令对象进入项目文件。

因此开发节点、项目、图形或展示器时：

- 不希望保存的运行时对象应标记 `JsonIgnore` 或 `XmlIgnore`。
- 命令属性通常不需要额外处理，会被自动忽略。
- 需要保存的属性必须有可读写的 `public` 属性访问器。
- 如果属性依赖运行时服务、UI 控件、线程对象、文件句柄、相机句柄、数据库上下文等，应避免直接序列化。

#### 适合保存的数据

建议保存稳定、可恢复、与业务状态相关的数据，例如：

- 项目名称、创建时间、更新时间、是否固定等项目基础信息。
- 流程图画布尺寸、节点位置、连线关系。
- 节点参数，例如阈值、核大小、ROI、模型路径、输入输出配置。
- 可恢复的图形参数，例如点、线、圆、矩形、ROI 等几何数据。
- 模板、标定点、比例尺、运行模式页面配置等设计期数据。

不建议保存的数据：

- `Mat`、`Bitmap`、`ImageSource` 等大对象或非托管资源。
- `VideoCapture`、相机句柄、网络连接、串口对象、数据库连接等运行时资源。
- `Task`、`Thread`、`DispatcherObject` 等线程相关对象。
- 运行中的状态、临时结果、缓存集合、日志对象、消息服务、IoC 服务实例。
- 密码、密钥、Token 等敏感信息；如必须保存，应加密或脱敏。

#### 二次开发注意事项

1. **节点类型重命名会影响旧项目加载**  
   因为 JSON 中包含 `$type` 类型全名，修改命名空间、类名或程序集名后，旧项目文件可能无法反序列化。若必须重构类型，建议提供兼容迁移逻辑或保留旧类型适配层。

2. **新增节点参数要考虑默认值**  
   当前配置会忽略默认值。新增属性时建议设置合理字段默认值、`DefaultValue` 或在 `LoadDefault()` 中初始化，保证旧项目加载后仍可正常运行。

3. **删除属性要考虑旧文件兼容**  
   删除属性通常不会阻止加载，但相关业务逻辑不能再依赖旧字段。若旧字段需要迁移到新字段，可在加载后补齐或兼容读取。

4. **避免序列化运行结果**  
   节点运行结果如 `ResultImage`、`ROIImage`、`ResultImageSource`、`ResultPresenter` 通常应作为运行时状态，不建议保存到项目文件。

5. **集合属性建议初始化**  
   `ObservableCollection<T>`、`List<T>` 等集合建议在字段或构造函数中初始化，避免旧项目缺少字段时出现空引用。

6. **多态对象必须可被创建**  
   需要反序列化的类型应是 `public`，并尽量提供无参构造函数。构造函数中不要依赖必须运行时注入的资源。

7. **UI 对象和服务对象不要直接保存**  
   `Window`、`Control`、`ICommand`、`IServiceProvider`、消息服务、数据库上下文等对象应通过 `JsonIgnore` 或 `XmlIgnore` 排除。

8. **文件路径建议使用相对路径或可配置路径**  
   模型、图片、模板、项目资源如果使用绝对路径，项目迁移到其他机器后可能失效。建议优先使用应用目录、项目目录或资源目录下的相对路径。

9. **谨慎反序列化外部 JSON**  
   当前配置启用了 `TypeNameHandling.All`，它适合加载本应用生成的可信项目文件，但不建议直接反序列化来源不明的 JSON 文件。若需要导入第三方文件，应先校验来源、路径和类型白名单。

#### 常见问题排查

| 现象 | 可能原因 | 处理建议 |
| --- | --- | --- |
| 项目文件无法打开 | 类型重命名、程序集变化、JSON 损坏 | 查看日志，检查 `$type` 指向的类型是否仍存在 |
| 节点参数丢失 | 属性被 `JsonIgnore` / `XmlIgnore` 忽略，或默认值被忽略 | 检查属性特性和默认值设置 |
| 加载后命令为空 | `ICommand` 属性被忽略 | 命令应使用只读属性动态创建，不应依赖序列化 |
| 加载后图像为空 | 运行结果未保存或图片路径失效 | 重新选择数据源，检查相对/绝对路径 |
| 加载后 ROI 或图形异常 | 类型转换失败或旧字段结构变化 | 检查 `Rect`、`Point`、图形类型是否兼容 |
| 保存文件过大 | 保存了运行结果、大集合或资源对象 | 为运行时数据添加忽略特性，改为保存路径或参数 |

### Diagram：视觉流程图

`Diagram` 表示一个可视化机器视觉流程。它负责承载流程节点、节点连线、运行状态、画布尺寸、节点资源分组和流程执行上下文。

主应用中的默认流程图类型是 `OpenCVVisionDiagramData`，继承自 `VisionDiagramDataBase`，并实现 `IVisionDiagramData` 相关能力。

一个 `Diagram` 通常包含：

- 画布尺寸、缩放、选中对象等流程图基础数据。
- 节点集合和连线集合。
- 可添加到画布的 `NodeDataGroup` 列表。
- 流程运行状态，例如运行、停止、取消等。
- 图像处理结果、运行消息和预览结果。

相关接口能力：

| 接口 | 说明 |
| --- | --- |
| `INodeDataGroupsDiagramData` | 提供节点分组资源，用于资源面板展示可用节点 |
| `IFlowableDiagramData` | 提供流程执行能力，支持节点按连线顺序运行 |
| `IResultImageSourceDiagramData` | 提供视觉结果图像输出能力 |
| `IVisionDiagramData` | 视觉流程图综合接口，包含消息、停止运行和运行结果等能力 |

### NodeData：功能节点

`NodeData` 是流程图中的最小执行单元，表示一个具体功能节点，例如图像源、相机采集、滤波、形态学、模板匹配、ONNX 推理、检测记录或网络通信。

节点通常具备以下职责：

- 定义节点显示名称、图标、描述和排序。
- 定义运行参数和结果参数。
- 接收上游节点输出，执行当前节点逻辑。
- 输出处理结果给下游节点。
- 在流程运行时提供消息、状态、耗时和结果展示。

OpenCV 图像处理节点通常继承 `OpenCVNodeDataBase`，核心扩展点是：

```csharp
protected override FlowableResult<IMatImage> Invoke(Mat fromImage)
```

常见节点类型：

| 节点类型 | 示例 | 说明 |
| --- | --- | --- |
| 数据源节点 | `CameraCaptureNodeData`、图像文件节点、视频文件节点 | 负责产生流程输入图像 |
| 图像处理节点 | `GaussianBlur`、形态学节点、矫正节点 | 负责对输入图像进行处理并输出新图像 |
| 逻辑节点 | `ForNodeData`、条件节点 | 负责流程控制、循环或条件分支 |
| 测量节点 | `CreateShapeNodeData`、卡尺测量节点 | 负责图形、几何和测量结果计算 |
| 推理节点 | `Yolov5OnnxNodeData`、分类节点、语义分割节点 | 负责 ONNX 模型推理 |
| 输出节点 | 结果展示、检测记录、网络通信节点 | 负责保存、展示或发送结果 |

#### NodeData 基础继承链

视觉节点最终都建立在 `H.Controls.Diagram` 的节点模型之上。常见继承链如下：

```text
NodeDataBase
└── TextNodeData
    └── DiagramableNodeDataBase
        └── ShowPropertyViewNodeDataBase
            └── ExpressionNodeDataBase
                └── FlowableNodeData
                    └── ResultPresenterNodeDataBase
                        └── SelectableFromNodeDataBase
                            └── ResultImageSourceNodeDataBase
                                └── StyleNodeDataBase
                                    └── StateNodeDataBase
                                        └── VisionNodeDataBase
                                            └── ShowPropertyNodeDataBase
                                                └── HelpNodeDataBase
                                                    └── DemoNodeDataBase
                                                        └── VisionNodeData<T>
                                                            └── FromImageVisionNodeDataBase<T>
                                                                └── NinePointSelectableVisionNodeData<T>
                                                                    └── ScalerSelectableVisionNodeData<T>
                                                                        └── WaitFromVisionNodeData<T>
                                                                            └── ROINodeData<T>
                                                                                └── OpenCVNodeDataBase
```

> 部分节点不是严格沿完整链路继承，例如网络节点通常直接继承 `DemoNodeDataBase`，数据源节点继承 `StartVisionNodeData<T>`，但都复用了流程执行、属性展示、表达式、消息和状态等公共能力。

#### 各基类职责

| 基类/接口 | 主要作用 |
| --- | --- |
| `NodeDataBase` | 最基础节点数据，提供 `ID`、`Location`、`Clone()`、`Create()` 等节点通用能力 |
| `DiagramableNodeDataBase` | 绑定所属 `DiagramData`，提供上游、下游、全部上游节点查询能力 |
| `ShowPropertyViewNodeDataBase` | 提供属性面板展示对象，默认返回节点自身 |
| `ExpressionNodeDataBase` | 提供表达式读取能力，可从流程图和上游节点读取可表达参数 |
| `FlowableNodeData` | 流程执行核心基类，提供 `Start()`、`TryInvokeAsync()`、`Invoke()`、运行状态、耗时、消息、串行/并行后续执行等能力 |
| `ResultPresenterNodeDataBase` | 提供 `ResultPresenter`，用于展示节点执行后的附加结果 UI |
| `SelectableFromNodeDataBase` | 支持从多个上游节点中选择允许触发当前节点的输入节点 |
| `ResultImageSourceNodeDataBase` | 提供结果图像源能力，用于节点预览和流程结果展示 |
| `StyleNodeDataBase` | 提供节点结果显示、样式、颜色等展示相关配置 |
| `StateNodeDataBase` | 提供 `ViewState` / `ViewStates`，让节点绑定 `ShapeBox` 绘图交互状态 |
| `VisionNodeDataBase` | 提供视觉节点通用参数，例如预览延迟、执行延迟、输出历史记录等 |
| `ShowPropertyNodeDataBase` | 面向视觉模块的属性展示节点基类 |
| `HelpNodeDataBase` | 提供帮助、说明类能力 |
| `DemoNodeDataBase` | 示例/演示型节点基类，常用于网络、记录等非图像处理节点 |
| `VisionNodeData<T>` | 视觉流程泛型节点核心基类，维护 `ResultImage`、`InvokeTotal`，封装图像结果、预览图、执行入口和资源释放 |
| `FromImageVisionNodeDataBase<T>` | 支持选择输入图像表达式，可从上游结果或指定表达式读取输入图像 |
| `NinePointSelectableVisionNodeData<T>` | 支持选择九点标定源，用于像素坐标和世界坐标转换场景 |
| `ScalerSelectableVisionNodeData<T>` | 支持选择比例尺源，将像素距离转换为实际距离 |
| `WaitFromVisionNodeData<T>` | 支持等待多个上游输入全部完成后再执行 |
| `ROINodeData<T>` | 支持 ROI 区域参数、ROI 图像结果和 `DrawROIVisionState` 绘制交互 |
| `OpenCVNodeDataBase` | OpenCV 图像处理节点基类，将 `IMatImage` 转为 `Mat`，扩展点为 `Invoke(Mat fromImage)` |
| `OpenCVDetectorNodeDataBase` | OpenCV 检测类节点基类，适合轮廓、二维码、霍夫检测等 |
| `PointDetectorNodeDataBase` | 点检测类节点基类，适合角点等点特征检测 |
| `FeatureOpenCVNodeDataBase` | 特征点检测节点基类，提供 `FeatureCountResult` 结果参数 |
| `MorphologyOpenCVNodeDataBase` | 形态学节点基类，封装内核、锚点、迭代次数、边界处理和 `MorphTypes` 扩展点 |
| `CascadeClassifierOpenCVNodeDataBase` | 级联分类器检测基类，适合 Haar、LBP 等检测节点 |
| `OpenCVSrcFilesNodeDataBase` | OpenCV 文件数据源基类，基于 `SrcFilesVisionNodeData<IMatImage>` 读取图像文件 |
| `VideoCaptureNodeDataBase` | 视频/摄像头数据源基类，负责逐帧输出图像到下游流程 |
| `OutputNodeDataBase` | 输出节点基类，适合 OK/NG 和消息通知类节点 |
| `OnnxNodeDataBase` | ONNX 推理节点基类，继承 `OpenCVNodeDataBase`，面向 DNN/ONNX 模型推理 |
| `ObjDetectOnnxNodeDataBase` | ONNX 目标检测节点基类 |
| `ClsOnnxNodeDataBase` | ONNX 分类节点基类 |
| `InferOnnxNodeDataBase` | 通用 ONNX 推理节点基类 |
| `SemSegOnnxNodeDataBase` | ONNX 语义分割节点基类 |
| `DetectRecordNodeDataBase` | 检测记录节点基类，负责检测记录相关读写和判断 |
| `ModbusNodeDataBase` / `TcpSocketNodeDataBase` / `UdpNodeDataBase` / `SerialNodeDataBase` | 通信节点基类，分别封装 Modbus、TCP、UDP、串口相关公共能力 |

#### OpenCV 节点继承关系

| 直接基类 | 节点 |
| --- | --- |
| `OpenCVNodeDataBase` | `AddSutract`、`BitwiseNot`、`Blur`、`Canny`、`CvtColor`、`DetailEnhance`、`DnnSuperres`、`EdgePreservingFilter`、`Flip`、`GaussianBlur`、`Hist`、`Hog`、`HomographyTransform`、`HSVInRange`、`MOG`、`MultiplayDivide`、`Normalize`、`PencilSketch`、`PixelThresholdIfConditionNodeData`、`Pow`、`Repeat`、`Resize`、`Rotate`、`SeamlessCloneBackground`、`SplitBGR`、`Stitching`、`Stylization`、`Subdiv2D`、`SVM`、`Threshold`、`Transpose`、`WarpAffineTransform`、`WarpPerspectiveTransform`、`Yolov3` |
| `MorphologyOpenCVNodeDataBase` | `BlackHat`、`Close`、`Dilate`、`Erode`、`Gradient`、`Open`、`TopHat` |
| `OpenCVDetectorNodeDataBase` | `BlobDetector`、`FindContours`、`HoughCircles`、`QRCode`、`RenderBlobs` |
| `PointDetectorNodeDataBase` | `CornerHarris`、`CornerSubPix` |
| `HoughLinesBase` | `HoughLines`、`HoughLinesP` |
| `FeatureOpenCVNodeDataBase` | `AKazeFeatureDetector`、`BriskFeatureDetector`、`FastFeatureDetector`、`FreakFeatureDetector`、`KazeFeatureDetector`、`MserFeatureDetector`、`StarFeatureDetector` |
| `CascadeClassifierOpenCVNodeDataBase` | `HaarCascade`、`LbpCascade` |
| `SeamlessCloneBase` | `SeamlessClone` |
| `OpenCVSrcFilesNodeDataBase` | `SrcImageFilesNodeData`、`OpenCVSrcImageFilesNodeData`、`OpenCVBitholderSrcImageFilesNodeData`、`OpenCVBoardSrcImageFilesNodeData`、`OpenCVCardoorSrcImageFilesNodeData`、`OpenCVHalconSrcImageFilesNodeData`、`OpenCVPillbagSrcImageFilesNodeData`、`OpenCVPillMagnesiumSrcImageFilesNodeData`、`OpenCVPipeJointsSrcImageFilesNodeData`、`OpenCVRadiusGaugesSrcImageFilesNodeData`、`OpenCVWoodSrcImageFilesNodeData`、`PersonSrcImageFilesNodeData` |
| `VideoCaptureNodeDataBase` | `CameraCaptureNodeData`、`SrcVideoFilesNodeData` |
| `OutputNodeDataBase` | `OKOutputNodeData`、`NGOutputNodeData`、`ShowInfoNotifyMessageOutputNodeData`、`ShowSuccessNotifyMessageOutputNodeData`、`ShowWarnNotifyMessageOutputNodeData`、`ShowErrorNotifyMessageOutputNodeData`、`ShowFatalNotifyMessageOutputNodeData`、`ShowDialogNotifyMessageOutputNodeData` |
| `ConditionNodeData<IMatImage>` | `OpenCVConditionNodeData` |
| `ForNodeDataBase<IMatImage>` | `ForNodeData` |
| `ForeachNodeDataBase<IMatImage, IVisionResultImage<IMatImage>>` | `ForeachSplitResultImageNodeData` |
| 测量基类 | `CreateShapeNodeData`、`CircleToCircleMesauseNodeData`、`LineToCircleMesauseNodeData`、`LineToLineAngleMesauseNodeData`、`LineToLineMesauseNodeData`、`PointToCircleMesauseNodeData`、`PointToLineMesauseNodeData`、`PointToPointMesauseNodeData` |

#### ONNX、网络、记录和应用节点继承关系

| 模块 | 继承关系 |
| --- | --- |
| ONNX 目标检测 | `ObjDetectOnnxNodeDataBase -> ObjDetectOnnxNodeData`、`Yolov5OnnxNodeData`、`Yolov5FaceOnnxNodeData` |
| ONNX 分类 | `ClsOnnxNodeDataBase -> ClsOnnxNodeData`、`GenderClsOnnxNodeData` |
| ONNX 通用推理 | `InferOnnxNodeDataBase -> InferOnnxNodeData`、`AgeInferOnnxNodeData` |
| ONNX 语义分割 | `SemSegOnnxNodeDataBase -> SemSegOnnxNodeData`、`HumanSemSegOnnxNodeData` |
| 检测记录 | `DetectRecordNodeDataBase -> DetectRecordNodeData`、`ClassDetectRecordNodeData`、`ObjectDetectRecordNodeData`、`HasDetectRecordNodeData` |
| HTTP 通信 | `DemoNodeDataBase -> HttpReadJsonNodeData`、`HttpWriteJsonNodeData` |
| Modbus 通信 | `ModbusNodeDataBase -> ReadableModbusNodeData<T> / WriteableModbusNodeData<T> -> IntReadableModbusNodeData`、`ShortWriteableModbusNodeData` |
| TCP 通信 | `TcpSocketNodeDataBase -> ReadableTcpSocketNodeData<T> -> TcpReadStringNodeData`；`TcpSocketNodeDataBase -> TcpWriteStringNodeData` |
| UDP 通信 | `UdpNodeDataBase -> UdpReadStringNodeData`、`UdpWriteStringNodeData` |
| 串口通信 | `SerialNodeDataBase -> ReadableSerialNodeData<T> / WriteableSerialNodeData<T> -> SerialReadByteNodeData`、`SerialReadStringNodeData`、`SerialWriteByteNodeData`、`SerialWriteStringNodeData` |
| 相机数据源 | `CameraNodeDataBase<IMatImage> -> CameraNodeData` |
| 模板匹配 | `MatchingNodeData<IMatImage> -> Base64TemplateMatchNodeData`、`FeaturePointTemplateMatch`、`ShapeTemplateMatch`；`RenderBlobs -> HSVTemplateMatch` |
| 图像矫正 | `ForegroundInfoNodeDataBase -> ForegroundRotatedRectRectification`、`TakeoffForegroundInfo`；`OpenCVNodeDataBase -> RotatedRectRectification` |

#### 选择基类的建议

| 开发目标 | 推荐基类 |
| --- | --- |
| 新增普通 OpenCV 图像处理节点 | `OpenCVNodeDataBase` |
| 新增带 ROI 的图像处理节点 | `OpenCVNodeDataBase`，直接复用其上层 `ROINodeData<IMatImage>` 能力 |
| 新增形态学节点 | `MorphologyOpenCVNodeDataBase` |
| 新增特征点检测节点 | `FeatureOpenCVNodeDataBase` |
| 新增轮廓、二维码、霍夫等检测节点 | `OpenCVDetectorNodeDataBase` 或其派生基类 |
| 新增图像/视频数据源 | `OpenCVSrcFilesNodeDataBase` 或 `VideoCaptureNodeDataBase` |
| 新增 ONNX 推理节点 | `ObjDetectOnnxNodeDataBase`、`ClsOnnxNodeDataBase`、`InferOnnxNodeDataBase` 或 `SemSegOnnxNodeDataBase` |
| 新增测量节点 | `CreateShapeNodeDataBase<T>` 或 `*MeasureNodeDataBase<T>` |
| 新增输出/消息节点 | `OutputNodeDataBase` |
| 新增非图像处理的功能节点 | `DemoNodeDataBase` 或更底层的 `FlowableNodeData` |

### NodeDataGroup：节点资源分组

`NodeDataGroup` 表示资源面板中的节点分类，用于组织可拖拽到流程图中的节点。每个分组通常包含一组同类 `NodeData`。

例如：

| 分组 | 说明 |
| --- | --- |
| `数据源` | 图像、视频、相机、示例数据等输入节点 |
| `滤波模块` | 高斯滤波、均值滤波等图像滤波节点 |
| `形态学模块` | 腐蚀、膨胀、开闭运算等节点 |
| `逻辑模块` | 循环、条件、遍历等流程控制节点 |
| `卡尺测量` | 几何创建、距离、角度、圆线测量等节点 |
| `ONNX` | 目标检测、分类、语义分割等推理节点 |
| `网络通信` | HTTP、TCP、UDP、Modbus 等通信节点 |
| `检测记录` | 检测结果保存、查询和判断节点 |

分组通常继承 `NodeDataGroupBase`，并通过 `CreateNodeDatas()` 返回节点集合。例如 `BlurDataGroup` 会从程序集里查找实现 `IBlurGroupableNodeData` 的节点，并按 `Order` 排序。

节点是否进入某个分组，通常由以下因素共同决定：

1. 节点类继承了可识别的节点基类，例如 `OpenCVNodeDataBase`。
2. 节点类实现了对应分组接口，例如 `IBlurGroupableNodeData`。
3. 节点所在程序集被主应用引用并参与节点加载。
4. `Diagram` 的 `CreateNodeGroups()` 返回了对应的 `NodeDataGroup`。

### NodeGroup：业务分组定义

`NodeGroup` 模块主要定义节点分组类型、分组接口和分组元数据。它位于 `Source/VisionMaster/H.VisionMaster.NodeGroup`，用于描述“有哪些业务分类”和“节点如何归类”。

典型结构包括：

- `Groups/Blurs`：滤波模块。
- `Groups/Conditions`：逻辑模块。
- `Groups/Cameras`：相机模块。
- `Groups/SrcImages`：图像数据源模块。
- `Groups/Mesure`：测量模块。
- `Groups/TemplateMatchings`：模板匹配模块。
- `Groups/Rectifications`：图像矫正模块。

### 模块关系

整体关系可以概括为：

```text
Project
└── DiagramDatas
    └── Diagram
        ├── NodeDatas       # 已放置到画布上的节点实例
        ├── Links           # 节点之间的连接关系
        └── NodeDataGroups  # 资源面板中的可用节点分组
            └── NodeData    # 可拖拽创建的节点模板/实例
```

二次开发时，最常见的扩展路径是：

1. 新增一个 `NodeData` 实现具体功能。
2. 让节点实现对应分组接口，例如 `IBlurGroupableNodeData`。
3. 必要时新增或复用 `NodeDataGroup`。
4. 确保主应用的 `Diagram` 能加载该分组。
5. 重新生成并在流程资源面板中拖拽使用。

## 绘图、标注与交互模块

机器视觉应用中除了流程编排，还需要在图像上完成 ROI 选择、点线圆标注、测量图形绘制、像素拾取、卡尺区域编辑等交互。相关能力主要位于 `Source/VisionMaster/H.VisionMaster.ShapeBox`。

### ShapeBox：图像与图形承载控件

`ShapeBox` 是绘图模块的核心 WPF 控件，继承自 `FrameworkElement`，用于在图像上叠加绘制一个或多个 `IShape`。

它主要负责：

- 显示底图 `ImageSource`。
- 维护单个图形 `Shape` 或图形集合 `Shapes`。
- 根据 `Position`、`Scale`、`Size` 提供当前视图上下文。
- 使用 `DrawingVisual` 分层绘制图像和图形。
- 在缩放变化、图形集合变化时刷新绘制结果。
- 支持像素颜色拾取 `PickColor(Point point)`。

`ShapeBox` 的基础绘制关系如下：

```text
ShapeBox
├── ImageDrawingVisual   # 底图层
└── ShapeDrawingVisual   # 图形层
```

在此基础上，模块继续扩展了多个专用控件：

| 控件 | 说明 |
| --- | --- |
| `ThumbShapeBox` | 支持绘制图形控制点或拖拽手柄 |
| `MouseOverShapeBox` | 支持鼠标悬停命中反馈 |
| `SelectShapeBox` | 支持选中图形并绘制选中态 |
| `StateShapeBox` | 支持通过 `State` 接管鼠标交互，绘制临时状态图形 |
| `PreviewShapeBox` | 支持鼠标附近的工具预览图形 |

### IShape：图形抽象

`IShape` 是所有可绘制图形的基础接口，核心方法是：

```csharp
void Draw(IView view, DrawingContext drawingContext, Brush stroke, double strokeThickness = 1, Brush fill = null);
```

其中：

- `IView` 提供当前视图位置、缩放比例和尺寸。
- `DrawingContext` 是 WPF 绘制上下文。
- `stroke`、`strokeThickness`、`fill` 控制图形样式。

常见图形包括：

| 图形 | 说明 |
| --- | --- |
| `PointShape` | 点标注 |
| `LineShape` | 直线标注 |
| `RectShape` / `ROIRectShape` | 矩形与 ROI 矩形 |
| `CircleShape` | 圆形标注，支持中心点、半径、标尺显示 |
| `PolygonShape` / `PolyLineShape` | 多边形和折线 |
| `CrossShape` | 十字准星 |
| `RulerLineShape` | 标尺线 |
| `CaliperLineShape` / `CaliperCircleShape` / `CaliperPointShape` | 卡尺测量相关图形 |
| `PixelColorPointShape` | 像素拾取标记 |

部分图形还会实现额外接口：

| 接口 | 说明 |
| --- | --- |
| `IBoundingBoxShape` | 提供 `BoundingBox`，便于框选、测量或定位 |
| `IHitableShape` | 支持鼠标命中检测 |
| `ISelectableShape` | 支持选中态绘制 |
| `IThumbShape` | 支持控制点、手柄绘制 |
| `IPreviewShape` | 支持工具预览绘制 |

### ShapeBase 与 Handle

大多数图形不会直接实现 `IShape`，而是继承已有基类，例如 `ShapeBase`、`CommonShapeBase`、`MatrixShapeBase`、`HandleShapeBase` 或 `TitleShapeBase`。

这些基类提供了：

- 通用绘制入口。
- 坐标矩阵变换能力。
- 标题绘制能力。
- 控制点和手柄能力。
- 命中检测和交互编辑能力。

`Handle` 用于描述图形上的可交互控制点，例如圆心、半径点、线段端点、删除按钮等。典型实现包括 `ActionHandle`、`ActionCircleHandle`、`DeleteHandle`。例如 `CircleShape` 会创建两个手柄：一个用于移动圆心，一个用于调整半径。

### State：绘图交互状态

`State` 用于描述当前 `ShapeBox` 的交互模式，例如“绘制圆”、“绘制矩形”、“选择 ROI”、“拾取像素”等。`StateShapeBox` 通过 `ViewState` 属性持有当前状态，并把鼠标事件转发给状态对象。

`IState` 定义了基础鼠标交互：

```csharp
void MouseDown(object sender, MouseButtonEventArgs e);
void MouseLeave(object sender, MouseEventArgs e);
void MouseMove(object sender, MouseEventArgs e);
void MouseUp(object sender, MouseButtonEventArgs e);
void QueryCursor(object sender, QueryCursorEventArgs e);
```

`IViewState` 在此基础上增加了生命周期和视图绑定：

```csharp
IView View { get; set; }
void Enter();
void Exit();
void ScaleChanged();
```

常见状态包括：

| 状态 | 说明 |
| --- | --- |
| `NoneState` | 空状态，不执行特殊交互 |
| `ShowShapeState` | 展示图形状态 |
| `DefaultRectState` | 默认矩形交互状态 |
| `ROIRectState` | ROI 矩形选择状态 |
| `AddPointShapeState` | 添加点 |
| `AddLineShapeState` | 添加线 |
| `AddCircleShapeState` | 添加圆 |
| `AddRectShapeState` | 添加矩形 |
| `AddRulerLineShapeState` | 添加标尺线 |
| `AddPickPixelShapeState` | 拾取像素点 |

### 绘图交互流程

一次典型绘图流程如下：

```text
用户选择绘图工具
└── 设置 StateShapeBox.ViewState
    ├── State.Enter()
    ├── MouseDown / MouseMove / MouseUp
    ├── State 生成临时 Shape
    ├── DrawStateShape() 绘制预览/临时图形
    ├── 完成绘制后 AddShapes()
    └── ShapeBox.DrawShapes() 刷新正式图形层
```

以 `AddCircleShapeState` 为例：

1. 第一次点击设置 `CircleShape.Center`。
2. 鼠标移动时实时更新 `CircleShape.Radius` 并刷新状态图形。
3. 第二次点击确认半径。
4. 调用 `AddShape()` 将圆添加到图形集合。
5. 清空临时状态图形。

### 绘图模块与视觉流程的关系

`ShapeBox` 主要用于图像交互和结果展示，常见使用场景包括：

- 在图像上选择 ROI 区域。
- 在测量节点中创建点、线、圆、矩形等几何对象。
- 展示模板匹配、检测框、分割轮廓和测量结果。
- 编辑卡尺线、卡尺圆等检测参数。
- 拾取图像像素点和颜色。

在流程节点中，绘图结果通常会作为参数、ROI、几何输入或结果展示对象，与 `NodeData` 的执行逻辑配合使用。

## Diagram 流程图控件体系

`Diagram` 控件位于 `Source/WPF-Control/Source/Controls/H.Controls.Diagram`，是项目中负责可视化流程编排的核心控件。它把 `NodeData`、`PortData`、`LinkData` 等数据对象呈现为可拖拽、可选择、可连接、可删除、可布局的图形化流程图界面。

### 控件与数据的对应关系

项目中的流程图采用“控件层 + 数据层”分离的方式：

```text
控件层                         数据层
Diagram      <------------>    IDiagramData / IDiagramDataSource
Node         <------------>    INodeData / NodeDataBase / FlowableNodeData
Port         <------------>    IPortData / FlowablePortData
Link         <------------>    ILinkData / FlowableLinkData
Part         <------------>    IPartData
```

其中：

- 控件层负责显示和交互，例如拖拽节点、选择、连线、删除、缩放。
- 数据层负责保存和恢复，例如节点位置、节点参数、端口信息、连线关系。
- 序列化项目时主要保存 `NodeDatas` 和 `LinkDatas`，控件实例由 `DataSource` 在运行时重新创建。

### Diagram：流程图画布

`Diagram` 继承自 `ContentControl`，实现 `IDiagram`，是整个流程图的画布容器。它内部通过多个图层管理节点和连线：

| 图层 | 说明 |
| --- | --- |
| `NodeLayer` | 节点图层，承载所有 `Node` 控件 |
| `LinkLayer` | 连线图层，承载已经创建的 `Link` 控件 |
| `DynamicLayer` | 动态连线图层，通常用于拖拽连线过程中的临时线 |

`Diagram` 的核心职责：

- 根据 `IDiagramDataSource` 创建和刷新节点、连线。
- 维护 `Nodes`、`Links` 集合。
- 维护当前选中节点 `SelectedNode` 和当前选中元素 `SelectedPart`。
- 支持添加节点 `AddNode()`、删除节点 `RemoveNode()`、添加连线 `AddLink()`。
- 支持框架命令：删除选中、全选、对齐、缩放到适合、方向键移动节点等。
- 支持缩放定位：`ZoomTo()`、`ZoomToFit()`。
- 通过 `LinkDrawer` 控制连线绘制方式。
- 通过 `Layout` 控制节点布局方式。

`Diagram` 与数据源的关系：

```text
IDiagramData
├── Datas.NodeDatas      # 保存节点数据
├── Datas.LinkDatas      # 保存连线数据
└── DataSource           # 运行时数据源，用于生成 Diagram 控件内容
    ├── GetNodeDatas()
    └── GetLinkDatas()
```

### Part：流程图元素基类

`Node`、`Port`、`Link` 都继承自 `FlowablePart`，而 `FlowablePart` 继承自 `Part`。

`Part` 是所有流程图可交互元素的基础类，继承自 `ContentPresenter`，所以它本身可以通过 `Content` 绑定数据对象，并通过 `DataTemplate` 呈现不同外观。

`Part` 提供的通用能力：

- `Content`：承载 `IPartData` 数据对象。
- `IsSelected`：选中状态。
- `SelectionChanged`：选中状态变化事件。
- `Delete()`：从所在图层删除控件。
- `Clear()`：清理逻辑关系，派生类可重写。
- `GetDiagram()`：获取所属 `Diagram`。
- `IsDragEnter`、`IsCanDrop`：拖拽状态附加属性。
- `HasError`：错误状态标记。
- `GetPrevious()` / `GetNext()`：键盘或流程导航时使用。

点击 `Part` 时会自动设置 `Diagram.SelectedPart`，并根据是否按下 `Ctrl` 控制单选或多选。

### Node：流程节点控件

`Node` 表示流程图中的节点控件，通常对应一个 `INodeData`，在视觉流程中就是一个具体 `NodeData` 功能模块。

`Node` 的核心数据来自：

```csharp
public interface INodeData : IPartData
{
    string ID { get; set; }
    Point Location { get; set; }
    INodeData Create();
}
```

`Node` 的主要职责：

- 显示节点内容，例如节点名称、图标、状态、参数摘要等。
- 保存和同步节点位置 `Location`。
- 管理节点端口 `Port`。
- 管理与节点相关的连线集合：
  - `LinksInto`：进入当前节点的流程连线。
  - `LinksOutOf`：从当前节点输出的流程连线。
  - `ConnectLinks`：非流程型普通连接线。
- 删除节点时同步删除所有相关连线。
- 提供上游、下游节点查询：`GetFromNodes()`、`GetToNodes()`、`GetAllToNodes()`。
- 提供节点及相关元素枚举：`GetParts()`、`GetAllParts()`。

节点删除逻辑大致如下：

```text
Node.Delete()
├── 找到所有进入、输出、连接线
├── 删除相关 Link
├── 清理 Node 与 Link 的引用关系
└── 从 Diagram 中移除 Node
```

在视觉流程中，节点控件本身只负责交互和显示，真正的运行逻辑位于 `FlowableNodeData`、`VisionNodeData<T>`、`OpenCVNodeDataBase` 等数据对象中。

### Port：节点端口控件

`Port` 表示节点上的连接点，用于创建连线或表达输入输出方向。一个节点可以拥有多个端口。

端口数据接口：

```csharp
public interface IPortData : ILinkInitializer, IData
{
    string ID { get; set; }
    string NodeID { get; set; }
    string Name { get; set; }
    Dock Dock { get; set; }
    PortType PortType { get; set; }
    Thickness PortMargin { get; set; }
}
```

`Port` 的主要职责：

- 保存所属节点 `ParentNode`。
- 保存端口方向 `Dock`，例如 `Left`、`Top`、`Right`、`Bottom`。
- 保存端口类型 `PortType`，用于区分输入、输出或双向端口。
- 支持拖拽创建连接。
- 删除端口时自动删除连接到该端口的连线。
- 查询进入端口和输出端口的连线：`GetLinkInto()`、`GetLinksOutOf()`。
- 查询端口连接到的下游节点：`GetToNodes()`。

端口的 `Dock` 会影响连线起点、终点以及拖拽时的方向辅助。例如 `ChangedPoint()` 会根据端口方向把点向外偏移，用于连线绘制时产生更自然的折线或曲线。

### Link：连线控件

`Link` 表示节点与节点之间的连接线，通常对应一个 `ILinkData`。

连线数据接口：

```csharp
public interface ILinkData : IPartData
{
    string FromNodeID { get; set; }
    string ToNodeID { get; set; }
    string FromPortID { get; set; }
    string ToPortID { get; set; }
}
```

`Link` 的核心职责：

- 保存起点节点 `FromNode` 和终点节点 `ToNode`。
- 保存起点端口 `FromPort` 和终点端口 `ToPort`。
- 使用内部 `Path` 绘制连线。
- 通过 `Diagram.LinkDrawer` 计算连线路径。
- 删除时清理节点与连线之间的引用关系。
- 支持流程导航：`GetPrevious()` 返回起点节点，`GetNext()` 返回终点节点。

创建连线时，会根据节点数据创建对应 `LinkData`：

```text
Link.Create(from, to)
├── 设置 FromNode / ToNode
├── 触发节点或端口的 ILinkInitializer
├── 如果 FromNode.Content 实现 ILinkDataCreator，则创建 LinkData
├── 如果 LinkData 实现 IFlowable，则加入 LinksOutOf / LinksInto
└── 否则加入 ConnectLinks
```

这意味着流程型连线和普通连接线可以共用 `Link` 控件，但通过数据对象是否实现 `IFlowable` 来区分是否参与流程执行。

### LinkDrawer：连线绘制器

`DiagramDataBase` 默认提供多种连线绘制器：

| 绘制器 | 说明 |
| --- | --- |
| `BrokenLinkDrawer` | 折线连线，默认方式 |
| `LineLinkDrawer` | 直线连线 |
| `BezierLinkDrawer` | 贝塞尔曲线连线 |
| `ArcLinkDrawer` | 弧线连线 |

`Link.Update()` 时会调用：

```text
diagram.LinkDrawer.DrawPath(link, out center)
```

然后把返回的 `Geometry` 设置给内部 `Path.Data`。因此如果需要自定义连线样式，可以新增实现 `ILinkDrawer` 的绘制器，并加入 `CreateLinkDrawerSource()`。

### Layout：节点布局

`DiagramDataBase` 维护 `Layouts` 和当前 `Layout`。默认布局为 `LocationLayout`，即按节点自身 `Location` 显示。

常见布局相关能力：

- 按保存的位置恢复节点。
- 对齐选中节点或全部节点。
- 通过布局算法重新排列节点。
- 结合 `ZoomToFit()` 自动缩放到合适视图。

当前视觉流程主要依赖节点保存的 `Location`，用户拖拽节点后位置会写回 `INodeData.Location`，项目保存时一起序列化。

### DiagramData：流程图数据模型

`DiagramDataBase` 是 Presenter 层的流程图数据基类，负责把可视化控件状态转化为可保存数据。

重要属性和职责：

| 属性/方法 | 说明 |
| --- | --- |
| `Name` | 流程图名称 |
| `Width` / `Height` | 流程图画布尺寸 |
| `SelectedPartData` | 当前选中的节点、端口或连线数据 |
| `LinkDrawer` | 当前连线绘制方式 |
| `Layout` | 当前布局方式 |
| `DataSource` | 运行时 Diagram 数据源，不直接序列化 |
| `Datas.NodeDatas` | 可序列化的节点数据集合 |
| `Datas.LinkDatas` | 可序列化的连线数据集合 |
| `OnSerializing()` | 保存前刷新 `Datas` |
| `OnDeserialized()` | 加载后重建 `DataSource` 并通知节点/连线 |

序列化时：

```text
Diagram 控件实例不会保存
Node / Port / Link 控件实例不会保存
保存的是 NodeData、PortData、LinkData 等数据对象
加载后由 DataSource 重新创建控件树
```

### 常见交互流程

#### 1. 从资源面板拖入节点

```text
NodeDataGroup.NodeDatas 中的 NodeData
└── 拖拽到 Diagram
    ├── 创建 Node 控件
    ├── Node.Content = NodeData
    ├── 设置 NodeData.Location
    ├── 创建 Port 控件和 PortData
    └── 加入 Diagram.NodeLayer / DataSource
```

#### 2. 从端口拖拽创建连线

```text
鼠标从 FromPort 拖出
└── DynamicLayer 显示临时 Link
    └── 拖到 ToPort 或 ToNode
        ├── 创建 Link 控件
        ├── 创建 LinkData
        ├── 设置 FromNodeID / ToNodeID / FromPortID / ToPortID
        ├── 加入 FromNode.LinksOutOf
        ├── 加入 ToNode.LinksInto
        └── 加入 Diagram.LinkLayer / DataSource
```

#### 3. 删除节点或连线

```text
用户选中 Part
└── Delete 键或删除命令
    ├── Part.Delete()
    ├── 从 Layer.Children 移除控件
    ├── Node / Link / Port 清理引用关系
    └── Diagram.OnItemsChanged() 刷新可序列化数据
```

#### 4. 执行流程

```text
FlowableDiagramData.Start()
└── 找到起始节点
    └── IFlowableNodeData.Start()
        ├── 当前 NodeData.Invoke()
        ├── 根据 LinkData 找到下游节点
        └── 继续执行下游 NodeData
```

控件负责“连起来”，数据负责“跑起来”。流程执行主要依赖 `FlowableNodeData` 和 `FlowableLinkData`，而不是直接依赖 `Node`、`Link` 控件。

### 二次开发建议

- 新增视觉功能时，优先新增 `NodeData`，不要直接继承 `Node` 控件。
- 只有需要改变节点交互或外观结构时，才考虑自定义 `Node` 控件或 `DataTemplate`。
- 节点可连接能力应通过 `IPortableNodeData` 和 `PortData` 描述，而不是在控件中硬编码端口。
- 连线保存必须依赖稳定的 `NodeID`、`PortID`，不要用控件引用做持久化。
- 自定义连线形状时优先实现 `ILinkDrawer`。
- 自定义布局时优先实现 `ILayout`。
- 需要保存的数据放到 `NodeData`、`PortData`、`LinkData`，运行时控件状态尽量不要序列化。
- 双击节点或连线时，可通过 `IDiagramShowPropertyView` 或 `IocMessage.Form.ShowTabEdit()` 显示属性编辑界面。

## 数据驱动 UI：DataTemplate 与 Presenter

本项目大量采用 WPF 的数据驱动模式：业务对象只负责描述数据和状态，界面通过 `DataTemplate`、`ContentPresenter`、`ItemsControl` 和各种 `Presenter` 自动选择显示方式。这样可以让 `Project`、`Diagram`、`NodeData`、`NodeDataGroup`、运行结果、图形状态等对象保持纯数据/状态模型，UI 呈现逻辑集中在 XAML 模板和 Presenter 中。

### 核心思想

```text
数据对象 / ViewModel / Presenter
        ↓  Binding / ContentPresenter / ItemsControl
DataTemplate 根据 DataType 自动匹配显示方式
        ↓
最终 WPF 控件界面
```

这种模式的好处：

- 新增数据类型时，只需要新增对应 `DataTemplate`，不必修改主窗口复杂布局。
- 业务节点不直接依赖具体控件，便于序列化、测试和复用。
- `ContentPresenter` 可以按对象实际类型自动切换界面。
- `ItemsControl` 可以按集合数据自动生成列表、工具栏、资源面板、历史结果等。
- 运行结果可以通过 `IResultPresenter` 统一呈现，不同节点返回不同 Presenter 即可。

### ContentPresenter：按对象类型自动呈现

主窗口中多处使用 `ContentPresenter` 直接绑定数据对象，由 WPF 根据资源中的 `DataTemplate.DataType` 自动选择模板。

例如流程图区域：

```xaml
<ContentPresenter Content="{Binding SelectedDiagramData}">
    <ContentPresenter.Resources>
        <DataTemplate DataType="{x:Type ld:OpenCVVisionDiagramData}">
            <!-- OpenCVVisionDiagramData 的专用呈现界面 -->
        </DataTemplate>
    </ContentPresenter.Resources>
</ContentPresenter>
```

当 `SelectedDiagramData` 是 `OpenCVVisionDiagramData` 时，界面自动使用该模板显示视觉流程图、图像预览、历史结果、节点结果等内容。

同样，数据源区域也使用不同 `DataTemplate` 呈现不同节点：

```xaml
<ContentPresenter Content="{Binding SrcImageNodeData}">
    <ContentPresenter.Resources>
        <DataTemplate DataType="{x:Type OpenCVSrcFilesNodeDataBase}">
            <!-- 图像文件源管理界面 -->
        </DataTemplate>

        <DataTemplate DataType="{x:Type SrcVideoFilesNodeData}">
            <!-- 视频文件源管理界面 -->
        </DataTemplate>

        <DataTemplate DataType="{x:Type CameraCaptureNodeData}" />
    </ContentPresenter.Resources>
</ContentPresenter>
```

因此新增一种数据源节点时，可以为该节点类型新增模板，而不是在主界面中写大量类型判断。

### ItemsControl：集合数据驱动列表和工具栏

项目中大量集合 UI 都由 `ItemsControl`、`ListBox`、`TreeView`、`TabControl`、`DataGrid` 驱动。

例如工具栏命令来自命令集合：

```xaml
<ItemsControl ItemsSource="{Binding Commands, IsAsync=True}">
    <ItemsControl.ItemTemplate>
        <DataTemplate>
            <FontIconButton
                Command="{Binding}"
                Content="{Binding Icon}"
                ToolTip="{Binding Name}" />
        </DataTemplate>
    </ItemsControl.ItemTemplate>
</ItemsControl>
```

这里 `Commands` 集合中的每个命令对象都会被模板渲染成一个 `FontIconButton`。如果后续新增命令，只需要把命令加入集合，界面会自动出现按钮。

流程图标签页也由项目中的 `DiagramDatas` 集合驱动：

```xaml
<TabControl
    ItemsSource="{Binding DiagramDatas}"
    SelectedItem="{Binding SelectedDiagramData}">
    <TabControl.ItemTemplate>
        <DataTemplate>
            <DockPanel>
                <TextBox Text="{Binding Name}" />
                <FontIconButton Command="{Binding StartCommand}" />
                <FontIconButton Command="{Binding StopCommand}" />
                <FontIconButton Command="{Binding ResetCommand}" />
            </DockPanel>
        </DataTemplate>
    </TabControl.ItemTemplate>
</TabControl>
```

`Project` 只维护 `DiagramDatas`，标签页的创建、选中和标题显示都由绑定完成。

### NodeDataGroup Presenter：节点资源面板呈现

节点资源面板没有直接把 `NodeDataGroup` 写死在主窗口中，而是通过 Presenter 转换和模板呈现。

主窗口绑定：

```xaml
<ContentPresenter
    Content="{Binding SelectedDiagramData.NodeGroups, Converter={GetNodeDataGroupsTreeViewPresenter}}" />

<ContentPresenter
    Content="{Binding SelectedDiagramData.NodeGroups, Converter={GetNodeDataGroupsItemsControlPresenter}}" />
```

转换器会把 `IEnumerable<INodeDataGroup>` 包装为对应 Presenter：

```csharp
public class NodeDataGroupsTreeViewPresenter : DisplayBindableBase
{
    public IEnumerable<INodeDataGroup> NodeDataGroups { get; set; }
}
```

然后在资源字典中通过 `DataTemplate` 呈现：

```xaml
<DataTemplate DataType="{x:Type ld:NodeDataGroupsTreeViewPresenter}">
    <TreeView ItemsSource="{Binding NodeDataGroups}">
        <ItemsControl.ItemTemplate>
            <HierarchicalDataTemplate ItemsSource="{Binding NodeDatas}">
                <DockPanel>
                    <FontIconTextBlock Text="{Binding Icon}" />
                    <TextBlock Text="{Binding Name}" />
                    <TextBlock Text="{Binding Description}" />
                </DockPanel>
            </HierarchicalDataTemplate>
        </ItemsControl.ItemTemplate>
    </TreeView>
</DataTemplate>
```

同一份 `NodeGroups` 数据可以用不同 Presenter 呈现为：

- 树形列表：`NodeDataGroupsTreeViewPresenter`
- 分组卡片：`NodeDataGroupsItemsControlPresenter`
- 右键菜单：`NodeDataGroupsContextMenuPresenter`

这就是“同一数据，多种视图”的典型数据驱动模式。

### ResultPresenter：节点运行结果呈现

节点执行后可以返回 `ResultPresenter`，主窗口通过一个 `ContentPresenter` 展示当前节点结果：

```xaml
<ContentPresenter Content="{Binding SelectedDiagramData.ResultNodeData.ResultPresenter}" />
```

节点本身只需要设置：

```csharp
return this.OK(resultImage, resultPresenter);
```

或在基类中重写：

```csharp
public override IResultPresenter CreateResultPresenter()
{
    return new DataGridResultPresenter<MyResultItem>(items);
}
```

不同 Presenter 通过不同 `DataTemplate` 呈现。例如表格结果：

```xaml
<DataTemplate DataType="{x:Type lr:DataGridResultPresenterBase}">
    <DataGrid
        AutoGenerateColumns="False"
        IsReadOnly="True"
        ItemsSource="{Binding Collection}"
        SelectedItem="{Binding SelectedItem}" />
</DataTemplate>
```

简单值结果：

```xaml
<DataTemplate DataType="{x:Type lr:ValueResultPresenterBase}">
    <ContentPresenter Content="{Binding Value}" />
</DataTemplate>
```

因此二次开发节点时，推荐把结果展示封装为 Presenter，而不是在节点里直接创建窗口或控件。

### DataTemplate 的典型使用位置

| 场景 | 数据对象 | 呈现方式 |
| --- | --- | --- |
| 主流程图区域 | `OpenCVVisionDiagramData` | `ContentPresenter` + `DataTemplate DataType` |
| 图像/视频/相机源面板 | `OpenCVSrcFilesNodeDataBase`、`SrcVideoFilesNodeData`、`CameraNodeData` | 数据源节点类型模板 |
| 节点资源树 | `NodeDataGroupsTreeViewPresenter` | `TreeView` + `HierarchicalDataTemplate` |
| 节点资源卡片 | `NodeDataGroupsItemsControlPresenter` | `ItemsControl` + `Expander` + 节点模板 |
| 命令工具栏 | `Commands` 集合 | `ItemsControl.ItemTemplate` 生成按钮 |
| 流程图标签页 | `DiagramDatas` 集合 | `TabControl.ItemTemplate` |
| 历史运行结果 | `Messages` 集合 | `DataGrid` + `DataGridTemplateColumn` |
| 当前节点结果 | `IResultPresenter` | `ContentPresenter` + Presenter 模板 |
| 绘图工具栏 | `ViewStates` 集合 | `ListBox.ItemTemplate` 生成图标工具 |

### 二次开发：新增一种 Presenter

如果某个节点需要显示自定义结果，推荐新增 Presenter 类型和对应模板。

1. 定义 Presenter 数据对象：

```csharp
public class DefectListPresenter : DisplayBindableBase, IResultPresenter
{
    public ObservableCollection<DefectItem> Items { get; } = new();

    private DefectItem _selectedItem;
    public DefectItem SelectedItem
    {
        get { return _selectedItem; }
        set
        {
            _selectedItem = value;
            RaisePropertyChanged();
        }
    }
}
```

2. 在资源字典中定义模板：

```xaml
<DataTemplate DataType="{x:Type local:DefectListPresenter}">
    <DataGrid
        AutoGenerateColumns="False"
        ItemsSource="{Binding Items}"
        SelectedItem="{Binding SelectedItem}">
        <DataGrid.Columns>
            <DataGridTextColumn Binding="{Binding Name}" Header="缺陷" />
            <DataGridTextColumn Binding="{Binding Score}" Header="得分" />
            <DataGridTextColumn Binding="{Binding Rect}" Header="区域" />
        </DataGrid.Columns>
    </DataGrid>
</DataTemplate>
```

3. 节点执行时返回 Presenter：

```csharp
protected override FlowableResult<IMatImage> Invoke(Mat fromImage)
{
    DefectListPresenter presenter = new DefectListPresenter();
    presenter.Items.Add(new DefectItem { Name = "Scratch", Score = 0.98 });

    return this.OK(fromImage.Clone(), presenter);
}
```

这样主窗口无需修改，`ContentPresenter` 会根据 `DefectListPresenter` 的类型自动找到模板并显示。

### 二次开发：新增一种节点资源面板呈现方式

如果希望同一组节点资源用新的方式显示，例如“搜索卡片视图”，可以新增一个 Presenter 和转换器：

```csharp
public class SearchNodeDataGroupsPresenter : DisplayBindableBase
{
    public SearchNodeDataGroupsPresenter(IEnumerable<INodeDataGroup> groups)
    {
        this.NodeDataGroups = groups;
    }

    public IEnumerable<INodeDataGroup> NodeDataGroups { get; }
}
```

然后定义 `DataTemplate`：

```xaml
<DataTemplate DataType="{x:Type local:SearchNodeDataGroupsPresenter}">
    <DockPanel>
        <TextBox DockPanel.Dock="Top" ToolTip="搜索节点" />
        <ItemsControl ItemsSource="{Binding NodeDataGroups}">
            <!-- 这里继续定义分组和节点展示方式 -->
        </ItemsControl>
    </DockPanel>
</DataTemplate>
```

最后在主界面中使用：

```xaml
<ContentPresenter Content="{Binding SelectedDiagramData.NodeGroups, Converter={local:GetSearchNodeDataGroupsPresenter}}" />
```

### 使用建议

- `NodeData`、`Project`、`Diagram` 尽量只保存业务参数、状态和命令，不直接持有复杂 UI 控件。
- 需要显示复杂结果时，优先定义 `Presenter` + `DataTemplate`。
- 需要支持多种显示方式时，优先为同一数据创建多个 Presenter，而不是复制业务数据。
- `DataTemplate` 尽量放在模块自己的资源字典中，随模块合并，避免主窗口持续膨胀。
- `ContentPresenter.Content` 绑定对象，`DataTemplate.DataType` 绑定类型，是项目中最常用的自动呈现方式。
- 需要列表时使用 `ItemsControl.ItemTemplate`；需要树形结构时使用 `HierarchicalDataTemplate`；需要表格时使用 `DataGridTemplateColumn` 或专用 Presenter。
- 不建议在节点执行逻辑中直接弹窗展示结果，除非是明确的输出节点；普通结果应通过 `ResultPresenter` 展示。

## Form 表单组件

`Form` 位于 `Source/WPF-Control/Source/Controls/H.Controls.Form`，是项目中用于“根据对象自动生成参数编辑界面”的核心控件。它通过反射读取对象属性，再根据属性类型、特性和配置生成不同的 `PropertyItem`，常用于节点参数编辑、项目编辑、设置项编辑、绘图状态编辑和弹窗表单。

### 核心用途

`Form` 主要解决以下问题：

- 自动把对象属性转换为可编辑表单。
- 根据 `Display`、`ReadOnly`、`Required`、`Range`、`DefaultValue` 等特性控制显示、分组、排序和校验。
- 根据属性类型自动选择编辑器，例如文本框、复选框、枚举下拉、日期控件、命令按钮等。
- 支持只显示指定属性、排除指定属性、只显示指定分组。
- 支持只读查看模式和编辑模式。
- 支持分组显示、搜索过滤、异步加载和属性值变化通知。
- 支持自定义 `PropertyItem`，用于文件选择、目录选择、颜色、画刷、单位、表达式、下拉数据源等复杂编辑场景。

### 基本使用

最简单的用法是绑定 `SelectObject`：

```xaml
<Form SelectObject="{Binding ResultNodeData}" />
```

在主窗口中，当前模块结果使用 `Form` 显示节点结果参数：

```xaml
<Form
    SelectObject="{Binding ResultNodeData}"
    UseGroupNames="{x:Static VisionPropertyGroupNames.ResultParameters}" />
```

这表示只显示 `ResultNodeData` 中 `Display.GroupName` 属于 `ResultParameters` 的属性。

### Form 与属性特性

`Form` 默认只显示带 `DisplayAttribute` 的属性，因为 `UseDisplayOnly` 默认值为 `true`。

典型属性写法：

```csharp
private double _threshold = 128;

[DefaultValue(128.0)]
[Range(0, 255)]
[Display(Name = "阈值", GroupName = VisionPropertyGroupNames.RunParameters, Description = "二值化阈值", Order = 10)]
public double Threshold
{
    get { return _threshold; }
    set
    {
        _threshold = value;
        RaisePropertyChanged();
        this.Invoke();
    }
}
```

常用特性：

| 特性 | 作用 |
| --- | --- |
| `Display(Name, GroupName, Description, Order)` | 控制显示名称、分组、说明和排序 |
| `Browsable(false)` | 不在表单中显示 |
| `ReadOnly(true)` | 显示为只读 |
| `Required` | 必填校验 |
| `Range` | 数值范围校验 |
| `DefaultValue` | 默认值说明，并配合序列化减少默认值保存 |
| `TypeConverter` | 使用类型转换器进行文本编辑和序列化 |
| `PropertyItem(typeof(...))` | 指定自定义属性编辑器 |
| `PropertyViewItem(typeof(...))` | 指定只读查看模式下的属性展示器 |

### 自动编辑器选择规则

`Form` 会把每个属性包装成 `IPropertyItem`。默认创建规则大致如下：

| 属性类型/配置 | 默认 PropertyItem |
| --- | --- |
| `ICommand` | `CommandPropertyItem` |
| `DateTime` | `DateTimePropertyItem` |
| `bool` | `BoolPropertyItem` |
| `bool?` | `BoolNullablePropertyItem` |
| `enum` | `EnumPropertyItem` |
| 支持 `TypeConverter` 的类型 | `TextPropertyItem` |
| `IConvertible` 或基元类型、`string` | `TextPropertyItem` |
| 其他对象 | `ObjectPropertyItem<object>` |
| 标记 `PropertyItemAttribute` | 使用指定的自定义 `PropertyItem` |

如果启用 `UsePropertyView`，则会进入只读展示模式，优先使用 `PropertyViewItemAttribute` 指定的展示器，否则使用只读型属性项。

### 属性筛选与显示控制

`Form` 提供大量选项控制属性是否显示：

| 选项 | 说明 |
| --- | --- |
| `UseDisplayOnly` | 只显示带 `Display` 的属性，默认 `true` |
| `UseDeclaredOnly` | 只显示当前类型声明的属性，不包含基类属性 |
| `UsePropertyNames` | 只显示指定属性名，多个名称用空格或逗号分隔 |
| `ExceptPropertyNames` | 排除指定属性名 |
| `UseGroupNames` | 只显示指定分组名 |
| `UseNull` | 是否显示值为 `null` 的属性 |
| `UseCommand` | 是否显示命令属性 |
| `UseCommandOnly` | 是否只显示命令属性 |
| `UseEnum` / `UseString` / `UseDateTime` / `UseBoolen` | 控制对应类型是否显示 |
| `UseClass` / `UseArray` / `UseInterface` / `UsePrimitive` | 控制对应类型类别是否显示 |
| `UseTypeConverterOnly` | 只显示具备 `TypeConverter` 的属性 |
| `UseOrder` | 按 `Display.Order` 排序，默认 `true` |
| `UseOrderByName` | 按名称排序 |
| `UseOrderByType` | 按 PropertyItem 类型排序 |
| `UseGroup` | 按 `GroupName` 分组显示 |
| `SearchText` | 按名称、说明等进行搜索过滤 |

示例：只显示运行参数和结果参数：

```xaml
<Form
    SelectObject="{Binding ResultNodeData}"
    UseGroup="True"
    UseGroupNames="运行参数,结果参数" />
```

示例：只编辑模型路径和标签路径：

```xaml
<Form
    SelectObject="{Binding SelectedNodeData}"
    UsePropertyNames="ModelPath,LabelsPath" />
```

### FormPresenter 与 DataTemplate

项目仍然遵循数据驱动模式，不一定直接在界面放置 `Form`，也可以使用 `FormPresenter` 包装表单配置。

`FormPresenter` 实现了 `IFormOption`，并通过 `DataTemplate` 呈现为 `Form`：

```xaml
<DataTemplate DataType="{x:Type local:FormPresenter}">
    <local:Form
        SelectObject="{Binding SelectObject}"
        UseGroup="{Binding UseGroup}"
        UseGroupNames="{Binding UseGroupNames}"
        UsePropertyNames="{Binding UsePropertyNames}"
        ExceptPropertyNames="{Binding ExceptPropertyNames}" />
</DataTemplate>
```

这意味着可以在代码中创建一个 Presenter，然后交给 `ContentPresenter` 自动显示：

```csharp
var presenter = new FormPresenter(nodeData)
{
    UseGroup = true,
    UseGroupNames = VisionPropertyGroupNames.RunParameters
};
```

### 弹窗编辑：IocMessage.Form

项目中大量参数编辑窗口通过 `IocMessage.Form` 打开。它内部使用 `StaticFormPresenter` 或 `TabFormPresenter`，并自动执行模型校验。

常用方式：

```csharp
bool? r = await IocMessage.Form.ShowEdit(this, x =>
{
    x.Title = "编辑节点参数";
}, null, x =>
{
    x.UseGroupNames = VisionPropertyGroupNames.RunParameters;
    x.UseCommand = false;
});
```

只读查看：

```csharp
await IocMessage.Form.ShowView(this, x =>
{
    x.Title = "查看节点参数";
}, x =>
{
    x.UseGroup = true;
});
```

Tab 分组编辑：

```csharp
bool? r = await IocMessage.Form.ShowTabEdit(data, x =>
{
    x.Title = "新建流程图";
}, null, x =>
{
    x.UseGroupNames = "基础信息,数据," + VisionPropertyGroupNames.DisplayParameters;
});
```

表单提交时会优先使用传入的 `match` 校验；如果没有传入，则调用对象的 `ModelState`，根据 `Required`、`Range` 等数据注解进行校验。

### 自定义 PropertyItem

当默认编辑器不满足需求时，可以为属性指定自定义编辑器。例如文件路径、文件夹路径、单位文本、表达式下拉、颜色选择等都可以通过自定义 `PropertyItem` 实现。

```csharp
[PropertyItem(typeof(OpenFileDialogPropertyItem))]
[Display(Name = "模型文件", GroupName = VisionPropertyGroupNames.RunParameters)]
public string ModelPath { get; set; }
```

常见扩展方向：

| 场景 | 推荐方式 |
| --- | --- |
| 文件路径 | `OpenFileDialogPropertyItem` 或自定义文件选择 PropertyItem |
| 文件夹路径 | 文件夹选择 PropertyItem |
| 枚举/数据源选择 | `ComboBoxPropertyItem` 或实现 `ISelectSourcePropertyItem` |
| 颜色/画刷 | `ColorPropertyItem`、`BrushPropertyItem` |
| 单位输入 | 单位文本 PropertyItem |
| 表达式选择 | `ExpressionComboBoxPropertyItem` |
| 复杂对象 | `PresenterPropertyItem`、`FormPropertyItem` 或自定义 Presenter |

### 与 NodeData 的关系

`NodeData` 的参数面板、运行参数编辑、结果参数展示都依赖 `Form` 的能力。节点开发时建议：

- 所有需要配置的参数使用 `Display` 标记，并设置清晰的 `GroupName`。
- 运行参数放到 `VisionPropertyGroupNames.RunParameters`。
- 结果参数放到 `VisionPropertyGroupNames.ResultParameters`，必要时加 `ReadOnly(true)`。
- 基础参数、显示参数、流程参数使用项目已有分组名，保持 UI 一致。
- 对文件、目录、颜色、表达式等复杂字段使用合适的 `PropertyItem`。
- 参数 setter 中调用 `RaisePropertyChanged()`，需要实时预览时再调用 `this.Invoke()`。

示例：节点参数在 `Form` 中自动显示：

```csharp
[Display(Name = "核大小", GroupName = VisionPropertyGroupNames.RunParameters, Description = "滤波核大小", Order = 10)]
public Size KSize
{
    get { return _ksize; }
    set
    {
        _ksize = value;
        RaisePropertyChanged();
        this.Invoke();
    }
}
```

### 使用建议

- 优先用 `Display` 和数据注解描述参数，不要为每个节点手写参数界面。
- 表单只负责编辑可持久化或可恢复的参数，运行时对象应标记 `Browsable(false)` 或 `JsonIgnore`。
- 分组名要统一，避免同类参数散落在多个分组。
- 对复杂类型优先使用 `TypeConverter` 或自定义 `PropertyItem`，确保编辑、显示和序列化一致。
- 对只读结果参数使用 `ReadOnly(true)`，避免用户误改运行结果。
- 对性能敏感的大对象避免进入 `Form`，可通过 `UsePropertyNames` 或 `ExceptPropertyNames` 精确控制显示范围。

## IocMessage 消息服务

`IocMessage` 位于 `Source/WPF-Control/Source/Services/H.Services.Message/IocMessage.cs`，是项目中统一访问消息、对话框、表单、通知、文件选择等 UI 服务的静态入口。它通过 IoC 容器获取具体服务，业务代码不需要直接依赖窗口或控件实现。

### 主要职责

`IocMessage` 主要用于：

- 显示普通提示、确认、错误信息。
- 显示自定义 Presenter 对话框。
- 显示 `Form` 自动表单编辑窗口。
- 显示 Snack 消息、Notify 通知、系统托盘通知。
- 显示等待、进度、字符串输入等交互对话框。
- 打开文件选择、保存文件、文件夹选择窗口。
- 在主窗口未加载时自动降级为 `MessageBox` 或独立窗口提示。

### 服务入口

`IocMessage` 暴露的常用服务：

| 入口 | 服务接口 | 说明 |
| --- | --- | --- |
| `IocMessage.Adorner` | `IAdornerDialogMessageService` | 基于装饰层的对话框服务 |
| `IocMessage.Window` | `IWindowDialogMessageService` | 独立窗口对话框服务 |
| `IocMessage.Dialog` | `IDialogMessageService` | 应用内通用对话框服务 |
| `IocMessage.Snack` | `ISnackMessageService` | 底部或轻量提示消息 |
| `IocMessage.Notify` | `INoticeMessageService` | 通知消息，支持信息、成功、警告、错误、进度等 |
| `IocMessage.SystemNotify` | `ISystemNotifyMessage` | 系统托盘气泡通知 |
| `IocMessage.TaskBar` | `ITaskBarMessage` | 任务栏状态提示 |
| `IocMessage.Form` | `IFormMessageService` | 自动表单编辑、查看和 Tab 编辑 |
| `IocMessage.IOFileDialog` | `IIOFileDialogService` | 打开文件、打开多个文件、保存文件 |
| `IocMessage.IOFolderDialog` | `IIOFolderDialogService` | 选择文件夹 |

当前主应用调用 `services.AddApplicationServices()` 后，会间接执行 `services.AddDefaultMessages()`，默认注册：

```text
AddAdornerDialogMessage()
AddWindowTransparencyMessage()
AddFormMessageService()
AddNoticeMessage()
AddSnackMessage()
AddIOFolderDialogService()
```

因此大多数业务代码可以直接使用 `IocMessage`。

### 普通提示与确认

最常用的是 `ShowDialogMessage`：

```csharp
await IocMessage.ShowDialogMessage("保存成功");
```

带标题：

```csharp
await IocMessage.ShowDialogMessage("模型文件不存在", "提示");
```

确认/取消：

```csharp
bool? r = await IocMessage.ShowDialogMessage(
    "删除数据无法恢复，确定要删除？",
    "确认删除",
    DialogButton.SumitAndCancel);

if (r == true)
{
    // 执行删除
}
```

`ShowDialogMessage` 内部会自动判断当前 UI 环境：

- 如果 `Dialog` 可用且主窗口已加载，优先使用应用内对话框。
- 如果主窗口未加载，但 `Window` 可用，则使用独立窗口。
- 如果消息服务尚未注册，则降级为 WPF `MessageBox`。

### 显示自定义 Presenter

如果要显示复杂内容，推荐创建 Presenter，然后交给 `IocMessage.ShowDialog` 或 `IocMessage.Dialog.Show`：

```csharp
var presenter = new MyResultPresenter();

bool? r = await IocMessage.ShowDialog(presenter, x =>
{
    x.Title = "检测结果";
    x.MinWidth = 800;
    x.MinHeight = 500;
    x.HorizontalContentAlignment = HorizontalAlignment.Stretch;
    x.VerticalContentAlignment = VerticalAlignment.Stretch;
});
```

需要在确认前执行校验时，可使用 `Dialog.Show` 的 `canSumit`：

```csharp
bool? r = await IocMessage.Dialog.Show(
    presenter,
    x => x.Title = "参数配置",
    async () =>
    {
        if (!presenter.IsValid)
        {
            await IocMessage.ShowDialogMessage("参数不正确");
            return false;
        }
        return true;
    });
```

### Form 表单消息

`IocMessage.Form` 用于快速显示对象编辑表单，内部使用 `Form`、`StaticFormPresenter` 或 `TabFormPresenter`。

编辑对象：

```csharp
bool? r = await IocMessage.Form.ShowEdit(this, x =>
{
    x.Title = "编辑节点参数";
}, null, x =>
{
    x.UseGroupNames = VisionPropertyGroupNames.RunParameters;
    x.UseCommand = false;
});
```

只读查看：

```csharp
await IocMessage.Form.ShowView(this, x =>
{
    x.Title = "查看参数";
}, x =>
{
    x.UseGroup = true;
});
```

Tab 分组编辑：

```csharp
bool? r = await IocMessage.Form.ShowTabEdit(data, x =>
{
    x.Title = "新建流程图";
}, null, x =>
{
    x.UseGroupNames = "基础信息,数据," + VisionPropertyGroupNames.DisplayParameters;
});
```

如果未传入自定义校验，`FormMessageService` 会调用对象的 `ModelState`，结合 `Required`、`Range` 等数据注解进行校验。

### Snack 与 Notify 消息

轻量提示可以使用 `Snack`：

```csharp
IocMessage.Snack?.ShowInfo("开始运行流程");
IocMessage.Snack?.ShowSuccess("运行成功");
IocMessage.Snack?.ShowWarn("参数可能不合理");
IocMessage.Snack?.ShowError("运行失败");
IocMessage.Snack?.ShowFatal("严重错误");
```

通知消息可以使用 `Notify`：

```csharp
IocMessage.Notify?.ShowInfo("检测完成");
IocMessage.Notify?.ShowSuccess("保存成功");
IocMessage.Notify?.ShowWarn("相机未连接");
IocMessage.Notify?.ShowError("保存失败");
```

`IocMessage` 还提供了带降级逻辑的简化方法：

```csharp
IocMessage.ShowSnackInfo("流程运行完成");
IocMessage.ShowNotifyInfo("检测完成");
```

如果对应服务不存在，会自动退回到普通对话框提示。

跨线程调用时，优先使用 Dispatcher 扩展方法：

```csharp
IocMessage.Snack?.ShowSuccessDispatcher("后台任务完成");
IocMessage.Notify?.ShowErrorDispatcher("后台任务失败");
```

### 进度、等待和批处理对话框

`IDialogMessageService` 支持进度、等待、字符串输入和循环批处理等场景。

进度示例：

```csharp
await IocMessage.Dialog.ShowPercent((dialog, percent) =>
{
    for (int i = 0; i <= 100; i++)
    {
        percent.Value = i;
        percent.Message = $"正在处理 {i}%";
        Thread.Sleep(20);
    }
    return true;
}, x =>
{
    x.Title = "处理中";
});
```

等待任务示例：

```csharp
await IocMessage.Dialog.ShowWait(dialog =>
{
    // 执行耗时任务
    Thread.Sleep(1000);
    return true;
}, x =>
{
    x.Title = "请稍候";
});
```

批处理示例：

```csharp
await IocMessage.Dialog.ShowForeach(
    () => files,
    file =>
    {
        // 处理单个文件
        return Tuple.Create(true, $"完成：{file}");
    },
    x => x.Title = "批量处理");
```

### 文件与文件夹选择

文件选择：

```csharp
string file = IocMessage.IOFileDialog.ShowOpenFile(x =>
{
    x.Filter = "图像文件|*.jpg;*.png;*.bmp|所有文件|*.*";
    x.Title = "选择图像";
});
```

多文件选择：

```csharp
string[] files = IocMessage.IOFileDialog.ShowOpenFiles(x =>
{
    x.Filter = "图像文件|*.jpg;*.png;*.bmp|所有文件|*.*";
    x.Title = "选择图像集合";
});
```

文件夹选择：

```csharp
IocMessage.IOFolderDialog.ShowOpenFolderAction(folder =>
{
    // 使用 folder
});
```

项目中的图像源节点就使用了 `IocMessage.IOFolderDialog.ShowOpenFolderAction(...)` 来添加图片文件夹。

### 在 NodeData 中的典型用法

节点中常见用法包括：

```csharp
protected override async Task<IFlowableResult> BeforeInvokeAsync(IFlowableLinkData previors, IFlowableDiagramData diagram)
{
    if (string.IsNullOrEmpty(this.ModelPath))
    {
        bool? r = await IocMessage.Form.ShowEdit(this, x =>
        {
            x.Title = "请先设置模型文件";
        }, null, x =>
        {
            x.UsePropertyNames = nameof(ModelPath);
        });

        if (r != true)
            return this.Error("未设置模型文件");
    }

    return await base.BeforeInvokeAsync(previors, diagram);
}
```

删除确认：

```csharp
await IocMessage.Dialog.ShowDeleteDialog(x =>
{
    this.Items.Clear();
});
```

运行完成提示：

```csharp
IocMessage.Notify?.ShowSuccess("检测记录保存成功");
```

### 注册与扩展

默认消息服务由 `services.AddApplicationServices()` 注册。如果只在独立测试项目或轻量应用中使用消息服务，可以按需注册：

```csharp
protected override void ConfigureServices(IServiceCollection services)
{
    base.ConfigureServices(services);

    services.AddDefaultMessages();
    // 或按需注册：
    services.AddFormMessageService();
    services.AddNoticeMessage();
    services.AddSnackMessage();
}
```

如果要替换某类消息实现，可以实现对应接口，例如 `IDialogMessageService`、`ISnackMessageService`、`INoticeMessageService`，然后在服务注册阶段替换默认实现。

### 使用建议

- 普通确认和提示优先使用 `await IocMessage.ShowDialogMessage(...)`。
- 轻量状态提示使用 `Snack` 或 `Notify`，不要频繁弹出阻塞对话框。
- 参数编辑使用 `IocMessage.Form.ShowEdit()`，不要手写重复窗口。
- 复杂内容使用 Presenter + `IocMessage.ShowDialog()`，保持数据和 UI 解耦。
- 后台线程触发 UI 消息时使用 `Dispatcher` 扩展方法或切回 UI 线程。
- 在启动早期或主窗口未加载时，`IocMessage` 会有降级逻辑，但业务代码仍应避免在服务注册前频繁弹窗。
- 对文件、文件夹选择优先使用 `IocMessage.IOFileDialog` 和 `IocMessage.IOFolderDialog`，便于统一替换实现。
- 输出节点可使用 `Notify`、`Snack`、`SystemNotify` 等服务实现运行结果提示。

## 二次开发示例

### 扩展功能节点

视觉流程中的节点通常以 `NodeData` 结尾，按功能放在 `Source/VisionMaster`、`Source/NodeDatas` 或应用项目的 `NodeDatas` 目录中。以 OpenCV 图像处理节点为例，推荐继承 `OpenCVNodeDataBase`，并通过 `Display`、`Icon` 和分组接口控制节点在流程资源面板中的展示位置。

#### 1. 创建节点类

例如新增一个“自定义阈值”节点，可在 `Source/VisionMaster/H.VisionMaster.OpenCV/NodeDatas` 下新增文件：

```csharp
using H.VisionMaster.NodeGroup.Groups.Blurs;

namespace H.VisionMaster.OpenCV.NodeDatas.Filter;

[Icon(FontIcons.InPrivate)]
[Display(Name = "自定义阈值", GroupName = "滤波模块", Description = "将输入图像转换为二值图像", Order = 100)]
public class CustomThresholdNodeData : OpenCVNodeDataBase, IBlurGroupableNodeData
{
    private double _threshold = 128;

    [DefaultValue(128.0)]
    [Display(Name = "阈值", GroupName = VisionPropertyGroupNames.RunParameters, Description = "像素值大于该阈值时输出最大值")]
    public double Threshold
    {
        get { return _threshold; }
        set
        {
            _threshold = value;
            RaisePropertyChanged();
            this.Invoke();
        }
    }

    private double _maxValue = 255;

    [DefaultValue(255.0)]
    [Display(Name = "最大值", GroupName = VisionPropertyGroupNames.RunParameters, Description = "二值化后的最大像素值")]
    public double MaxValue
    {
        get { return _maxValue; }
        set
        {
            _maxValue = value;
            RaisePropertyChanged();
            this.Invoke();
        }
    }

    protected override FlowableResult<IMatImage> Invoke(Mat fromImage)
    {
        Mat gray = new Mat();
        Mat dst = new Mat();

        if (fromImage.Channels() == 1)
            gray = fromImage.Clone();
        else
            Cv2.CvtColor(fromImage, gray, ColorConversionCodes.BGR2GRAY);

        Cv2.Threshold(gray, dst, this.Threshold, this.MaxValue, ThresholdTypes.Binary);
        gray.Dispose();

        return this.OK(dst);
    }
}
```

#### 2. 节点元数据说明

| 配置 | 作用 |
| --- | --- |
| `Display.Name` | 节点在资源面板和画布中的显示名称 |
| `Display.GroupName` | 节点所在功能分组，例如 `滤波模块`、`数据源`、`逻辑模块` |
| `Display.Description` | 节点说明，会用于属性、提示或帮助展示 |
| `Display.Order` | 同一分组内的排序 |
| `Icon` | 节点图标 |
| `IBlurGroupableNodeData` 等分组接口 | 控制节点归属的业务分组，建议参考同目录已有节点选择合适接口 |

#### 3. 参数属性约定

- 运行参数使用 `Display(GroupName = VisionPropertyGroupNames.RunParameters)`。
- 结果参数使用 `Display(GroupName = VisionPropertyGroupNames.ResultParameters)`，如需被条件节点引用，可参考已有节点使用 `Expressionable`。
- 参数变更后调用 `RaisePropertyChanged()`，需要实时预览时可继续调用 `this.Invoke()`。
- 默认值建议通过字段初始化、`DefaultValue` 或重写 `LoadDefault()` 设置。

#### 4. 节点执行逻辑

`OpenCVNodeDataBase` 的核心扩展点是：

```csharp
protected override FlowableResult<IMatImage> Invoke(Mat fromImage)
```

常见返回方式：

```csharp
return this.OK(dst);              // 执行成功并输出图像
return this.Error(fromImage);     // 执行失败并保留输入图像
```

如果节点需要返回额外的展示结果，可参考 `CreateShapeNodeData` 等节点，使用带 `IResultPresenter` 的 `OK` 重载。

#### 5. 注册与显示

通常情况下，节点类编译进已被主应用引用的项目后，会随节点资源加载逻辑自动被发现。若新增了独立类库，需要确保：

1. 类库目标框架与主工程一致，例如 `net8.0-windows`。
2. 主应用项目引用该类库。
3. 节点类为 `public`，且具备可识别的节点基类、接口和元数据特性。
4. 重新生成解决方案后，在流程资源面板中查看对应分组。

#### 6. 调试建议

- 优先复制同分组下已有节点作为模板，例如 `GaussianBlur`、`ForNodeData`、`CreateShapeNodeData`。
- OpenCV 的 `Mat` 涉及非托管资源，临时对象使用完成后应及时 `Dispose()`。
- 不建议直接修改输入 `Mat`，除非明确希望原图被覆盖；更安全的方式是输出新的 `Mat`。
- 节点运行异常时返回 `this.Error(...)`，避免异常直接中断整个流程。

## 文档维护说明

本文档作为仓库根文档，统一承载主应用说明、架构说明、控件说明和二次开发说明。后续维护建议：

- 主应用相关说明统一维护在根目录 `README.md`，避免 `Source/Apps/H.App.VisionMaster.OpenCV4/README.md` 与根文档重复。
- 新增应用能力时，优先更新“主应用概览”和“常见问题”。
- 新增核心模块时，优先更新“常用模块说明”和“核心概念与主要模块”。
- 新增节点开发规范时，优先更新“NodeData：功能节点”和“二次开发示例”。
- 修改启动配置、依赖注入或主题配置时，优先更新“应用启动、依赖注入与配置”。
- 修改控件机制时，优先更新 `Diagram`、`Form`、`IocMessage`、数据驱动 UI 等对应章节。
- 如果文档过长，可后续拆分为 `docs/` 目录，并在根 `README.md` 保留索引。

## 开发建议

- 新增视觉能力时，优先放入 `Source/VisionMaster` 或 `Source/NodeDatas` 下对应模块。
- 新增通用 WPF 控件时，优先放入 `Source/WPF-Control/Source/Controls`。
- 新增跨项目复用能力时，优先放入 `H.Extensions.*` 或 `H.Services.*`。
- 保持项目目标框架与 `Directory.Build.Props` 中的公共配置一致。
- 提交前建议执行 `dotnet restore` 和 `dotnet build`。

## 许可

从原作者正规渠道获取的源码遵循项目公共构建配置中声明使用 `MIT` 许可证。否则禁止一切商业行为。实际分发和使用请以仓库中的许可证文件及项目声明为准（推荐同作者签署许可或获得书面授权）。

作者：HeBianGu 联系方式：QQ908293466
