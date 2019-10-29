# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('artworks')
ApplicationRecord.connection.reset_pk_sequence!('artwork_shares')

ActiveRecord::Base.transaction do
  u1 = User.create!(username: 'jay')
  u2 = User.create!(username: 'cam')
  u3 = User.create!(username: 'mom')

  a1 = Artwork.create!(title: 'favorite', artist_id: 1, image_url: 'test')
  a2 = Artwork.create!(title: 'restaurant', artist_id: 3, image_url: 'test')
  a3 = Artwork.create!(title: 'sport', artist_id: 3, image_url: 'test')
  a4 = Artwork.create!(title: 'book', artist_id: 2, image_url: 'test')
  a5 = Artwork.create!(title: 'book', artist_id: 3, image_url: 'test')

  s1 = ArtworkShare.create!(artwork_id: 1, viewer_id: 2)
  s2 = ArtworkShare.create!(artwork_id: 1, viewer_id: 3)
  s3 = ArtworkShare.create!(artwork_id: 2, viewer_id: 2)
  s4 = ArtworkShare.create!(artwork_id: 3, viewer_id: 2)
  #s5 = ArtworkShare.create!(artwork_id: 1, viewer_id: 2)
  #s6 = ArtworkShare.create!(artwork_id: 1, viewer_id: 2)

  c1 = Comment.create!(artwork_id: 1, user_id: 2, body: "awesome!")
  c2 = Comment.create!(artwork_id: 1, user_id: 3, body: "best!")
  c3 = Comment.create!(artwork_id: 2, user_id: 1, body: "wow!")

end