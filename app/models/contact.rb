class Contact < ActiveRecord::Base
  belongs_to :user
  
  def full_name
    first_name + " " + last_name
  end

  def friendly_updated_time
    updated_at.strftime('%B %d, %Y')
  end

  def japanify
    "81" + " " + " #{phone_number}"
  
  end
end
