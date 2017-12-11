# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Project.create(
  title: 'WatchFlix',
  image: 'watchflix.png',
  short_desc: 'A website that allowers users to browse movies and create personalized watch lists',
  long_desc: 'This was a team project that that was created using HTML, CSS, SQL, Javascript, Bootstrap, and PHP. Our team populated our database using the IMDb API.', 
  project_link: 'https://watchflix.000webhostapp.com/index.php'
  )
