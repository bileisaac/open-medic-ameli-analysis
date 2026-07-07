###############################################################################
# Projet  : Analyse des données Open Medic AMELI
# Script  : 00_run_all.R
# Objet   : Exécuter tout le pipeline du projet
###############################################################################

rm(list = ls())

message("Début du pipeline Open Medic...")

source("scripts/01_import_donnees.R")
source("scripts/02_preparation_donnees.R")
source("scripts/03_controle_qualite_donnees.R")
source("scripts/04_nettoyage_donnees.R")
source("scripts/05_analyse_exploratoire.R")
source("scripts/06_feature_engineering.R")
source("scripts/07_visualisations.R")

rmarkdown::render(
  input = "scripts/08_article_metier.Rmd",
  output_file = "../docs/article_open_medic.html"
)

message("Pipeline terminé avec succès.")