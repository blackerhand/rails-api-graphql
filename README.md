# version

- ruby: 2.6.3
- rails: 6.0.3
- graphql: 1.11.4

# 说明

使用官方的脚手架能很快引入 graphql, 但是写着写着就发现, 各种 type/input/mutation 很快占满你的目录.
为了能让代码更加有条理, 所以写了这个项目. 也许不是最佳组织代码的形式, 希望比默认生成的会好一点, 做了负优化就罪过了. 
ps: 请注意 graphql 的版本, 不保证能兼容其他版本

# 优化点

- 抽离 mutation/query/inputs/types(models)
- 改用目录分层的方式, 组织以上内容
- i18n 优化
- 加入 policy
