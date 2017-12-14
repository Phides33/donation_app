class User < ActiveRecord::Base
  # Definition des enum
  enum amount_bracket: [:moins_de_20, :moins_de_50, :moins_de_100, :moins_de_200, :moins_de_500, :_500_et_plus ]
  enum cause: []
  enum own_emotion: [:fierté, :bonheur, :plénitude, :joie]
  enum other_emotion: [:admiration, :respect, :amour, :tendresse, :reconnaissance]
  enum preferred_mean: [:gagner_plus, :travailler_plus, :dépenser_moins, :payer_moins]
  enum age_bracket: ["18-25", "26-35", "36-45", "46-55", "56-65", "66 et plus"]
  enum main_mobility_mode: [:voiture, :moto, :scooter, :vélo, :fourgon, :camion, :transports_en_commun]

  # Validations de format
  validates_format_of :po_code, :with => /\A[0-9]{5}\Z/
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :mob_number, :with => /\A0[6-7][0-9]{8}\Z/
  validates_format_of :first_name, :with => /[^0-9]/
  validates_format_of :last_name, :with => /[^0-9]/

  # Validations de longueur
  validates :first_name, length: { minimum: 3, maximum: 20 }
  validates :last_name, length: { minimum: 2, maximum: 30 }
  validates :why_not_more, length: { maximum: 150 }
  validates :money_wish, length: { maximum: 150 }

end
