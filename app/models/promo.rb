class Promo < ActiveRecord::Base
	belongs_to :bar
	enum date: [:Monday, :Tuesday, :Wednesday, :Thursday, :Friday, :Saturday, :Sunday]
end
