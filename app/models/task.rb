class Task < ApplicationRecord
    belongs_to :user
    belongs_to :project, optional: true
    has_many :comments, :dependent => :delete_all 

    validates :text, presence: true
end
