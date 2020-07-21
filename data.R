#loading the data
pulsar <- read.csv('/Users/joel/Desktop/Pulsar/data/HTRU_2.csv', header = FALSE, 
                   col.names = c('Mean of the integrated profile',
                                 'Standard deviation of the integrated profile',
                                 'Excess kurtosis of the integrated profile',
                                 'Skewness of the integrated profile',
                                 'Mean of the DM-SNR curve',
                                 'Standard deviation of the DM-SNR curve',
                                 'Excess kurtosis of the DM-SNR curve',
                                 'Skewness of the DM-SNR curve',
                                 'Class'))
#Create a data set that contains all values except of the class for unsupervised learning
pulsar2 <- pulsar[,1:8]

# using just a subset
set.seed(42)
index <- sample(c(1:nrow(pulsar)), 1000)
pulsar_subset <- pulsar[index,]

#variable dependence
ggpairs(pulsar, columnLabels = c(1,2,3,4,5,6,7,8, 9), aes(colour = as.factor(Class)))

#creating color vector
pulsar_color <- c("red", "navyblue")
pulsar_color <- setNames(pulsar_color, c(0, 1))

