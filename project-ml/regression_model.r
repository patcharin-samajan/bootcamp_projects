# build a regression model

install.packages("caret")
library(caret)

mtcars

# Spilt Data
train_test_split <- function(data) {
  set.seed(42)
  n <- nrow(data)
  id <- sample(n, size = 0.8*n)
  train_data <- mtcars[id, ]
  test_data <- mtcars[-id, ]
  return(list(train_data, test_data))
}

split_data <- train_test_split(mtcars)

# Train Model
lm_model <- train(mpg ~ hp, 
                  data = split_data[[1]],
                  method = "lm")


# Score and evaluate
p <- predict(lm_model, newdata = split_data[[2]])

error <- split_data[[2]]$mpg - p
rmse <- sqrt(mean(error**2))