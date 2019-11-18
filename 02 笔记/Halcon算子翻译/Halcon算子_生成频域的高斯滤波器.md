

# Version

HALCON 18.11.0.1 / HALCON Operator Reference / Filters / FFT

***

# 算子形式

```C
gen_gauss_filter( : ImageGauss : Sigma1, Sigma2, Phi, Norm, Mode, Width, Height : )
```

***

## Name

+ __gen\_gauss\_filter__ — Generate a Gaussian filter in the frequency domain.
+  在频域生成一个高斯滤波器.

***

# Description

+ __gen\_gauss\_filter__ generates a (possibly anisotropic) Gaussian filter in the frequency domain. The standard deviations (i.e., the amount of smoothing) of the Gaussian in the spatial domain are determined by Sigma1 and Sigma2. Sigma1 is the standard deviation in the principal direction of the filter in the spatial domain determined by the angle Phi. To achieve a maximum overall efficiency of the filtering operation, the parameter Norm can be used to specify the normalization factor of the filter. If fft_generic and Norm = 'n' is used the normalization in the FFT can be avoided. Mode can be used to determine where the DC term of the filter lies or whether the filter should be used in the real-valued FFT. If fft_generic is used, 'dc_edge' can be used to gain efficiency. If fft_image and fft_image_inv are used for filtering, Norm = 'none' and Mode = 'dc_center' must be used. If rft_generic is used, Mode = 'rft' must be used.
+ $gen\_gauss\_filter$在频域生成一个(可能是各向异性)的高斯滤波器.高斯函数在空域的标准差由$Sigma1$和$Sigma2$来决定.
+ $Sigma1$是空间域滤波器的主方向上的标准差,$Phi$是这个空域滤波器的参数(todo 没看懂)
+ 为达到最高总效率的滤波操作的效果,参数$Norm$可以用来设置这个滤波器的__归一化因子__.
+ 如果是使用$fft\_generic$函数来做变换且$Norm$被设置为$'n'$,那么$FFT$中的归一化就被禁用.
+ $Mode$参数用来决定生成的滤波器的形式,配套不同的算子流：
  + $'dc\_edge'$,表示生成的滤波器的直流分量在四周，没有进行中心化，若使用$fft\_generic$函数进行$FFT$,应该选取此参数.
  + $'dc\_center'$,表示生成的滤波器的直流分量在中心位置，滤波器已经进行了中心化，如果是使用$fft\_image$或$fft\_image\_inv$函数进行$FFT$,应该选取此参数.
  + $'rft'$，如果使用$rft\_generic()$函数进行$FFT$,应该选取此参数.

***

# Execution Information

+ Multithreading type: reentrant (runs in parallel with non-exclusive operators).
+ Multithreading scope: global (may be called from any thread
+ Processed without parallelization.