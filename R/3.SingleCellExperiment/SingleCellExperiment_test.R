# 2 Creating SingleCellExperiment instances
# SingleCellExperiment 对象可以通过同名的构造函数创建。例如，如果我们有一个计数矩阵 counts，我们可以简单地调用：
library(SingleCellExperiment)
counts <- matrix(rpois(100, lambda = 10), ncol=10, nrow=10)
sce <- SingleCellExperiment(counts)
sce
# 在实践中，通过传入命名列表来命名检测通常更有用：
sce <- SingleCellExperiment(list(counts=counts))
sce
# 通过将值传递给适当的参数来设置列和行元数据同样容易。
# 我们不会在这里详细介绍，因为 SummarizedExperiment 文档中涵盖了大部分内容，但举个例子：
pretend.cell.labels <- sample(letters, ncol(counts), replace=TRUE)
pretend.gene.lengths <- sample(10000, nrow(counts))

sce <- SingleCellExperiment(list(counts=counts),
                            colData=DataFrame(label=pretend.cell.labels),
                            rowData=DataFrame(length=pretend.gene.lengths),
                            metadata=list(study="GSE111111")
)
sce



