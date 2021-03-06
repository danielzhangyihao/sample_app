class Product < ActiveRecord::Base
	include AlgoliaSearch

    algoliasearch synchronous: true do
    	attribute :name,:description,:price,:brand,:primary,:secondary,:size,:color
    end


	has_many :assets,  dependent: :destroy, autosave: true                                                                                                                                      
    accepts_nested_attributes_for :assets, :allow_destroy =>true,reject_if: :all_blank

	validates :name,  presence: true
	validates :price,  presence: true, :numericality => true
	validates :description,  presence: true


	validates :buy_url, presence: true
	validates :brand, presence: true


	



end
