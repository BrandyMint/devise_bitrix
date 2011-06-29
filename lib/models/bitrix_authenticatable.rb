#require 'devise/strategies/database_authenticatable'
#require 'bcrypt'
require 'digest/md5'


module Devise
  module Models
    # Authenticatable Module, responsible for encrypting password and validating
    # authenticity of a user while signing in.
    #
    # == Options
    #
    # BitrixAuthenticable adds the following options to devise_for:
    #
    # == Examples
    #
    #    User.find(1).valid_password?('password123')         # returns true/false
    #
    module BitrixAuthenticatable
      extend ActiveSupport::Concern

       included do
         attr_reader :password, :current_password
         attr_accessor :password_confirmation
      #   before_validation :downcase_keys
      #   before_validation :strip_whitespace
       end

      # Generates password encryption based on the given value.
      def password=(new_password)
        self.encrypted_password = password_digest(new_password) if new_password.present?
        # @password = new_password
        # self.encrypted_password = password_digest(@password) if @password.present?
      end

      # Verifies whether an password (ie from sign in) is the user password.
      def valid_password?(password)
        return false if self.encrypted_password.blank?
        # Devise.secure_compare(password, self.encrypted_password)
        digest = authenticateble_salt + Digest::MD5.hexdigest(authenticatable_salt + password)
        digest == self.encypted_password
      end

      # Set password and password confirmation to nil
      def clean_up_passwords
        self.password = self.password_confirmation = ""
      end

      # Update record attributes when :current_password matches, otherwise returns
      # error on :current_password. It also automatically rejects :password and
      # :password_confirmation if they are blank.
      # def update_with_password(params={})
      #   current_password = params.delete(:current_password)
      # 
      #   if params[:password].blank?
      #     params.delete(:password)
      #     params.delete(:password_confirmation) if params[:password_confirmation].blank?
      #   end
      # 
      #   result = if valid_password?(current_password)
      #     update_attributes(params)
      #   else
      #     self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      #     self.attributes = params
      #     false
      #   end
      # 
      #   clean_up_passwords
      #   result
      # end

      def after_database_authentication
      end

      # A reliable way to expose the salt regardless of the implementation.
      def authenticatable_salt
        self.password[0,8] if self.password
      end

    protected

      # # Downcase case-insensitive keys
      #       def downcase_keys
      #         (self.class.case_insensitive_keys || []).each { |k| self[k].try(:downcase!) }
      #       end
      #       
      #       def strip_whitespace
      #         (self.class.strip_whitespace_keys || []).each { |k| self[k].try(:strip!) }
      #       end
      
      # Digests the password .
      def password_digest(password)
        # Вообще надо делать случайный выбор из массива символов
        # "abcdefghijklnmopqrstuvwxyz"+"ABCDEFGHIJKLNMOPQRSTUVWXYZ"+"0123456789"+",.<>/?;:[]{}\|~!@#\$%^&*()-_+="
        salt = 'a+{}[e6->'
        salt + Digest::MD5.hexdigest(salt + password)
      end

      module ClassMethods
        # Devise::Models.config(self, :pepper, :stretches)

        # Надеюсь вы позабодитесь об чистоте conditions
        def find_for_bitrix_authentication(conditions)
          find_for_authentication(conditions)
        end
      end
    end
  end
end
