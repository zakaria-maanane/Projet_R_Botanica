install.packages(c("tidyverse", "ggplot2", "dplyr", "tidyr", "corrplot", "GGally", "knitr"))

library(dplyr) # pour la manipulation de données ( regle le problème de %>% )

library(ggplot2) # pour la visualisation de données


"Etape 1 : Exploration et péréparation des données"
# charger le dataset iris
data(iris)
df <- iris

#Observations de la structure du dataset

str(df)
summary(df)
head(df)

# Afficher les 6 premières lignes du dataset
head(df)

# Afficher les 6 dernières lignes du dataset
tail(df)

# Afficher les noms des colonnes
colnames(df)

# Afficher les dimensions du dataset
dim(df)

#afficher les valeurs manquantes
sum(is.na(df))

"Etape 2 Statistique descriptive et correlation"

#calculer les statistique de base

df %>%
  group_by(Species) %>%
  summarise_all(list(mean = mean, median = median, sd = sd))

# Analyser les corrélations 

cor_matrix <- cor(df[, 1:4])
corrplot::corrplot(cor_matrix, method = "color", type = "upper")


"Etape 3 Visualisation et tendances"

# Histogrammes

cor_matrix <- cor(df[, 1:4])
corrplot::corrplot(cor_matrix, method = "color", type = "upper")

# Boxplots 

ggplot(df, aes(x = Species, y = Petal.Length)) + geom_boxplot()


# Scatter plots 

ggplot(df, aes(x = Petal.Length, y = Petal.Width, color = Species)) + geom_point()


"Fin"