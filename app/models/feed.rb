class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates :image_or_content, presence: true

  private
  def image_or_content
    image.presence or content.presence
  end
end
