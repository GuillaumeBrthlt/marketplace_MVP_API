class Property < ApplicationRecord
  belongs_to :user
  has_one_attached :picture, dependent: :destroy
  
  def picture_url
    Rails.application.routes.url_helpers.url_for(picture) if picture.attached?
  end
end
