# Cv2.imgproc 开发指南 — OpenCVSharp API 参考文档

---

## 目录

- [一、滤波与导数计算](#一滤波与导数计算)
  - [GetGaussianKernel](#getgaussiankernel--获取高斯滤波器系数)
  - [GetDerivKernels](#getderivkernels--获取图像空间导数滤波器系数)
  - [GetGaborKernel](#getgaborkernel--获取-gabor-滤波器系数)
  - [GetStructuringElement](#getstructuringelement-重载1--获取形态学操作的结构元素)
  - [MedianBlur](#medianblur--中值滤波)
  - [GaussianBlur](#gaussianblur--高斯模糊)
  - [BilateralFilter](#bilateralfilter--双边滤波)
  - [BoxFilter](#boxfilter--方框滤波)
  - [SqrBoxFilter](#sqrboxfilter--平方方框滤波)
  - [Blur](#blur--均值模糊)
  - [Filter2D](#filter2d--图像卷积)
  - [SepFilter2D](#sepfilter2d--可分离线性滤波)
  - [Sobel](#sobel--sobel-算子)
  - [SpatialGradient](#spatialgradient--空间梯度)
  - [Scharr](#scharr--scharr-算子)
- [二、边缘检测、霍夫变换与形态学](#二边缘检测霍夫变换与形态学)
  - [Scharr](#scharr--scharr算子一阶导数)
  - [Laplacian](#laplacian--拉普拉斯算子)
  - [Canny](#canny--canny边缘检测)
  - [CornerMinEigenVal](#cornermineigenval--最小特征值角点检测)
  - [CornerHarris](#cornerharris--harris角点检测)
  - [CornerEigenValsAndVecs](#cornereigenvalsandvecs--特征值与特征向量角点分析)
  - [PreCornerDetect](#precornerdetect--预角点检测)
  - [CornerSubPix](#cornersubpix--亚像素级角点精炼)
  - [GoodFeaturesToTrack](#goodfeaturestotrack--强角点检测)
  - [HoughLines](#houghlines--标准霍夫线变换)
  - [HoughLinesP](#houghlinesp--概率霍夫线变换)
  - [HoughLinesPointSet](#houghlinespointset--点集霍夫线变换)
  - [HoughCircles](#houghcircles--霍夫圆检测)
  - [MorphologyDefaultBorderValue](#morphologydefaultbordervalue--形态学默认边界值)
  - [Dilate](#dilate--膨胀)
  - [Erode](#erode--腐蚀)
  - [MorphologyEx](#morphologyex--高级形态学变换)
  - [Resize](#resize--图像缩放)
- [三、几何变换与积分图](#三几何变换与积分图)
  - [WarpAffine](#warpaffine--仿射变换)
  - [WarpPerspective](#warpperspective--透视变换)
  - [Remap](#remap--重映射)
  - [ConvertMaps](#convertmaps--转换映射表)
  - [GetRotationMatrix2D](#getrotationmatrix2d--获取二维旋转矩阵)
  - [InvertAffineTransform](#invertaffinetransform--逆仿射变换)
  - [GetPerspectiveTransform](#getperspectivetransform--获取透视变换矩阵)
  - [GetAffineTransform](#getaffinetransform--获取仿射变换矩阵)
  - [GetRectSubPix](#getrectsubpix--亚像素精度提取矩形区域)
  - [LogPolar](#logpolar--对数极坐标重映射)
  - [LinearPolar](#linearpolar--线性极坐标重映射)
  - [WarpPolar](#warppolar--极坐标半对数极坐标重映射)
  - [Integral](#integral--积分图计算)
- [四、直方图、阈值与图像分割](#四直方图阈值与图像分割)
  - [Integral](#integral--图像积分图计算)
  - [Accumulate](#accumulate--图像累加)
  - [AccumulateSquare](#accumulatesquare--图像像素平方累加)
  - [AccumulateProduct](#accumulateproduct--图像逐元素乘积累加)
  - [AccumulateWeighted](#accumulateweighted--更新运行平均值)
  - [PhaseCorrelate](#phasecorrelate--相位相关法位移检测)
  - [CreateHanningWindow](#createhanningwindow--创建二维汉宁窗)
  - [Threshold](#threshold--固定阈值二值化)
  - [AdaptiveThreshold](#adaptivethreshold--自适应阈值)
  - [PyrDown](#pyrdown--图像金字塔降采样)
  - [BuildPyramid](#buildpyramid--构建图像金字塔)
  - [PyrUp](#pyrup--图像金字塔升采样)
  - [CalcHist](#calchist--计算直方图)
  - [CalcBackProject](#calcbackproject--直方图反向投影)
  - [CompareHist](#comparehist--直方图比较)
  - [EqualizeHist](#equalizehist--直方图均衡化)
  - [CreateCLAHE](#createclahe--创建-clahe-对象)
  - [EMD](#emd--推土机距离)
  - [Watershed](#watershed--分水岭分割)
  - [PyrMeanShiftFiltering](#pyrmeanshiftfiltering--均值漂移分割预处理)
  - [GrabCut](#grabcut--grabcut-图像分割)
  - [DistanceTransformWithLabels](#distancetransformwithlabels--带标签的距离变换)
  - [DistanceTransform](#distancetransform--距离变换)
  - [FloodFill](#floodfill--泛洪填充)
  - [BlendLinear](#blendlinear--线性混合)
  - [CvtColor](#cvtcolor--颜色空间转换)
- [五、颜色空间转换、连通组件与轮廓](#五颜色空间转换连通组件与轮廓)
  - [CvtColor](#cvtcolor--颜色空间转换-1)
  - [CvtColorTwoPlane](#cvttwoplane--双平面颜色空间转换)
  - [Demosaicing](#demosaicing--去马赛克处理)
  - [Moments](#moments--计算图像--点集的矩)
  - [MatchTemplate](#matchtemplate--模板匹配)
  - [ConnectedComponentsWithAlgorithm](#connectedcomponentswithalgorithm--带算法选择的连通组件标记)
  - [ConnectedComponents](#connectedcomponents--连通组件标记)
  - [ConnectedComponentsWithStatsWithAlgorithm](#connectedcomponentswithstatswithalgorithm--带统计和质心及算法选择的连通组件)
  - [ConnectedComponentsWithStats](#connectedcomponentswithstats--带统计和质心的连通组件)
  - [ConnectedComponentsEx](#connectedcomponentsex--封装版连通组件)
  - [FindContours](#findcontours--查找轮廓)
  - [FindContoursAsArray](#findcontoursasarray--查找轮廓并直接返回数组)
  - [FindContoursAsMat](#findcontoursasmat--查找轮廓并以-mat-数组返回)
  - [ApproxPolyDP](#approxpolydp--多边形逼近)
  - [ArcLength](#arclength--计算轮廓周长--曲线长度)
  - [BoundingRect](#boundingrect--计算正立外接矩形)
  - [ContourArea](#contourarea--计算轮廓面积)
  - [MinAreaRect](#minarearect--最小面积旋转矩形)
  - [BoxPoints](#boxpoints--获取旋转矩形的四个顶点)
  - [MinEnclosingCircle](#minenclosingcircle--最小包围圆)
- [六、形状分析与绘图](#六形状分析与绘图)
  - [MinEnclosingCircle](#minenclosingcircle--最小外接圆)
  - [MinEnclosingTriangle](#minenclosingtriangle--最小外接三角形)
  - [MatchShapes](#matchshapes--形状匹配)
  - [ConvexHull](#convexhull--凸包计算)
  - [ConvexHullIndices](#convexhullindices--凸包索引)
  - [ConvexityDefects](#convexitydefects--凸缺陷检测)
  - [IsContourConvex](#iscontourconvex--判断轮廓是否为凸)
  - [IntersectConvexConvex](#intersectconvexconvex--两凸多边形求交)
  - [FitEllipse](#fitellipse--椭圆拟合)
  - [FitEllipseAMS](#fitellipseams--椭圆拟合ams-方法)
  - [FitEllipseDirect](#fitellipsedirect--椭圆拟合direct-方法)
  - [FitLine](#fitline--直线拟合)
  - [PointPolygonTest](#pointpolygontest--点与轮廓位置关系检测)
  - [RotatedRectangleIntersection](#rotatedrectangleintersection--旋转矩形求交)
  - [ApplyColorMap](#applycolormap--伪彩色映射)
  - [Line](#line--绘制线段)
  - [ArrowedLine](#arrowedline--绘制箭头线段)
  - [Rectangle](#rectangle--绘制矩形)
  - [Circle](#circle--绘制圆形)
  - [Ellipse](#ellipse--绘制椭圆--椭圆弧)
  - [DrawMarker](#drawmarker--绘制标记)
  - [FillConvexPoly](#fillconvexpoly--填充凸多边形)
  - [FillPoly](#fillpoly--填充多边形区域)
  - [Polylines](#polylines--绘制多边形折线)
  - [DrawContours](#drawcontours--绘制轮廓)
  - [ClipLine](#clipline--裁剪线段到图像矩形)
  - [Ellipse2Poly](#ellipse2poly--椭圆弧折线近似)
  - [PutText](#puttext--绘制文本)
  - [GetTextSize](#gettextsize--获取文本尺寸)
  - [GetFontScaleFromHeight](#getfontscalefromheight--根据像素高度计算字体缩放)

---

## 一、滤波与导数计算

# OpenCVSharp Cv2 imgproc 方法参考 — 第 1 节：滤波器

---

## GetGaussianKernel — 获取高斯滤波器系数

**签名：** `public static Mat? GetGaussianKernel(int ksize, double sigma, MatType? ktype = null)`

**说明：** 返回高斯滤波器的系数矩阵。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| ksize | int | 孔径大小。必须为奇数且为正数。 |
| sigma | double | 高斯标准差。如果为非正数，则根据 ksize 自动计算：`sigma = 0.3*((ksize-1)*0.5 - 1) + 0.8`。 |
| ktype | MatType? | 滤波器系数的类型。可以是 CV_32F 或 CV_64F。默认为 CV_64F。 |

**返回值：** 返回一个 `Mat` 对象，包含高斯滤波器系数矩阵。如果内部创建失败则返回 `null`。

**示例：**
```csharp
// 获取一个 5x5 的高斯核，sigma = 1.0
Mat gaussianKernel = Cv2.GetGaussianKernel(5, 1.0);
// 可以用于自定义滤波或查看系数
```

---

## GetDerivKernels — 获取图像空间导数滤波器系数

**签名：** `public static void GetDerivKernels(OutputArray kx, OutputArray ky, int dx, int dy, int ksize, bool normalize = false, MatType? ktype = null)`

**说明：** 返回用于计算图像空间导数的滤波器系数。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| kx | OutputArray | 输出矩阵，行滤波器系数，类型为 ktype。 |
| ky | OutputArray | 输出矩阵，列滤波器系数，类型为 ktype。 |
| dx | int | 关于 x 的导数阶数。 |
| dy | int | 关于 y 的导数阶数。 |
| ksize | int | 孔径大小。可以是 CV_SCHARR、1、3、5 或 7。 |
| normalize | bool | 是否对滤波系数进行归一化（缩小）。理论上系数分母应为 `2^(ksize*2-dx-dy-2)`。如果处理浮点图像，建议使用归一化核；如果计算 8 位图像的导数并将结果存为 16 位图像以保留小数位，可设 normalize = false。默认为 false。 |
| ktype | MatType? | 滤波器系数类型。可以是 CV_32F 或 CV_64F。默认为 CV_32F。 |

**返回值：** 无返回值。结果通过 `kx` 和 `ky` 输出参数返回。

**示例：**
```csharp
using Mat kx = new Mat();
using Mat ky = new Mat();
Cv2.GetDerivKernels(kx, ky, dx: 1, dy: 0, ksize: 3, normalize: true);
// kx 包含 x 方向的一阶导数核，ky 包含 y 方向的
```

---

## GetGaborKernel — 获取 Gabor 滤波器系数

**签名：** `public static Mat GetGaborKernel(Size ksize, double sigma, double theta, double lambd, double gamma, double psi, int ktype)`

**说明：** 返回 Gabor 滤波器的系数矩阵。

> 关于 Gabor 滤波器方程和参数的更多细节，请参考：https://en.wikipedia.org/wiki/Gabor_filter

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| ksize | Size | 返回的滤波器大小。 |
| sigma | double | 高斯包络的标准差。 |
| theta | double | Gabor 函数平行条纹法线的方向角度。 |
| lambd | double | 正弦因子的波长。 |
| gamma | double | 空间纵横比。 |
| psi | double | 相位偏移。 |
| ktype | int | 滤波器系数类型。可以是 CV_32F 或 CV_64F。 |

**返回值：** 返回一个 `Mat` 对象，包含 Gabor 滤波器系数矩阵。

**示例：**
```csharp
// 创建一个 31x31 的 Gabor 核
Size ksize = new Size(31, 31);
double sigma = 5.0;
double theta = Math.PI / 4;  // 45 度方向
double lambd = 10.0;
double gamma = 0.5;
double psi = 0;
Mat gaborKernel = Cv2.GetGaborKernel(ksize, sigma, theta, lambd, gamma, psi, (int)MatType.CV_32F);
// 可用于纹理分析等
```

---

## GetStructuringElement (重载1) — 获取形态学操作的结构元素

**签名：** `public static Mat GetStructuringElement(MorphShapes shape, Size ksize)`

**说明：** 返回指定大小和形状的结构元素，用于形态学操作。该函数构造并返回结构元素，可进一步传递给 erode、dilate 或 morphologyEx。当然你也可以自己构造任意二值掩码作为结构元素使用。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| shape | MorphShapes | 元素形状，取值为 MorphShapes 枚举之一。 |
| ksize | Size | 结构元素的大小。 |

**返回值：** 返回一个 `Mat` 对象，包含构造好的结构元素。锚点默认为中心 `(-1, -1)`。

**示例：**
```csharp
// 创建一个 5x5 的矩形结构元素
Mat element = Cv2.GetStructuringElement(MorphShapes.Rect, new Size(5, 5));
Cv2.Dilate(src, dst, element);
```

---

## GetStructuringElement (重载2) — 获取形态学操作的结构元素（指定锚点）

**签名：** `public static Mat GetStructuringElement(MorphShapes shape, Size ksize, Point anchor)`

**说明：** 返回指定大小和形状的结构元素，用于形态学操作。该函数构造并返回结构元素，可进一步传递给 erode、dilate 或 morphologyEx。当然你也可以自己构造任意二值掩码作为结构元素使用。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| shape | MorphShapes | 元素形状，取值为 MorphShapes 枚举之一。 |
| ksize | Size | 结构元素的大小。 |
| anchor | Point | 元素内的锚点位置。默认值 `(-1, -1)` 表示锚点位于中心。注意只有十字形元素的结果依赖于锚点位置，其他情况下锚点仅调节形态学结果的偏移量。 |

**返回值：** 返回一个 `Mat` 对象，包含构造好的结构元素。

**示例：**
```csharp
// 创建一个 7x7 的椭圆结构元素，锚点在左上角
Mat element = Cv2.GetStructuringElement(MorphShapes.Ellipse, new Size(7, 7), new Point(0, 0));
Cv2.Erode(src, dst, element);
```

---

## MedianBlur — 中值滤波

**签名：** `public static void MedianBlur(InputArray src, OutputArray dst, int ksize)`

**说明：** 使用中值滤波器平滑图像。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像，1、3 或 4 通道。当 ksize 为 3 或 5 时，图像深度应为 CV_8U、CV_16U 或 CV_32F；对于更大的孔径，只能为 CV_8U。 |
| dst | OutputArray | 目标图像，与 src 大小和类型相同。 |
| ksize | int | 孔径线性尺寸。必须为大于 1 的奇数，如 3、5、7…… |

**返回值：** 无返回值。滤波结果写入 `dst`。

**示例：**
```csharp
using Mat src = Cv2.ImRead("image.jpg");
using Mat dst = new Mat();
Cv2.MedianBlur(src, dst, 5);
// dst 包含中值滤波后的结果，对椒盐噪声特别有效
```

---

## GaussianBlur — 高斯模糊

**签名：** `public static void GaussianBlur(InputArray src, OutputArray dst, Size ksize, double sigmaX, double sigmaY = 0, BorderTypes borderType = BorderTypes.Default)`

**说明：** 使用高斯滤波器对图像进行模糊处理。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像；可以有任意数量的通道，各通道独立处理。深度应为 CV_8U、CV_16U、CV_16S、CV_32F 或 CV_64F。 |
| dst | OutputArray | 输出图像，与 src 大小和类型相同。 |
| ksize | Size | 高斯核大小。ksize.Width 和 ksize.Height 可以不同，但必须都为正奇数，或者均为零（此时由 sigma 自动计算）。 |
| sigmaX | double | X 方向的高斯核标准差。 |
| sigmaY | double | Y 方向的高斯核标准差。如果 sigmaY 为零，则设为与 sigmaX 相同；如果两个 sigma 都为零，则由 ksize.Width 和 ksize.Height 分别计算。为完全控制结果，建议同时指定 ksize、sigmaX 和 sigmaY。默认为 0。 |
| borderType | BorderTypes | 像素外推方法。默认为 BorderTypes.Default。 |

**返回值：** 无返回值。模糊结果写入 `dst`。

**示例：**
```csharp
using Mat src = Cv2.ImRead("image.jpg");
using Mat dst = new Mat();
// 使用 5x5 核，sigma 自动计算
Cv2.GaussianBlur(src, dst, new Size(5, 5), 0);
// 或手动指定 sigma
Cv2.GaussianBlur(src, dst, new Size(0, 0), 3.0, 3.0);
```

---

## BilateralFilter — 双边滤波

**签名：** `public static void BilateralFilter(InputArray src, OutputArray dst, int d, double sigmaColor, double sigmaSpace, BorderTypes borderType = BorderTypes.Default)`

**说明：** 对图像应用双边滤波器。双边滤波能够在保持边缘清晰的同时对图像进行平滑处理。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像，8 位或浮点型，1 通道或 3 通道。 |
| dst | OutputArray | 目标图像，与 src 大小和类型相同。 |
| d | int | 滤波时每个像素邻域的直径。如果为非正数，则由 sigmaSpace 计算得出。 |
| sigmaColor | double | 颜色空间滤波 sigma。值越大，像素邻域内颜色差异较大的像素也会被混合，产生更大面积的半均匀颜色区域。 |
| sigmaSpace | double | 坐标空间滤波 sigma。值越大，距离较远的像素也会相互影响（前提是颜色足够接近；参见 sigmaColor）。当 d > 0 时，d 指定邻域大小而不考虑 sigmaSpace；否则 d 与 sigmaSpace 成正比。 |
| borderType | BorderTypes | 像素外推方法。默认为 BorderTypes.Default。 |

**返回值：** 无返回值。滤波结果写入 `dst`。

**示例：**
```csharp
using Mat src = Cv2.ImRead("image.jpg");
using Mat dst = new Mat();
// 保持边缘的平滑，常用于美颜或去噪
Cv2.BilateralFilter(src, dst, 9, 75, 75);
// d=9 邻域直径，颜色 sigma=75，空间 sigma=75
```

---

## BoxFilter — 方框滤波

**签名：** `public static void BoxFilter(InputArray src, OutputArray dst, MatType ddepth, Size ksize, Point? anchor = null, bool normalize = true, BorderTypes borderType = BorderTypes.Default)`

**说明：** 使用方框滤波器平滑图像。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像。 |
| dst | OutputArray | 目标图像，与 src 大小和类型相同。 |
| ddepth | MatType | 目标图像深度。 |
| ksize | Size | 平滑核大小。 |
| anchor | Point? | 锚点位置。默认值 `Point(-1, -1)` 表示锚点位于核中心。 |
| normalize | bool | 核是否按其面积归一化。默认为 true。 |
| borderType | BorderTypes | 图像外像素的外推方法。默认为 BorderTypes.Default。 |

**返回值：** 无返回值。滤波结果写入 `dst`。

**示例：**
```csharp
using Mat src = Cv2.ImRead("image.jpg");
using Mat dst = new Mat();
// 归一化方框滤波（等同于均值模糊）
Cv2.BoxFilter(src, dst, src.Type(), new Size(5, 5), normalize: true);
```

---

## SqrBoxFilter — 平方方框滤波

**签名：** `public static void SqrBoxFilter(InputArray src, OutputArray dst, int ddepth, Size ksize, Point? anchor = null, bool normalize = true, BorderTypes borderType = BorderTypes.Default)`

**说明：** 计算与滤波器重叠的像素值的归一化平方和。

对于源图像中的每个像素 f(x, y)，该函数计算放置在该像素上的滤波器范围内相邻像素值的平方和。未归一化的平方方框滤波器可用于计算局部图像统计量，如像素邻域周围的局部方差和标准差。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像。 |
| dst | OutputArray | 目标图像。 |
| ddepth | int | 目标图像深度。 |
| ksize | Size | 核大小。 |
| anchor | Point? | 锚点位置。默认值为 `(-1, -1)`。 |
| normalize | bool | 是否归一化。默认为 true。 |
| borderType | BorderTypes | 边界类型。默认为 BorderTypes.Default。 |

**返回值：** 无返回值。结果写入 `dst`。

**示例：**
```csharp
using Mat src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using Mat dst = new Mat();
// 计算局部像素平方和
Cv2.SqrBoxFilter(src, dst, MatType.CV_32F, new Size(5, 5));
// dst 包含每个像素 5x5 邻域的平方和
```

---

## Blur — 均值模糊

**签名：** `public static void Blur(InputArray src, OutputArray dst, Size ksize, Point? anchor = null, BorderTypes borderType = BorderTypes.Default)`

**说明：** 使用归一化方框滤波器平滑图像。这是最简单的线性滤波器之一。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像。 |
| dst | OutputArray | 目标图像，与 src 大小和类型相同。 |
| ksize | Size | 平滑核大小。 |
| anchor | Point? | 锚点位置。默认值 `Point(-1, -1)` 表示锚点位于核中心。 |
| borderType | BorderTypes | 图像外像素的外推方法。默认为 BorderTypes.Default。 |

**返回值：** 无返回值。模糊结果写入 `dst`。

**示例：**
```csharp
using Mat src = Cv2.ImRead("image.jpg");
using Mat dst = new Mat();
// 使用 5x5 核进行均值模糊
Cv2.Blur(src, dst, new Size(5, 5));
```

---

## Filter2D — 图像卷积

**签名：** `public static void Filter2D(InputArray src, OutputArray dst, MatType ddepth, InputArray kernel, Point? anchor = null, double delta = 0, BorderTypes borderType = BorderTypes.Default)`

**说明：** 使用指定的核对图像进行卷积。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像。 |
| dst | OutputArray | 目标图像，与 src 大小和通道数相同。 |
| ddepth | MatType | 目标图像的期望深度。如果为负数，则与 src 深度相同。 |
| kernel | InputArray | 卷积核（实际为相关核），单通道浮点矩阵。如果要为不同通道应用不同核，可使用 split() 将图像分离为单独的颜色平面后分别处理。 |
| anchor | Point? | 核的锚点，表示滤波点在核内的相对位置。锚点应在核范围内。默认值 `(-1, -1)` 表示锚点在核中心。 |
| delta | double | 滤波后加到每个像素上的可选偏移值。默认为 0。 |
| borderType | BorderTypes | 像素外推方法。默认为 BorderTypes.Default。 |

**返回值：** 无返回值。卷积结果写入 `dst`。

**示例：**
```csharp
using Mat src = Cv2.ImRead("image.jpg");
using Mat dst = new Mat();
// 定义一个 3x3 的锐化核
float[] kernelData = { 0, -1, 0, -1, 5, -1, 0, -1, 0 };
using Mat kernel = new Mat(3, 3, MatType.CV_32F, kernelData);
Cv2.Filter2D(src, dst, -1, kernel);
// dst 为锐化后的图像
```

---

## SepFilter2D — 可分离线性滤波

**签名：** `public static void SepFilter2D(InputArray src, OutputArray dst, MatType ddepth, InputArray kernelX, InputArray kernelY, Point? anchor = null, double delta = 0, BorderTypes borderType = BorderTypes.Default)`

**说明：** 对图像应用可分离线性滤波器。先将 kernelX 应用于每一行，再将 kernelY 应用于每一列。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像。 |
| dst | OutputArray | 目标图像，与 src 大小和通道数相同。 |
| ddepth | MatType | 目标图像深度。 |
| kernelX | InputArray | 每行的滤波系数。 |
| kernelY | InputArray | 每列的滤波系数。 |
| anchor | Point? | 核内的锚点位置。默认值 `(-1, -1)` 表示锚点在核中心。 |
| delta | double | 滤波后加到每个像素上的偏移值。默认为 0。 |
| borderType | BorderTypes | 像素外推方法。默认为 BorderTypes.Default。 |

**返回值：** 无返回值。滤波结果写入 `dst`。

**示例：**
```csharp
using Mat src = Cv2.ImRead("image.jpg");
using Mat dst = new Mat();
// 高斯滤波可以分解为 x 和 y 方向的可分离滤波
Mat kernelX = Cv2.GetGaussianKernel(5, 1.0);
Mat kernelY = Cv2.GetGaussianKernel(5, 1.0);
Cv2.SepFilter2D(src, dst, -1, kernelX, kernelY);
// 等价于高斯模糊，但有时效率更高
```

---

## Sobel — Sobel 算子

**签名：** `public static void Sobel(InputArray src, OutputArray dst, MatType ddepth, int xorder, int yorder, int ksize = 3, double scale = 1, double delta = 0, BorderTypes borderType = BorderTypes.Default)`

**说明：** 使用扩展的 Sobel 算子计算一阶、二阶、三阶或混合图像导数。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像。 |
| dst | OutputArray | 目标图像，与 src 大小和通道数相同。 |
| ddepth | MatType | 目标图像深度。 |
| xorder | int | x 方向导数阶数。 |
| yorder | int | y 方向导数阶数。 |
| ksize | int | 扩展 Sobel 核大小，必须为 1、3、5 或 7。默认为 3。 |
| scale | double | 计算导数值的可选缩放因子（默认不缩放）。默认为 1。 |
| delta | double | 存入 dst 之前加到结果上的可选偏移值。默认为 0。 |
| borderType | BorderTypes | 像素外推方法。默认为 BorderTypes.Default。 |

**返回值：** 无返回值。导数图像写入 `dst`。

**示例：**
```csharp
using Mat src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using Mat gradX = new Mat();
using Mat gradY = new Mat();
// 计算 x 方向梯度
Cv2.Sobel(src, gradX, MatType.CV_16S, xorder: 1, yorder: 0, ksize: 3);
// 计算 y 方向梯度
Cv2.Sobel(src, gradY, MatType.CV_16S, xorder: 0, yorder: 1, ksize: 3);
// 注意：结果通常需要取绝对值并转换回 CV_8U 用于显示
```

---

## SpatialGradient — 空间梯度

**签名：** `public static void SpatialGradient(InputArray src, OutputArray dx, OutputArray dy, int ksize = 3, BorderTypes borderType = BorderTypes.Default)`

**说明：** 使用 Sobel 算子同时计算 x 和 y 方向的一阶图像导数。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像。 |
| dx | OutputArray | x 方向一阶导数的输出图像。 |
| dy | OutputArray | y 方向一阶导数的输出图像。 |
| ksize | int | Sobel 核大小，必须为 3。默认为 3。 |
| borderType | BorderTypes | 像素外推方法。默认为 BorderTypes.Default。 |

**返回值：** 无返回值。x 和 y 方向的导数分别写入 `dx` 和 `dy`。

**示例：**
```csharp
using Mat src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using Mat dx = new Mat();
using Mat dy = new Mat();
Cv2.SpatialGradient(src, dx, dy);
// dx 包含 x 方向梯度，dy 包含 y 方向梯度
```

---

## Scharr — Scharr 算子

**签名：** `public static void Scharr(InputArray src, OutputArray dst, MatType ddepth, int xorder, int yorder, double scale = 1, double delta = 0, BorderTypes borderType = BorderTypes.Default)`

**说明：** 使用 Scharr 算子计算一阶 x 或 y 方向图像导数。Scharr 算子比 Sobel 算子（核大小 3）具有更好的旋转对称性，因此梯度方向估计更精确。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像。 |
| dst | OutputArray | 目标图像，与 src 大小和通道数相同。 |
| ddepth | MatType | 目标图像深度。 |
| xorder | int | x 方向导数阶数。 |
| yorder | int | y 方向导数阶数。 |
| scale | double | 计算导数值的可选缩放因子（默认不缩放）。默认为 1。 |
| delta | double | 存入 dst 之前加到结果上的可选偏移值。默认为 0。 |
| borderType | BorderTypes | 像素外推方法。默认为 BorderTypes.Default。 |

**返回值：** 无返回值。导数图像写入 `dst`。

**示例：**
```csharp
using Mat src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using Mat dst = new Mat();
// x 方向 Scharr 梯度
Cv2.Scharr(src, dst, MatType.CV_16S, xorder: 1, yorder: 0);
// Scharr 算子在 ksize=3 时比 Sobel 精度更高
```

---

## 二、边缘检测、霍夫变换与形态学

# OpenCVSharp Cv2 imgproc 方法参考 — 第2节：边缘检测与形态学操作

> 本文档基于 OpenCVSharp Cv2_imgproc.cs 源码提取，涵盖边缘检测、角点检测、霍夫变换及形态学操作相关方法。

---

## Scharr — Scharr算子（一阶导数）

**签名：** `void Scharr(InputArray src, OutputArray dst, MatType ddepth, int xorder, int yorder, double scale = 1, double delta = 0, BorderTypes borderType = BorderTypes.Default)`

**说明：** 使用Scharr算子计算图像的一阶x方向或y方向导数。Scharr算子比Sobel算子对图像梯度有更好的旋转对称性。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入源图像 |
| dst | OutputArray | 输出目标图像；尺寸和通道数与src相同 |
| ddepth | MatType | 目标图像的深度 |
| xorder | int | x方向导数的阶数 |
| yorder | int | y方向导数的阶数 |
| scale | double | 可选的计算导数值的缩放因子（默认为1，即不缩放） |
| delta | double | 可选的增量值，在结果存入dst之前加到结果上 |
| borderType | BorderTypes | 像素外推方法 |

**返回值：** 无返回值（void），结果写入dst。

**示例：**
```csharp
using var src = new Mat("image.jpg", ImreadModes.Grayscale);
using var dstX = new Mat();
using var dstY = new Mat();

// 计算x方向一阶导数（深度CV_16S防止溢出）
Cv2.Scharr(src, dstX, MatType.CV_16S, xorder: 1, yorder: 0);
// 计算y方向一阶导数
Cv2.Scharr(src, dstY, MatType.CV_16S, xorder: 0, yorder: 1);
```

---

## Laplacian — 拉普拉斯算子

**签名：** `void Laplacian(InputArray src, OutputArray dst, MatType ddepth, int ksize = 1, double scale = 1, double delta = 0, BorderTypes borderType = BorderTypes.Default)`

**说明：** 计算图像的拉普拉斯算子（二阶导数）。用于检测图像中的边缘区域——强度发生快速变化的区域。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入源图像 |
| dst | OutputArray | 输出目标图像；尺寸和通道数与src相同 |
| ddepth | MatType | 目标图像所需深度 |
| ksize | int | 用于计算二阶导数滤波器的孔径大小（默认1） |
| scale | double | 可选的计算Laplacian值的缩放因子（默认为1，即不缩放） |
| delta | double | 可选的增量值，在结果存入dst之前加到结果上 |
| borderType | BorderTypes | 像素外推方法 |

**返回值：** 无返回值（void），结果写入dst。

**示例：**
```csharp
using var src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using var dst = new Mat();

// 计算拉普拉斯算子，深度CV_16S
Cv2.Laplacian(src, dst, MatType.CV_16S, ksize: 3);

// 转换回8位用于显示
using var absDst = new Mat();
Cv2.ConvertScaleAbs(dst, absDst);
```

---

## Canny — Canny边缘检测

**签名：** `void Canny(InputArray src, OutputArray edges, double threshold1, double threshold2, int apertureSize = 3, bool L2gradient = false)`

**说明：** 使用Canny算法在图像中查找边缘。这是最流行的边缘检测算法之一，包含多阶段处理：噪声抑制、梯度计算、非极大值抑制和双阈值滞后处理。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 单通道8位输入图像 |
| edges | OutputArray | 输出的边缘图；尺寸和类型与src相同 |
| threshold1 | double | 滞后阈值处理的第一阈值（低阈值） |
| threshold2 | double | 滞后阈值处理的第二阈值（高阈值） |
| apertureSize | int | Sobel算子的孔径大小（默认为ApertureSize.Size3，即3x3） |
| L2gradient | bool | 是否使用更精确的L2范数计算图像梯度幅值（true），或使用更快的L1范数（false，默认） |

**返回值：** 无返回值（void），结果写入edges。

**示例：**
```csharp
using var src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using var edges = new Mat();

// Canny边缘检测
Cv2.Canny(src, edges, threshold1: 100, threshold2: 200);
Cv2.ImShow("Canny Edges", edges);
Cv2.WaitKey();
```

---

## Canny（自定义梯度重载） — Canny边缘检测（自定义图像梯度）

**签名：** `void Canny(InputArray dx, InputArray dy, OutputArray edges, double threshold1, double threshold2, bool L2gradient = false)`

**说明：** 使用Canny算法和用户指定的图像梯度进行边缘检测。当你已经通过Sobel或Scharr等方法计算了x和y方向导数时，可以使用此重载避免重复计算。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| dx | InputArray | 输入图像的16位x方向导数（CV_16SC1或CV_16SC3） |
| dy | InputArray | 输入图像的16位y方向导数（类型与dx相同） |
| edges | OutputArray | 输出的边缘图；单通道8位图像，尺寸与输入图像相同 |
| threshold1 | double | 滞后阈值处理的第一阈值（低阈值） |
| threshold2 | double | 滞后阈值处理的第二阈值（高阈值） |
| L2gradient | bool | 是否使用更精确的L2范数（true），或更快的L1范数（false，默认） |

**返回值：** 无返回值（void），结果写入edges。

**示例：**
```csharp
using var src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using var dx = new Mat();
using var dy = new Mat();
using var edges = new Mat();

// 先计算梯度
Cv2.Sobel(src, dx, MatType.CV_16S, xorder: 1, yorder: 0, ksize: 3);
Cv2.Sobel(src, dy, MatType.CV_16S, xorder: 0, yorder: 1, ksize: 3);

// 使用自定义梯度进行Canny边缘检测
Cv2.Canny(dx, dy, edges, threshold1: 100, threshold2: 200);
```

---

## CornerMinEigenVal — 最小特征值角点检测

**签名：** `void CornerMinEigenVal(InputArray src, OutputArray dst, int blockSize, int ksize = 3, BorderTypes borderType = BorderTypes.Default)`

**说明：** 计算梯度矩阵的最小特征值，用于角点检测。该值是Shi-Tomasi角点检测器的基础。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入单通道8位或浮点图像 |
| dst | OutputArray | 存储最小特征值的图像；类型为CV_32FC1，尺寸与src相同 |
| blockSize | int | 邻域大小 |
| ksize | int | Sobel算子的孔径参数（默认3） |
| borderType | BorderTypes | 像素外推方法（不支持BORDER_WRAP） |

**返回值：** 无返回值（void），结果写入dst。

**示例：**
```csharp
using var src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using var dst = new Mat();

// 计算最小特征值图
Cv2.CornerMinEigenVal(src, dst, blockSize: 5, ksize: 3);

// 进一步使用GoodFeaturesToTrack提取角点
var corners = Cv2.GoodFeaturesToTrack(src, 100, 0.01, 10, null, 3, false, 0.04);
```

---

## CornerHarris — Harris角点检测

**签名：** `void CornerHarris(InputArray src, OutputArray dst, int blockSize, int ksize, double k, BorderTypes borderType = BorderTypes.Default)`

**说明：** Harris角点检测器。通过分析局部窗口在不同方向上的强度变化来识别图像中的角点区域。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入单通道8位或浮点图像 |
| dst | OutputArray | 存储Harris检测器响应的图像；类型为CV_32FC1，尺寸与src相同 |
| blockSize | int | 邻域大小 |
| ksize | int | Sobel算子的孔径参数 |
| k | double | Harris检测器的自由参数（通常取0.04–0.06） |
| borderType | BorderTypes | 像素外推方法（不支持BORDER_WRAP） |

**返回值：** 无返回值（void），结果写入dst。

**示例：**
```csharp
using var src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using var dst = new Mat();
using var dstNorm = new Mat();

// Harris角点检测
Cv2.CornerHarris(src, dst, blockSize: 2, ksize: 3, k: 0.04);

// 归一化并标记角点
Cv2.Normalize(dst, dstNorm, 0, 255, NormTypes.MinMax);
for (int y = 0; y < dstNorm.Rows; y++)
{
    for (int x = 0; x < dstNorm.Cols; x++)
    {
        if (dstNorm.At<byte>(y, x) > 120)
        {
            Cv2.Circle(src, new Point(x, y), 5, Scalar.Red, 1);
        }
    }
}
```

---

## CornerEigenValsAndVecs — 特征值与特征向量角点分析

**签名：** `void CornerEigenValsAndVecs(InputArray src, OutputArray dst, int blockSize, int ksize, BorderTypes borderType = BorderTypes.Default)`

**说明：** 计算每个像素处2x2导数协方差矩阵的特征值和特征向量。输出为6通道矩阵，包含更丰富的角点特征信息。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像 |
| dst | OutputArray | 输出6通道图像 |
| blockSize | int | 邻域大小 |
| ksize | int | Sobel算子的孔径大小 |
| borderType | BorderTypes | 像素外推方法 |

**返回值：** 无返回值（void），结果写入dst。

**示例：**
```csharp
using var src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using var dst = new Mat();

// 计算特征值与特征向量
Cv2.CornerEigenValsAndVecs(src, dst, blockSize: 5, ksize: 3);

// dst为6通道CV_32FC1类型
// 通道0-1: λ1, λ2（特征值）
// 通道2-3: v1（第一个特征向量）
// 通道4-5: v2（第二个特征向量）
```

---

## PreCornerDetect — 预角点检测

**签名：** `void PreCornerDetect(InputArray src, OutputArray dst, int ksize, BorderTypes borderType = BorderTypes.Default)`

**说明：** 在每个像素处计算另一种复杂的角点度量准则。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像 |
| dst | OutputArray | 输出图像 |
| ksize | int | Sobel算子的孔径大小 |
| borderType | BorderTypes | 像素外推方法 |

**返回值：** 无返回值（void），结果写入dst。

**示例：**
```csharp
using var src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using var dst = new Mat();

Cv2.PreCornerDetect(src, dst, ksize: 3);
```

---

## CornerSubPix — 亚像素级角点精炼

**签名：** `Point2f[] CornerSubPix(InputArray image, IEnumerable<Point2f> inputCorners, Size winSize, Size zeroZone, TermCriteria criteria)`

**说明：** 以亚像素精度调整角点位置，使特定的角点度量准则最大化。通过迭代优化将初始浮点角点坐标精炼到更精确的位置。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputArray | 输入图像 |
| inputCorners | IEnumerable\<Point2f\> | 初始角点坐标（也作为精炼后坐标的输出） |
| winSize | Size | 搜索窗口半边长度 |
| zeroZone | Size | 搜索区域中间死区的一半大小（在此区域内不进行求和）。值(-1, -1)表示没有死区 |
| criteria | TermCriteria | 角点精炼迭代过程的终止条件（通过maxCount或epsilon控制） |

**返回值：** `Point2f[]` —— 精炼后的亚像素精度角点坐标数组。

**示例：**
```csharp
using var src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);

// 先检测粗略角点
var corners = Cv2.GoodFeaturesToTrack(src, 100, 0.01, 10, null, 3, false, 0.04);

// 亚像素精炼
var criteria = new TermCriteria(CriteriaTypes.Eps | CriteriaTypes.MaxIter, 30, 0.001);
var refinedCorners = Cv2.CornerSubPix(src, corners, new Size(5, 5), new Size(-1, -1), criteria);

// 绘制精炼后的角点
foreach (var pt in refinedCorners)
{
    Cv2.Circle(src, (Point)pt, 3, Scalar.Red, -1);
}
```

---

## GoodFeaturesToTrack — 强角点检测

**签名：** `Point2f[] GoodFeaturesToTrack(InputArray src, int maxCorners, double qualityLevel, double minDistance, InputArray mask, int blockSize, bool useHarrisDetector, double k)`

**说明：** 查找cornerMinEigenVal()或cornerHarris()报告局部最大值的强角点。这是Shi-Tomasi（默认）和Harris角点检测的统一接口。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入8位或32位浮点单通道图像 |
| maxCorners | int | 返回的最大角点数量；若实际检测到更多，则返回最强的一部分 |
| qualityLevel | double | 表征图像角点最小可接受质量的参数。该值乘以最佳角点的质量度量值，低于此乘积的角点被拒绝。例如最佳角点质量=1500，qualityLevel=0.01，则质量低于15的角点被拒绝 |
| minDistance | double | 返回角点之间的最小欧几里得距离 |
| mask | InputArray | 可选感兴趣区域。若非空，需为CV_8UC1类型且与图像尺寸相同，指定角点检测区域 |
| blockSize | int | 用于计算每个像素邻域导数协方差矩阵的平均块大小 |
| useHarrisDetector | bool | 是否使用Harris检测器（false则使用Shi-Tomasi的最小特征值方法） |
| k | double | Harris检测器的自由参数（仅useHarrisDetector=true时有效） |

**返回值：** `Point2f[]` —— 检测到的角点坐标数组。

**示例：**
```csharp
using var src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using var display = src.Clone();

// Shi-Tomasi角点检测
var corners = Cv2.GoodFeaturesToTrack(
    src, maxCorners: 50, qualityLevel: 0.01, minDistance: 10,
    mask: null, blockSize: 3, useHarrisDetector: false, k: 0.04);

foreach (var pt in corners)
{
    Cv2.Circle(display, (Point)pt, 5, Scalar.Red, 1);
}
Cv2.ImShow("Corners", display);
Cv2.WaitKey();
```

---

## HoughLines — 标准霍夫线变换

**签名：** `LineSegmentPolar[] HoughLines(InputArray image, double rho, double theta, int threshold, double srn = 0, double stn = 0)`

**说明：** 使用标准霍夫变换在二值图像中查找直线。返回用(rho, theta)表示的直线集合。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputArray | 8位单通道二值源图像（可能会被函数修改） |
| rho | double | 累加器的距离分辨率（像素） |
| theta | double | 累加器的角度分辨率（弧度） |
| threshold | int | 累加器阈值参数；只有获得足够票数（>threshold）的直线才会被返回 |
| srn | double | 多尺度霍夫变换中距离分辨率rho的除数（默认为0，即不启用多尺度） |
| stn | double | 多尺度霍夫变换中角度分辨率theta的除数（默认为0，即不启用多尺度） |

**返回值：** `LineSegmentPolar[]` —— 检测到的直线数组。每条直线由一个两元素向量(rho, theta)表示，rho是坐标原点(0,0)到直线的距离，theta是直线旋转角度（弧度）。

**示例：**
```csharp
using var src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using var edges = new Mat();

// 先用Canny提取边缘
Cv2.Canny(src, edges, 50, 200);

// 霍夫线检测
var lines = Cv2.HoughLines(edges, rho: 1, theta: Math.PI / 180, threshold: 100);

using var display = src.Clone();
foreach (var line in lines)
{
    var rho = line.Rho;
    var theta = line.Theta;
    double a = Math.Cos(theta), b = Math.Sin(theta);
    double x0 = a * rho, y0 = b * rho;
    var pt1 = new Point((int)(x0 + 1000 * (-b)), (int)(y0 + 1000 * a));
    var pt2 = new Point((int)(x0 - 1000 * (-b)), (int)(y0 - 1000 * a));
    Cv2.Line(display, pt1, pt2, Scalar.Red, 1);
}
```

---

## HoughLinesP — 概率霍夫线变换

**签名：** `LineSegmentPoint[] HoughLinesP(InputArray image, double rho, double theta, int threshold, double minLineLength = 0, double maxLineGap = 0)`

**说明：** 使用概率霍夫变换在二值图像中查找线段。与标准霍夫变换不同，此版本直接返回线段的端点坐标。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputArray | 输入图像 |
| rho | double | 累加器的距离分辨率（像素） |
| theta | double | 累加器的角度分辨率（弧度） |
| threshold | int | 累加器阈值参数；只有获得足够票数（>threshold）的线段才会被返回 |
| minLineLength | double | 最小线段长度；短于此长度的线段被拒绝（默认为0） |
| maxLineGap | double | 同一直线上点之间的最大允许间隙，用于连接线段（默认为0） |

**返回值：** `LineSegmentPoint[]` —— 检测到的线段数组。每条线段由4个元素表示：(x1, y1, x2, y2)。

**示例：**
```csharp
using var src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using var edges = new Mat();

Cv2.Canny(src, edges, 50, 200);

// 概率霍夫线检测
var lines = Cv2.HoughLinesP(edges, rho: 1, theta: Math.PI / 180,
    threshold: 50, minLineLength: 50, maxLineGap: 10);

using var display = src.Clone();
foreach (var line in lines)
{
    Cv2.Line(display, line.P1, line.P2, Scalar.Red, 2);
}
```

---

## HoughLinesPointSet — 点集霍夫线变换

**签名：** `void HoughLinesPointSet(InputArray point, OutputArray lines, int linesMax, int threshold, double minRho, double maxRho, double rhoStep, double minTheta, double maxTheta, double thetaStep)`

**说明：** 使用标准霍夫变换的修改版本在点集中查找直线。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| point | InputArray | 输入点集向量；每个点以(x, y)编码，类型必须为CV_32FC2或CV_32SC2 |
| lines | OutputArray | 输出找到的直线向量；每条线编码为Vec3d |
| linesMax | int | 霍夫直线的最大数量 |
| threshold | int | 累加器阈值参数；只有获得足够票数的直线才会被返回 |
| minRho | double | 累加器中像素的最小距离值 |
| maxRho | double | 累加器中像素的最大距离值 |
| rhoStep | double | 累加器中像素的距离分辨率 |
| minTheta | double | 累加器中弧度的最小角度值 |
| maxTheta | double | 累加器中弧度的最大角度值 |
| thetaStep | double | 累加器中弧度的角度分辨率 |

**返回值：** 无返回值（void），结果写入lines。

**示例：**
```csharp
using var points = new Mat(100, 1, MatType.CV_32FC2);
// 填充点集...
using var lines = new Mat();

Cv2.HoughLinesPointSet(points, lines,
    linesMax: 50, threshold: 10,
    minRho: 0, maxRho: 500, rhoStep: 1,
    minTheta: 0, maxTheta: Math.PI, thetaStep: Math.PI / 180);
```

---

## HoughCircles — 霍夫圆检测

**签名：** `CircleSegment[] HoughCircles(InputArray image, HoughModes method, double dp, double minDist, double param1 = 100, double param2 = 100, int minRadius = 0, int maxRadius = 0)`

**说明：** 使用霍夫变换在灰度图像中查找圆形。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputArray | 8位单通道灰度输入图像 |
| method | HoughModes | 可用方法：HoughModes.Gradient和HoughModes.GradientAlt |
| dp | double | 累加器分辨率与图像分辨率的反比（例如dp=1时累加器与图像分辨率相同，dp=2时累加器为一半分辨率） |
| minDist | double | 检测到的圆中心之间的最小距离 |
| param1 | double | 第一个方法特定参数（对于Gradient方法，是传递给Canny的高阈值，低阈值为其一半——默认为100） |
| param2 | double | 第二个方法特定参数（对于Gradient方法，是圆心检测的累加器阈值，越小越容易检测到更多假圆——默认为100） |
| minRadius | int | 最小圆半径（默认为0） |
| maxRadius | int | 最大圆半径（默认为0，即无限制） |

**返回值：** `CircleSegment[]` —— 找到的圆的数组。每个圆编码为一个3元素浮点向量：(x, y, radius)。

**示例：**
```csharp
using var src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using var blurred = new Mat();

// 先高斯模糊减少噪声
Cv2.GaussianBlur(src, blurred, new Size(9, 9), 2);

// 霍夫圆检测
var circles = Cv2.HoughCircles(blurred, HoughModes.Gradient,
    dp: 1, minDist: 20, param1: 100, param2: 30, minRadius: 10, maxRadius: 100);

using var display = src.CvtColor(ColorConversionCodes.GRAY2BGR);
foreach (var circle in circles)
{
    Cv2.Circle(display, (Point)circle.Center, (int)circle.Radius, Scalar.Red, 2);
    Cv2.Circle(display, (Point)circle.Center, 2, Scalar.Green, -1);
}
```

---

## MorphologyDefaultBorderValue — 形态学默认边界值

**签名：** `Scalar MorphologyDefaultBorderValue()`

**说明：** Dilate/Erode操作的默认borderValue。返回最大值Scalar。

| 参数 | 类型 | 说明 |
| --- | --- | --- |

**返回值：** `Scalar` —— 对应于double.MaxValue的Scalar值，用作形态学操作的默认边界值。

**示例：**
```csharp
var defaultBorder = Cv2.MorphologyDefaultBorderValue();
// 通常不需要手动调用，Dilate/Erode会自动使用此默认值
```

---

## Dilate — 膨胀

**签名：** `void Dilate(InputArray src, OutputArray dst, InputArray? element, Point? anchor = null, int iterations = 1, BorderTypes borderType = BorderTypes.Constant, Scalar? borderValue = null)`

**说明：** 使用特定结构元素对图像进行膨胀操作。膨胀是形态学基本操作之一，使亮区域"生长"或"加厚"。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入源图像 |
| dst | OutputArray | 输出目标图像；尺寸和类型与src相同 |
| element | InputArray? | 用于膨胀的结构元素；若为new Mat()，则使用3x3矩形结构元素 |
| anchor | Point? | 锚点在结构元素内的位置；默认值(-1, -1)表示锚点位于元素中心 |
| iterations | int | 膨胀操作的重复次数（默认为1） |
| borderType | BorderTypes | 像素外推方法（默认为BorderType.Constant） |
| borderValue | Scalar? | 常量边界情况下的边界值；默认值为CvCpp.MorphologyDefaultBorderValue() |

**返回值：** 无返回值（void），结果写入dst。

**示例：**
```csharp
using var src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using var dst = new Mat();

// 使用5x5椭圆核进行膨胀
using var kernel = Cv2.GetStructuringElement(MorphShapes.Ellipse, new Size(5, 5));
Cv2.Dilate(src, dst, kernel, iterations: 1);

// 或使用默认3x3矩形核
Cv2.Dilate(src, dst, null, iterations: 2);
```

---

## Erode — 腐蚀

**签名：** `void Erode(InputArray src, OutputArray dst, InputArray? element, Point? anchor = null, int iterations = 1, BorderTypes borderType = BorderTypes.Constant, Scalar? borderValue = null)`

**说明：** 使用特定结构元素对图像进行腐蚀操作。腐蚀是形态学基本操作之一，使亮区域"收缩"或"变薄"。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入源图像 |
| dst | OutputArray | 输出目标图像；尺寸和类型与src相同 |
| element | InputArray? | 用于腐蚀的结构元素；若为new Mat()，则使用3x3矩形结构元素 |
| anchor | Point? | 锚点在结构元素内的位置；默认值(-1, -1)表示锚点位于元素中心 |
| iterations | int | 腐蚀操作的重复次数（默认为1） |
| borderType | BorderTypes | 像素外推方法（默认为BorderType.Constant） |
| borderValue | Scalar? | 常量边界情况下的边界值；默认值为CvCpp.MorphologyDefaultBorderValue() |

**返回值：** 无返回值（void），结果写入dst。

**示例：**
```csharp
using var src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using var dst = new Mat();

// 使用3x3矩形核进行腐蚀
using var kernel = Cv2.GetStructuringElement(MorphShapes.Rect, new Size(3, 3));
Cv2.Erode(src, dst, kernel, iterations: 1);
```

---

## MorphologyEx — 高级形态学变换

**签名：** `void MorphologyEx(InputArray src, OutputArray dst, MorphTypes op, InputArray? element, Point? anchor = null, int iterations = 1, BorderTypes borderType = BorderTypes.Constant, Scalar? borderValue = null)`

**说明：** 执行高级形态学变换。支持开运算、闭运算、形态学梯度、顶帽和黑帽等多种操作。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入源图像 |
| dst | OutputArray | 输出目标图像；尺寸和类型与src相同 |
| op | MorphTypes | 形态学操作类型（如Open, Close, Gradient, TopHat, BlackHat等） |
| element | InputArray? | 结构元素 |
| anchor | Point? | 锚点在结构元素内的位置；默认值(-1, -1)表示锚点位于元素中心 |
| iterations | int | 腐蚀和膨胀的应用次数（默认为1） |
| borderType | BorderTypes | 像素外推方法（默认为BorderType.Constant） |
| borderValue | Scalar? | 常量边界情况下的边界值；默认值为CvCpp.MorphologyDefaultBorderValue() |

**返回值：** 无返回值（void），结果写入dst。

**示例：**
```csharp
using var src = Cv2.ImRead("image.jpg", ImreadModes.Grayscale);
using var dst = new Mat();

using var kernel = Cv2.GetStructuringElement(MorphShapes.Rect, new Size(5, 5));

// 开运算（先腐蚀后膨胀）
Cv2.MorphologyEx(src, dst, MorphTypes.Open, kernel);

// 闭运算（先膨胀后腐蚀）
Cv2.MorphologyEx(src, dst, MorphTypes.Close, kernel);

// 形态学梯度（膨胀 - 腐蚀）
Cv2.MorphologyEx(src, dst, MorphTypes.Gradient, kernel);

// 顶帽（原图 - 开运算）
Cv2.MorphologyEx(src, dst, MorphTypes.TopHat, kernel);

// 黑帽（闭运算 - 原图）
Cv2.MorphologyEx(src, dst, MorphTypes.BlackHat, kernel);
```

---

## Resize — 图像缩放

**签名：** `void Resize(InputArray src, OutputArray dst, Size dsize, double fx = 0, double fy = 0, InterpolationFlags interpolation = InterpolationFlags.Linear)`

**说明：** 调整图像尺寸。可以通过指定目标尺寸(dsize)或缩放因子(fx, fy)来缩放图像。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像 |
| dst | OutputArray | 输出图像；尺寸为dsize（非零时）或由src.Size()、fx、fy计算得出；类型与src相同 |
| dsize | Size | 输出图像尺寸；若为零则计算为 `dsize = Size(round(fx*src.cols), round(fy*src.rows))`。dsize和(fx, fy)必须有一方非零 |
| fx | double | 水平轴缩放因子；等于0时计算为 `(double)dsize.width/src.cols` |
| fy | double | 垂直轴缩放因子；等于0时计算为 `(double)dsize.height/src.rows` |
| interpolation | InterpolationFlags | 插值方法（默认为InterpolationFlags.Linear双线性插值） |

**返回值：** 无返回值（void），结果写入dst。

**示例：**
```csharp
using var src = Cv2.ImRead("image.jpg");

// 方式1：指定目标尺寸
using var dst1 = new Mat();
Cv2.Resize(src, dst1, new Size(640, 480));

// 方式2：指定缩放因子（缩小一半）
using var dst2 = new Mat();
Cv2.Resize(src, dst2, new Size(), fx: 0.5, fy: 0.5);

// 方式3：使用不同插值方法（最近邻，放大2倍）
using var dst3 = new Mat();
Cv2.Resize(src, dst3, new Size(), fx: 2.0, fy: 2.0,
    interpolation: InterpolationFlags.Nearest);
```

---

## 三、几何变换与积分图

# 第3节：几何变换 — Geometric Transformations (imgproc)

---

## WarpAffine — 仿射变换

**签名：** `void WarpAffine(InputArray src, OutputArray dst, InputArray m, Size dsize, InterpolationFlags flags = InterpolationFlags.Linear, BorderTypes borderMode = BorderTypes.Constant, Scalar? borderValue = null)`

**说明：** 对图像应用仿射变换。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像 |
| dst | OutputArray | 输出图像，其尺寸为dsize，类型与src相同 |
| m | InputArray | 2×3 仿射变换矩阵 |
| dsize | Size | 输出图像的尺寸 |
| flags | InterpolationFlags | 插值方法的组合，可选标志 WARP_INVERSE_MAP 表示 M 是逆变换（从dst到src） |
| borderMode | BorderTypes | 像素外推方法；当 borderMode=BORDER_TRANSPARENT 时，目标图像中对应于源图像"异常值"的像素不会被函数修改 |
| borderValue | Scalar? | 常量边界时使用的值，默认为 0 |

**返回值：** 无返回值（void），结果直接写入 dst

**示例：**
```csharp
using OpenCvSharp;

// 读取图像
Mat src = Cv2.ImRead("input.jpg");
Mat dst = new Mat();

// 定义仿射变换矩阵（平移+旋转）
Mat m = new Mat(2, 3, MatType.CV_64FC1);
// 例如：绕中心旋转30度并平移
Point2f center = new Point2f(src.Width / 2f, src.Height / 2f);
m = Cv2.GetRotationMatrix2D(center, 30, 1.0);

// 执行仿射变换
Cv2.WarpAffine(src, dst, m, src.Size());

// 保存结果
Cv2.ImWrite("output_affine.jpg", dst);
```

---

## WarpPerspective — 透视变换（InputArray 重载）

**签名：** `void WarpPerspective(InputArray src, OutputArray dst, InputArray m, Size dsize, InterpolationFlags flags = InterpolationFlags.Linear, BorderTypes borderMode = BorderTypes.Constant, Scalar? borderValue = null)`

**说明：** 对图像应用透视变换。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像 |
| dst | OutputArray | 输出图像，其尺寸为dsize，类型与src相同 |
| m | InputArray | 3×3 透视变换矩阵 |
| dsize | Size | 输出图像的尺寸 |
| flags | InterpolationFlags | 插值方法组合（INTER_LINEAR 或 INTER_NEAREST），可选标志 WARP_INVERSE_MAP 表示 M 是逆变换（从dst到src） |
| borderMode | BorderTypes | 像素外推方法（BORDER_CONSTANT 或 BORDER_REPLICATE） |
| borderValue | Scalar? | 常量边界时使用的值，默认为 0 |

**返回值：** 无返回值（void），结果直接写入 dst

**示例：**
```csharp
using OpenCvSharp;

Mat src = Cv2.ImRead("input.jpg");
Mat dst = new Mat();

// 定义源四边形和目标四边形的四个顶点
Point2f[] srcPoints = new Point2f[]
{
    new Point2f(0, 0),
    new Point2f(src.Width - 1, 0),
    new Point2f(src.Width - 1, src.Height - 1),
    new Point2f(0, src.Height - 1)
};

Point2f[] dstPoints = new Point2f[]
{
    new Point2f(50, 50),
    new Point2f(src.Width - 100, 30),
    new Point2f(src.Width - 80, src.Height - 80),
    new Point2f(30, src.Height - 50)
};

// 计算透视变换矩阵
Mat perspectiveMatrix = Cv2.GetPerspectiveTransform(srcPoints, dstPoints);

// 执行透视变换
Cv2.WarpPerspective(src, dst, perspectiveMatrix, src.Size());

Cv2.ImWrite("output_perspective.jpg", dst);
```

---

## WarpPerspective — 透视变换（float[,] 重载）

**签名：** `void WarpPerspective(InputArray src, OutputArray dst, float[,] m, Size dsize, InterpolationFlags flags = InterpolationFlags.Linear, BorderTypes borderMode = BorderTypes.Constant, Scalar? borderValue = null)`

**说明：** 对图像应用透视变换（使用 float[,] 二维数组作为变换矩阵）。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像 |
| dst | OutputArray | 输出图像，其尺寸为dsize，类型与src相同 |
| m | float[,] | 3×3 透视变换矩阵（二维浮点数组） |
| dsize | Size | 输出图像的尺寸 |
| flags | InterpolationFlags | 插值方法组合（INTER_LINEAR 或 INTER_NEAREST），可选标志 WARP_INVERSE_MAP 表示 M 是逆变换（从dst到src） |
| borderMode | BorderTypes | 像素外推方法（BORDER_CONSTANT 或 BORDER_REPLICATE） |
| borderValue | Scalar? | 常量边界时使用的值，默认为 0 |

**返回值：** 无返回值（void），结果直接写入 dst

**示例：**
```csharp
using OpenCvSharp;

Mat src = Cv2.ImRead("input.jpg");
Mat dst = new Mat();

// 直接使用 float[,] 定义透视变换矩阵
float[,] perspectiveMatrix = new float[3, 3]
{
    { 0.8f, 0.1f, 30f },
    { 0.0f, 0.9f, 20f },
    { 0.0001f, 0.0001f, 1f }
};

Cv2.WarpPerspective(src, dst, perspectiveMatrix, src.Size());

Cv2.ImWrite("output_perspective_float.jpg", dst);
```

---

## Remap — 重映射

**签名：** `void Remap(InputArray src, OutputArray dst, InputArray map1, InputArray map2, InterpolationFlags interpolation = InterpolationFlags.Linear, BorderTypes borderMode = BorderTypes.Constant, Scalar? borderValue = null)`

**说明：** 对图像应用通用几何变换。通过指定的映射关系，将源图像中的每个像素重新映射到目标图像中的新位置。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像 |
| dst | OutputArray | 目标图像，尺寸与map1相同，类型与src相同 |
| map1 | InputArray | 第一个映射表，可以是 (x,y) 点集或仅 x 值，类型为 CV_16SC2、CV_32FC1 或 CV_32FC2 |
| map2 | InputArray | 第二个映射表，y 值，类型为 CV_16UC1、CV_32FC1，或空矩阵（如果map1已经是(x,y)点集） |
| interpolation | InterpolationFlags | 插值方法，该函数不支持 INTER_AREA 方法 |
| borderMode | BorderTypes | 像素外推方法；当 borderMode=BORDER_TRANSPARENT 时，目标图像中对应于源图像"异常值"的像素不会被修改 |
| borderValue | Scalar? | 常量边界时使用的值，默认为 0 |

**返回值：** 无返回值（void），结果直接写入 dst

**示例：**
```csharp
using OpenCvSharp;

Mat src = Cv2.ImRead("input.jpg");
Mat dst = new Mat();

// 创建 x 和 y 方向的映射表，实现水平翻转
Mat mapX = new Mat(src.Size(), MatType.CV_32FC1);
Mat mapY = new Mat(src.Size(), MatType.CV_32FC1);

for (int y = 0; y < src.Rows; y++)
{
    for (int x = 0; x < src.Cols; x++)
    {
        mapX.Set<float>(y, x, src.Cols - 1 - x); // 水平翻转
        mapY.Set<float>(y, x, y);                  // 保持 y 不变
    }
}

Cv2.Remap(src, dst, mapX, mapY);
Cv2.ImWrite("output_remap.jpg", dst);
```

---

## ConvertMaps — 转换映射表

**签名：** `void ConvertMaps(InputArray map1, InputArray map2, OutputArray dstmap1, OutputArray dstmap2, MatType dstmap1Type, bool nnInterpolation = false)`

**说明：** 将图像变换映射表从一种表示形式转换为另一种表示形式。常用于优化 Remap 函数的性能，将浮点映射转换为定点映射以加速处理。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| map1 | InputArray | 第一个输入映射表，类型为 CV_16SC2、CV_32FC1 或 CV_32FC2 |
| map2 | InputArray | 第二个输入映射表，类型为 CV_16UC1、CV_32FC1，或空矩阵 |
| dstmap1 | OutputArray | 第一个输出映射表，类型为 dstmap1type，尺寸与src相同 |
| dstmap2 | OutputArray | 第二个输出映射表 |
| dstmap1Type | MatType | 第一个输出映射表的类型，应为 CV_16SC2、CV_32FC1 或 CV_32FC2 |
| nnInterpolation | bool | 指示定点映射表是否用于最近邻插值还是更复杂的插值 |

**返回值：** 无返回值（void），结果写入 dstmap1 和 dstmap2

**示例：**
```csharp
using OpenCvSharp;

Mat src = Cv2.ImRead("input.jpg");

// 创建映射表
Mat mapX = new Mat(src.Size(), MatType.CV_32FC1);
Mat mapY = new Mat(src.Size(), MatType.CV_32FC1);
// ... 填充 mapX 和 mapY ...

// 转换为定点映射以提高 Remap 性能
Mat dstMap1 = new Mat();
Mat dstMap2 = new Mat();
Cv2.ConvertMaps(mapX, mapY, dstMap1, dstMap2, MatType.CV_16SC2, false);

// 使用转换后的映射进行重映射
Mat dst = new Mat();
Cv2.Remap(src, dst, dstMap1, dstMap2);
```

---

## GetRotationMatrix2D — 获取二维旋转矩阵

**签名：** `Mat GetRotationMatrix2D(Point2f center, double angle, double scale)`

**说明：** 计算二维旋转的仿射矩阵。返回一个 2×3 的仿射变换矩阵，可用于 WarpAffine 函数。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| center | Point2f | 源图像中旋转的中心点坐标 |
| angle | double | 旋转角度（度）。正值表示逆时针旋转（坐标原点为左上角） |
| scale | double | 各向同性缩放因子 |

**返回值：** 返回一个 2×3 的 Mat 对象，表示仿射旋转矩阵

**示例：**
```csharp
using OpenCvSharp;

Mat src = Cv2.ImRead("input.jpg");

// 以图像中心为旋转中心，旋转45度，缩放0.8倍
Point2f center = new Point2f(src.Width / 2f, src.Height / 2f);
Mat rotMatrix = Cv2.GetRotationMatrix2D(center, 45, 0.8);

Mat dst = new Mat();
Cv2.WarpAffine(src, dst, rotMatrix, src.Size());

Cv2.ImWrite("output_rotated.jpg", dst);
```

---

## InvertAffineTransform — 逆仿射变换

**签名：** `void InvertAffineTransform(InputArray m, OutputArray im)`

**说明：** 求仿射变换的逆变换。给定一个仿射变换矩阵，计算其逆矩阵。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| m | InputArray | 原始仿射变换矩阵 |
| im | OutputArray | 输出的逆仿射变换矩阵 |

**返回值：** 无返回值（void），逆矩阵写入 im

**示例：**
```csharp
using OpenCvSharp;

Mat src = Cv2.ImRead("input.jpg");

// 创建正向仿射变换
Point2f center = new Point2f(src.Width / 2f, src.Height / 2f);
Mat forwardMatrix = Cv2.GetRotationMatrix2D(center, 30, 1.0);

// 计算逆变换
Mat inverseMatrix = new Mat();
Cv2.InvertAffineTransform(forwardMatrix, inverseMatrix);

// 使用逆变换撤销之前的变换
Mat restored = new Mat();
Cv2.WarpAffine(src, restored, inverseMatrix, src.Size());
```

---

## GetPerspectiveTransform — 获取透视变换矩阵（IEnumerable 重载）

**签名：** `Mat GetPerspectiveTransform(IEnumerable<Point2f> src, IEnumerable<Point2f> dst)`

**说明：** 根据四对对应点计算透视变换矩阵。该函数计算透视变换的 3×3 矩阵。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | IEnumerable\<Point2f\> | 源图像中四边形顶点的坐标 |
| dst | IEnumerable\<Point2f\> | 目标图像中对应四边形顶点的坐标 |

**返回值：** 返回一个 3×3 的 Mat 对象，表示透视变换矩阵

**示例：**
```csharp
using OpenCvSharp;
using System.Collections.Generic;

Mat src = Cv2.ImRead("input.jpg");

// 定义源图像和目标图像中的四个对应点
List<Point2f> srcPoints = new List<Point2f>
{
    new Point2f(56, 65),
    new Point2f(368, 52),
    new Point2f(28, 387),
    new Point2f(389, 390)
};

List<Point2f> dstPoints = new List<Point2f>
{
    new Point2f(0, 0),
    new Point2f(300, 0),
    new Point2f(0, 300),
    new Point2f(300, 300)
};

// 计算透视变换矩阵
Mat perspectiveMatrix = Cv2.GetPerspectiveTransform(srcPoints, dstPoints);

// 应用透视变换
Mat dst = new Mat();
Cv2.WarpPerspective(src, dst, perspectiveMatrix, new Size(300, 300));

Cv2.ImWrite("output_perspective_transform.jpg", dst);
```

---

## GetPerspectiveTransform — 获取透视变换矩阵（InputArray 重载）

**签名：** `Mat GetPerspectiveTransform(InputArray src, InputArray dst)`

**说明：** 根据四对对应点计算透视变换矩阵。该函数计算透视变换的 3×3 矩阵。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像中四边形顶点的坐标（作为 InputArray） |
| dst | InputArray | 目标图像中对应四边形顶点的坐标（作为 InputArray） |

**返回值：** 返回一个 3×3 的 Mat 对象，表示透视变换矩阵

**示例：**
```csharp
using OpenCvSharp;

Mat src = Cv2.ImRead("input.jpg");

// 使用 Mat 作为输入
Mat srcPoints = new Mat(4, 1, MatType.CV_32FC2);
Mat dstPoints = new Mat(4, 1, MatType.CV_32FC2);

srcPoints.Set(0, 0, new Point2f(56, 65));
srcPoints.Set(1, 0, new Point2f(368, 52));
srcPoints.Set(2, 0, new Point2f(28, 387));
srcPoints.Set(3, 0, new Point2f(389, 390));

dstPoints.Set(0, 0, new Point2f(0, 0));
dstPoints.Set(1, 0, new Point2f(300, 0));
dstPoints.Set(2, 0, new Point2f(0, 300));
dstPoints.Set(3, 0, new Point2f(300, 300));

Mat perspectiveMatrix = Cv2.GetPerspectiveTransform(srcPoints, dstPoints);

Mat dst = new Mat();
Cv2.WarpPerspective(src, dst, perspectiveMatrix, new Size(300, 300));
```

---

## GetAffineTransform — 获取仿射变换矩阵（IEnumerable 重载）

**签名：** `Mat GetAffineTransform(IEnumerable<Point2f> src, IEnumerable<Point2f> dst)`

**说明：** 根据三对对应点计算仿射变换矩阵。该函数计算仿射变换的 2×3 矩阵。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | IEnumerable\<Point2f\> | 源图像中三角形顶点的坐标 |
| dst | IEnumerable\<Point2f\> | 目标图像中对应三角形顶点的坐标 |

**返回值：** 返回一个 2×3 的 Mat 对象，表示仿射变换矩阵

**示例：**
```csharp
using OpenCvSharp;
using System.Collections.Generic;

Mat src = Cv2.ImRead("input.jpg");

// 定义三对对应点
List<Point2f> srcPoints = new List<Point2f>
{
    new Point2f(0, 0),
    new Point2f(src.Width - 1, 0),
    new Point2f(0, src.Height - 1)
};

List<Point2f> dstPoints = new List<Point2f>
{
    new Point2f(0, 0),
    new Point2f(src.Width - 1, 50),
    new Point2f(50, src.Height - 1)
};

// 计算仿射变换矩阵
Mat affineMatrix = Cv2.GetAffineTransform(srcPoints, dstPoints);

Mat dst = new Mat();
Cv2.WarpAffine(src, dst, affineMatrix, src.Size());

Cv2.ImWrite("output_affine_transform.jpg", dst);
```

---

## GetAffineTransform — 获取仿射变换矩阵（InputArray 重载）

**签名：** `Mat GetAffineTransform(InputArray src, InputArray dst)`

**说明：** 根据三对对应点计算仿射变换矩阵。该函数计算仿射变换的 2×3 矩阵。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像中三角形顶点的坐标（作为 InputArray） |
| dst | InputArray | 目标图像中对应三角形顶点的坐标（作为 InputArray） |

**返回值：** 返回一个 2×3 的 Mat 对象，表示仿射变换矩阵

**示例：**
```csharp
using OpenCvSharp;

Mat src = Cv2.ImRead("input.jpg");

// 使用 Mat 作为输入
Mat srcPoints = new Mat(3, 1, MatType.CV_32FC2);
Mat dstPoints = new Mat(3, 1, MatType.CV_32FC2);

srcPoints.Set(0, 0, new Point2f(0, 0));
srcPoints.Set(1, 0, new Point2f(src.Width - 1, 0));
srcPoints.Set(2, 0, new Point2f(0, src.Height - 1));

dstPoints.Set(0, 0, new Point2f(0, 0));
dstPoints.Set(1, 0, new Point2f(src.Width - 1, 50));
dstPoints.Set(2, 0, new Point2f(50, src.Height - 1));

Mat affineMatrix = Cv2.GetAffineTransform(srcPoints, dstPoints);

Mat dst = new Mat();
Cv2.WarpAffine(src, dst, affineMatrix, src.Size());
```

---

## GetRectSubPix — 亚像素精度提取矩形区域

**签名：** `void GetRectSubPix(InputArray image, Size patchSize, Point2f center, OutputArray patch, int patchType = -1)`

**说明：** 从图像中以亚像素精度提取像素矩形区域。该函数可以根据浮点坐标精确地提取图像中的子矩形，超出图像边界部分会进行外推填充。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputArray | 源图像 |
| patchSize | Size | 提取的矩形区域（patch）的尺寸 |
| center | Point2f | 提取矩形的中心在源图像中的浮点坐标。该中心点必须位于图像内部 |
| patch | OutputArray | 提取出的矩形区域，尺寸为 patchSize，通道数与 src 相同 |
| patchType | int | 提取像素的深度。默认值为 -1，表示与 src 深度相同 |

**返回值：** 无返回值（void），结果写入 patch

**示例：**
```csharp
using OpenCvSharp;

Mat src = Cv2.ImRead("input.jpg");

// 以亚像素精度提取中心 (100.5, 100.5)、尺寸 50x50 的区域
Size patchSize = new Size(50, 50);
Point2f center = new Point2f(100.5f, 100.5f);
Mat patch = new Mat();

Cv2.GetRectSubPix(src, patchSize, center, patch);

Cv2.ImWrite("output_patch.jpg", patch);
```

---

## LogPolar — 对数极坐标重映射

**签名：** `void LogPolar(InputArray src, OutputArray dst, Point2f center, double m, InterpolationFlags flags)`

**说明：** 将图像重映射到对数极坐标空间。该变换模拟人眼视网膜的中央凹成像特性，常用于形状匹配和目标识别中实现旋转和缩放的鲁棒性。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像 |
| dst | OutputArray | 目标图像 |
| center | Point2f | 变换中心点；该点处输出精度最高 |
| m | double | 幅度缩放参数 |
| flags | InterpolationFlags | 插值方法组合，参见 cv::InterpolationFlags |

**返回值：** 无返回值（void），结果直接写入 dst

**示例：**
```csharp
using OpenCvSharp;

Mat src = Cv2.ImRead("input.jpg");
Mat dst = new Mat();

Point2f center = new Point2f(src.Width / 2f, src.Height / 2f);
double magnitude = src.Width / (2 * Math.PI);

Cv2.LogPolar(src, dst, center, magnitude, InterpolationFlags.Linear);

Cv2.ImWrite("output_log_polar.jpg", dst);
```

---

## LinearPolar — 线性极坐标重映射

**签名：** `void LinearPolar(InputArray src, OutputArray dst, Point2f center, double maxRadius, InterpolationFlags flags)`

**说明：** 将图像重映射到极坐标空间。与对数极坐标不同，线性极坐标变换不使用对数缩放，而是直接在极坐标空间中进行线性映射。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像 |
| dst | OutputArray | 目标图像 |
| center | Point2f | 变换中心点 |
| maxRadius | double | 逆幅度缩放参数（即最大半径） |
| flags | InterpolationFlags | 插值方法组合，参见 cv::InterpolationFlags |

**返回值：** 无返回值（void），结果直接写入 dst

**示例：**
```csharp
using OpenCvSharp;

Mat src = Cv2.ImRead("input.jpg");
Mat dst = new Mat();

Point2f center = new Point2f(src.Width / 2f, src.Height / 2f);
double maxRadius = Math.Min(src.Width, src.Height) / 2.0;

Cv2.LinearPolar(src, dst, center, maxRadius, InterpolationFlags.Linear);

Cv2.ImWrite("output_linear_polar.jpg", dst);
```

---

## WarpPolar — 极坐标/半对数极坐标重映射

**签名：** `void WarpPolar(InputArray src, OutputArray dst, Size dsize, Point2f center, double maxRadius, InterpolationFlags interpolationFlags, WarpPolarMode warpPolarMode)`

**说明：** 将图像重映射到极坐标或半对数极坐标空间。该函数是 LogPolar 和 LinearPolar 的统一替代方案，提供了更多控制选项。

**备注：**
- 该函数不能原地操作（即 src 和 dst 必须是不同的图像）
- 内部使用 cartToPolar 计算幅度和角度（度），角度测量范围为 0 到 360 度，精度约 0.3 度
- 该函数内部使用 remap。由于当前实现限制，输入和输出图像的尺寸应小于 32767×32767

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像 |
| dst | OutputArray | 目标图像，类型与 src 相同 |
| dsize | Size | 目标图像尺寸（有效选项参见说明） |
| center | Point2f | 变换中心点 |
| maxRadius | double | 要变换的边界圆半径，同时也决定逆幅度缩放参数 |
| interpolationFlags | InterpolationFlags | 插值方法 |
| warpPolarMode | WarpPolarMode | 极坐标变换模式（线性/对数） |

**返回值：** 无返回值（void），结果直接写入 dst

**示例：**
```csharp
using OpenCvSharp;

Mat src = Cv2.ImRead("input.jpg");

// 线性极坐标变换
Mat dstLinear = new Mat();
Size dsize = new Size(src.Width, src.Height);
Point2f center = new Point2f(src.Width / 2f, src.Height / 2f);
double maxRadius = Math.Min(src.Width, src.Height) / 2.0;

Cv2.WarpPolar(src, dstLinear, dsize, center, maxRadius,
    InterpolationFlags.Linear, WarpPolarMode.Linear);

Cv2.ImWrite("output_warp_polar_linear.jpg", dstLinear);

// 对数极坐标变换
Mat dstLog = new Mat();
Cv2.WarpPolar(src, dstLog, dsize, center, maxRadius,
    InterpolationFlags.Linear, WarpPolarMode.Log);

Cv2.ImWrite("output_warp_polar_log.jpg", dstLog);
```

---

## Integral — 积分图计算（sum）

**签名：** `void Integral(InputArray src, OutputArray sum, MatType? sdepth = null)`

**说明：** 计算图像的积分图。该函数为源图像计算一个或多个积分图像。积分图允许快速计算图像中任意矩形区域内的像素和，广泛用于 Haar 特征提取、人脸检测等算法。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像，W×H，8 位或浮点数（32f 或 64f） |
| sum | OutputArray | 积分图像，尺寸为 (W+1)×(H+1)，32 位整数或浮点数（32f 或 64f） |
| sdepth | MatType? | 积分图像的期望深度，CV_32S、CV_32F 或 CV_64F |

**返回值：** 无返回值（void），结果写入 sum

**示例：**
```csharp
using OpenCvSharp;

Mat src = new Mat(10, 10, MatType.CV_8UC1, Scalar.All(1));
Mat sum = new Mat();

// 计算积分图
Cv2.Integral(src, sum);

// 积分图尺寸为 (W+1)×(H+1)，第一行和第一列均为 0
Console.WriteLine($"积分图尺寸: {sum.Width} x {sum.Height}");
```

---

## Integral — 积分图计算（sum + sqsum）

**签名：** `void Integral(InputArray src, OutputArray sum, OutputArray sqsum, MatType? sdepth = null)`

**说明：** 计算图像的积分图，同时输出平方像素值的积分图。平方积分图用于快速计算图像任意矩形区域的像素平方和，从而高效计算局部方差和标准差。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像 |
| sum | OutputArray | 积分图像，尺寸为 (W+1)×(H+1) |
| sqsum | OutputArray | 平方像素值的积分图像，尺寸为 (W+1)×(H+1)，双精度浮点（64f） |
| sdepth | MatType? | 积分图像的期望深度 |

**返回值：** 无返回值（void），结果写入 sum 和 sqsum

**示例：**
```csharp
using OpenCvSharp;

Mat src = new Mat(10, 10, MatType.CV_8UC1, Scalar.All(1));
Mat sum = new Mat();
Mat sqsum = new Mat();

// 计算积分图和平方积分图
Cv2.Integral(src, sum, sqsum);

Console.WriteLine($"积分图尺寸: {sum.Width} x {sum.Height}");
Console.WriteLine($"平方积分图尺寸: {sqsum.Width} x {sqsum.Height}");
```

---

## Integral — 积分图计算（sum + sqsum + tilted）

**签名：** `void Integral(InputArray src, OutputArray sum, OutputArray sqsum, OutputArray tilted, MatType? sdepth = null, MatType? sqdepth = null)`

**说明：** 计算图像的积分图，包括标准积分图、平方积分图和旋转45度的倾斜积分图。倾斜积分图用于加速旋转 Haar 特征的计算。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像，W×H，8 位或浮点数（32f 或 64f） |
| sum | OutputArray | 积分图像，尺寸为 (W+1)×(H+1)，32 位整数或浮点数（32f 或 64f） |
| sqsum | OutputArray | 平方像素值的积分图像，尺寸为 (W+1)×(H+1)，双精度浮点（64f）数组 |
| tilted | OutputArray | 旋转45度的积分图像，尺寸为 (W+1)×(H+1)，数据类型与 sum 相同 |
| sdepth | MatType? | 积分图像和倾斜积分图像的期望深度，CV_32S、CV_32F 或 CV_64F |
| sqdepth | MatType? | 平方像素值积分图像的期望深度，CV_32F 或 CV_64F |

**返回值：** 无返回值（void），结果写入 sum、sqsum 和 tilted

**示例：**
```csharp
using OpenCvSharp;

Mat src = new Mat(10, 10, MatType.CV_8UC1, Scalar.All(1));
Mat sum = new Mat();
Mat sqsum = new Mat();
Mat tilted = new Mat();

// 计算完整积分图（标准积分图 + 平方积分图 + 旋转积分图）
Cv2.Integral(src, sum, sqsum, tilted);

Console.WriteLine($"标准积分图尺寸: {sum.Width} x {sum.Height}");
Console.WriteLine($"平方积分图尺寸: {sqsum.Width} x {sqsum.Height}");
Console.WriteLine($"倾斜积分图尺寸: {tilted.Width} x {tilted.Height}");

// 使用积分图快速计算矩形区域像素和（例如区域 (2,2) 到 (7,7)）
// sum(A) = sum(D) + sum(A) - sum(B) - sum(C)
// 其中 A=(x1,y1), B=(x2,y1), C=(x1,y2), D=(x2,y2)
```

---

## 四、直方图、阈值与图像分割

# 第4节 — 直方图与图像变换

---

## Integral — 图像积分图计算

**签名：** `void Integral(InputArray src, OutputArray sum, OutputArray sqsum, OutputArray tilted, MatType? sdepth = null, MatType? sqdepth = null)`

**说明：** 计算图像的积分图。该函数为源图像计算一张或多张积分图像。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像，尺寸为 W×H，8位或浮点型（32f 或 64f） |
| sum | OutputArray | 积分图像，尺寸为 (W+1)×(H+1)，32位整型或浮点型（32f 或 64f） |
| sqsum | OutputArray | 像素值平方的积分图像，尺寸为 (W+1)×(H+1)，双精度浮点型（64f）数组 |
| tilted | OutputArray | 旋转45度的积分图像，尺寸为 (W+1)×(H+1)，数据类型与 sum 相同 |
| sdepth | MatType? | 积分图像和倾斜积分图像的目标深度，可选 CV_32S、CV_32F 或 CV_64F |
| sqdepth | MatType? | 像素值平方积分图像的目标深度，可选 CV_32F 或 CV_64F |

**返回值：** 无返回值（void），结果写入 sum、sqsum、tilted 三个输出参数。

**示例：**
```csharp
using OpenCvSharp;

Mat src = new Mat("image.png", ImreadModes.Grayscale);
Mat sum = new Mat();
Mat sqsum = new Mat();
Mat tilted = new Mat();

Cv2.Integral(src, sum, sqsum, tilted);
// sum 现在包含积分图像，可用于快速计算矩形区域像素和
```

---

## Accumulate — 图像累加

**签名：** `void Accumulate(InputArray src, InputOutputArray dst, InputArray? mask = null)`

**说明：** 将图像添加到累加器中。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像，1或3通道，8位或32位浮点型 |
| dst | InputOutputArray | 累加器图像，通道数与输入图像相同，32位或64位浮点型 |
| mask | InputArray? | 可选的操作掩码 |

**返回值：** 无返回值（void），结果累加到 dst 中。

**示例：**
```csharp
Mat src = Cv2.ImRead("frame.png");
Mat acc = new Mat(src.Size(), MatType.CV_64FC3, Scalar.All(0));

Cv2.Accumulate(src, acc);          // 累加当前帧
Cv2.Accumulate(src, acc);          // 再次累加以叠加帧
```

---

## AccumulateSquare — 图像像素平方累加

**签名：** `void AccumulateSquare(InputArray src, InputOutputArray dst, InputArray? mask = null)`

**说明：** 将源图像每个像素的平方值添加到累加器中。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像，1或3通道，8位或32位浮点型 |
| dst | InputOutputArray | 累加器图像，通道数与输入图像相同，32位或64位浮点型 |
| mask | InputArray? | 可选的操作掩码 |

**返回值：** 无返回值（void），结果累加到 dst 中。

**示例：**
```csharp
Mat src = Cv2.ImRead("frame.png");
Mat accSquare = new Mat(src.Size(), MatType.CV_64FC1, Scalar.All(0));

Cv2.AccumulateSquare(src, accSquare);
// accSquare 包含像素值的平方和，可用于方差计算
```

---

## AccumulateProduct — 图像逐元素乘积累加

**签名：** `void AccumulateProduct(InputArray src1, InputArray src2, InputOutputArray dst, InputArray? mask = null)`

**说明：** 将两个输入图像逐元素乘积的结果添加到累加器中。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src1 | InputArray | 第一个输入图像，1或3通道，8位或32位浮点型 |
| src2 | InputArray | 第二个输入图像，类型和尺寸与 src1 相同 |
| dst | InputOutputArray | 累加器图像，通道数与输入图像相同，32位或64位浮点型 |
| mask | InputArray? | 可选的操作掩码 |

**返回值：** 无返回值（void），结果累加到 dst 中。

**示例：**
```csharp
Mat src1 = Cv2.ImRead("frame1.png", ImreadModes.Grayscale);
Mat src2 = Cv2.ImRead("frame2.png", ImreadModes.Grayscale);
Mat accProd = new Mat(src1.Size(), MatType.CV_64FC1, Scalar.All(0));

Cv2.AccumulateProduct(src1, src2, accProd);
// 用于计算协方差
```

---

## AccumulateWeighted — 更新运行平均值

**签名：** `void AccumulateWeighted(InputArray src, InputOutputArray dst, double alpha, InputArray? mask = null)`

**说明：** 更新运行平均值。公式：`dst = (1-alpha)*dst + alpha*src`。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像，1或3通道，8位或32位浮点型 |
| dst | InputOutputArray | 累加器图像，通道数与输入图像相同，32位或64位浮点型 |
| alpha | double | 输入图像的权重（0 ~ 1） |
| mask | InputArray? | 可选的操作掩码 |

**返回值：** 无返回值（void），结果更新到 dst 中。

**示例：**
```csharp
Mat src = Cv2.ImRead("frame.png");
Mat avg = new Mat(src.Size(), MatType.CV_64FC3, Scalar.All(0));
double alpha = 0.05; // 学习率

Cv2.AccumulateWeighted(src, avg, alpha);
// avg 逐步逼近源图像的运行平均值，常用于背景建模
```

---

## PhaseCorrelate — 相位相关法位移检测

**签名：** `Point2d PhaseCorrelate(InputArray src1, InputArray src2, InputArray? window = null, out double response)`

**说明：** 该函数用于检测两幅图像之间的平移位移。操作利用傅里叶移位定理在频域中检测平移位移。可用于快速图像配准以及运动估计。计算两个输入数组的交叉功率谱。如果数组尺寸不适合FFT，会用 `GetOptimalDFTSize` 进行填充。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src1 | InputArray | 源浮点数组（CV_32FC1 或 CV_64FC1） |
| src2 | InputArray | 源浮点数组（CV_32FC1 或 CV_64FC1） |
| window | InputArray? | 带加窗系数的浮点数组，用于减少边缘效应（可选） |
| response | out double | 峰值周围 5×5 质心内的信号功率，值在 0 到 1 之间 |

**返回值：** `Point2d` — 两个数组之间检测到的相位位移（亚像素精度）。

**示例：**
```csharp
Mat img1 = Cv2.ImRead("image1.png", ImreadModes.Grayscale);
Mat img2 = Cv2.ImRead("image2.png", ImreadModes.Grayscale);
img1.ConvertTo(img1, MatType.CV_64FC1);
img2.ConvertTo(img2, MatType.CV_64FC1);

Point2d shift = Cv2.PhaseCorrelate(img1, img2, null, out double response);
// shift.X, shift.Y 即为亚像素位移
// response 表示匹配质量（越接近 1 越好）
```

---

## CreateHanningWindow — 创建二维汉宁窗

**签名：** `void CreateHanningWindow(InputOutputArray dst, Size winSize, MatType type)`

**说明：** 计算二维汉宁窗系数。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| dst | InputOutputArray | 目标数组，用于存放汉宁窗系数 |
| winSize | Size | 窗口尺寸规格 |
| type | MatType | 创建的数组类型 |

**返回值：** 无返回值（void），结果写入 dst。

**示例：**
```csharp
Size winSize = new Size(64, 64);
Mat hann = new Mat();

Cv2.CreateHanningWindow(hann, winSize, MatType.CV_32FC1);
// hann 是 64×64 二维汉宁窗，常用于频域处理前减少边缘效应
```

---

## Threshold — 固定阈值二值化

**签名：** `double Threshold(InputArray src, OutputArray dst, double thresh, double maxval, ThresholdTypes type)`

**说明：** 对数组的每个元素应用固定阈值。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入数组（单通道，8位或32位浮点型） |
| dst | OutputArray | 输出数组，尺寸和类型与 src 相同 |
| thresh | double | 阈值 |
| maxval | double | 与 THRESH_BINARY 和 THRESH_BINARY_INV 类型配合使用的最大值 |
| type | ThresholdTypes | 阈值类型（如 Binary、BinaryInv、Otsu 等） |

**返回值：** `double` — 当使用 Otsu 方法时返回计算得到的阈值。

**示例：**
```csharp
Mat src = Cv2.ImRead("gray.png", ImreadModes.Grayscale);
Mat dst = new Mat();

// 普通二值化
double ret = Cv2.Threshold(src, dst, 127, 255, ThresholdTypes.Binary);

// Otsu 自动阈值
double otsu = Cv2.Threshold(src, dst, 0, 255, ThresholdTypes.Binary | ThresholdTypes.Otsu);
// otsu 即为 Otsu 算法计算出的最佳阈值
```

---

## AdaptiveThreshold — 自适应阈值

**签名：** `void AdaptiveThreshold(InputArray src, OutputArray dst, double maxValue, AdaptiveThresholdTypes adaptiveMethod, ThresholdTypes thresholdType, int blockSize, double c)`

**说明：** 对数组应用自适应阈值。不同于全局阈值，该方法对图像的不同区域使用不同的阈值。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像，8位单通道 |
| dst | OutputArray | 目标图像，尺寸和类型与 src 相同 |
| maxValue | double | 满足条件的像素所赋予的非零值 |
| adaptiveMethod | AdaptiveThresholdTypes | 自适应阈值算法，ADAPTIVE_THRESH_MEAN_C 或 ADAPTIVE_THRESH_GAUSSIAN_C |
| thresholdType | ThresholdTypes | 阈值类型，THRESH_BINARY 或 THRESH_BINARY_INV |
| blockSize | int | 用于计算阈值的像素邻域大小：3、5、7 等 |
| c | double | 从均值或加权均值中减去的常数，通常为正数 |

**返回值：** 无返回值（void），结果写入 dst。

**示例：**
```csharp
Mat src = Cv2.ImRead("gray.png", ImreadModes.Grayscale);
Mat dst = new Mat();

Cv2.AdaptiveThreshold(src, dst, 255,
    AdaptiveThresholdTypes.GaussianC,
    ThresholdTypes.Binary, 11, 2);
// 适合光照不均匀的图像二值化
```

---

## PyrDown — 图像金字塔降采样

**签名：** `void PyrDown(InputArray src, OutputArray dst, Size? dstSize = null, BorderTypes borderType = BorderTypes.Default)`

**说明：** 先模糊图像，再进行降采样。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像 |
| dst | OutputArray | 输出图像，尺寸为指定大小，类型与 src 相同 |
| dstSize | Size? | 输出图像尺寸，默认计算为 Size((src.cols+1)/2, (src.rows+1)/2) |
| borderType | BorderTypes | 边界扩展类型 |

**返回值：** 无返回值（void），结果写入 dst。

**示例：**
```csharp
Mat src = Cv2.ImRead("image.png");
Mat dst = new Mat();

// 缩小为原来一半
Cv2.PyrDown(src, dst);
// dst 宽高约为 src 的一半

// 指定目标尺寸
Cv2.PyrDown(src, dst, new Size(100, 75));
```

---

## BuildPyramid — 构建图像金字塔

**签名：** `void BuildPyramid(InputArray src, VectorOfMat dst, int maxlevel, BorderTypes borderType = BorderTypes.Default)`

**说明：** 构建图像金字塔。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像 |
| dst | VectorOfMat | 输出的多层级图像集合 |
| maxlevel | int | 金字塔层级数 |
| borderType | BorderTypes | 边界类型 |

**返回值：** 无返回值（void），结果写入 dst（VectorOfMat）。

**示例：**
```csharp
Mat src = Cv2.ImRead("image.png");
VectorOfMat pyramid = new VectorOfMat();

Cv2.BuildPyramid(src, pyramid, 3);
// pyramid[0] 为原图，pyramid[1] 为降采样后的图像，以此类推
```

---

## PyrUp — 图像金字塔升采样

**签名：** `void PyrUp(InputArray src, OutputArray dst, Size? dstSize = null, BorderTypes borderType = BorderTypes.Default)`

**说明：** 先对图像升采样，再进行模糊处理。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像 |
| dst | OutputArray | 输出图像，尺寸为指定大小，类型与 src 相同 |
| dstSize | Size? | 输出图像尺寸，默认计算为 Size(src.cols×2, src.rows×2) |
| borderType | BorderTypes | 边界扩展类型 |

**返回值：** 无返回值（void），结果写入 dst。

**示例：**
```csharp
Mat src = Cv2.ImRead("small.png");
Mat dst = new Mat();

// 放大为原来两倍
Cv2.PyrUp(src, dst);
// dst 宽高约为 src 的两倍
```

---

## CalcHist — 计算直方图（Rangef 范围）

**签名：** `void CalcHist(Mat[] images, int[] channels, InputArray? mask, OutputArray hist, int dims, int[] histSize, Rangef[] ranges, bool uniform = true, bool accumulate = false)`

**说明：** 计算一组图像的联合密集直方图。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| images | Mat[] | 输入图像数组 |
| channels | int[] | 要计算的通道索引 |
| mask | InputArray? | 可选的操作掩码 |
| hist | OutputArray | 输出直方图 |
| dims | int | 直方图维度 |
| histSize | int[] | 每个维度的 bin 数量 |
| ranges | Rangef[] | 每个维度的取值范围 |
| uniform | bool | 是否均匀分布（默认 true） |
| accumulate | bool | 是否累加到已有直方图中（默认 false） |

**返回值：** 无返回值（void），结果写入 hist。

**示例：**
```csharp
Mat src = Cv2.ImRead("image.png", ImreadModes.Grayscale);
Mat hist = new Mat();

Cv2.CalcHist(
    new Mat[] { src },
    new int[] { 0 },
    null,
    hist,
    1,
    new int[] { 256 },
    new Rangef[] { new Rangef(0, 256) });
// hist 为 256 个 bin 的灰度直方图
```

---

## CalcHist — 计算直方图（float[][] 范围）

**签名：** `void CalcHist(Mat[] images, int[] channels, InputArray? mask, OutputArray hist, int dims, int[] histSize, float[][] ranges, bool uniform = true, bool accumulate = false)`

**说明：** 计算一组图像的联合密集直方图。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| images | Mat[] | 输入图像数组 |
| channels | int[] | 要计算的通道索引 |
| mask | InputArray? | 可选的操作掩码 |
| hist | OutputArray | 输出直方图 |
| dims | int | 直方图维度 |
| histSize | int[] | 每个维度的 bin 数量 |
| ranges | float[][] | 每个维度的取值范围（锯齿数组） |
| uniform | bool | 是否均匀分布（默认 true） |
| accumulate | bool | 是否累加到已有直方图中（默认 false） |

**返回值：** 无返回值（void），结果写入 hist。

**示例：**
```csharp
Mat src = Cv2.ImRead("image.png");
Mat hist = new Mat();

// 彩色图像的双通道直方图（Hue-Saturation）
Cv2.CalcHist(
    new Mat[] { src },
    new int[] { 0, 1 },
    null,
    hist,
    2,
    new int[] { 180, 256 },
    new float[][] { new float[] { 0, 180 }, new float[] { 0, 256 } });
```

---

## CalcBackProject — 直方图反向投影

**签名：** `void CalcBackProject(Mat[] images, int[] channels, InputArray hist, OutputArray backProject, Rangef[] ranges, bool uniform = true)`

**说明：** 计算直方图的反向投影。将直方图映射回图像空间，产生每个像素属于目标的概率图像。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| images | Mat[] | 输入图像数组 |
| channels | int[] | 要使用的通道索引 |
| hist | InputArray | 输入直方图 |
| backProject | OutputArray | 输出反向投影图像 |
| ranges | Rangef[] | 直方图每个维度的取值范围 |
| uniform | bool | 直方图是否均匀分布（默认 true） |

**返回值：** 无返回值（void），结果写入 backProject。

**示例：**
```csharp
Mat src = Cv2.ImRead("image.png");
Mat hist = new Mat();
Mat backProj = new Mat();

// 先计算目标区域的直方图，再做反向投影
Cv2.CalcHist(
    new Mat[] { src }, new int[] { 0 }, null,
    hist, 1, new int[] { 256 }, new Rangef[] { new Rangef(0, 256) });

Cv2.CalcBackProject(
    new Mat[] { src }, new int[] { 0 }, hist,
    backProj, new Rangef[] { new Rangef(0, 256) });
// backProj 每个像素值表示该像素属于目标的概率
```

---

## CompareHist — 直方图比较

**签名：** `double CompareHist(InputArray h1, InputArray h2, HistCompMethods method)`

**说明：** 比较两个存储在密集数组中的直方图。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| h1 | InputArray | 第一个待比较的直方图 |
| h2 | InputArray | 第二个待比较的直方图，尺寸与 h1 相同 |
| method | HistCompMethods | 比较方法（Correlation、ChiSquare、Intersection、Bhattacharyya 等） |

**返回值：** `double` — 相似度值，具体含义取决于 method 参数：
- Correlation：越大越相似（最大1）
- ChiSquare：越小越相似（最小0）
- Intersection：越大越相似
- Bhattacharyya：越小越相似（最小0）

**示例：**
```csharp
Mat hist1 = new Mat();
Mat hist2 = new Mat();
// … 假设 hist1、hist2 已通过 CalcHist 计算 …

double correlation = Cv2.CompareHist(hist1, hist2, HistCompMethods.Correl);
// correlation 越接近 1 表示越相似

double bhattacharyya = Cv2.CompareHist(hist1, hist2, HistCompMethods.Bhattacharyya);
// Bhattacharyya 距离越接近 0 表示越相似
```

---

## EqualizeHist — 直方图均衡化

**签名：** `void EqualizeHist(InputArray src, OutputArray dst)`

**说明：** 通过直方图均衡化来归一化灰度图像的亮度和对比度。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像，8位单通道 |
| dst | OutputArray | 目标图像，尺寸和类型与 src 相同 |

**返回值：** 无返回值（void），结果写入 dst。

**示例：**
```csharp
Mat src = Cv2.ImRead("dark.png", ImreadModes.Grayscale);
Mat dst = new Mat();

Cv2.EqualizeHist(src, dst);
// dst 的对比度得到增强，特别适合曝光不足的图像
```

---

## CreateCLAHE — 创建 CLAHE 对象

**签名：** `CLAHE CreateCLAHE(double clipLimit = 40.0, Size? tileGridSize = null)`

**说明：** 创建一个预定义的 CLAHE（对比度受限的自适应直方图均衡化）对象。CLAHE 是 EqualizeHist 的改进版本，通过限制对比度放大来减少噪声。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| clipLimit | double | 对比度限制阈值（默认 40.0） |
| tileGridSize | Size? | 网格大小（默认 8×8） |

**返回值：** `CLAHE` — CLAHE 算法对象，调用其 `Apply` 方法对图像进行处理。

**示例：**
```csharp
Mat src = Cv2.ImRead("gray.png", ImreadModes.Grayscale);
Mat dst = new Mat();

using (CLAHE clahe = Cv2.CreateCLAHE(3.0, new Size(8, 8)))
{
    clahe.Apply(src, dst);
}
// 比普通 EqualizeHist 噪声更少，局部对比度更好
```

---

## EMD — 推土机距离（3 参数版）

**签名：** `float EMD(InputArray signature1, InputArray signature2, DistanceTypes distType)`

**说明：** 计算两个加权点配置之间的"推土机距离"（Earth Mover's Distance / Wasserstein 距离）。该函数计算两个加权点配置之间的推土机距离和/或距离下界。在图像检索中的应用之一是多维直方图比较。EMD 是一个运输问题，使用单纯形算法的修改版求解，最坏情况下复杂度是指数级的，但平均速度快得多。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| signature1 | InputArray | 第一个签名，size1×(dims+1) 的浮点矩阵，每行存储点权重后跟坐标 |
| signature2 | InputArray | 第二个签名，格式与 signature1 相同，行数可不同 |
| distType | DistanceTypes | 使用的距离度量 |

**返回值：** `float` — 推土机距离值，越小表示两个分布越相似。

**示例：**
```csharp
// signature 为 4×3 矩阵，每行: [权重, x, y]
Mat sig1 = new Mat(4, 3, MatType.CV_32FC1);
Mat sig2 = new Mat(3, 3, MatType.CV_32FC1);
// … 填充签名数据 …

float distance = Cv2.EMD(sig1, sig2, DistanceTypes.L2);
```

---

## EMD — 推土机距离（带成本矩阵版）

**签名：** `float EMD(InputArray signature1, InputArray signature2, DistanceTypes distType, InputArray? cost)`

**说明：** 计算两个加权点配置之间的推土机距离，支持自定义成本矩阵。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| signature1 | InputArray | 第一个签名，size1×(dims+1) 浮点矩阵 |
| signature2 | InputArray | 第二个签名，格式相同，行数可不同 |
| distType | DistanceTypes | 距离度量类型 |
| cost | InputArray? | 自定义 size1×size2 成本矩阵。使用成本矩阵时无法计算下界 |

**返回值：** `float` — 推土机距离值。

**示例：**
```csharp
Mat sig1 = new Mat(4, 3, MatType.CV_32FC1);
Mat sig2 = new Mat(3, 3, MatType.CV_32FC1);
Mat costMat = new Mat(4, 3, MatType.CV_32FC1);
// … 填充签名和成本矩阵 …

float distance = Cv2.EMD(sig1, sig2, DistanceTypes.User, costMat);
```

---

## EMD — 推土机距离（完整版）

**签名：** `float EMD(InputArray signature1, InputArray signature2, DistanceTypes distType, InputArray? cost, out float lowerBound, OutputArray? flow = null)`

**说明：** 计算两个加权点配置之间的推土机距离，同时返回距离下界和流量矩阵。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| signature1 | InputArray | 第一个签名 |
| signature2 | InputArray | 第二个签名 |
| distType | DistanceTypes | 距离度量类型 |
| cost | InputArray? | 用户自定义的成本矩阵 |
| lowerBound | out float | 两个签名质心之间的距离下界；若下界足够大，函数可能不计算 EMD。传入 0 表示同时计算两者 |
| flow | OutputArray? | 输出的 size1×size2 流量矩阵：flow[i,j] 为从第 i 个点到第 j 个点的流量 |

**返回值：** `float` — 推土机距离值。

**示例：**
```csharp
Mat sig1 = new Mat(4, 3, MatType.CV_32FC1);
Mat sig2 = new Mat(3, 3, MatType.CV_32FC1);
Mat flow = new Mat();

float emd = Cv2.EMD(sig1, sig2, DistanceTypes.L2, null, out float lowerBound, flow);
// emd 为推土机距离，lowerBound 为距离下界
// flow 矩阵描述了点之间的流量分配
```

---

## Watershed — 分水岭分割

**签名：** `void Watershed(InputArray image, InputOutputArray markers)`

**说明：** 使用分水岭算法执行基于标记的图像分割。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputArray | 输入图像，8位3通道 |
| markers | InputOutputArray | 输入/输出 32位单通道标记图像（地图），尺寸与 image 相同 |

**返回值：** 无返回值（void），结果修改 markers 参数（输入时标记种子区域，输出时边界像素被设为 -1）。

**示例：**
```csharp
Mat src = Cv2.ImRead("image.png");
Mat markers = new Mat(src.Size(), MatType.CV_32SC1, Scalar.All(0));

// 用背景标记和前景标记初始化 markers
// 背景 = 1, 前景 = 2, 未知 = 0
markers.Rectangle(new Rect(0, 0, 5, src.Rows), Scalar.All(1), -1);
markers.Circle(300, 200, 10, Scalar.All(2), -1);

Cv2.Watershed(src, markers);
// markers 中非边界的每个连通区域得到一个不同标签（> 0）
// 边界像素被标记为 -1
```

---

## PyrMeanShiftFiltering — 均值漂移分割预处理

**签名：** `void PyrMeanShiftFiltering(InputArray src, OutputArray dst, double sp, double sr, int maxLevel = 1, TermCriteria? termcrit = null)`

**说明：** 对图像执行均值漂移分割的初始步骤。均值漂移分割通过颜色和空间聚类平滑图像，常用于图像分割和边缘保持滤波。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像，8位3通道 |
| dst | OutputArray | 目标图像，格式和尺寸与源图像相同 |
| sp | double | 空间窗口半径 |
| sr | double | 颜色窗口半径 |
| maxLevel | int | 分割金字塔的最大层级（默认 1） |
| termcrit | TermCriteria? | 终止条件：何时停止均值漂移迭代（默认 5次迭代，精度 1） |

**返回值：** 无返回值（void），结果写入 dst。

**示例：**
```csharp
Mat src = Cv2.ImRead("image.png");
Mat dst = new Mat();

Cv2.PyrMeanShiftFiltering(src, dst, 20, 40, 2);
// dst 为平滑后的图像，相似颜色区域被合并
```

---

## GrabCut — GrabCut 图像分割

**签名：** `void GrabCut(InputArray img, InputOutputArray mask, Rect rect, InputOutputArray bgdModel, InputOutputArray fgdModel, int iterCount, GrabCutModes mode)`

**说明：** 使用 GrabCut 算法分割图像。GrabCut 是一种基于图割的交互式前景提取算法。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| img | InputArray | 输入图像，8位3通道 |
| mask | InputOutputArray | 输入/输出 8位单通道掩码。当 mode = GC_INIT_WITH_RECT 时由函数初始化。元素值可为 GC_BGD / GC_FGD / GC_PR_BGD / GC_PR_FGD |
| rect | Rect | 包含被分割对象的 ROI，ROI 外的像素标记为"明显背景"。仅在 mode == GC_INIT_WITH_RECT 时使用 |
| bgdModel | InputOutputArray | 背景模型的临时数组，处理同一图像时请勿修改 |
| fgdModel | InputOutputArray | 前景模型的临时数组，处理同一图像时请勿修改 |
| iterCount | int | 算法返回结果前的迭代次数。可通过后续调用 mode==GC_INIT_WITH_MASK 或 mode==GC_EVAL 来细化结果 |
| mode | GrabCutModes | 操作模式，GC_INIT_WITH_RECT 或 GC_INIT_WITH_MASK 或 GC_EVAL |

**返回值：** 无返回值（void），结果写入 mask 中。

**示例：**
```csharp
Mat src = Cv2.ImRead("image.png");
Mat mask = new Mat(src.Size(), MatType.CV_8UC1, Scalar.All(0));
Mat bgdModel = new Mat();
Mat fgdModel = new Mat();
Rect roi = new Rect(50, 50, 200, 200);

// 第一轮：用矩形初始化
Cv2.GrabCut(src, mask, roi, bgdModel, fgdModel, 5, GrabCutModes.InitWithRect);

// 提取前景二值掩码
Mat resultMask = new Mat();
Cv2.Compare(mask, new Scalar((int)GrabCutClasses.PrdFgd), resultMask, CmpType.EQ);
// resultMask 中白色像素为前景
```

---

## DistanceTransformWithLabels — 带标签的距离变换

**签名：** `void DistanceTransformWithLabels(InputArray src, OutputArray dst, OutputArray labels, DistanceTypes distanceType, DistanceTransformMasks maskSize, DistanceTransformLabelTypes labelType = DistanceTransformLabelTypes.CComp)`

**说明：** 计算源图像中每个像素到最近零像素的距离，同时生成 Voronoi 标签图。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像，8位单通道（二值图像） |
| dst | OutputArray | 已计算距离的输出图像，8位或32位浮点型单通道，尺寸与 src 相同 |
| labels | OutputArray | 标签的输出二维数组（离散 Voronoi 图），类型 CV_32SC1，尺寸与 src 相同 |
| distanceType | DistanceTypes | 距离类型（L1、L2、C 等） |
| maskSize | DistanceTransformMasks | 距离变换掩码大小。此变体不支持 DIST_MASK_PRECISE。对于 DIST_L1 或 DIST_C 距离，该参数强制为 3 |
| labelType | DistanceTransformLabelTypes | 要构建的标签数组类型（默认 CComp） |

**返回值：** 无返回值（void），结果写入 dst 和 labels。

**示例：**
```csharp
Mat binary = new Mat(); // 二值化图像（前景=255，背景=0）
Mat dist = new Mat();
Mat labels = new Mat();

Cv2.DistanceTransformWithLabels(binary, dist, labels, DistanceTypes.L2, DistanceTransformMasks.Mask5);
// dist: 每个像素到最近背景的距离
// labels: 每个前景像素属于哪个连通分量的标签
```

---

## DistanceTransform — 距离变换

**签名：** `void DistanceTransform(InputArray src, OutputArray dst, DistanceTypes distanceType, DistanceTransformMasks maskSize, int dstType = MatType.CV_32S)`

**说明：** 计算距离变换图。计算源图像中每个像素到最近零像素的距离。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像，8位单通道（二值图像） |
| dst | OutputArray | 已计算距离的输出图像，8位或32位浮点型单通道，尺寸与 src 相同 |
| distanceType | DistanceTypes | 距离类型 |
| maskSize | DistanceTransformMasks | 距离变换掩码大小。对于 DIST_L1 或 DIST_C 距离类型，参数强制为 3 |
| dstType | int | 输出图像类型，可为 MatType.CV_8U 或 MatType.CV_32F。CV_8U 仅可用于第一变体且 distanceType == DIST_L1 |

**返回值：** 无返回值（void），结果写入 dst。

**示例：**
```csharp
Mat binary = new Mat(); // 二值化后的图像
Mat dist = new Mat();

Cv2.DistanceTransform(binary, dist, DistanceTypes.L2, DistanceTransformMasks.Mask5, MatType.CV_32F);
// dist 中每个像素值为到最近零像素的欧氏距离
```

---

## FloodFill — 泛洪填充（无掩码版）

**签名：** `int FloodFill(InputOutputArray image, Point seedPoint, Scalar newVal)`

**说明：** 用给定颜色填充连通区域。从种子点开始，将相邻且颜色相近的像素替换为新值。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputOutputArray | 输入/输出图像，1或3通道，8位或浮点型。函数会直接修改该图像（除非设置 MaskOnly 标志） |
| seedPoint | Point | 起始种子点 |
| newVal | Scalar | 重新填充区域像素的新值 |

**返回值：** `int` — 被填充的像素数量。

**示例：**
```csharp
Mat img = Cv2.ImRead("image.png");
Point seed = new Point(100, 100);
Scalar fillColor = new Scalar(0, 0, 255); // 红色

int pixelCount = Cv2.FloodFill(img, seed, fillColor);
// 从种子点开始，将连通区域填充为红色
```

---

## FloodFill — 泛洪填充（无掩码版，带控制参数）

**签名：** `int FloodFill(InputOutputArray image, Point seedPoint, Scalar newVal, out Rect rect, Scalar? loDiff = null, Scalar? upDiff = null, FloodFillFlags flags = FloodFillFlags.Link4)`

**说明：** 用给定颜色填充连通区域，可控制容差和连通性。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputOutputArray | 输入/输出图像，1或3通道，8位或浮点型 |
| seedPoint | Point | 起始种子点 |
| newVal | Scalar | 重新填充区域像素的新值 |
| rect | out Rect | 函数输出的可选参数，设置为被重新填充区域的最小边界矩形 |
| loDiff | Scalar? | 当前观察像素与其邻域或种子像素之间的最大下限亮度/颜色差异 |
| upDiff | Scalar? | 当前观察像素与其邻域或种子像素之间的最大上限亮度/颜色差异 |
| flags | FloodFillFlags | 操作标志。低位包含连通性值（4 或 8 邻接）。使用 FloodFillFlags.MaskOnly 则仅在掩码中填充灰度值 255 |

**返回值：** `int` — 被填充的像素数量。

**示例：**
```csharp
Mat img = Cv2.ImRead("image.png");
Point seed = new Point(50, 50);
Scalar fillColor = new Scalar(0, 255, 0);

int count = Cv2.FloodFill(img, seed, fillColor, out Rect boundingRect,
    loDiff: new Scalar(10, 10, 10),
    upDiff: new Scalar(10, 10, 10),
    flags: FloodFillFlags.Link8);
// 8连通填充，容差±10
// boundingRect 为填充区域的外接矩形
```

---

## FloodFill — 泛洪填充（带掩码版）

**签名：** `int FloodFill(InputOutputArray image, InputOutputArray mask, Point seedPoint, Scalar newVal)`

**说明：** 用给定颜色填充连通区域，使用掩码控制填充范围。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputOutputArray | 输入/输出图像，1或3通道，8位或浮点型 |
| mask | InputOutputArray | 操作掩码，单通道8位图像，宽高比原图各多 2 像素。泛洪不会穿过掩码中的非零像素。可在多次调用中使用同一掩码确保填充区域不重叠 |
| seedPoint | Point | 起始种子点 |
| newVal | Scalar | 重新填充区域像素的新值 |

**返回值：** `int` — 被填充的像素数量。

**示例：**
```csharp
Mat img = Cv2.ImRead("image.png");
// 掩码尺寸需比原图宽高各多 2 像素
Mat mask = new Mat(img.Rows + 2, img.Cols + 2, MatType.CV_8UC1, Scalar.All(0));
Point seed = new Point(100, 100);

int count = Cv2.FloodFill(img, mask, seed, new Scalar(0, 0, 255));
// mask 中对应填充区域被标记为 1
```

---

## FloodFill — 泛洪填充（带掩码版，带控制参数）

**签名：** `int FloodFill(InputOutputArray image, InputOutputArray mask, Point seedPoint, Scalar newVal, out Rect rect, Scalar? loDiff = null, Scalar? upDiff = null, FloodFillFlags flags = FloodFillFlags.Link4)`

**说明：** 用给定颜色填充连通区域，使用掩码并支持容差和连通性控制。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputOutputArray | 输入/输出图像，1或3通道，8位或浮点型 |
| mask | InputOutputArray | 操作掩码，单通道8位，宽高比原图各多 2 像素。泛洪不会穿过掩码非零像素。边缘检测输出可用作掩码以阻止在边缘处填充 |
| seedPoint | Point | 起始种子点 |
| newVal | Scalar | 重新填充区域像素的新值 |
| rect | out Rect | 输出的最小边界矩形 |
| loDiff | Scalar? | 最大下限亮度/颜色差异 |
| upDiff | Scalar? | 最大上限亮度/颜色差异 |
| flags | FloodFillFlags | 操作标志（连通性 + MaskOnly 等） |

**返回值：** `int` — 被填充的像素数量。

**示例：**
```csharp
Mat img = Cv2.ImRead("image.png");
Mat mask = new Mat(img.Rows + 2, img.Cols + 2, MatType.CV_8UC1, Scalar.All(0));
Point seed = new Point(100, 100);

int count = Cv2.FloodFill(img, mask, seed, new Scalar(255, 0, 0), out Rect rect,
    loDiff: new Scalar(20, 20, 20),
    upDiff: new Scalar(20, 20, 20),
    flags: FloodFillFlags.Link8);
// 8连通填充，容差±20，同时获得填充区域外接矩形
```

---

## BlendLinear — 线性混合

**签名：** `void BlendLinear(InputArray src1, InputArray src2, InputArray weights1, InputArray weights2, OutputArray dst)`

**说明：** 对两幅图像执行逐像素线性混合：`dst(i,j) = weights1(i,j)×src1(i,j) + weights2(i,j)×src2(i,j)`

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src1 | InputArray | 第一幅输入图像，类型 CV_8UC(n) 或 CV_32FC(n) |
| src2 | InputArray | 第二幅输入图像，类型和尺寸与 src1 相同 |
| weights1 | InputArray | 权重图，类型 CV_32FC1，尺寸与 src1 相同 |
| weights2 | InputArray | 权重图，类型 CV_32FC1，尺寸与 src1 相同 |
| dst | OutputArray | 输出图像，若尺寸/类型与 src1 不同则自动创建 |

**返回值：** 无返回值（void），结果写入 dst。

**示例：**
```csharp
Mat src1 = Cv2.ImRead("image1.png");
Mat src2 = Cv2.ImRead("image2.png");

// 创建渐变权重
Mat weights1 = new Mat(src1.Size(), MatType.CV_32FC1);
Mat weights2 = new Mat(src1.Size(), MatType.CV_32FC1);
// weights1 从左侧 1.0 渐变到右侧 0.0，weights2 则相反
for (int y = 0; y < src1.Rows; y++)
    for (int x = 0; x < src1.Cols; x++)
    {
        float ratio = (float)x / src1.Cols;
        weights1.Set<float>(y, x, 1.0f - ratio);
        weights2.Set<float>(y, x, ratio);
    }

Mat dst = new Mat();
Cv2.BlendLinear(src1, src2, weights1, weights2, dst);
// dst 从左到右平滑过渡从 image1 到 image2
```

---

## CvtColor — 颜色空间转换

**签名：** `void CvtColor(InputArray src, OutputArray dst, ColorConversionCodes code, int dstCn = 0)`

**说明：** 将图像从一种颜色空间转换到另一种颜色空间。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像，8位无符号、16位无符号或单精度浮点型 |
| dst | OutputArray | 目标图像，尺寸和深度与 src 相同 |
| code | ColorConversionCodes | 颜色空间转换代码（如 BGR2GRAY、BGR2HSV 等） |
| dstCn | int | 目标图像的通道数；若为 0，则根据 src 和 code 自动推导 |

**返回值：** 无返回值（void），结果写入 dst。

**示例：**
```csharp
Mat src = Cv2.ImRead("color.png");   // BGR
Mat gray = new Mat();
Mat hsv = new Mat();

Cv2.CvtColor(src, gray, ColorConversionCodes.BGR2GRAY);   // BGR → 灰度
Cv2.CvtColor(src, hsv, ColorConversionCodes.BGR2HSV);     // BGR → HSV
```

---

## 五、颜色空间转换、连通组件与轮廓

# Cv2 类方法文档 — 颜色转换与连通组件 / 轮廓分析

> 源自 OpenCVSharp `Cv2_imgproc.cs` 第 2450–3400 行

---

## CvtColor — 颜色空间转换

**签名：** `void CvtColor(InputArray src, OutputArray dst, ColorConversionCodes code, int dstCn = 0)`

**说明：** 将图像从一种颜色空间转换到另一种颜色空间。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像，支持 8 位无符号、16 位无符号或单精度浮点类型 |
| dst | OutputArray | 目标图像，大小和深度与 src 相同 |
| code | ColorConversionCodes | 颜色空间转换代码 |
| dstCn | int | 目标图像的通道数；若为 0，则根据 src 和 code 自动推导 |

**返回值：** 无（void），结果写入 dst

**示例：**
```csharp
using var src = Cv2.ImRead("input.jpg");
using var dst = new Mat();
// BGR 转灰度
Cv2.CvtColor(src, dst, ColorConversionCodes.BGR2GRAY);
// BGR 转 HSV
Cv2.CvtColor(src, dst, ColorConversionCodes.BGR2HSV);
// BGR 转 RGB（3通道）
Cv2.CvtColor(src, dst, ColorConversionCodes.BGR2RGB, 3);
```

---

## CvtColorTwoPlane — 双平面颜色空间转换

**签名：** `void CvtColorTwoPlane(InputArray src1, InputArray src2, OutputArray dst, ColorConversionCodes code)`

**说明：** 将存储在两个平面中的源图像从一种颜色空间转换到另一种。目前仅支持 YUV420 到 RGB 的转换。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src1 | InputArray | 8 位图像（CV_8U），Y 平面 |
| src2 | InputArray | 包含交错排列 U/V 平面的图像 |
| dst | OutputArray | 输出图像 |
| code | ColorConversionCodes | 转换类型，可选值包括：COLOR_YUV2BGR_NV12、COLOR_YUV2RGB_NV12、COLOR_YUV2BGRA_NV12、COLOR_YUV2RGBA_NV12、COLOR_YUV2BGR_NV21、COLOR_YUV2RGB_NV21、COLOR_YUV2BGRA_NV21、COLOR_YUV2RGBA_NV21 |

**返回值：** 无（void），结果写入 dst

**示例：**
```csharp
using var yPlane = new Mat("y_plane.bin", ImreadModes.Grayscale);
using var uvPlane = new Mat("uv_plane.bin", ImreadModes.Grayscale);
using var dst = new Mat();
// NV12 YUV420 转 BGR
Cv2.CvtColorTwoPlane(yPlane, uvPlane, dst, ColorConversionCodes.COLOR_YUV2BGR_NV12);
```

---

## Demosaicing — 去马赛克处理

**签名：** `void Demosaicing(InputArray src, OutputArray dst, ColorConversionCodes code, int dstCn = 0)`

**说明：** 所有去马赛克处理的主函数。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 输入图像：8 位无符号或 16 位无符号 |
| dst | OutputArray | 输出图像，大小和深度与 src 相同 |
| code | ColorConversionCodes | 颜色空间转换代码 |
| dstCn | int | 目标图像的通道数；若为 0，则根据 src 和 code 自动推导 |

**返回值：** 无（void），结果写入 dst

**备注：** 该函数可执行以下变换：
- 双线性插值去马赛克：COLOR_BayerBG2BGR、COLOR_BayerGB2BGR、COLOR_BayerRG2BGR、COLOR_BayerGR2BGR 等
- VNG（可变梯度数）去马赛克：COLOR_BayerBG2BGR_VNG 等
- EA（边缘感知）去马赛克：COLOR_BayerBG2BGR_EA 等
- 带 Alpha 通道去马赛克：COLOR_BayerBG2BGRA 等

**示例：**
```csharp
using var bayer = new Mat("bayer.raw", ImreadModes.Grayscale);
using var rgb = new Mat();
// Bayer BG 转 BGR 彩色
Cv2.Demosaicing(bayer, rgb, ColorConversionCodes.COLOR_BayerBG2BGR);
```

---

## Moments — 计算图像 / 点集的矩（5 个重载）

**签名 1：** `Moments Moments(InputArray array, bool binaryImage = false)`

**签名 2：** `Moments Moments(byte[,] array, bool binaryImage = false)`

**签名 3：** `Moments Moments(float[,] array, bool binaryImage = false)`

**签名 4：** `Moments Moments(IEnumerable<Point> array, bool binaryImage = false)`

**签名 5：** `Moments Moments(IEnumerable<Point2f> array, bool binaryImage = false)`

**说明：** 计算多边形或光栅化形状的三阶及以下全部矩。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| array | InputArray / byte[,] / float[,] / IEnumerable\<Point\> / IEnumerable\<Point2f\> | 光栅图像（单通道 8 位或浮点二维数组），或 1×N / N×1 的二维点（Point 或 Point2f）数组 |
| binaryImage | bool | 若为 true，则所有非零图像像素视为 1 |

**返回值：** `Moments` — 包含计算得到的空间矩、中心矩和归一化中心矩的对象

**示例：**
```csharp
using var src = Cv2.ImRead("shape.png", ImreadModes.Grayscale);
// 二值化后计算矩
Cv2.Threshold(src, src, 128, 255, ThresholdTypes.Binary);
var moments = Cv2.Moments(src, binaryImage: true);
double area = moments.M00;
double cx = moments.M10 / moments.M00;  // 重心 X
double cy = moments.M01 / moments.M00;  // 重心 Y

// 也可以从轮廓点计算
Point[] contour = /* ... */;
var contourMoments = Cv2.Moments(contour);
```

---

## MatchTemplate — 模板匹配

**签名：** `void MatchTemplate(InputArray image, InputArray templ, OutputArray result, TemplateMatchModes method, InputArray? mask = null)`

**说明：** 为光栅模板和待搜索图像计算邻近度映射。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputArray | 要在其中执行搜索的图像，应为 8 位或 32 位浮点 |
| templ | InputArray | 搜索的模板；不得大于源图像且数据类型必须相同 |
| result | OutputArray | 比较结果映射；单通道 32 位浮点。若 image 为 W×H，templ 为 w×h，则 result 为 (W-w+1)×(H-h+1) |
| method | TemplateMatchModes | 比较方法 |
| mask | InputArray? | 搜索模板的掩码。必须与 templ 具有相同的数据类型和大小。默认不设置 |

**返回值：** 无（void），结果写入 result

**示例：**
```csharp
using var image = Cv2.ImRead("scene.jpg", ImreadModes.Grayscale);
using var templ = Cv2.ImRead("template.jpg", ImreadModes.Grayscale);
using var result = new Mat();
Cv2.MatchTemplate(image, templ, result, TemplateMatchModes.CCoeffNormed);
Cv2.MinMaxLoc(result, out _, out double maxVal, out _, out Point maxLoc);
// maxLoc 即为最佳匹配位置
```

---

## ConnectedComponentsWithAlgorithm — 带算法选择的连通组件标记

**签名：** `int ConnectedComponentsWithAlgorithm(InputArray image, OutputArray labels, PixelConnectivity connectivity, MatType ltype, ConnectedComponentsAlgorithmsTypes ccltype)`

**说明：** 计算布尔图像的连通组件标记图像。支持 4 或 8 连通——返回 N，即标签总数 [0, N-1]，其中 0 表示背景标签。ltype 指定输出标签图像类型，根据标签总数或源图像像素总数选择。ccltype 指定要使用的连通组件标记算法，目前支持 Grana（BBDT）和 Wu（SAUF）算法，详见 ConnectedComponentsAlgorithmsTypes。注意 SAUF 算法强制使用行主序标签排列，而 BBDT 不做此要求。如果至少启用了一个并行框架且图像行数至少为 getNumberOfCPUs 返回值的两倍，则此函数会使用两种算法的并行版本。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputArray | 待标记的 8 位单通道图像 |
| labels | OutputArray | 目标标记图像 |
| connectivity | PixelConnectivity | 8 或 4，分别对应 8 连通或 4 连通 |
| ltype | MatType | 输出图像标签类型。当前支持 CV_32S 和 CV_16U |
| ccltype | ConnectedComponentsAlgorithmsTypes | 连通组件算法类型 |

**返回值：** `int` — 标签总数（包含背景 0）

**示例：**
```csharp
using var src = Cv2.ImRead("binary.png", ImreadModes.Grayscale);
Cv2.Threshold(src, src, 128, 255, ThresholdTypes.Binary);
using var labels = new Mat();
int numLabels = Cv2.ConnectedComponentsWithAlgorithm(
    src, labels, PixelConnectivity.Connectivity8, MatType.CV_32S,
    ConnectedComponentsAlgorithmsTypes.Default);
// numLabels 即为连通区域数量（含背景）
```

---

## ConnectedComponents — 连通组件标记（3 个重载）

**签名 1：** `int ConnectedComponents(InputArray image, OutputArray labels, PixelConnectivity connectivity = PixelConnectivity.Connectivity8)`

**签名 2：** `int ConnectedComponents(InputArray image, OutputArray labels, PixelConnectivity connectivity, MatType ltype)`

**签名 3：** `int ConnectedComponents(InputArray image, out int[,] labels, PixelConnectivity connectivity)`

**说明：** 计算布尔图像的连通组件标记图像。支持 4 或 8 连通——返回 N，即标签总数 [0, N-1]，其中 0 表示背景标签。ltype 指定输出标签图像类型，根据标签总数或源图像像素总数选择。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputArray | 待标记的图像 |
| labels | OutputArray / out int[,] | 目标标记图像 / 目标标记矩形数组 |
| connectivity | PixelConnectivity | 8 或 4，分别对应 8 连通或 4 连通 |
| ltype | MatType | 输出图像标签类型。当前支持 CV_32S 和 CV_16U |

**返回值：** `int` — 标签总数

**示例：**
```csharp
using var src = Cv2.ImRead("binary.png", ImreadModes.Grayscale);
Cv2.Threshold(src, src, 128, 255, ThresholdTypes.Binary);
using var labels = new Mat();
int numLabels = Cv2.ConnectedComponents(src, labels);
// 使用默认 8 连通，CV_32S 类型

// 或直接输出 int[,] 数组
int num = Cv2.ConnectedComponents(src, out int[,] labelArray, PixelConnectivity.Connectivity4);
```

---

## ConnectedComponentsWithStatsWithAlgorithm — 带统计和质心及算法选择的连通组件

**签名：** `int ConnectedComponentsWithStatsWithAlgorithm(InputArray image, OutputArray labels, OutputArray stats, OutputArray centroids, PixelConnectivity connectivity, MatType ltype, ConnectedComponentsAlgorithmsTypes ccltype)`

**说明：** 计算布尔图像的连通组件标记图像，同时为每个标签输出统计信息。支持 4 或 8 连通——返回 N，即标签总数 [0, N-1]，其中 0 表示背景标签。ccltype 指定要使用的连通组件标记算法，目前支持 Grana（BBDT）和 Wu（SAUF）。如果至少启用了一个并行框架且图像行数至少为 getNumberOfCPUs 返回值的两倍，则此函数会使用两种算法（含统计信息）的并行版本。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputArray | 待标记的 8 位单通道图像 |
| labels | OutputArray | 目标标记图像 |
| stats | OutputArray | 每个标签的统计输出，包括背景标签。通过 stats(label, COLUMN) 访问，其中 COLUMN 为 ConnectedComponentsTypes 之一。数据类型为 CV_32S |
| centroids | OutputArray | 每个标签的质心输出，包括背景标签。通过 centroids(label, 0) 获取 x，centroids(label, 1) 获取 y。数据类型为 CV_64F |
| connectivity | PixelConnectivity | 8 或 4，分别对应 8 连通或 4 连通 |
| ltype | MatType | 输出图像标签类型。当前支持 CV_32S 和 CV_16U |
| ccltype | ConnectedComponentsAlgorithmsTypes | 连通组件算法类型 |

**返回值：** `int` — 标签总数

**示例：**
```csharp
using var src = Cv2.ImRead("binary.png", ImreadModes.Grayscale);
Cv2.Threshold(src, src, 128, 255, ThresholdTypes.Binary);
using var labels = new Mat();
using var stats = new Mat();
using var centroids = new Mat();
int nLabels = Cv2.ConnectedComponentsWithStatsWithAlgorithm(
    src, labels, stats, centroids,
    PixelConnectivity.Connectivity8, MatType.CV_32S,
    ConnectedComponentsAlgorithmsTypes.Wu);
// stats 每一行：[左, 上, 宽, 高, 面积]
```

---

## ConnectedComponentsWithStats — 带统计和质心的连通组件（2 个重载）

**签名 1：** `int ConnectedComponentsWithStats(InputArray image, OutputArray labels, OutputArray stats, OutputArray centroids, PixelConnectivity connectivity = PixelConnectivity.Connectivity8)`

**签名 2：** `int ConnectedComponentsWithStats(InputArray image, OutputArray labels, OutputArray stats, OutputArray centroids, PixelConnectivity connectivity, MatType ltype)`

**说明：** 计算布尔图像的连通组件标记图像。支持 4 或 8 连通——返回 N，即标签总数 [0, N-1]，其中 0 表示背景标签。同时返回每个标签的统计信息和浮点质心坐标。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputArray | 待标记的图像 |
| labels | OutputArray | 目标标记图像 |
| stats | OutputArray | 每个标签的统计输出，包括背景标签。通过 stats(label, COLUMN) 访问，其中 COLUMN 为 cv::ConnectedComponentsTypes 枚举之一 |
| centroids | OutputArray | 每个标签的浮点质心 (x, y) 输出，包括背景标签 |
| connectivity | PixelConnectivity | 8 或 4，分别对应 8 连通或 4 连通 |
| ltype | MatType | 输出图像标签类型。当前支持 CV_32S 和 CV_16U |

**返回值：** `int` — 标签总数

**示例：**
```csharp
using var src = Cv2.ImRead("binary.png", ImreadModes.Grayscale);
Cv2.Threshold(src, src, 128, 255, ThresholdTypes.Binary);
using var labels = new Mat();
using var stats = new Mat();
using var centroids = new Mat();
int nLabels = Cv2.ConnectedComponentsWithStats(src, labels, stats, centroids);
// 遍历每个连通区域（跳过背景 label 0）
for (int i = 1; i < nLabels; i++)
{
    int left   = stats.At<int>(i, (int)ConnectedComponentsTypes.Left);
    int top    = stats.At<int>(i, (int)ConnectedComponentsTypes.Top);
    int width  = stats.At<int>(i, (int)ConnectedComponentsTypes.Width);
    int height = stats.At<int>(i, (int)ConnectedComponentsTypes.Height);
    int area   = stats.At<int>(i, (int)ConnectedComponentsTypes.Area);
    double cx  = centroids.At<double>(i, 0);
    double cy  = centroids.At<double>(i, 1);
}
```

---

## ConnectedComponentsEx — 封装版连通组件（高级用法）

**签名：** `ConnectedComponents ConnectedComponentsEx(InputArray image, PixelConnectivity connectivity = PixelConnectivity.Connectivity8, ConnectedComponentsAlgorithmsTypes ccltype = ConnectedComponentsAlgorithmsTypes.Default)`

**说明：** 计算布尔图像的连通组件标记图像。支持 4 或 8 连通——返回 N，即标签总数 [0, N-1]，其中 0 表示背景标签。返回封装好的 ConnectedComponents 对象，包含 Blob 数组（标签、位置、大小、面积、质心）和二维标签数组。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputArray | 待标记的图像 |
| connectivity | PixelConnectivity | 8 或 4，分别对应 8 连通或 4 连通 |
| ccltype | ConnectedComponentsAlgorithmsTypes | 连通组件算法类型 |

**返回值：** `ConnectedComponents` — 包含 Blob 数组（每个 Blob 有 Label、Left、Top、Width、Height、Area、Centroid）、二维标签数组及标签总数的封装对象

**示例：**
```csharp
using var src = Cv2.ImRead("binary.png", ImreadModes.Grayscale);
Cv2.Threshold(src, src, 128, 255, ThresholdTypes.Binary);
var cc = Cv2.ConnectedComponentsEx(src);
// 访问 Blob 信息
foreach (var blob in cc.Blobs)
{
    Console.WriteLine($"Label:{blob.Label} Area:{blob.Area} Center:{blob.Centroid}");
}
// 访问标签数组
int[,] labelMap = cc.Labels;
```

---

## FindContours — 查找轮廓（2 个重载）

**签名 1：** `void FindContours(InputArray image, out Point[][] contours, out HierarchyIndex[] hierarchy, RetrievalModes mode, ContourApproximationModes method, Point? offset = null)`

**签名 2：** `void FindContours(InputArray image, out Mat[] contours, OutputArray hierarchy, RetrievalModes mode, ContourApproximationModes method, Point? offset = null)`

**说明：** 在二值图像中查找轮廓。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputArray | 源图像，8 位单通道。非零像素视为 1，零像素保持为 0，图像被视为二值图像。函数在提取轮廓时会修改图像 |
| contours | out Point[][] / out Mat[] | 检测到的轮廓。每个轮廓存储为点向量 |
| hierarchy | out HierarchyIndex[] / OutputArray | 可选的输出向量，包含图像拓扑信息。其元素数量与轮廓数量相同。对于第 i 个轮廓 contours[i]，hierarchy[i] 的成员分别设置为其在同一层级中的下一个轮廓、上一个轮廓、第一个子轮廓和父轮廓在 contours 中的从 0 开始的索引。若某轮廓没有对应的相邻/父子轮廓，则 hierarchy[i] 中相应元素为负数 |
| mode | RetrievalModes | 轮廓检索模式 |
| method | ContourApproximationModes | 轮廓近似方法 |
| offset | Point? | 可选的偏移量，每个轮廓点都会偏移此值。当轮廓从图像 ROI 中提取并需要在整幅图像上下文中分析时非常有用 |

**返回值：** 无（void），结果通过 out 参数返回

**示例：**
```csharp
using var src = Cv2.ImRead("shapes.png", ImreadModes.Grayscale);
Cv2.Threshold(src, src, 128, 255, ThresholdTypes.Binary);
Cv2.FindContours(src, out Point[][] contours, out HierarchyIndex[] hierarchy,
    RetrievalModes.Tree, ContourApproximationModes.ApproxSimple);
// 遍历轮廓
foreach (var contour in contours)
{
    double area = Cv2.ContourArea(contour);
    var rect = Cv2.BoundingRect(contour);
}
```

---

## FindContoursAsArray — 查找轮廓并直接返回数组

**签名：** `Point[][] FindContoursAsArray(InputArray image, RetrievalModes mode, ContourApproximationModes method, Point? offset = null)`

**说明：** 在二值图像中查找轮廓。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputArray | 源图像，8 位单通道。非零像素视为 1。函数在提取轮廓时会修改图像 |
| mode | RetrievalModes | 轮廓检索模式 |
| method | ContourApproximationModes | 轮廓近似方法 |
| offset | Point? | 可选的偏移量，每个轮廓点都会偏移此值。当轮廓从图像 ROI 中提取并需要在整幅图像上下文中分析时非常有用 |

**返回值：** `Point[][]` — 检测到的轮廓，每个轮廓存储为点数组

**示例：**
```csharp
using var src = Cv2.ImRead("shapes.png", ImreadModes.Grayscale);
Cv2.Threshold(src, src, 128, 255, ThresholdTypes.Binary);
Point[][] contours = Cv2.FindContoursAsArray(src, RetrievalModes.External, ContourApproximationModes.ApproxSimple);
```

---

## FindContoursAsMat — 查找轮廓并以 Mat 数组返回

**签名：** `Mat<Point>[] FindContoursAsMat(InputArray image, RetrievalModes mode, ContourApproximationModes method, Point? offset = null)`

**说明：** 在二值图像中查找轮廓。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputArray | 源图像，8 位单通道。非零像素视为 1。函数在提取轮廓时会修改图像 |
| mode | RetrievalModes | 轮廓检索模式 |
| method | ContourApproximationModes | 轮廓近似方法 |
| offset | Point? | 可选的偏移量，每个轮廓点都会偏移此值。当轮廓从图像 ROI 中提取并需要在整幅图像上下文中分析时非常有用 |

**返回值：** `Mat<Point>[]` — 检测到的轮廓，每个轮廓存储为 Mat\<Point\>

**示例：**
```csharp
using var src = Cv2.ImRead("shapes.png", ImreadModes.Grayscale);
Cv2.Threshold(src, src, 128, 255, ThresholdTypes.Binary);
Mat<Point>[] contours = Cv2.FindContoursAsMat(src, RetrievalModes.List, ContourApproximationModes.ApproxNone);
```

---

## ApproxPolyDP — 多边形逼近（Douglas-Peucker 算法）（3 个重载）

**签名 1：** `void ApproxPolyDP(InputArray curve, OutputArray approxCurve, double epsilon, bool closed)`

**签名 2：** `Point[] ApproxPolyDP(IEnumerable<Point> curve, double epsilon, bool closed)`

**签名 3：** `Point2f[] ApproxPolyDP(IEnumerable<Point2f> curve, double epsilon, bool closed)`

**说明：** 使用 Douglas-Peucker 算法逼近轮廓或曲线。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| curve | InputArray / IEnumerable\<Point\> / IEnumerable\<Point2f\> | 要逼近的多边形或曲线。必须是 1×N 或 N×1 的 CV_32SC2 或 CV_32FC2 类型矩阵 |
| approxCurve | OutputArray | 逼近结果；类型应与输入曲线匹配 |
| epsilon | double | 逼近精度。这是原始曲线与其逼近之间的最大距离 |
| closed | bool | 若为 true，逼近曲线为闭合曲线（首尾顶点相连），否则不闭合 |

**返回值：** `Point[]` / `Point2f[]` / void — 逼近后的多边形顶点

**示例：**
```csharp
Point[] contour = /* 来自 FindContours */;
// 使用多边形逼近简化轮廓
Point[] approx = Cv2.ApproxPolyDP(contour, epsilon: 5.0, closed: true);
// 根据顶点数判断形状
if (approx.Length == 4)
    Console.WriteLine("四边形");
else if (approx.Length > 8)
    Console.WriteLine("圆形");
```

---

## ArcLength — 计算轮廓周长 / 曲线长度（3 个重载）

**签名 1：** `double ArcLength(InputArray curve, bool closed)`

**签名 2：** `double ArcLength(IEnumerable<Point> curve, bool closed)`

**签名 3：** `double ArcLength(IEnumerable<Point2f> curve, bool closed)`

**说明：** 计算轮廓周长或曲线长度。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| curve | InputArray / IEnumerable\<Point\> / IEnumerable\<Point2f\> | 输入二维点向量，表示为 CV_32SC2 或 CV_32FC2 矩阵 |
| closed | bool | 指示曲线是否闭合 |

**返回值：** `double` — 轮廓周长或曲线长度

**示例：**
```csharp
Point[] contour = /* ... */;
double perimeter = Cv2.ArcLength(contour, closed: true);
// 可用于判断近似精度
double epsilon = 0.02 * perimeter;
Point[] approx = Cv2.ApproxPolyDP(contour, epsilon, true);
```

---

## BoundingRect — 计算正立外接矩形（3 个重载）

**签名 1：** `Rect BoundingRect(InputArray curve)`

**签名 2：** `Rect BoundingRect(IEnumerable<Point> curve)`

**签名 3：** `Rect BoundingRect(IEnumerable<Point2f> curve)`

**说明：** 计算点集的正立（轴对齐）外接矩形。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| curve | InputArray / IEnumerable\<Point\> / IEnumerable\<Point2f\> | 输入二维点集，表示为 CV_32SC2 或 CV_32FC2 矩阵 |

**返回值：** `Rect` — 指定点集的最小正立外接矩形

**示例：**
```csharp
Point[] contour = /* ... */;
Rect rect = Cv2.BoundingRect(contour);
Console.WriteLine($"位置:({rect.X},{rect.Y}) 大小:{rect.Width}x{rect.Height}");
// 可用于在图像上绘制外接矩形
Cv2.Rectangle(image, rect, Scalar.Red, 2);
```

---

## ContourArea — 计算轮廓面积（3 个重载）

**签名 1：** `double ContourArea(InputArray contour, bool oriented = false)`

**签名 2：** `double ContourArea(IEnumerable<Point> contour, bool oriented = false)`

**签名 3：** `double ContourArea(IEnumerable<Point2f> contour, bool oriented = false)`

**说明：** 计算轮廓面积。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| contour | InputArray / IEnumerable\<Point\> / IEnumerable\<Point2f\> | 轮廓顶点，表示为 CV_32SC2 或 CV_32FC2 矩阵 |
| oriented | bool | 若为 true，返回有符号面积（取决于轮廓方向），顺时针为负，逆时针为正。默认为 false 返回绝对值 |

**返回值：** `double` — 轮廓面积

**示例：**
```csharp
Point[] contour = /* ... */;
double area = Cv2.ContourArea(contour);
// 计算有符号面积以判断轮廓方向
double signedArea = Cv2.ContourArea(contour, oriented: true);
bool isClockwise = signedArea < 0;
```

---

## MinAreaRect — 最小面积旋转矩形（3 个重载）

**签名 1：** `RotatedRect MinAreaRect(InputArray points)`

**签名 2：** `RotatedRect MinAreaRect(IEnumerable<Point> points)`

**签名 3：** `RotatedRect MinAreaRect(IEnumerable<Point2f> points)`

**说明：** 找到包围二维点集的最小面积旋转矩形。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| points | InputArray / IEnumerable\<Point\> / IEnumerable\<Point2f\> | 输入二维点集，表示为 CV_32SC2 或 CV_32FC2 矩阵 |

**返回值：** `RotatedRect` — 包围点集的最小面积旋转矩形，包含中心点、尺寸和旋转角度

**示例：**
```csharp
Point[] contour = /* ... */;
RotatedRect rotatedRect = Cv2.MinAreaRect(contour);
Console.WriteLine($"中心:({rotatedRect.Center.X},{rotatedRect.Center.Y})");
Console.WriteLine($"尺寸:{rotatedRect.Size.Width}x{rotatedRect.Size.Height}");
Console.WriteLine($"角度:{rotatedRect.Angle}°");
// 获取四个顶点用于绘制
Point2f[] vertices = Cv2.BoxPoints(rotatedRect);
```

---

## BoxPoints — 获取旋转矩形的四个顶点（2 个重载）

**签名 1：** `void BoxPoints(RotatedRect box, OutputArray points)`

**签名 2：** `Point2f[] BoxPoints(RotatedRect box)`

**说明：** 获取旋转矩形的四个顶点。该函数可用于绘制旋转矩形。在 C++ 中可以直接使用 RotatedRect::points 方法，不必调用此函数。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| box | RotatedRect | 输入旋转矩形。通常来自 MinAreaRect 的输出 |
| points | OutputArray | 矩形的四个顶点输出数组 |

**返回值：** `Point2f[]` 或 void — 矩形的四个顶点坐标数组

**示例：**
```csharp
RotatedRect rotatedRect = Cv2.MinAreaRect(contour);
Point2f[] vertices = Cv2.BoxPoints(rotatedRect);
// 绘制旋转矩形
for (int i = 0; i < 4; i++)
    Cv2.Line(image, (Point)vertices[i], (Point)vertices[(i + 1) % 4], Scalar.Green, 2);
```

---

## MinEnclosingCircle — 最小包围圆（3 个重载）

**签名 1：** `void MinEnclosingCircle(InputArray points, out Point2f center, out float radius)`

**签名 2：** `void MinEnclosingCircle(IEnumerable<Point> points, out Point2f center, out float radius)`

**签名 3：** `void MinEnclosingCircle(IEnumerable<Point2f> points, out Point2f center, out float radius)`

**说明：** 找到包围二维点集的最小面积圆。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| points | InputArray / IEnumerable\<Point\> / IEnumerable\<Point2f\> | 输入二维点集，表示为 CV_32SC2 或 CV_32FC2 矩阵 |
| center | out Point2f | 圆的输出中心点 |
| radius | out float | 圆的输出半径 |

**返回值：** 无（void），通过 out 参数返回圆心和半径

**示例：**
```csharp
Point[] contour = /* ... */;
Cv2.MinEnclosingCircle(contour, out Point2f center, out float radius);
// 绘制最小包围圆
Cv2.Circle(image, (Point)center, (int)radius, Scalar.Blue, 2);
```

---

## 六、形状分析与绘图

# Section 6 — 形状分析与绘图方法

> 本文档基于 OpenCVSharp 的 `Cv2` 类（`Cv2_imgproc.cs` 第 3400–5087 行），收录形状分析、几何计算与绘图渲染相关方法。

---

## MinEnclosingCircle — 最小外接圆

**签名：** `void MinEnclosingCircle(IEnumerable<Point2f> points, out Point2f center, out float radius)`

**说明：** 寻找包围一组 2D 点集的最小面积圆。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| points | IEnumerable\<Point2f\> | 输入的 2D 点集，通常以 CV_32SC2 或 CV_32FC2 矩阵表示 |
| center | out Point2f | 输出的圆心坐标 |
| radius | out float | 输出的圆半径 |

**返回值：** 无（通过 `out` 参数返回圆心和半径）

**示例：**
```csharp
using OpenCvSharp;

var points = new List<Point2f>
{
    new Point2f(100, 100),
    new Point2f(200, 100),
    new Point2f(200, 200),
    new Point2f(100, 200)
};
Cv2.MinEnclosingCircle(points, out var center, out var radius);
Console.WriteLine($"圆心: ({center.X}, {center.Y}), 半径: {radius}");
```

---

## MinEnclosingTriangle — 最小外接三角形

### 重载 1

**签名：** `double MinEnclosingTriangle(InputArray points, OutputArray triangle)`

**说明：** 寻找包围一组 2D 点集的最小面积三角形，并返回其面积。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| points | InputArray | 输入的 2D 点集，深度为 CV_32S 或 CV_32F，以 std::vector 或 Mat 形式存储 |
| triangle | OutputArray | 输出的三角形三个顶点，由三个 2D 点定义 |

**返回值：** `double` — 最小外接三角形的面积

### 重载 2

**签名：** `double MinEnclosingTriangle(IEnumerable<Point> points, out Point2f[] triangle)`

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| points | IEnumerable\<Point\> | 输入的 2D 点集，深度为 CV_32S 或 CV_32F |
| triangle | out Point2f[] | 输出的三角形三个顶点数组 |

**返回值：** `double` — 最小外接三角形的面积

### 重载 3

**签名：** `double MinEnclosingTriangle(IEnumerable<Point2f> points, out Point2f[] triangle)`

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| points | IEnumerable\<Point2f\> | 输入的 2D 点集，深度为 CV_32S 或 CV_32F |
| triangle | out Point2f[] | 输出的三角形三个顶点数组 |

**返回值：** `double` — 最小外接三角形的面积

**示例：**
```csharp
using OpenCvSharp;

var points = new List<Point>
{
    new Point(50, 50),
    new Point(300, 80),
    new Point(250, 250),
    new Point(80, 200)
};
double area = Cv2.MinEnclosingTriangle(points, out var triangle);
Console.WriteLine($"三角形面积: {area}");
Console.WriteLine($"顶点: {string.Join(", ", triangle)}");
```

---

## MatchShapes — 形状匹配

### 重载 1

**签名：** `double MatchShapes(InputArray contour1, InputArray contour2, ShapeMatchModes method, double parameter = 0)`

### 重载 2

**签名：** `double MatchShapes(IEnumerable<Point> contour1, IEnumerable<Point> contour2, ShapeMatchModes method, double parameter = 0)`

**说明：** 比较两个形状的相似度。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| contour1 | InputArray / IEnumerable\<Point\> | 第一个轮廓或灰度图像 |
| contour2 | InputArray / IEnumerable\<Point\> | 第二个轮廓或灰度图像 |
| method | ShapeMatchModes | 比较方法（Hu矩匹配等） |
| parameter | double | 方法特定参数（当前暂不支持） |

**返回值：** `double` — 形状相似度分数，值越小表示两个形状越相似

**示例：**
```csharp
using OpenCvSharp;

var contour1 = new List<Point> { new Point(0, 0), new Point(100, 0), new Point(100, 100), new Point(0, 100) };
var contour2 = new List<Point> { new Point(10, 10), new Point(90, 10), new Point(90, 90), new Point(10, 90) };
double score = Cv2.MatchShapes(contour1, contour2, ShapeMatchModes.I1);
Console.WriteLine($"形状匹配分数: {score}");
```

---

## ConvexHull — 凸包计算

### 重载 1

**签名：** `void ConvexHull(InputArray points, OutputArray hull, bool clockwise = false, bool returnPoints = true)`

**说明：** 计算一组 2D 点集的凸包。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| points | InputArray | 输入的 2D 点集，以 CV_32SC2 或 CV_32FC2 矩阵表示 |
| hull | OutputArray | 输出的凸包。可以是构成凸包的点集（与输入点类型相同），或是原始数组中凸包点的从 0 开始的索引向量 |
| clockwise | bool | 若为 true，输出凸包为顺时针方向；否则为逆时针方向。此处假设通常的屏幕坐标系——原点在左上角，x 轴向右，y 轴向下 |
| returnPoints | bool | 若为 true 返回凸包顶点坐标；若为 false 返回原始点集的索引 |

**返回值：** 无（结果写入 `hull` 参数）

### 重载 2

**签名：** `Point[] ConvexHull(IEnumerable<Point> points, bool clockwise = false)`

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| points | IEnumerable\<Point\> | 输入的 2D 点集 |
| clockwise | bool | 是否顺时针排列 |

**返回值：** `Point[]` — 凸包顶点坐标数组

### 重载 3

**签名：** `Point2f[] ConvexHull(IEnumerable<Point2f> points, bool clockwise = false)`

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| points | IEnumerable\<Point2f\> | 输入的 2D 点集 |
| clockwise | bool | 是否顺时针排列 |

**返回值：** `Point2f[]` — 凸包顶点坐标数组（浮点）

**示例：**
```csharp
using OpenCvSharp;

var points = new List<Point>
{
    new Point(100, 100),
    new Point(200, 50),
    new Point(300, 100),
    new Point(250, 200),
    new Point(150, 200)
};
Point[] hull = Cv2.ConvexHull(points, clockwise: true);
Console.WriteLine($"凸包顶点数: {hull.Length}");
```

---

## ConvexHullIndices — 凸包索引

### 重载 1

**签名：** `int[] ConvexHullIndices(IEnumerable<Point> points, bool clockwise = false)`

### 重载 2

**签名：** `int[] ConvexHullIndices(IEnumerable<Point2f> points, bool clockwise = false)`

**说明：** 计算一组 2D 点集的凸包，返回原始点集中构成凸包的从 0 开始的索引。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| points | IEnumerable\<Point\> / IEnumerable\<Point2f\> | 输入的 2D 点集 |
| clockwise | bool | 是否顺时针排列 |

**返回值：** `int[]` — 凸包点在原始数组中从 0 开始的索引

**示例：**
```csharp
using OpenCvSharp;

var points = new List<Point>
{
    new Point(100, 200),  // 索引 0
    new Point(300, 100),  // 索引 1
    new Point(200, 50),   // 索引 2
    new Point(50, 150)    // 索引 3
};
int[] indices = Cv2.ConvexHullIndices(points);
Console.WriteLine($"凸包点索引: {string.Join(", ", indices)}");
```

---

## ConvexityDefects — 凸缺陷检测

### 重载 1

**签名：** `void ConvexityDefects(InputArray contour, InputArray convexHull, OutputArray convexityDefects)`

### 重载 2

**签名：** `Vec4i[] ConvexityDefects(IEnumerable<Point> contour, IEnumerable<int> convexHull)`

### 重载 3

**签名：** `Vec4i[] ConvexityDefects(IEnumerable<Point2f> contour, IEnumerable<int> convexHull)`

**说明：** 计算轮廓的凸缺陷。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| contour | InputArray / IEnumerable | 输入的轮廓 |
| convexHull | InputArray / IEnumerable\<int\> | 由 ConvexHull() 得到的凸包，应包含构成凸包的轮廓点索引 |
| convexityDefects | OutputArray | 输出的凸缺陷向量。每个凸缺陷用一个 4 元素整数向量（Vec4i）表示：`(start_index, end_index, farthest_pt_index, fixpt_depth)`。其中索引是原始轮廓中凸缺陷起点、终点和最远点的从 0 开始的索引，`fixpt_depth` 是最远轮廓点到凸包的定点近似距离（8 位小数位），即实际距离 = `fixpt_depth / 256.0` |

**返回值：** `Vec4i[]` — 凸缺陷数组（重载 2/3）

**示例：**
```csharp
using OpenCvSharp;

var contour = new List<Point>
{
    new Point(100, 100), new Point(200, 80), new Point(280, 150),
    new Point(250, 250), new Point(150, 250), new Point(120, 180)
};
int[] hullIndices = Cv2.ConvexHullIndices(contour);
Vec4i[] defects = Cv2.ConvexityDefects(contour, hullIndices);
foreach (var d in defects)
{
    float depth = d.Item3 / 256.0f;
    Console.WriteLine($"起点: {d.Item0}, 终点: {d.Item1}, 最远点: {d.Item2}, 深度: {depth:F2}");
}
```

---

## IsContourConvex — 判断轮廓是否为凸

### 重载 1

**签名：** `bool IsContourConvex(InputArray contour)`

### 重载 2

**签名：** `bool IsContourConvex(IEnumerable<Point> contour)`

### 重载 3

**签名：** `bool IsContourConvex(IEnumerable<Point2f> contour)`

**说明：** 判断轮廓是否为凸轮廓。不支持自相交轮廓。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| contour | InputArray / IEnumerable | 输入的 2D 点集 |

**返回值：** `bool` — 若轮廓为凸则返回 `true`，否则返回 `false`

**示例：**
```csharp
using OpenCvSharp;

var convexPoints = new List<Point>
{
    new Point(0, 0), new Point(100, 0), new Point(100, 100), new Point(0, 100)
};
bool isConvex = Cv2.IsContourConvex(convexPoints);
Console.WriteLine($"是否为凸轮廓: {isConvex}");  // True
```

---

## IntersectConvexConvex — 两凸多边形求交

### 重载 1

**签名：** `float IntersectConvexConvex(InputArray p1, InputArray p2, OutputArray p12, bool handleNested = true)`

### 重载 2

**签名：** `float IntersectConvexConvex(IEnumerable<Point> p1, IEnumerable<Point> p2, out Point[] p12, bool handleNested = true)`

### 重载 3

**签名：** `float IntersectConvexConvex(IEnumerable<Point2f> p1, IEnumerable<Point2f> p2, out Point2f[] p12, bool handleNested = true)`

**说明：** 寻找两个凸多边形的交集。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| p1 | InputArray / IEnumerable | 第一个凸多边形 |
| p2 | InputArray / IEnumerable | 第二个凸多边形 |
| p12 | OutputArray / out array | 输出的交集多边形顶点 |
| handleNested | bool | 是否处理嵌套情况（一个多边形完全在另一个内部） |

**返回值：** `float` — 交集区域面积

**示例：**
```csharp
using OpenCvSharp;

var poly1 = new List<Point> { new Point(0, 0), new Point(100, 0), new Point(100, 100), new Point(0, 100) };
var poly2 = new List<Point> { new Point(50, 50), new Point(150, 50), new Point(150, 150), new Point(50, 150) };
float area = Cv2.IntersectConvexConvex(poly1, poly2, out var intersection);
Console.WriteLine($"交集面积: {area}");
Console.WriteLine($"交点多边形顶点数: {intersection.Length}");
```

---

## FitEllipse — 椭圆拟合

### 重载 1

**签名：** `RotatedRect FitEllipse(InputArray points)`

### 重载 2

**签名：** `RotatedRect FitEllipse(IEnumerable<Point> points)`

### 重载 3

**签名：** `RotatedRect FitEllipse(IEnumerable<Point2f> points)`

**说明：** 对一组 2D 点进行椭圆拟合。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| points | InputArray / IEnumerable | 输入的 2D 点集 |

**返回值：** `RotatedRect` — 包围拟合椭圆的旋转矩形

**示例：**
```csharp
using OpenCvSharp;

var points = new List<Point>
{
    new Point(150, 100), new Point(200, 120), new Point(250, 150),
    new Point(240, 200), new Point(200, 220), new Point(150, 200),
    new Point(120, 180), new Point(130, 130)
};
RotatedRect ellipse = Cv2.FitEllipse(points);
Console.WriteLine($"椭圆中心: ({ellipse.Center.X}, {ellipse.Center.Y})");
Console.WriteLine($"长轴/短轴: {ellipse.Size.Width} x {ellipse.Size.Height}");
Console.WriteLine($"旋转角度: {ellipse.Angle}°");
```

---

## FitEllipseAMS — 椭圆拟合（AMS 方法）

### 重载 1

**签名：** `RotatedRect FitEllipseAMS(InputArray points)`

### 重载 2

**签名：** `RotatedRect FitEllipseAMS(IEnumerable<Point> points)`

### 重载 3

**签名：** `RotatedRect FitEllipseAMS(IEnumerable<Point2f> points)`

**说明：** 对一组 2D 点进行椭圆拟合。该函数计算拟合一组 2D 点的椭圆，返回椭圆内切的旋转矩形。采用 Taubin1991 提出的近似均方（AMS）方法。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| points | InputArray / IEnumerable | 输入的 2D 点集 |

**返回值：** `RotatedRect` — 包围拟合椭圆的旋转矩形

**示例：**
```csharp
using OpenCvSharp;

var points = new List<Point2f>
{
    new Point2f(150, 100), new Point2f(200, 120), new Point2f(250, 150),
    new Point2f(240, 200), new Point2f(200, 220), new Point2f(150, 200)
};
RotatedRect ellipse = Cv2.FitEllipseAMS(points);
Console.WriteLine($"AMS 椭圆拟合 — 中心: ({ellipse.Center.X:F1}, {ellipse.Center.Y:F1})");
```

---

## FitEllipseDirect — 椭圆拟合（Direct 方法）

### 重载 1

**签名：** `RotatedRect FitEllipseDirect(InputArray points)`

### 重载 2

**签名：** `RotatedRect FitEllipseDirect(IEnumerable<Point> points)`

### 重载 3

**签名：** `RotatedRect FitEllipseDirect(IEnumerable<Point2f> points)`

**说明：** 对一组 2D 点进行椭圆拟合。该函数计算拟合一组 2D 点的椭圆，返回椭圆内切的旋转矩形。采用 Fitzgibbon1999 提出的直接最小二乘（Direct）方法。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| points | InputArray / IEnumerable | 输入的 2D 点集 |

**返回值：** `RotatedRect` — 包围拟合椭圆的旋转矩形

**示例：**
```csharp
using OpenCvSharp;

var points = new List<Point2f>
{
    new Point2f(150, 100), new Point2f(250, 150), new Point2f(200, 200), new Point2f(120, 150)
};
RotatedRect ellipse = Cv2.FitEllipseDirect(points);
Console.WriteLine($"Direct 椭圆拟合 — 中心: ({ellipse.Center.X:F1}, {ellipse.Center.Y:F1})");
```

---

## FitLine — 直线拟合（M 估计器）

### 重载 1（通用 InputArray）

**签名：** `void FitLine(InputArray points, OutputArray line, DistanceTypes distType, double param, double reps, double aeps)`

### 重载 2（2D 整数点）

**签名：** `Line2D FitLine(IEnumerable<Point> points, DistanceTypes distType, double param, double reps, double aeps)`

### 重载 3（2D 浮点点）

**签名：** `Line2D FitLine(IEnumerable<Point2f> points, DistanceTypes distType, double param, double reps, double aeps)`

### 重载 4（3D 整数点）

**签名：** `Line3D FitLine(IEnumerable<Point3i> points, DistanceTypes distType, double param, double reps, double aeps)`

### 重载 5（3D 浮点点）

**签名：** `Line3D FitLine(IEnumerable<Point3f> points, DistanceTypes distType, double param, double reps, double aeps)`

**说明：** 使用 M 估计器算法对一组 2D 或 3D 点进行直线拟合。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| points | InputArray / IEnumerable | 输入的 2D 或 3D 点集 |
| line | OutputArray | 输出的直线参数。对于 2D 拟合，应为 4 元素向量（Vec4f）— `(vx, vy, x0, y0)`，其中 `(vx, vy)` 是与直线共线的归一化向量，`(x0, y0)` 是直线上的一点。对于 3D 拟合，应为 6 元素向量（Vec6f）— `(vx, vy, vz, x0, y0, z0)` |
| distType | DistanceTypes | M 估计器使用的距离类型 |
| param | double | 某些距离类型的数值参数（C），若为 0 则选择最优值 |
| reps | double | 半径（坐标原点到直线距离）的足够精度 |
| aeps | double | 角度的足够精度。reps 和 aeps 推荐默认值 0.01 |

**返回值：** `Line2D` / `Line3D` — 输出的直线参数（重载 2-5）

**示例：**
```csharp
using OpenCvSharp;

var points = new List<Point2f>
{
    new Point2f(10, 20), new Point2f(50, 60), new Point2f(100, 110), new Point2f(80, 90)
};
Line2D line = Cv2.FitLine(points, DistanceTypes.L2, 0, 0.01, 0.01);
Console.WriteLine($"方向向量: ({line.Vx:F3}, {line.Vy:F3})");
Console.WriteLine($"直线上一点: ({line.X1:F3}, {line.Y1:F3})");
```

---

## PointPolygonTest — 点与轮廓位置关系检测

### 重载 1

**签名：** `double PointPolygonTest(InputArray contour, Point2f pt, bool measureDist)`

### 重载 2

**签名：** `double PointPolygonTest(IEnumerable<Point> contour, Point2f pt, bool measureDist)`

### 重载 3

**签名：** `double PointPolygonTest(IEnumerable<Point2f> contour, Point2f pt, bool measureDist)`

**说明：** 检测点是否在轮廓内部。可选择计算点到轮廓边界的有符号距离。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| contour | InputArray / IEnumerable | 输入的轮廓 |
| pt | Point2f | 待检测的点 |
| measureDist | bool | 若为 true，函数估算点到最近轮廓边的有符号距离；若为 false，函数仅检测点是否在轮廓内部 |

**返回值：** `double` — 正值表示在轮廓内部，负值表示在轮廓外部，零表示在轮廓边上

**示例：**
```csharp
using OpenCvSharp;

var contour = new List<Point>
{
    new Point(0, 0), new Point(100, 0), new Point(100, 100), new Point(0, 100)
};
double result = Cv2.PointPolygonTest(contour, new Point2f(50, 50), true);
Console.WriteLine($"点 (50,50) 到轮廓的有符号距离: {result:F2}");  // 正值，在内部

result = Cv2.PointPolygonTest(contour, new Point2f(150, 150), false);
Console.WriteLine($"点 (150,150) 是否在轮廓内: {result > 0}");  // 负值，在外部
```

---

## RotatedRectangleIntersection — 旋转矩形求交

### 重载 1

**签名：** `RectanglesIntersectTypes RotatedRectangleIntersection(RotatedRect rect1, RotatedRect rect2, OutputArray intersectingRegion)`

### 重载 2

**签名：** `RectanglesIntersectTypes RotatedRectangleIntersection(RotatedRect rect1, RotatedRect rect2, out Point2f[] intersectingRegion)`

**说明：** 检测两个旋转矩形之间是否存在交集。若存在交集，则同时返回相交区域的顶点。函数最多返回 8 个顶点。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| rect1 | RotatedRect | 第一个旋转矩形 |
| rect2 | RotatedRect | 第二个旋转矩形 |
| intersectingRegion | OutputArray / out Point2f[] | 输出的相交区域顶点，最多 8 个顶点，存储为 `std::vector<cv::Point2f>` 或 CV_32FC2 类型的 Mat |

**返回值：** `RectanglesIntersectTypes` — 枚举值，指示相交类型（无交集 / 部分相交 / 完全包含等）

**示例：**
```csharp
using OpenCvSharp;

var rect1 = new RotatedRect(new Point2f(100, 100), new Size2f(200, 100), 0);
var rect2 = new RotatedRect(new Point2f(200, 100), new Size2f(100, 200), 30);
var type = Cv2.RotatedRectangleIntersection(rect1, rect2, out var intersection);
Console.WriteLine($"相交类型: {type}");
if (intersection.Length > 0)
    Console.WriteLine($"交点多边形顶点数: {intersection.Length}");
```

---

## ApplyColorMap — 伪彩色映射

### 重载 1（预置颜色映射）

**签名：** `void ApplyColorMap(InputArray src, OutputArray dst, ColormapTypes colormap)`

### 重载 2（自定义颜色映射）

**签名：** `void ApplyColorMap(InputArray src, OutputArray dst, InputArray userColor)`

**说明：** 对给定图像应用伪彩色映射（类似 GNU Octave / MATLAB 的 colormap 效果）。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| src | InputArray | 源图像，灰度或彩色，类型为 CV_8UC1 或 CV_8UC3 |
| dst | OutputArray | 伪彩色映射后的结果图像（内部会调用 Mat::create） |
| colormap | ColormapTypes | 要应用的预置颜色映射类型 |
| userColor | InputArray | 用户自定义的颜色映射，类型为 CV_8UC1 或 CV_8UC3，大小 256 |

**返回值：** 无

**示例：**
```csharp
using OpenCvSharp;

Mat gray = new Mat(200, 200, MatType.CV_8UC1);
Cv2.Randu(gray, 0, 256);
Mat colored = new Mat();
Cv2.ApplyColorMap(gray, colored, ColormapTypes.Jet);
// colored 现在是伪彩色图像
```

---

## Line — 绘制线段

### 重载 1（坐标分离）

**签名：** `void Line(InputOutputArray img, int pt1X, int pt1Y, int pt2X, int pt2Y, Scalar color, int thickness = 1, LineTypes lineType = LineTypes.Link8, int shift = 0)`

### 重载 2（Point 参数）

**签名：** `void Line(InputOutputArray img, Point pt1, Point pt2, Scalar color, int thickness = 1, LineTypes lineType = LineTypes.Link8, int shift = 0)`

**说明：** 绘制连接两个点的线段。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| img | InputOutputArray | 目标图像 |
| pt1 / pt1X / pt1Y | Point / int | 线段第一个点 |
| pt2 / pt2X / pt2Y | Point / int | 线段第二个点 |
| color | Scalar | 线条颜色 |
| thickness | int | 线条粗细（默认 1） |
| lineType | LineTypes | 线条类型，默认 LineType.Link8 |
| shift | int | 点坐标的小数位数（默认 0） |

**返回值：** 无

**示例：**
```csharp
using OpenCvSharp;

Mat img = new Mat(300, 400, MatType.CV_8UC3, Scalar.White);
Cv2.Line(img, new Point(50, 50), new Point(350, 250), Scalar.Red, thickness: 2);
```

---

## ArrowedLine — 绘制箭头线段

**签名：** `void ArrowedLine(InputOutputArray img, Point pt1, Point pt2, Scalar color, int thickness = 1, LineTypes lineType = LineTypes.Link8, int shift = 0, double tipLength = 0.1)`

**说明：** 在图像上绘制从第一个点指向第二个点的箭头线段。参考 cv::line。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| img | InputOutputArray | 目标图像 |
| pt1 | Point | 箭头起始点 |
| pt2 | Point | 箭头指向的点 |
| color | Scalar | 线条颜色 |
| thickness | int | 线条粗细 |
| lineType | LineTypes | 线条类型，参考 LineTypes |
| shift | int | 点坐标的小数位数 |
| tipLength | double | 箭头尖端长度相对于箭头总长度的比例（默认 0.1） |

**返回值：** 无

**示例：**
```csharp
using OpenCvSharp;

Mat img = new Mat(300, 400, MatType.CV_8UC3, Scalar.White);
Cv2.ArrowedLine(img, new Point(50, 150), new Point(350, 150), Scalar.Blue, thickness: 2, tipLength: 0.2);
```

---

## Rectangle — 绘制矩形

### 重载 1（InputOutputArray + Point）

**签名：** `void Rectangle(InputOutputArray img, Point pt1, Point pt2, Scalar color, int thickness = 1, LineTypes lineType = LineTypes.Link8, int shift = 0)`

### 重载 2（InputOutputArray + Rect）

**签名：** `void Rectangle(InputOutputArray img, Rect rect, Scalar color, int thickness = 1, LineTypes lineType = LineTypes.Link8, int shift = 0)`

### 重载 3（Mat + Rect）

**签名：** `void Rectangle(Mat img, Rect rect, Scalar color, int thickness = 1, LineTypes lineType = LineTypes.Link8, int shift = 0)`

### 重载 4（Mat + Point）

**签名：** `void Rectangle(Mat img, Point pt1, Point pt2, Scalar color, int thickness = 1, LineTypes lineType = LineTypes.Link8, int shift = 0)`

**说明：** 绘制简单、加粗或填充的矩形。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| img | InputOutputArray / Mat | 目标图像 |
| pt1 | Point | 矩形的一个顶点 |
| pt2 | Point | 矩形的对角顶点 |
| rect | Rect | 矩形 |
| color | Scalar | 线条颜色（RGB）或亮度（灰度图） |
| thickness | int | 构成矩形的线条粗细。负值表示绘制填充矩形（默认 1） |
| lineType | LineTypes | 线条类型（默认 LineType.Link8） |
| shift | int | 点坐标的小数位数（默认 0） |

**返回值：** 无

**示例：**
```csharp
using OpenCvSharp;

Mat img = new Mat(300, 400, MatType.CV_8UC3, Scalar.White);
// 空心矩形
Cv2.Rectangle(img, new Point(50, 50), new Point(200, 150), Scalar.Green, thickness: 2);
// 填充矩形
Cv2.Rectangle(img, new Rect(220, 50, 150, 100), Scalar.Red, thickness: -1);
```

---

## Circle — 绘制圆形

### 重载 1（分离坐标）

**签名：** `void Circle(InputOutputArray img, int centerX, int centerY, int radius, Scalar color, int thickness = 1, LineTypes lineType = LineTypes.Link8, int shift = 0)`

### 重载 2（Point 参数）

**签名：** `void Circle(InputOutputArray img, Point center, int radius, Scalar color, int thickness = 1, LineTypes lineType = LineTypes.Link8, int shift = 0)`

**说明：** 绘制圆形。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| img | InputOutputArray | 绘制圆形的目标图像 |
| center / centerX / centerY | Point / int | 圆心坐标 |
| radius | int | 圆的半径 |
| color | Scalar | 圆的颜色 |
| thickness | int | 圆形轮廓粗细。正值绘制轮廓，负值填充整个圆（默认 1） |
| lineType | LineTypes | 圆形边界类型（默认 LineType.Link8） |
| shift | int | 圆心坐标和半径的小数位数（默认 0） |

**返回值：** 无

**示例：**
```csharp
using OpenCvSharp;

Mat img = new Mat(300, 300, MatType.CV_8UC3, Scalar.White);
Cv2.Circle(img, 150, 150, 100, Scalar.Blue, thickness: 2);
Cv2.Circle(img, new Point(150, 150), 40, Scalar.Red, thickness: -1);  // 填充实心圆
```

---

## Ellipse — 绘制椭圆 / 椭圆弧

### 重载 1（完整椭圆参数）

**签名：** `void Ellipse(InputOutputArray img, Point center, Size axes, double angle, double startAngle, double endAngle, Scalar color, int thickness = 1, LineTypes lineType = LineTypes.Link8, int shift = 0)`

### 重载 2（RotatedRect 参数）

**签名：** `void Ellipse(InputOutputArray img, RotatedRect box, Scalar color, int thickness = 1, LineTypes lineType = LineTypes.Link8)`

**说明：** 绘制简单或加粗的椭圆弧，或填充椭圆扇形区域。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| img | InputOutputArray | 目标图像 |
| center | Point | 椭圆中心 |
| axes | Size | 椭圆轴的长度 |
| angle | double | 旋转角度（度） |
| startAngle | double | 椭圆弧起始角度（度） |
| endAngle | double | 椭圆弧终止角度（度） |
| box | RotatedRect | 椭圆的外接旋转矩形 |
| color | Scalar | 椭圆颜色 |
| thickness | int | 椭圆边界粗细（默认 1） |
| lineType | LineTypes | 椭圆边界类型（默认 LineType.Link8） |
| shift | int | 中心坐标和轴值的小数位数（默认 0） |

**返回值：** 无

**示例：**
```csharp
using OpenCvSharp;

Mat img = new Mat(300, 400, MatType.CV_8UC3, Scalar.White);
// 绘制完整椭圆
Cv2.Ellipse(img, new Point(200, 150), new Size(100, 60), 30, 0, 360, Scalar.Green, thickness: 2);
// 使用 RotatedRect 绘制
var rotatedRect = new RotatedRect(new Point2f(100, 150), new Size2f(80, 50), 45);
Cv2.Ellipse(img, rotatedRect, Scalar.Red, thickness: 2);
```

---

## DrawMarker — 绘制标记

**签名：** `void DrawMarker(InputOutputArray img, Point position, Scalar color, MarkerTypes markerType = MarkerTypes.Cross, int markerSize = 20, int thickness = 1, LineTypes lineType = LineTypes.Link8)`

**说明：** 在图像的预定义位置绘制标记。支持多种标记类型，参见 MarkerTypes 枚举。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| img | InputOutputArray | 目标图像 |
| position | Point | 标记位置点 |
| color | Scalar | 线条颜色 |
| markerType | MarkerTypes | 要使用的标记类型（默认 Cross 十字交叉） |
| markerSize | int | 标记轴的长度（默认 20 像素） |
| thickness | int | 线条粗细 |
| lineType | LineTypes | 线条类型 |

**返回值：** 无

**示例：**
```csharp
using OpenCvSharp;

Mat img = new Mat(200, 200, MatType.CV_8UC3, Scalar.White);
Cv2.DrawMarker(img, new Point(100, 100), Scalar.Red, MarkerTypes.Cross, markerSize: 30, thickness: 2);
Cv2.DrawMarker(img, new Point(50, 50), Scalar.Blue, MarkerTypes.TiltedCross, markerSize: 20);
```

---

## FillConvexPoly — 填充凸多边形

### 重载 1

**签名：** `void FillConvexPoly(Mat img, IEnumerable<Point> pts, Scalar color, LineTypes lineType = LineTypes.Link8, int shift = 0)`

### 重载 2

**签名：** `void FillConvexPoly(InputOutputArray img, InputArray pts, Scalar color, LineTypes lineType = LineTypes.Link8, int shift = 0)`

**说明：** 填充一个凸多边形区域。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| img | Mat / InputOutputArray | 目标图像 |
| pts | IEnumerable\<Point\> / InputArray | 多边形的顶点 |
| color | Scalar | 填充颜色 |
| lineType | LineTypes | 多边形边界类型 |
| shift | int | 顶点坐标的小数位数 |

**返回值：** 无

**示例：**
```csharp
using OpenCvSharp;

Mat img = new Mat(300, 300, MatType.CV_8UC3, Scalar.White);
var pts = new List<Point>
{
    new Point(50, 200),
    new Point(150, 50),
    new Point(250, 200)
};
Cv2.FillConvexPoly(img, pts, Scalar.Blue);
```

---

## FillPoly — 填充多边形区域

### 重载 1

**签名：** `void FillPoly(Mat img, IEnumerable<IEnumerable<Point>> pts, Scalar color, LineTypes lineType = LineTypes.Link8, int shift = 0, Point? offset = null)`

### 重载 2

**签名：** `void FillPoly(InputOutputArray img, InputArray pts, Scalar color, LineTypes lineType = LineTypes.Link8, int shift = 0, Point? offset = null)`

**说明：** 填充由一个或多个多边形围成的区域。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| img | Mat / InputOutputArray | 目标图像 |
| pts | IEnumerable\<IEnumerable\<Point\>\> / InputArray | 多边形数组，每个多边形由一组点表示 |
| color | Scalar | 填充颜色 |
| lineType | LineTypes | 多边形边界类型 |
| shift | int | 顶点坐标的小数位数 |
| offset | Point? | 可选偏移量 |

**返回值：** 无

**示例：**
```csharp
using OpenCvSharp;

Mat img = new Mat(300, 300, MatType.CV_8UC3, Scalar.White);
var polygons = new List<List<Point>>
{
    new List<Point> { new Point(50, 50), new Point(150, 30), new Point(120, 120) },
    new List<Point> { new Point(180, 150), new Point(250, 120), new Point(230, 220), new Point(180, 200) }
};
Cv2.FillPoly(img, polygons, Scalar.Green);
```

---

## Polylines — 绘制多边形折线

### 重载 1

**签名：** `void Polylines(Mat img, IEnumerable<IEnumerable<Point>> pts, bool isClosed, Scalar color, int thickness = 1, LineTypes lineType = LineTypes.Link8, int shift = 0)`

### 重载 2

**签名：** `void Polylines(InputOutputArray img, InputArray pts, bool isClosed, Scalar color, int thickness = 1, LineTypes lineType = LineTypes.Link8, int shift = 0)`

**说明：** 绘制一条或多条多边形折线。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| img | Mat / InputOutputArray | 目标图像 |
| pts | IEnumerable\<IEnumerable\<Point\>\> / InputArray | 多边形点集 |
| isClosed | bool | 是否闭合多边形 |
| color | Scalar | 线条颜色 |
| thickness | int | 线条粗细 |
| lineType | LineTypes | 线条类型 |
| shift | int | 点坐标小数位数 |

**返回值：** 无

**示例：**
```csharp
using OpenCvSharp;

Mat img = new Mat(300, 300, MatType.CV_8UC3, Scalar.White);
var polyline = new List<Point>
{
    new Point(50, 50), new Point(200, 80), new Point(150, 200), new Point(60, 180)
};
Cv2.Polylines(img, new[] { polyline }, isClosed: true, Scalar.Red, thickness: 2);
```

---

## DrawContours — 绘制轮廓

### 重载 1（IEnumerable\<Point\> 轮廓）

**签名：** `void DrawContours(InputOutputArray image, IEnumerable<IEnumerable<Point>> contours, int contourIdx, Scalar color, int thickness = 1, LineTypes lineType = LineTypes.Link8, IEnumerable<HierarchyIndex>? hierarchy = null, int maxLevel = int.MaxValue, Point? offset = null)`

### 重载 2（Mat 轮廓）

**签名：** `void DrawContours(InputOutputArray image, IEnumerable<Mat> contours, int contourIdx, Scalar color, int thickness = 1, LineTypes lineType = LineTypes.Link8, Mat? hierarchy = null, int maxLevel = int.MaxValue, Point? offset = null)`

**说明：** 在图像上绘制轮廓。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| image | InputOutputArray | 目标图像 |
| contours | IEnumerable\<IEnumerable\<Point\>\> / IEnumerable\<Mat\> | 所有输入轮廓，每个轮廓存储为点向量 |
| contourIdx | int | 指示要绘制的轮廓索引。若为负数，则绘制所有轮廓 |
| color | Scalar | 轮廓颜色 |
| thickness | int | 绘制轮廓的线条粗细。若为负值（如 thickness = CV_FILLED），则填充轮廓内部 |
| lineType | LineTypes | 线条连接类型 |
| hierarchy | IEnumerable\<HierarchyIndex\>? / Mat? | 可选的层次信息。仅当需要绘制特定嵌套级别的轮廓时才需要 |
| maxLevel | int | 绘制轮廓的最大层级。若为 0，仅绘制指定轮廓；若为 1，绘制轮廓及所有嵌套子轮廓；若为 2，绘制轮廓、嵌套子轮廓及更深层级的子子轮廓，以此类推。此参数仅在提供 hierarchy 时生效 |
| offset | Point? | 可选的轮廓偏移量，将所有绘制的轮廓平移 `(dx, dy)` |

**返回值：** 无

**示例：**
```csharp
using OpenCvSharp;

Mat src = Cv2.ImRead("input.png", ImreadModes.Grayscale);
Mat binary = new Mat();
Cv2.Threshold(src, binary, 128, 255, ThresholdTypes.Binary);
Cv2.FindContours(binary, out var contours, out var hierarchy, RetrievalModes.Tree, ContourApproximationModes.ApproxSimple);

Mat result = new Mat(src.Size(), MatType.CV_8UC3, Scalar.Black);
Cv2.DrawContours(result, contours, -1, Scalar.Green, thickness: 2);
```

---

## ClipLine — 裁剪线段到图像矩形

### 重载 1（Size 参数）

**签名：** `bool ClipLine(Size imgSize, ref Point pt1, ref Point pt2)`

### 重载 2（Rect 参数）

**签名：** `bool ClipLine(Rect imgRect, ref Point pt1, ref Point pt2)`

**说明：** 将线段裁剪到图像矩形范围内。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| imgSize | Size | 图像大小 |
| imgRect | Rect | 图像矩形 |
| pt1 | ref Point | 线段第一个端点（将被修改） |
| pt2 | ref Point | 线段第二个端点（将被修改） |

**返回值：** `bool` — 若线段与矩形有交集则返回 `true`，否则返回 `false`

**示例：**
```csharp
using OpenCvSharp;

var pt1 = new Point(-10, 50);
var pt2 = new Point(250, 50);
bool clipped = Cv2.ClipLine(new Size(200, 200), ref pt1, ref pt2);
Console.WriteLine($"已裁剪: {clipped}, pt1=({pt1.X},{pt1.Y}), pt2=({pt2.X},{pt2.Y})");
// 输出: 已裁剪: True, pt1=(0,50), pt2=(199,50)
```

---

## Ellipse2Poly — 椭圆弧折线近似

### 重载 1（整数坐标）

**签名：** `Point[] Ellipse2Poly(Point center, Size axes, int angle, int arcStart, int arcEnd, int delta)`

### 重载 2（双精度浮点坐标）

**签名：** `Point2d[] Ellipse2Poly(Point2d center, Size2d axes, int angle, int arcStart, int arcEnd, int delta)`

**说明：** 用折线近似椭圆弧。该函数计算近似指定椭圆弧的折线顶点，被 `cv::ellipse` 内部使用。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| center | Point / Point2d | 圆弧中心 |
| axes | Size / Size2d | 椭圆主轴半尺寸 |
| angle | int | 椭圆旋转角度（度） |
| arcStart | int | 椭圆弧起始角度（度） |
| arcEnd | int | 椭圆弧终止角度（度） |
| delta | int | 相邻折线顶点之间的角度间隔，它定义了近似精度 |

**返回值：** `Point[]` / `Point2d[]` — 折线顶点数组

**示例：**
```csharp
using OpenCvSharp;

Point[] polyPoints = Cv2.Ellipse2Poly(
    new Point(200, 150), new Size(100, 60), 30, 0, 360, 10);
Console.WriteLine($"椭圆弧折线顶点数: {polyPoints.Length}");

Mat img = new Mat(300, 400, MatType.CV_8UC3, Scalar.White);
Cv2.Polylines(img, new[] { polyPoints }, isClosed: true, Scalar.Red, thickness: 1);
```

---

## PutText — 绘制文本

**签名：** `void PutText(InputOutputArray img, string text, Point org, HersheyFonts fontFace, double fontScale, Scalar color, int thickness = 1, LineTypes lineType = LineTypes.Link8, bool bottomLeftOrigin = false)`

**说明：** 在图像上渲染文本字符串。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| img | InputOutputArray | 目标图像 |
| text | string | 要绘制的文本字符串 |
| org | Point | 文本字符串在图像中的左下角位置 |
| fontFace | HersheyFonts | 字体类型，参见 HersheyFonts 枚举 |
| fontScale | double | 字体缩放因子，乘以字体特定基础大小 |
| color | Scalar | 文本颜色 |
| thickness | int | 绘制文本线条的粗细 |
| lineType | LineTypes | 线条类型 |
| bottomLeftOrigin | bool | 若为 true，图像数据原点位于左下角；否则位于左上角 |

**返回值：** 无

**示例：**
```csharp
using OpenCvSharp;

Mat img = new Mat(200, 400, MatType.CV_8UC3, Scalar.White);
Cv2.PutText(img, "Hello OpenCV!", new Point(50, 100),
    HersheyFonts.HersheySimplex, 1.0, Scalar.Black, thickness: 2);
```

---

## GetTextSize — 获取文本尺寸

**签名：** `Size GetTextSize(string text, HersheyFonts fontFace, double fontScale, int thickness, out int baseLine)`

**说明：** 返回文本字符串的边界框大小。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| text | string | 输入文本字符串 |
| fontFace | HersheyFonts | 要使用的字体，参见 HersheyFonts 枚举 |
| fontScale | double | 字体缩放因子，乘以字体特定基础大小 |
| thickness | int | 渲染文本线条的粗细 |
| baseLine | out int | 基线相对于最底部文本的 y 坐标 |

**返回值：** `Size` — 包含指定文本的边界框大小

**示例：**
```csharp
using OpenCvSharp;

string text = "Hello World";
Size textSize = Cv2.GetTextSize(text, HersheyFonts.HersheySimplex, 1.0, 2, out int baseline);
Console.WriteLine($"文本尺寸: {textSize.Width} x {textSize.Height}, 基线: {baseline}");

// 将文本居中绘制
Mat img = new Mat(300, 500, MatType.CV_8UC3, Scalar.White);
Point textOrg = new Point(
    (img.Width - textSize.Width) / 2,
    (img.Height + textSize.Height) / 2);
Cv2.PutText(img, text, textOrg, HersheyFonts.HersheySimplex, 1.0, Scalar.Black, 2);
```

---

## GetFontScaleFromHeight — 根据像素高度计算字体缩放

**签名：** `double GetFontScaleFromHeight(HersheyFonts fontFace, int pixelHeight, int thickness = 1)`

**说明：** 计算达到指定像素高度所需使用的字体特定缩放因子。

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| fontFace | HersheyFonts | 要使用的字体，参见 HersheyFonts 枚举 |
| pixelHeight | int | 需要计算 fontScale 的目标像素高度 |
| thickness | int | 渲染文本线条的粗细，参见 putText（默认 1） |

**返回值：** `double` — 用于 `cv::putText` 的字体缩放值（fontScale）

**示例：**
```csharp
using OpenCvSharp;

double fontScale = Cv2.GetFontScaleFromHeight(HersheyFonts.HersheySimplex, pixelHeight: 50, thickness: 2);
Console.WriteLine($"要达到 50 像素高度，fontScale 应为: {fontScale:F3}");

Mat img = new Mat(200, 500, MatType.CV_8UC3, Scalar.White);
Cv2.PutText(img, "50px Height", new Point(10, 100),
    HersheyFonts.HersheySimplex, fontScale, Scalar.Black, thickness: 2);
```
