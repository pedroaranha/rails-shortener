class Link < ActiveRecord::Base
  before_create :create_unique_identifier, :verify_http_protocol

  validates :long_url, :http_status, :hits, :presence => true

  def create_unique_identifier
  	if self.short_url.blank?
  	  begin
        self.short_url = SecureRandom.hex(3).to_s
  	  end while self.class.exists?(:short_url => short_url)
  	end
  end

  def verify_http_protocol
  	original_url = self.long_url
  	unless original_url[0..6] == "http://" || original_url[0..7] == "https://"
  	  self.long_url = "http://" + original_url
  	end
  end
end
