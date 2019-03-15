class Bandname < ApplicationRecord
    acts_as_votable
    belongs_to :user
    validates :user_id, presence: true
    validates :name, presence: true, length: { maximum: 50 },
        uniqueness: { case_sensitive: false }

    def rating
        find_votes_for().average(:vote_weight)
    end

    def blank_stars
        5 - rating.to_i
    end
end
