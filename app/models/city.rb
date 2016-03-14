class City < ActiveRecord::Base
	has_many :areas
	belongs_to :location
end