
- 参数估计 
  - 最大似然估计 bbmle
  - 最小二乘估计 `nlme::gls` lm

- 假设检验 Test
  - `t.test` 检验
  - F 检验
  - T^2 检验
  - 正态性检验
  - 卡方检验
  - 拟合优度检验
  - 相关性检验
  - 模型系数显著性检验
  - 独立性检验
  - 因果检验
  - 单样本检验、两样本检验
  - 小样本检验、大样本检验

- 线性模型 LM
  - 奇异值和特征值分解 （线性模型） 
     - `stats::lm` `stats::glm` `stats::nlm` 
     - `MASS::rlm` `MASS::lqs` `nlme::gls` 
     - [svd](http://github.com/asl/svd) 
     - [RSpectra](https://github.com/yixuan/RSpectra) 
     - [RcppEigen](	https://github.com/RcppCore/RcppEigen) `fastLm`
       - column-pivoted QR 分解
       - unpivoted QR 分解
       - LLT Cholesky 分解
       - LDLT Cholesky 分解
       - Jacobi SVD 分解
       - eigenvalue-eigenvector decomposition of X'X 
     - [biglm](https://cran.r-project.org/web/packages/biglm/index.html)  内存外回归，借助数据库
       - 增量 QR 分解
  - 一元线性回归 univa 
  - 多元线性回归 multiva
  - 多重多元线性回归 multiply linear regression

- 广义线性模型 GLM Generalized Linear Models

  - `glm` 

- 非线性模型 NLM nonlinear Models

  - `nlm`

- 线性混合效应模型 LME Linear Mixed Models

  - lme4

- 广义线性混合效应模型 GLMM Generalized Linear Mixed Models

  - glmer

- 非线性混合效应模型 NLMM nonlinear Mixed Models

  - nlme

- 动态线性模型 DLM Dynamic Linear Models

- 动态广义线性模型 DGLM Dynamic Linear Models

- 线性时间序列模型 LTS linear Time Series
  - 一元时间序列分析
  - 多元时间序列分析

- 非线性时间序列模型 NLTS nonlinear Time Series


