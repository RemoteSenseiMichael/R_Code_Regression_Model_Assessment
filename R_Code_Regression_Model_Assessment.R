# First Install the following packages if you have not already:
install.packages('metrica')
install.packages('stats')

# Once or if the packages are installed, then load them into R:
library(metrica)
library(stats)

# Set your working directory:
setwd('C:/Directory')

# Read in a CSV file containing your model predictions. The file should have headings:
Model_Results <- read.csv(file = 'C:/Directory/Predictions.csv', header = TRUE)

# View your data. In this example, there are 2 columns, 1 for the true depth value (ALT), and the second the modelled/predicted value:
print(Model_Results)

# Create a linear regression model (lm) between the measured (ALT) and modelled values, in order to determine R2:
R2 <- lm(Model_Results$ALT ~ Model_Results$Modelled)

# View the results. “Multiple R-squared” is the value you are looking for:
Summary(R2)

# Calculate mean absolute error (MAE), mean squared error (MSE), root mean squared error (RMSE), and relative absolute error (RAE):
mae(Model_Results$ALT, Model_Results$Modelled)
mse(Model_Results$ALT, Model_Results$Modelled)
rmse(Model_Results$ALT, Model_Results$Modelled)
rae(Model_Results$ALT, Model_Results$Modelled)
