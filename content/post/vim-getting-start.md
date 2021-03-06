---
title: "Vim 快速入门"
date: 2019-03-15T15:59:52+08:00
categories:
- Vim
tags:
- Linux
- vim
keywords:
- linux
- editor
- vim
#thumbnailImage: //example.com/image.jpg
---

Vim是一个类似于Vi的著名的功能强大、高度可定制的文本编辑器，在Vi的基础上改进和增加了很多特性。VIM是自由软件。本篇文章是作者的学习笔记，发布本篇文章主要为了备忘，同时也希望能帮助读者快速入门Vim。

<!--more-->

## 新建文件

```bash
# 方法一
# 直接输入以下命令，编写文件内容； ESC + : + wq! filename 保存退出
vim

# 方法二
# ESC + : + wq 保存并退出
vim filename

vim + filename # 打开文件，光标定位最后一行
```

## 保存文件并退回终端

**命令模式下双击ZZ(大写的)**

## 移动 

```
# 每次移动一个字符
k	上移；
j	下移；
h  	左移；
l	右移；
```

**ctrl+f 向前移动一页（page down）, ctrl+b 向后移动一页（page up)更大范围的移动**

```txt
*               当光标停留在一个单词上, * 会在文件内搜索该单词,并跳转到下一处;
#               当光标停留在一个单词上，# 会在文件内搜索该单词,并跳转到上一处；
(/)             移动到 前/后 句 的开始；
{/}             跳转到 当前/下一个 段落 的开始。
g_              到本行最后一个不是 blank 字符的位置。
fa              到下一个为 a 的字符处，你也可以fs到下一个为s的字符。
t,              到逗号前的第一个字符。逗号可以变成其它字符。
3fa             在当前行查找第三个出现的 a。
gg              将光标定位到文件第一行起始位置；
G               将光标定位到文件最后一行起始位置；
NG或Ngg         将光标定位到第 N 行的起始位置
```
## 快速移动光标
```
H               将光标移动到屏幕上的起始行（或最上行};
M               将光标移动到屏幕中间；
L               将光标移动到屏幕的最后一行。
```

同样需要注意字母的大小写。`H` 和 `L` 命令还可以加数字。如 `2H` 表示将光标移到屏幕的第`２`行，`3L` 表示将光标移到屏幕的倒数第`3`行。

## 行内移动光标

```
w               右移光标到下一个字的开头；
e               右移光标到一个字的结尾；
b               左移光标到前一个字的开头；
0               左移光标到本行的开始；
$               右移光标到本行末尾；
^               移动光标到本行的第一个非空字符。
```

## 搜索匹配

```
/str            正向搜索字符串str；
n               继续搜索，定位到str字符串下一次出现的位置；
N               继续搜索，定位到str字符串上一次出现的位置；
？str	        反向搜索字符串str；
```

## 替换和删除

**Vim常规的删除命令是d、x(前者删除`行`,后者删除`字符`**

```
rc              用c替换光标所指向的字符
nrc             用c替换光标所指向的前n个字符
x               删除光标所指向的当前字符
nx              删除光标所指向的前n个字符
dw              删除光标右侧的字
ndw             删除光标邮政的n个字
db              删除光标左侧的字
ndb             删除光标左侧的n个字
dd              删除光标所在行，并去除空隙
ndd             删除n行内容，并去除空隙

d$              从当前光标位置删除字符直到行的结束
d0              从当前光标位置删除字符直到行的开始
J               删除本行的回车符（CR），并和下一行合并
```

## Vim常规的替换命令有`c`和`s`

```
s               删除光标所指向的字符，进入编辑模式
S               删除当前行，进入编辑模式
c$              删除光标位置到行尾的所有字符并进入编辑模式
c0              删除光标位置到行开始位置的所有字符，并进入编辑模式
```

## 复制粘贴

从正文中删除的内容（如字符、字或行）并没有真正丢失，而是被剪切并复制到了一个内存缓冲区中。用户可将其粘贴到正文中的指定位置

```
p               小写字母p,将缓冲区的内容粘贴到光标的后面
P               大写字母P,将缓冲区的内容粘贴到光标的前面
```

如果缓冲区的内容是字符或字，直接粘贴在光标的前面或后面；如果缓冲区的内容为整行正文，执行上述粘贴命令将会粘贴在当前光标所在行的上一行或下一行。
注意上述两个命令中字母的大小写。Vim 编辑器经常以一对大、小写字母（如 p 和 P）来提供一对相似的功能。通常，小写命令在光标的后面进行操作，大写命令在光标的前面进行操作。

## 复制正文

```
yy              复制当前行内容到缓冲区
nyy             复制n行内容到缓冲区
“+y             复制当前行的内容到操作系统的粘贴板
”+nyy           复制n行内容到操作系统的粘贴板
```

## 撤销和重复

```
u               小写字母u,撤销前一条命令的结果
.               重复最后一条修改正文的命令
```

## 进入插入模式

在正确定位光标之后，可以使用以下命令进入插入模式：

```
i               在光标左侧插入正文
a               在光标右侧插入正文
o               在光标所在行的下一行新增一行
O               在光标所在行的上一行新增一行
I               大写, 在光标所在行的开头插入
A               大写, 在光标所在行的末尾插入
```

按`ESC`键 和 组合键`Ctrl + [` 可退出插入模式。


## 打开、保存、退出

```
:e path_to_file/filename     在已经启动的Vim中打开一个文件
:w                           保存当前编辑的文件
:w  new_fileName             将当前文件另存为new_fileName
ZZ                           大写，保存并退出
:q                           在未作任何修改的情况下退出
:q!                          放弃所有修改，并退出
:wq                          保存并退出，注意命令顺序
```

## 行号与文件

```
:n                           将光标移动到指定行，同ngg和nG相同
```

命令模式下，可以规定命令操作的行号范围。数值用来指定绝对行号；字符`.`表示光标所在行的行号；字符符$表示正文最后一行的行号；简单的表达式，例如`.+5`表示当前行往下5行,例如:

```
:345                         将光标移动到第345行
:345w file                   将第345行内容写入file文件
:3,5w file                   将第3至第5行写入file文件
:1,.w file                   将第1行至当前行写入file文件
:.,$w file                   将当前行至最后一行写入file文件
:a,bW file                   将第a行至第b行的内容写入file文件
:r file                      读取file文件的内容，插入当前光标所在行的后面
:e file                      编辑新文件file 代替原有内容
:f file                      将当前文件重命名为file
:f                           打印当前文件的名称、状态、行数、光标所在行号等
```

## 字符串搜索

在 编辑模式 讲过字符串的搜索，此处的 命令模式 也可以进行字符串搜索，给出一个字符串，可以通过搜索该字符串到达指定行。如果希望进行正向搜索，将待搜索的字符串置于两个`/` 之间；如果希望反向搜索，则将字符串放在两个 `?` 之间

```
:/str/                      正向搜索，将光标移动到下一个包含字符串 str 的行
:?str?                      反向搜索，将光标移动到上一个包含字符串 str 的行
:/str/w file                正向搜索，将第一个包含字符串的行写入 file 文件
:/str1/,/str2/w file        正向搜索，将包含字符串 str1 的行至 包含字符串 str2 的行的内容写入 file文件 

:d                          删除光标所在行
:nd                         删除 n 行

:recover                    恢复意外退出而没有保存的修改，也可在启动的时候使用'-r'选项 
```

## Shell 切换

当处于编辑的对话过程中时，可能需要执行一些Linux命令。如果需要保存当前的结果，退出编辑程序，再执行所需的Linux命令，然后再回头继续编辑过程，就显得十分累赘。如果能在编辑的环境中运行Linux命令就要省事得多。在Vim中，可以用下面的命令来做到这一点：

```
:!shell_command             执行完 shell_command 后回到Vim  :!pwd
```

## 分屏

```
:split                      缩写:sp, 上下分屏
:vsplit                     缩写:vsp,左右分屏1
```

另外，也可以在终端里启动vim时就开启分屏操作：

```
vim -On file1 file2...      打开 file1 和 file2 ，垂直分屏
vim -on file1 file2...      打开 file1 和 file2 ，水平分屏
```

## 快速操作

```
以下命令可以对标点内的内容进行操作。
ci’、ci”、ci(、ci[、ci{、ci<               分别更改这些配对标点符号中的文本内容
di’、di”、di(或dib、di[、di{或diB、di<      分别删除这些配对标点符号中的文本内容
yi’、yi”、yi(、yi[、yi{、yi<               分别复制这些配对标点符号中的文本内容
vi’、vi”、vi(、vi[、vi{、vi<               分别选中这些配对标点符号中的文本内容
```
## 删除全部

```
# 光标在第一行
V + G + d

# 光标在任一行
1,$d
```

## 快速删除

```bash
# 有时候我们需要删除括号或者引号内的内容
# 方法一：
定位到{},()等位置，按v然后按%选中删除

# 方法二:
vi + c          # c 为 " ' ( { [ 等字符
```

## 替换

```text
:[range]s/pattern/string/[c,e,g,i]

range  指的是范围，1,7 指从第一行至第七行，1,$ 指从第一行
       至最后一行，也就是整篇文章，也可以 % 代表。
pattern  就是要被替替换的字串，可以用 regexp 來表示。
string   pattern将由string所取代。
c  confirm，每次替换前询问。
e  不显示error。
g  globe，不询问，整行替換。
i  ignore 不分大小写。
```

## vim中大小写转化

```
# 整篇文章转换为小写
ggguG

gg=光标到文件第一个字符
gu=把选定范围全部小写
G=到文件结束

# 整篇文章转大写
gggUG

# 只转换某个单词
guw, gue
gUw, gUe

# 其他
gU0        ：从光标所在位置到行首，都变为大写
gU$        ：从光标所在位置到行尾，都变为大写
shift + `  ：光标所在字符大小写切换, 配合v可以进行选择转换
```

## 其他

```txt
:files 或 :buffers 或 :ls 列出目前buffer中的所有文档

:e filename 进入vim后，在不离开vim的情形下再打开其他文档

:e# 或 Ctrl + ^, 编辑前一个文档， 用于两文档相互编辑时相当好用

:sh 退回终端命令界面，可以执行命令， exit回到vim界面

K, 大写的K, 会打开光标所在单词的manpage

: r !command 在光标下一行插入command的输出, 报错时会插入错误信息
```
