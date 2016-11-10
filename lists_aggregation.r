set.seed(1)
df = read.csv("lists_for_aggregation.csv")
lists = as.matrix(df)
library(RankAggreg)
args = commandArgs(trailingOnly=TRUE)
if (length(args) == 0) {
  stop("At least one argument must be supplied (number of genes in aggregation).", call.=FALSE)
}
toplist <- RankAggreg(lists, as.numeric(args[1]), method = "CE", verbose = TRUE)
result_list = data.frame(Genes = toplist$top.list)
write.csv(file = "selected_genes_list.csv",result_list, quote = FALSE, row.names  = FALSE)
