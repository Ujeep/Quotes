class Quote < ActiveRecord::Base
    validates :content, presence: true,length:{maximum:140}
 belongs_to :user
end
