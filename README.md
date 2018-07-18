# Diantask
## 2.1递归阶乘
这题我的思路很清楚，就是使用了一个递归函数。代码见factorial.sh.结果图如下

![result](https://github.com/Nevermore512/Diantask/blob/master/pictures/task2.1.png)

## 2.2自动根据后缀名解压文件
思路：用if语句来判断输入的参数类型，若为--list则打印支持类型，若为空则打印用法，不为空则通过elif判断类型，再进行解压，解压路径通过直接传脚本参数决定。
代码见self_compression.sh.结果图如下

![result](https://github.com/Nevermore512/Diantask/edit/master/README.md)

## 2.3获取文件夹下最大的前n个文件
思路：主要是使用 du -max-depth=1 查看目录下的第一层文件，再利用sort函数排序。代码见file_size.sh,结果图如下

![result]()
