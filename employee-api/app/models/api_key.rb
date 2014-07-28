class ApiKey < ActiveRecord::Base
  belongs_to :user

  before_create :generate_access_token
  
  private
  
  def generate_access_token
    begin
      self.access_token = SecureRandom.urlsafe_base64(32)
    end while self.class.exists?(access_token: access_token)
  end

end
