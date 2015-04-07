require 'mongoid'
require 'devise/orm/mongoid'

require_relative 'hotkey'

class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name,
    :password, :password_confirmation, :first_name, :last_name, :country, :age,
    :ethnicity, :highest_level_of_qualification, :poker_experience

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  field :invitation_token, type: String
  field :invitation_created_at, type: Time
  field :invitation_sent_at, type: Time
  field :invitation_accepted_at, type: Time
  field :invitation_limit, type: Integer

  field :admin, type: Boolean

  field :first_name, type: String
  field :last_name, type: String
  field :country, type: String
  field :age, type: Integer
  field :ethnicity, type: String
  field :highest_level_of_qualification, type: String
  field :poker_experience, type: String

  index( {invitation_token: 1}, {:background => true} )
  index( {invitation_by_id: 1}, {:background => true} )

  embeds_many :hotkeys, class_name: "Hotkey"

  DEFAULT_NAME = 'Guest'

  def self.include_name
    field :name
    validates_presence_of :name
    validates_format_of :name, without: /^\s*$/
    validates_uniqueness_of :name
  end

  include_name

  def reset_hotkeys!
    hotkeys.delete_all
    Hotkey::DEFAULT_HOTKEYS.each do |action, key|
      hotkeys.create! action: action, key: key
    end
    save!

    self
  end
end
