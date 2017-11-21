# 4차산업혁명 선도인재 양성 프로젝트 과정

---
## 1. Week 1 Day 12:  

***



### watcha 평점 board



C:\Users\student\project\real_board\app\views\layouts\application.html.erb

웹사이트 타이틀 변경



rails g scaffold movies title desc:text

rails g migration add_user_id_to_tweets user_id:integer



```ruby
<p id="notice"><%= notice %></p>

<h1>Listing Movies</h1>

<table>
  <thead>
    <tr>
      <th>Photo</th>
      <th>Title</th>
      <th>Desc</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @movies.each do |movie| %>
      <tr>
        <td><%= image_tag movie.photo_url, size: "100x100" %></td>
        <td><%= movie.title %></td>
        <td><%= movie.desc %></td>
        <td><%= link_to 'Show', movie %></td>
        <td><%= link_to 'Edit', edit_movie_path(movie) %></td>
        <td><%= link_to 'Destroy', movie, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<br>

<%= link_to 'New Movie', new_movie_path %>

```



show.erb

```ruby
<p id="notice"><%= notice %></p>

<p>
  <strong>image:</strong>
  <%= image_tag @movie.photo_url %>
</p>

<p>
  <strong>Title:</strong>
  <%= @movie.title %>
</p>

<p>
  <strong>Desc:</strong>
  <%= @movie.desc %>
</p>

<%= link_to 'Edit', edit_movie_path(@movie) %> |
<%= link_to 'Back', movies_path %>

```





##### 로그인 및 한글로 변경 가능

gem 'devise-i18n' 추가

Rails 국제화 API





##### 각각 다른 환경 설정 가능

C:\Users\student\project\real_board\config\environments\development.rb

C:\Users\student\project\real_board\config\environments\production.rb

C:\Users\student\project\real_board\config\environments\test.rb

개발 실제 배포 환경



C:\Users\student\project\real_board\config\initializers

앱이 처음 켜졌을때 모두 load이고 수정하면 꼭 서버를 껐다 켜야한다



C:\Users\student\project\real_board\config\locales

우리가 주로 보는곳



.yml = yaml => xml을 쉽게 쓸 수 있는 문서



C:\Users\student\project\real_board\config\application.rb

여기있는 모든 파일들이 상속받고 가장 priority에 있는 파일, 모두 적용



2개 comment-out

```ruby
config.time_zone = 'Central Time (US & Canada)'
변경
config.time_zone = 'Seoul'

config.i18n.default_locale = :de
변경
config.i18n.default_locale = :ko
```

수정 후

1. rails g devise:i18n:locale ko => C:\Users\student\project\real_board\config\locales\devise.views.ko.yml 생성
2. rails g devise:i18n:views => C:\Users\student\project\real_board\app\views\devise 생성

ctrl shift p 로 환영합니다 검색 후 수정하면 됌



크롤링 watcha

vi watcha.rb에 등록

```ruby
require 'httparty'
require 'rest-client'
require 'json'
require 'awesome_print'

headers = {
  cookie: "__uvt=; fbm_126765124079533=base_domain=.watcha.net; _s_guit=aacdc1416192a0dea193c8364aa6595a332f0bab348f3e6ae8e1725cd584; _ga=GA1.2.1140386975.1510902244; _gid=GA1.2.1293021724.1511237841; uvts=6m3wC8FXmE3CRFqf; fbsr_126765124079533=xxVwii0pZbqdSP5dk4iZAxl1I8B2P7F7hFfO9Ztym8s.eyJhbGdvcml0aG0iOiJITUFDLVNIQTI1NiIsImNvZGUiOiJBUUNWSVJxNmZNLTkwcjFfa2Z1UG1qZmlPNHJMa3h0NHJuWHlzSi1XZnNvWGVIVlItWGE0U3ViTFpaZGpJUkZNT055X3BybEd2S2RsV3l0UVVXMlNDNGdkMEt1OFJUYkFCTFRPOG5qR2JzMWdrQnNoUzJyeHl1LXR4ZTBtNklKZVhjT29iZUtGWERJdFhxUUFKMzAxLWMzOXN6Q05Xdk11U2FVMGVYVXktWjVFQTR1N1NZY2g4SkV3aTctWTlQMkVzbElMZ3JaWE1pVC1zNVNOMnFkV0VrVWNfaDFDQXFiZ24xNHJSa2FLdEFvWGxiVGRmY29HNktNSW1HV3k4Xzd1UGtfU1JuSW9nWnA3d3J1cVVuYzJHcEdqRno4d1BIeUw3eVI2ZGFIX0QxbHdzRy1LVVkwUlRqQ05Yb09ZLV9YY0UzYUNla2xkUDhlWUpPeS11cGYwRDJnUyIsImlzc3VlZF9hdCI6MTUxMTIzNzg1OSwidXNlcl9pZCI6IjEwMTU0ODIzNTc0MDk1ODcwIn0; _guinness_session=SFowUndCUDdVck9rZUFtRkhORXg4UEpxNjgydUphQytkblRUTFJlK2RjUGVhR0xINUN4RU52dHB6Nm1zamdSQ1gwOHptZFhoL0RmaURDNHJta1BwRjR3NzNpb3ZjWm8rVnlLS2NzYkdiT1dZekpHdGF4U01QS0dKaHJjNXM3Q1BUNlFMV0hQeVpwU0Q4WTh0bGRmeEc1RTdDZzBZNmgzZTFiYmJ2NGZENDNnN09DZjZvSmYyVm0wYzNuNm9EMFRTLS1iakRVMTg4emZkMER5N2Z0YTdmTjJRPT0%3D--10816b17f127149099d0e7219c50a11c01d47d61"
}
res = HTTParty.get(
  "https://watcha.net/boxoffice.json",
  :headers => headers
 )
watcha = JSON.parse(res.body)
```

https://watcha.net/boxoffice.json



.csv로 title, image, desc 출력



```ruby
require 'httparty'
require 'rest-client'
require 'json'
require 'awesome_print'

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
```



hash로 변경할 때

```ruby
watcha = JSON.parse(res.body)
ap watcha
```



keys 확인

```ruby
ap watcha.keys
```



C:\Users\student\project\real_board\db\seeds.rb

```ruby
require 'csv'

CSV.foreach(Rails.root.join('movie_list.csv')) do |row|
  Movie.create(
  title: row[0],
  remote_photo_url_url: row[1],
  desc: row[2]  
)
end
```

### 절대경로

rails c

Rails.root

filepath = Rails.root + '/movie_list.csv'

Rails.root.join('app')



##### url 있는 그대로 받으려면

image_url 우회 하려면

seeds.rb

```ruby
remote_photo_url_url: row[2]
```



##### 평가 하는 form 작성

```ruby
<%= form_tag() do%>
  <p>
    <strong>평점:</strong>
    <%= radio_button_tag(:rating, "1") %>
    <%= label_tag(:point_1, "1") %>
    <%= radio_button_tag(:rating, "2") %>
    <%= label_tag(:point_2, "2") %>
    <%= radio_button_tag(:rating, "3") %>
    <%= label_tag(:point_3, "3") %>
    <%= radio_button_tag(:rating, "4") %>
    <%= label_tag(:point_4, "4") %>
    <%= radio_button_tag(:rating, "5") %>
    <%= label_tag(:point_5, "5") %>
  </p>
    <%= text_field_tag(:comment) %>
    <%= submit_tag("리뷰제출") %>
<% end %>
```



rails g model review movie:references comment:text rating:integer user:references

##### references

+ movie_id, user_id



##### routes.rb

get 'movies/:id/reviews' => 'reviews#create'

rails g controller reviews create

reviews_controller.rb

```ruby
class ReviewsController < ApplicationController
  def create
    Review.create(
    movie_id: params[:id],
    rating: params[:rating],
    comment: params[:comment]
  )
  end
end
```



rails c

movie = Movie.first

movie.reviews

review = Review.first

reveiw.movie



해당 댓글에 리뷰 출력

```ruby
<% @movie.reviews.each do |review| %>
<p>
  점수 : <%= review.rating %>
</p>
<p>
  댓글 : <%= review.comment %>
</p>
<% end %>
```



##### avg

```ruby
@sum = 0
@sum =  @sum
	+ 특정 영화에 있는 모든 리뷰들을 돌면서 하나씩 더한다
	1. 특정 영화에 담긴 리뷰들을 다 불러온다.
	2. 리뷰를 각각 돌면서(each) rating에 담겨 있는 점수들을 @sum 에 더한다
	3. 누적된 값을 전체 리뷰수로 나	눠준다
	4. @avg 에 넣어준다
@avg =

def show
  total = 0
  @movie.reviews.each do |review|
    total += review.rating
  end
  if @movie.reviews.count == 0
    @avg = 0
  else
    @avg = total.to_f / @movie.reviews.count
  end
```
```ruby
<p>
  <strong>평균 평점:</strong>
  <%= @movie.reviews.average(:rating) %>
</p>
```
