Classified.destroy_all
User.destroy_all

Auction.destroy_all

Item.destroy_all

Property.destroy_all


User.create!(first_name: "kirui",
  last_name: "kirui",
    email: "kiffifi@gmail.com",
  contact: 98765432,
location: "kilifi",
category:  "kind",
password: "121212",
password_confirmation: "121212",)

User.create!(first_name: "kibiko",
last_name: "kibikoh",
 email: "kibiko@gmail.com",
contact: 272727290,
location: "kisumu",
category:  "election",
password: "202020",
password_confirmation: "202020",)

User.create!(first_name: "kinara",
last_name: "kinarar",
email: "kinara@gmail.com",
contact: 723890789,
location: "nakuru",
category:  "plumbing",
password: "123456",
password_confirmation: "123456",)


p "Created #{User.count} users"



    Classified.create!(first_name: "kinutia",
                   last_name: "kinuthiad",
                     email: "kinuthia@gmail.com",
                   contact: 720458902 ,
                 location: "kiambu",
                 occupation:  "technician",
                description: "mchapa kazi",
                 user_id: 1,
                 image_data:'https://images.pexels.com/photos/834892/pexels-photo-834892.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')

  Classified.create!(first_name: "piploma",
                    last_name: "kipling",
                      email: "kiplagat@gmail.com",
                    contact: 72020202 ,
                  location: "thika",
                  occupation:  "electricisan",
                 description: "mchapa kazi",
                  user_id: 2,
                  image_data:'https://images.pexels.com/photos/834892/pexels-photo-834892.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1') 

 Classified.create!(first_name: "shayanan",
                    last_name: "shayani",
                      email: "shayanaia.com",
                    contact:  733445660 ,
                  location: "mlomlongo",
                  occupation:  "broker",
                 description: "mcsahara",
                  user_id: 2,
                  image_data:'https://images.pexels.com/photos/834892/pexels-photo-834892.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')

  
  p "Created #{Classified.count} classifieds"


 Auction.create!(name: "pp1",
                    description: "p for sale",
                     price: 20000,
                     is_valid: true,
                  end_date: "12/07/24",
                 user_id:  1)

Auction.create!(name: "pp2",
                    description: "for rent",
                     price: 50000,
                     is_valid: true,
                  end_date: "12/09/22",
                 user_id:  3)

Auction.create!(name: "pp3",
                    description: "for lease",
                     price: 25000,
                     is_valid: false,
                  end_date: "12/45/56",
                 user_id:  2)
  
  p "Created #{Auction.count} auctions"

 Item.create!(name: "kijiko",
                      description: "kijiko for sale",
                       price: 30000,
                     category: "vijikos",
                   user_id:  1,)

 Item.create!(name: "sufuria",
                    description: "sufuria for rent",
                     price: 70000,
                   category: "sufurias",
                 user_id:  3)

 Item.create!(name: "kikombe",
                    description: "for rent",
                     price: 20000,
                   category: "vikoos",
                 user_id:  2)
    
    p "Created #{Item.count} items"

 Property.create!(name: "p3",
                        description: "p3 for sale",
                         price: 30000,
                       location: "adams",
                      amenities: "water",
                      home_type: 'For Sale',
                     user_id:  1,
                     image_data: 'https://images.pexels.com/photos/209296/pexels-photo-209296.jpeg?auto=compress&cs=tinysrgb&w=300')

  Property.create!(name: "pp4",
                        description: "froe rent",
                         price: 80000,
                       location: "kileleswa",
                      amenities: "stima",
                      home_type: 'For Rent',
                     user_id:  2,
                     image_data: 'https://images.pexels.com/photos/209296/pexels-photo-209296.jpeg?auto=compress&cs=tinysrgb&w=300')

Property.create!(name: "pp3",
                        description: "for example",
                         price: 90000,
                       location: "lamu",
                      amenities: "celling",
                      home_type: 'For Sale',
                     user_id:  3,
                     image_data: 'https://images.pexels.com/photos/209296/pexels-photo-209296.jpeg?auto=compress&cs=tinysrgb&w=300')
      
      
      p "Created #{Property.count} properties"



