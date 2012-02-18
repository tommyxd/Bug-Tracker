class Issue < ActiveRecord::Base
  attr_accessible :title, :content, :status, :priority

  belongs_to :project
  
  validates :title,      :presence  => true,
                         :length    => { :maximum => 50 }
  validates :content,    :presence  => true
  validates :status,     :presence  => true,
                         :inclusion => { :in => %w[new accepted fixed closed wont-fix invalid works-for-me] }
  validates :priority,   :presence  => true,
                         :inclusion => { :in => 1..5 }
  validates :project_id, :presence  => true
end
