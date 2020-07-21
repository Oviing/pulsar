# k means on the full data set
kmean <- kmeans(pca_matrix[,1:2], centers = 2, iter.max = 100, nstart = 25)

#change result from 2 to 1 and from 1 to 0
cluster_2 <- kmean$cluster
cluster_2[cluster_2 == 1] <- 0
cluster_2[cluster_2 == 2] <- 1

#plot the kmeans result
kmean_plot <- plot_ly(data = pca_matrix, x= ~PC1, y = ~PC2, color = cluster_2, colors = pulsar_color)
kmean_plot <- kmean_plot %>% layout(xaxis = list(title = 'Principal Component 1'),
                                yaxis = list(title = 'Principal Component 2'))
kmean_plot

#plot the subset
cluster2_subset <-cluster_2[index]
kmean_subset_plot <- plot_ly(data = pca_matrix_subset, x= ~PC1, y = ~PC2, color = cluster2_subset, colors = pulsar_color)
kmean_subset_plot <- kmean_subset_plot %>% layout(xaxis = list(title = 'Principal Component 1'),
                                    yaxis = list(title = 'Principal Component 2'))


kmean_subset_plot

#plot with edges

fviz_cluster(kmean, data = pca_matrix[,1:2], geom = 'point', repel = TRUE)

# check points which are wrong clustered
check_wrong <- function(q, p){
  for(i in 1:length(q)){
    if(q[i] != p[i]){
      q[i] <- 2
    } 
  }
  return(q)
}
cluster_wrong_list <- cluster2_subset
wrong <- check_wrong(cluster_wrong_list, pulsar_subset$Class)
colors2 <- c("red", "navyblue", "green")
colors2 <- setNames(colors2, c(0, 1, 2))

kmean_subset_plot_2 <- plot_ly(data = pca_matrix_subset, x= ~PC1, y = ~PC2, 
                               color = wrong, colors = colors2)
kmean_subset_plot_2 <- kmean_subset_plot_2 %>% layout(xaxis = list(title = 'Principal Component 1'),
                                                  yaxis = list(title = 'Principal Component 2'))


kmean_subset_plot_2
###########
#k means in 3d
kmean3 <- kmeans(pca_matrix[,1:3], centers = 2, iter.max = 100, nstart = 25)
#check where it is wrong clustered
cluster_3d <- kmean3$cluster
cluster_3d[cluster_3d == 1] <- 0
cluster_3d[cluster_3d == 2] <- 1
cluster_3d <- cluster_3d[index]
cluster_wrong_3d <- cluster_3d
wrong_3d <- check_wrong(cluster_wrong_3d, pulsar_subset$Class)
#plot 3d
kmean_subset_plot_3D <- plot_ly(data = pca_matrix_subset, x= ~PC1, y = ~PC2, z = ~PC3,
                                size = 0.3,
                               color = wrong_3d, colors = colors2)
kmean_subset_plot_3D <- kmean_subset_plot_3D %>% layout(xaxis = list(title = 'Principal Component 1'),
                                                      yaxis = list(title = 'Principal Component 2'),
                                                      zaxis = list(title = 'Principal Component 3'))


kmean_subset_plot_3D


#################
#Compare
kmean[["size"]]
kmean3[["size"]]

