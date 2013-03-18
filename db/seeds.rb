# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


House.delete_all
Product.delete_all
Design.delete_all
Brand.delete_all

design = Design.create!({ name: 'Initial design', 
                          vertical_tubes: 3,
                          horizontal_tubes: 3 })

brand_1 = Brand.create!({ name: 'Bee Guardian Foundation', logo: 'bgf.png', tag: "BG" })
brand_2 = Brand.create!({ name: 'Bristol Zoo', logo: 'bz.png', tag: "BZ"  })

Product.create!({name: 'Model 1', brand: brand_1, design: design, range_start: 1000, range_end: 1999})
Product.create!({name: 'Beta', brand: brand_2, design: design, range_start: 2000, range_end: 2999})

