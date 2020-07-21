# calculating the distance
distance <- dist(pca_matrix[,1:2])
#set method to average
hCluster <- hclust(dist(pulsar_scale), method = 'average')

#four groups
plot(hCluster, hang = -1)
rect.hclust(hCluster, k = 4, border = 2:5)
sub_grp_4 <- cutree(hCluster, k = 4)
fviz_cluster(list(data = pulsar_scale, cluster = sub_grp_4), geom = 'point', repel = TRUE, show.clust.cent = TRUE)

#Two groups
plot(hCluster, hang = -1)
rect.hclust(hCluster, k = 2, border = 2:3)
sub_grp_2 <- cutree(hCluster, k = 2)
fviz_cluster(list(data = pulsar_scale, cluster = sub_grp_2), geom = 'point', repel = TRUE, show.clust.cent = TRUE)
