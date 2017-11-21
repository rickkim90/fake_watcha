require 'httparty'
require 'rest-client'
require 'json'
require 'awesome_print'
require 'csv'

headers = {
  cookie: "__uvt=; fbm_126765124079533=base_domain=.watcha.net; _s_guit=aacdc1416192a0dea193c8364aa6595a332f0bab348f3e6ae8e1725cd584; _ga=GA1.2.1140386975.1510902244; _gid=GA1.2.1293021724.1511237841; uvts=6m3wC8FXmE3CRFqf; fbsr_126765124079533=xxVwii0pZbqdSP5dk4iZAxl1I8B2P7F7hFfO9Ztym8s.eyJhbGdvcml0aG0iOiJITUFDLVNIQTI1NiIsImNvZGUiOiJBUUNWSVJxNmZNLTkwcjFfa2Z1UG1qZmlPNHJMa3h0NHJuWHlzSi1XZnNvWGVIVlItWGE0U3ViTFpaZGpJUkZNT055X3BybEd2S2RsV3l0UVVXMlNDNGdkMEt1OFJUYkFCTFRPOG5qR2JzMWdrQnNoUzJyeHl1LXR4ZTBtNklKZVhjT29iZUtGWERJdFhxUUFKMzAxLWMzOXN6Q05Xdk11U2FVMGVYVXktWjVFQTR1N1NZY2g4SkV3aTctWTlQMkVzbElMZ3JaWE1pVC1zNVNOMnFkV0VrVWNfaDFDQXFiZ24xNHJSa2FLdEFvWGxiVGRmY29HNktNSW1HV3k4Xzd1UGtfU1JuSW9nWnA3d3J1cVVuYzJHcEdqRno4d1BIeUw3eVI2ZGFIX0QxbHdzRy1LVVkwUlRqQ05Yb09ZLV9YY0UzYUNla2xkUDhlWUpPeS11cGYwRDJnUyIsImlzc3VlZF9hdCI6MTUxMTIzNzg1OSwidXNlcl9pZCI6IjEwMTU0ODIzNTc0MDk1ODcwIn0; _guinness_session=SFowUndCUDdVck9rZUFtRkhORXg4UEpxNjgydUphQytkblRUTFJlK2RjUGVhR0xINUN4RU52dHB6Nm1zamdSQ1gwOHptZFhoL0RmaURDNHJta1BwRjR3NzNpb3ZjWm8rVnlLS2NzYkdiT1dZekpHdGF4U01QS0dKaHJjNXM3Q1BUNlFMV0hQeVpwU0Q4WTh0bGRmeEc1RTdDZzBZNmgzZTFiYmJ2NGZENDNnN09DZjZvSmYyVm0wYzNuNm9EMFRTLS1iakRVMTg4emZkMER5N2Z0YTdmTjJRPT0%3D--10816b17f127149099d0e7219c50a11c01d47d61"
}
res = HTTParty.get(
  "https://watcha.net/boxoffice.json",
  :headers => headers
 )
watcha = JSON.parse(res.body)
list = watcha["cards"]
list.each do |item|
  movie = item["items"].first["item"]
  title = movie["title"]
  image = movie["poster"]["large"]
  desc = movie["interesting_comment"]["text"] if movie["interesting_comment"]
  CSV.open("movie_list.csv", "a+") do |csv|
    csv << [title, image, desc]
  end
end

# title = watcha["cards"].first["items"].first["item"]["title"]
# image = watcha["cards"].first["items"].first["item"]["poster"]["large"]
# desc = watcha["cards"].first["items"].first["item"]["interesting_comment"]["text"]



# movie = watcha["cards"][0]["items"][0]["item"]
# comment = movie["interesting_comment"]["text"]
# ap comment
# ap watcha["cards"][9]["items"][0]["item"]["poster"]["original"]
# ap watcha["cards"][9]["items"][0]["item"]["description"]["text"]
