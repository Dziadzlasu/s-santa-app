class LotteryService
  def call
    User.where(registration_status: 'approved').find_each do |user|
      next if user.recipient.present?

      candidates = User.where(registration_status: 'approved').reject { |c| c.giver.present?}
      candidate = candidates.sample
      while candidate.id == user.id
        candidate = candidates.sample
      end
      Pairing.create(giver: user, recipient: candidate)
    end
  end
end
