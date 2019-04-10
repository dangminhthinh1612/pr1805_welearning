class Cart < ApplicationRecord
  
  belongs_to :user, class_name: User.name
  belongs_to :course, class_name: Course.name
end
