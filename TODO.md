# Introduction
学别人弄的一个记录单，挺漂亮的，用来记录做过的事情。

## Todo
* [ ] 引入纹理特征
  * [-] 用3*3的像素块？
    [-] 如果像素块太小，纹理在此范围内无法重复；
  * [ ] 用5*5像素块
    [ ] 死马当活马医，纹理特征用起来真心不方便
  * [ ] 用超大的像素块？
    [ ] 用分层的思想来做这个，用那个什么merge，先大块然后小块，是一个兴奋点~
    * [ ] 先问Vincent，要等
    * [ ] 马上动手写可能不耗时，浪费时间
    * [ ] 先写必须要用到的部分，对几个特征系数的计算
    [ ] 像素块太大，不便于各特征的融合；如果用纹理单特征呢
    [ ] merge的过程中可以优，实际上是个string的merge
* [ ] 引入SEC
  * [ ] SEC 是一个很有趣的算法，对于分块后的融合很有用
* [ ] 对特征向量进行threshold
* [ ] 实现对图像分割的评价函数的实现
* [ ] 引入IC Graph，看效果好不好
* [ ] 考虑为什么这么慢，找出最慢的部分(tic toc)
* [ ] 在纯色图中加入噪声（泊松过程？）
* [ ] 对自然图像进行处理

## Done
* [X] 引入Partial特征
* [X] 完成特征归一化函数
* [X] 引入Mean和Variance特征
* [X] 用画图工具建立一个纯色图
* [X] 将运算逻辑拆分，放弃多特征融合
* [X] 将位置过滤加到特征计算的过程中，而不是之后考虑
* [X] 改Bug，Aii应该是0，不是1（big mistake）
* [X] 生成测试图像
  * [-] 手工生成，没有技术含量，但是简单（四块，纯色简单，纹理略复杂，梯度简单）
  * [X] 代码生成，稳定，可调整，Geek（纯色简单，纹理一般，梯度一般，选这个，因为长期利益的原因）
