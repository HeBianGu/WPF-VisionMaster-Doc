# 【WPF-VisionMaster】 机器视觉通用平台V5.0版本二次开发说明

> 比较范围：`dev4.0.0..dev5.0.0`  
> 提交数量：366  
> 变更规模：2066 个文件，新增约 31.9 万行，删除约 71.1 万行  
> 运行框架：继续使用 `.NET 8 / net8.0-windows`

## 版本概述

5.0.0 是一次架构级升级，重点不是单纯增加视觉算子，而是将原有集中式工程重构为：

- 统一应用入口
- 基础能力分层
- 视觉功能插件化
- 商业控件与基础控件子模块化
- OpenCV、HALCON、ONNX、YOLO 能力统一集成

对于二次开发项目，不建议直接覆盖升级，应按照“基础框架、插件、业务工程、历史项目数据”四个层次逐步迁移。

## 主要更新

### 1. 应用程序入口统一

原有应用：

- `H.App.VisionMaster.OpenCV4`

已删除或整合，新版本使用统一入口：

- `Source/Apps/H.App.VisionMaster`

OpenCV、HALCON、相机、通信和 AI 推理功能通过核心组件及插件接入，不再建议维护多个独立应用壳。

### 2. 引入插件化视觉工具体系

新增 `Source/VisionMaster/Plugins`，主要插件包括：

- `H.VisionMaster.Plugins.Calculation`
- `H.VisionMaster.Plugins.Calibration`
- `H.VisionMaster.Plugins.CameraCalibration`
- `H.VisionMaster.Plugins.CameraCapturing`
- `H.VisionMaster.Plugins.Capturing`
- `H.VisionMaster.Plugins.ColorPreprocessing`
- `H.VisionMaster.Plugins.Communication`
- `H.VisionMaster.Plugins.DefectDetection`
- `H.VisionMaster.Plugins.Detection`
- `H.VisionMaster.Plugins.GeometryGeneration`
- `H.VisionMaster.Plugins.ImagePreprocessing`
- `H.VisionMaster.Plugins.Localization`
- `H.VisionMaster.Plugins.LogicTool`
- `H.VisionMaster.Plugins.Measure`
- `H.VisionMaster.Plugins.Network`
- `H.VisionMaster.Plugins.Onnx`
- `H.VisionMaster.Plugins.SplitCombine`
- `H.VisionMaster.Plugins.Yolo`

插件编译后会复制到主程序目录：

```text
bin/<Configuration>/net8.0-windows/Plugins/<AssemblyName>
```

这使业务专用算子可以独立开发和部署，减少对主程序及基础库的修改。

### 3. AI 与视觉检测能力增强

5.0.0 新增或重新组织了以下能力：

- ONNX 模型推理
- YOLO 分类
- YOLO 目标检测
- YOLO OBB 旋转框检测
- YOLO 姿态检测
- YOLO 实例分割
- 缺陷检测与检测记录
- 图像切片、合并及重叠框处理
- 相机标定和畸变校正
- 几何定位、测量和图像预处理
- 条形码及二维码识别

统一应用项目新增或明确引用：

- `OpenCvSharp4.Windows`
- `YoloSharp`
- `PaddleOCRSDK`
- `PaddleOCRRuntime_x64`
- `ZXing.Net.Bindings.Windows.Compatibility`
- `Microsoft.EntityFrameworkCore.Tools`
- `NModbus`
- `System.IO.Ports`

### 4. 核心项目重新分层

新增核心项目：

- `H.VisionMaster.Base`
- `H.VisionMaster.Communication`
- `H.VisionMaster.Halcon`
- `H.VisionMaster.OpenCVs.Onnx`

原有以下项目被删除、合并或迁移：

- `H.VisionMaster.NodeData`
- `H.VisionMaster.NodeGroup`
- `H.VisionMaster.DiagramData`
- `H.VisionMaster.ImageBox`
- `H.VisionMaster.ShapeBox`
- `H.VisionMaster.ShapeZoomBox`
- `H.VisionMaster.ResultPresenter`
- `H.VisionMaster.Network`
- `H.VisionMaster.DetectRecord`
- `H.VisionMaster.OpenCV`
- `H.VisionMaster.OpenCVs.TemplateMatch`

其中部分功能迁移到基础框架，部分迁移到对应插件。依赖这些程序集名称或命名空间的二次开发代码需要重新映射。

### 5. 子模块结构调整

4.0.0 直接引用：

```text
Source/WPF-Control
```

5.0.0 调整为：

```text
Source/WPF-CommercialControl
```

而 `WPF-Control` 位于：

```text
Source/WPF-CommercialControl/Source/WPF-Control
```

解决方案中的大量 `ProjectReference` 路径也随之变化。

### 6. 构建系统调整

项目版本从 `4.0.0` 更新为正式的 `5.0.0`，但目标框架仍为 `net8.0-windows`，语言版本仍为 C# 11。

## 不兼容变更

### 工程路径变化

所有包含以下路径的项目引用、脚本和 CI 配置都需要更新：

```text
Source/WPF-Control
```

调整为：

```text
Source/WPF-CommercialControl/Source/WPF-Control
```

### 程序入口变化

如果二次开发基于 `H.App.VisionMaster.OpenCV4` 或 `H.App.VisionMaster.Halcon`，不能继续把旧应用项目作为启动入口，应将业务代码迁移到：

- `H.App.VisionMaster`
- 独立业务插件
- 独立应用壳

### 程序集及命名空间变化

旧版直接引用的 NodeData、NodeGroup、Network、DetectRecord、OpenCV 等程序集，部分已不存在。

不建议仅通过批量替换命名空间解决，因为部分类型的基类、注册方式、资源字典和序列化信息也可能已经变化。

### 项目文件兼容性

项目保存仍涉及 Newtonsoft JSON 序列化。由于节点类型可能迁移到新程序集或新命名空间，4.0.0 保存的项目可能出现：

- 找不到节点类型
- 节点无法反序列化
- 属性恢复失败
- 插件未加载导致节点缺失
- ROI、检测结果或相机配置丢失

升级前必须备份真实生产项目文件，并使用副本验证。

## 二次开发升级建议

### 1. 不要直接合并两个版本

推荐建立独立迁移分支：

```powershell
git switch dev5.0.0
git switch -c upgrade/custom-to-5.0.0
git submodule sync --recursive
git submodule update --init --recursive
```

不要把 `dev4.0.0` 的整个 `Source`、解决方案文件或旧 `csproj` 直接覆盖到 5.0.0。

### 2. 先验证未经修改的 5.0.0

迁移业务代码之前先完成：

1. 递归初始化子模块。
2. 还原 NuGet 包。
3. 编译 `Solution/WPF-VisionMaster.sln`。
4. 启动 `H.App.VisionMaster`。
5. 验证 OpenCV、HALCON、相机和插件目录。
6. 确认目标机器的原生运行库完整。

只有原始 5.0.0 可以正常运行后，再开始迁移业务功能。

### 3. 将自定义节点改造成独立插件

推荐为二次开发创建独立项目，例如：

```text
Source/VisionMaster/Plugins/Company.VisionMaster.Plugins.Custom
```

插件项目只引用必要的基础项目，不应直接修改官方插件。构建输出遵循：

```text
Plugins/<AssemblyName>
```

这样后续升级 5.x 或 6.x 时，只需适配自定义插件，不必重新合并整个主仓库。

### 4. 按功能映射旧项目

建议使用以下迁移方向：

| 4.0 自定义依赖 | 5.0 建议迁移位置 |
| --- | --- |
| 通用节点基类、视觉接口 | `H.VisionMaster.Base` |
| 通信节点 | `H.VisionMaster.Communication` 或 `Plugins.Communication` |
| 网络功能 | `Plugins.Network` |
| 检测记录 | `Plugins.DetectRecord` |
| OpenCV 预处理 | `Plugins.ImagePreprocessing` |
| 模板匹配和定位 | `Plugins.Localization` |
| 测量节点 | `Plugins.Measure` |
| 标定功能 | `Plugins.Calibration` 或 `Plugins.CameraCalibration` |
| ONNX 推理 | `Plugins.Onnx` |
| YOLO 推理 | `Plugins.Yolo` |
| 条件、循环和逻辑节点 | `Plugins.LogicTool` |
| 图像拆分、合并 | `Plugins.SplitCombine` |

迁移时应重新添加引用并由 IDE 修正命名空间，避免保留对已删除程序集的隐式依赖。

### 5. 单独处理历史项目数据

建议建立 4.0 到 5.0 的项目转换流程：

1. 保留 4.0 可运行环境。
2. 复制项目文件及相关图片、模型、标定文件。
3. 在 5.0 中逐个打开。
4. 记录无法解析的节点类型。
5. 建立旧类型到新类型的映射。
6. 必要时提供兼容类型或专用转换工具。
7. 转换后另存为新文件，不覆盖原文件。

重点验证：

- 节点类型名称
- 程序集限定名称
- 节点连接关系
- 自定义属性
- ROI 和标定参数
- 相机序列号
- 模型及图片相对路径
- 检测记录数据库路径

### 6. 检查资源和 XAML

由于资源构建任务已经启用，自定义项目中手动声明的 PNG 资源可能与自动收集重复。

升级后应检查：

- 重复的 `Resource Include`
- `Generic.xaml` 是否正确合并
- `pack://application:,,,/` URI 中的程序集名称
- 自定义控件命名空间
- 插件资源字典的加载时机
- 图片究竟采用 `Resource` 还是 `Content`

### 7. 检查原生组件部署

以下组件可能需要 x64 原生文件或外部安装环境：

- HALCON
- OpenCvSharp
- PaddleOCR
- ONNX/YOLO 运行时
- 相机厂商 SDK

发布前应在没有开发环境的干净机器上验证，不能只确认 Visual Studio 中可以运行。

## 推荐升级顺序

1. 固定并备份 `dev4.0.0`。
2. 初始化 `dev5.0.0` 全部子模块。
3. 编译并运行原始 5.0.0。
4. 迁移配置和基础服务。
5. 新建业务插件。
6. 逐个迁移自定义节点。
7. 迁移 XAML、主题和资源。
8. 转换历史项目数据。
9. 验证相机、通信及原生 SDK。
10. 完成回归测试后再替换生产版本。

## 总体建议

> 将 5.0.0 作为新平台，将 4.0.0 的二次开发功能逐项移植为插件，而不是对两个分支进行整体代码合并。
