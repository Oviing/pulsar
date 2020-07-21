#scaling the data for pca
pulsar_scale <- scale(pulsar2, center = TRUE)

s#compute principal components
pca <- prcomp(pulsar_scale)

#Changing result into a data frame
pca_matrix <- as.data.frame(pca[["x"]])

pca_matrix_subset <- pca_matrix[index, ]


#compute the variance
pca.var <- pca$sdev^2
#propotion what the variance explains
pve <- pca.var / sum(pca.var)
pve
sum(pve[1:3])

#plot pca
pca_plot <- plot_ly(data = pca_matrix, x= ~PC1, y = ~PC2)

pca_plot <- pca_plot %>% layout(xaxis = list(title = 'Principal Component 1'),
                                    yaxis = list(title = 'Principal Component 2'))
pca_plot

#plot pca subset
labels_subset <- pulsar[index, 9]
pca_plot_subset <- plot_ly(data = pca_matrix_subset, x= ~PC1, y = ~PC2)
pca_plot_subset <- pca_plot_subset %>% layout(xaxis = list(title = 'Principal Component 1'),
                                    yaxis = list(title = 'Principal Component 2'))
pca_plot_subset


#color pca full
labels <- pulsar[, 9]
pca_plot_c <- plot_ly(data = pca_matrix, x= ~PC1, y = ~PC2
                      ,color = labels, colors = pulsar_color)
pca_plot_c <- pca_plot_c %>% layout(xaxis = list(title = 'Principal Component 1'),
                                yaxis = list(title = 'Principal Component 2'))
pca_plot_c

#colorized subset of pca
labels_subset <- pulsar[index, 9]
pca_plot_subset_c <- plot_ly(data = pca_matrix_subset, x= ~PC1, y = ~PC2, color = labels_subset, colors = pulsar_color)
pca_plot_subset_c <- pca_plot_subset_c %>% layout(xaxis = list(title = 'Principal Component 1'),
                                              yaxis = list(title = 'Principal Component 2'))
pca_plot_subset_c

#colorized 3d subset
pca_plot_3d <- plot_ly(data = pca_matrix_subset, x= ~PC1, y = ~PC2,
                       z = ~PC3,
                       size = 0.3, color = labels_subset, colors = pulsar_color)

pca_plot_3d

