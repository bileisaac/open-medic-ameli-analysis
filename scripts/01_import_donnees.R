###############################################################################
# Projet  : Analyse des données Open Medic AMELI
# Script  : 01_import_donnees.R
# Objet   : Importer les données brutes du projet
###############################################################################

rm(list = ls())

library(tidyverse)
library(readxl)
library(janitor)

# Chemins des fichiers bruts
path_open_medic <- "data/raw/OPEN_MEDIC_2025.csv"
path_descriptif <- "data/raw/descriptif.xls"

# Vérification de l'existence des fichiers
stopifnot(file.exists(path_open_medic))
stopifnot(file.exists(path_descriptif))

# Import du fichier principal
open_medic_2025 <- read_delim(
  file = path_open_medic,
  delim = ";",
  locale = locale(decimal_mark = ","),
  show_col_types = FALSE
)

# Import des dictionnaires
cip13 <- read_excel(path_descriptif, sheet = "CIP13")
top_gen <- read_excel(path_descriptif, sheet = "TOP_GEN")
gen_num <- read_excel(path_descriptif, sheet = "GEN_NUM")
age <- read_excel(path_descriptif, sheet = "AGE")
sexe <- read_excel(path_descriptif, sheet = "SEXE")
ben_reg <- read_excel(path_descriptif, sheet = "BEN_REG")
psp_spe <- read_excel(path_descriptif, sheet = "PSP_SPE")

# Vérification rapide
glimpse(open_medic_2025)