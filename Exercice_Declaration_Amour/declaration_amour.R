# Exercice : Déclaration d'amour à R
# Traduction du code Python vers R

# Générer un nombre aléatoire entre 0 et 1 (équivalent à randrange(0, 2) en Python)
answer <- sample(0:1, 1)

# Poser la question
cat("Est-ce que tu aimes R ?\n")

# Répondre selon le nombre aléatoire
if (answer == 0) {
  cat("R réfléchit...\n")
  Sys.sleep(1.5)
  cat("Tu aimes R :)\n")
} else {
  cat("R réfléchit...\n")
  Sys.sleep(1.5)
  cat("Tu n'aimes pas R :(\n")
}