class Project < ActiveRecord::Base
  attr_accessible :title

  validates :title, :presence   => true,
                    :length     => { :maximum => 50 },
                    :uniqueness => { :case_sensitive => false }
end
