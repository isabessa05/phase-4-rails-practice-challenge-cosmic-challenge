class Mission < ApplicationRecord
    belongs_to :planet
    belongs_to :scientist 

    validates :name, presence: true, uniqueness: {scope: :scientist_id}
    validates :scientist_id, presence: true
    validates :planet_id, presence: true
end
