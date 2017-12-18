class User < ActiveRecord::Base
  # Definition des enum
  enum amount_bracket: ["moins de 50€", "moins de 100€", "moins de 200€",
              "moins de 500€", "500€ et plus" ]
  enum cause: ["Personnes en difficulté", "Santé", "Recherche", "Enfance",
              "Environnement", "Situations d'urgence", "Education", "Animaux",
              "Pays en développement", "Droits de l'homme", "Patrimoine-culture",
              "Ordres religieux", "Sport"]
  enum own_emotion: ["fierté", "bonheur", "plénitude", "joie"]
  enum other_emotion: ["admiration", "respect", "amour", "tendresse",
              "reconnaissance"]
  enum preferred_mean: ["gagner plus", "travailler plus", "dépenser moins",
              "payer moins cher"]
  enum age_bracket: ["18-25", "26-35", "36-45", "46-55", "56-65", "66 et plus"]
  enum main_mobility_mode: ["voiture", "moto", "scooter", "vélo", "fourgon",
              "camion", "transports en commun"]

  # Validations de format
  validates_format_of :po_code, :with => /\A[0-9]{5}\Z/, message: "Un code postal comporte 5 chiffres"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Veuillez saisir un email valide"
  validates_format_of :mob_number, :with => /\A0[6-7][0-9]{8}\Z/, message: "Veuillez saisir un numéro à 10 chiffres commençant par 06 ou 07"
  validates_format_of :first_name, :with => /[^0-9]/, message: "Aucun chiffre ne peut figurer dans un prénom"
  validates_format_of :last_name, :with => /[^0-9]/, message: "Aucun chiffre ne peut figurer dans un nom"

  # Validations de longueur
  validates :first_name, length: { minimum: 3, maximum: 20 }
  validates :last_name, length: { minimum: 2, maximum: 30 }
  validates :why_not_more, length: { maximum: 150 }
  validates :money_wish, length: { maximum: 150 }

  # Validations de présence et unicité
  validates :email, presence: true, uniqueness: true
  validates :mob_number, uniqueness: true

end
