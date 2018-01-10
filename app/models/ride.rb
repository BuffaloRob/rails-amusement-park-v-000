class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    # binding.pry
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      new_ticket_count = user.tickets - attraction.tickets
      new_nausea = user.nausea + attraction.nausea_rating
      new_happiness = user.happiness + attraction.happiness_rating
      user.update(:tickets => new_ticket_count, :nausea => new_nausea, :happiness => new_happiness)
      "Thanks for riding the #{attraction.name}!"
    end 
  end

end
