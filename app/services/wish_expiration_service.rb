class WishExpirationService
  def call
    Wish.where(status: 'pending', created_at: 1.year.ago.beginning_of_year..(1.year.ago.end_of_year)).find_each do |wish|
      wish.status = 'expired'
      wish.save
    end
  end
end
