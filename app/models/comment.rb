class Comment < ApplicationRecord
belongs_to :Job
validates_presence_of :content



end
