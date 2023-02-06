class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    # acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :generate_token


    def is_admin?
    User.is_admin? self
  end

  def admin?
    User.is_admin? self
  end

  def self.is_admin? user
    if user.present?
      array = ["rockystorm@gmail.com", "farhanmshaikh1@gmail.com"]
      bool = false
      array.each do |a|
        if user.email.include? a
          return true
        else
        end
      end
      return bool
    else
      return false
    end
  end
  
  def generate_token
      token = rand(36**8).to_s(36)
      while User.where(code: token).present? == true
        token = rand(36**8).to_s(36)
      end
      self.update_attribute(:code, token)
  end


  def generate_temporary_authentication_token
    # self.authentication_token = Devise.friendly_token
    token = Devise.friendly_token
    tokens = (self.tokens || []).push(token)
    self.update(tokens: tokens)
    return token
  end

  def clear_temporary_authentication_token
    self.authentication_token = nil
    self.save
  end

end
