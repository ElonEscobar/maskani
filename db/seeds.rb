Classifieds.destroy_all

100.times do |index|
    Classifieds.create!(first_name: "first_name #{index}",
                   last_name: "last_name #{index}",
                     email: "email #{index}",
                   contact: "contact #{index}",
                 location: "location #{index}",
                 occupation:  "occupation #{index}",
                description: "description #{index}",
                 user_id: "user_id #{index}",
                  is_verified: "is_verified #{index}",)
  end
  
  p "Created #{Classified.count} classifieds"


  Auctions.destroy_all

100.times do |index|
    Auctions.create!(name: "name #{index}",
                    description: "description #{index}",
                     price: "price #{index}",
                   valid: "valid #{index}",
                  end_date: "end_date #{index}",
                 user_id:  "user_id #{index}",
                is_verified: "is_verified #{index}",)
  end
  
  p "Created #{Auction.count} auctions"

  Items.destroy_all

  100.times do |index|
      Items.create!(name: "name #{index}",
                      description: "description #{index}",
                       price: "price #{index}",
                     category: "category #{index}",
                   user_id:  "user_id #{index}",
                  is_verified: "is_verified #{index}",)
    end
    
    p "Created #{Item.count} items"

    Properties.destroy_all

    100.times do |index|
        Properties.create!(name: "name #{index}",
                        description: "description #{index}",
                         price: "price #{index}",
                       location: "location #{index}",
                      amenities: "amenities #{index}",
                      onsale: "onsale #{index}",
                     user_id:  "user_id #{index}",
                    is_verified: "is_verified #{index}",)
      end
      
      p "Created #{Property.count} properties"



      Users.destroy_all

100.times do |index|
    Users.create!(first_name: "first_name #{index}",
                   last_name: "last_name #{index}",
                     email: "email #{index}",
                   contact: "contact #{index}",
                 location: "location #{index}",
                 category:  "category #{index}",
              password_digest: "password #{index}",)
  end
  
  p "Created #{User.count} users"
end

