module BandnamesHelper
    def current_user_vote
        v = @bandname.find_votes_for({ voter_id: current_user.id })
        v.size > 0? v.first.vote_weight: 0
    end

    def current_user_blanks
        5 - current_user_vote
    end
end
