class Post < ApplicationRecord

	validates_presence_of :date , :rationale , :adjustment , :Department 

end
