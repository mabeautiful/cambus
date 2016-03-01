class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    belongs_to :location
    has_many :photos
    has_attached_file :image, styles: { medium: "500x320#",croppable: '560x420', thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true

    def self.search(location, post_type, keyword)
	   where("CAST(location_id As Text) like ? and CAST(post_type As Text) like ? and title like ?",
             "%#{location}%", "%#{post_type}%", "%#{keyword}%") 
	end
end
