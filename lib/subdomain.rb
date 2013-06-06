class Subdomain
  def self.matches?(request)
    #request.subdomain.present? && request.subdomain != "www"
    case request.subdomain
    when 'www', '', nil
    	false
    # when 'www', '', nil
    # 	request.subdomain = "gal"
    # 	true
    else
    	true
    end
  end
end