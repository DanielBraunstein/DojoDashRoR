class Dojo < ActiveRecord::Base
    validates :name, :street, :state, :city, presence:true
    has_many :students
end
