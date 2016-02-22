class Post < ActiveRecord::Base
    belongs_to :user
    has_many :photos
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
end
