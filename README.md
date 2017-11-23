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
	3. 누적된 값을 전체 리뷰수로 나눠준다
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

##### rails g migration add_role_to_users role

rake db:migrate



C:\Users\student\project\real_board\app\models\user.rb

admin인지 아닌지 구분하는 def 함수

User 클래스에서는 접근이 가능



user = User.find_by(role: "admin")



```ruby
def admin?
  if role == "admin"
    true
  else
    false
  end
end
```



user확인

pry(main)> rails c

pry(main)> User.all



User생성

pry(main)> User.create email: "admin@asdf.com", password: "123123", password_confirmation: "123123", role: "admin"



User.create email: "regular@asdf.com", password: "123123", password_confirmation: "123123", role: "regular"



##### Whitelisting

= 다 못오고 올수있는거만 허용, lock up authorization



##### 로그인을 해야만 화면이 보이도록

C:\Users\student\project\real_board\app\controllers\application_controller.rb



##### authentication & authorization

C:\Users\student\project\real_board\app\views\movies\index.html.erb

```ruby
<% if current_user.admin? %>
	<td><%= link_to 'Edit', edit_movie_path(movie) %></td>
	<td><%= link_to 'Destroy', movie, method: :delete, data: { confirm: 'Are you sure?' } %></td>
<% else %>
	<td><%= link_to 'Show', movie %></td>
<% end %>
```





URL로 접근 못하게

```ruby
def destroy
  @movie.destroy if current_user.admin?

OR

private 안에

def check_admin
 unless current_user.admin?
   redirect_to redirect_path
end

before_action :check_admin, only: [:edit, :update, :destroy]
```



##### gem cancancan

https://github.com/CanCanCommunity/cancancan

rails g  cancan:ability

C:\Users\student\project\real_board\app\models\ability.rb



comment-out

````ruby
user ||= User.new # guest user (not logged in)
if user.admin?
  can :manage, Movie
else
  can :read, Movie
end
````



C:\Users\student\project\real_board\app\controllers\movies_controller.rb

```ruby
load_and_authorize_resource
```





### Heroku 배포

https://devcenter.heroku.com/articles/getting-started-with-rails4

1. vagrant에 heroku 설치

##### [Heroku Toolbelt](https://toolbelt.heroku.com/)

+ https://devcenter.heroku.com/articles/heroku-cli

2. heroku login

3. gemfile => gem 'sqlite3', group: :development 수정

           => gem 'rails_12factor', group: :production 추가

   ​                => gem 'pg', group: :production 추가

   sudo apt-get install libpq-dev 추가

4. heroku create

5. git push heroku master

6. heroku run rake db:migrate



User 생성

C:\Users\student\project\real_board\db\seeds.rb

```ruby
User.create([
  {
    email: "admin@asdf.com",
    password: "123123",
    password_confirmation: "123123",
    role: "admin"
},
 {
   email: "yangmin@asdf.com",
   password: "123123",
   password_confirmation: "123123",
   role: "regular"
 }
])
```



### admin 페이지

C:\Users\student\project\real_board\app\controllers\

생성 admin\admin_application_controller.rb



상속

admin모듈 추가



C:\Users\student\project\real_board\app\controllers\admin\users_controller.rb

모든 유저들을 볼수 있는 파일 생성

Admin에서만 사용할거라 Admin:: 추가



C:\Users\student\project\real_board\app\views\admin\users\index.erb

생성



rake routes | grep admin

### AWS 관리



IAM user



Redactor

ckeditor

trix



##### text editor되는 게시판



게시판관리

post라는 게시판

rails g scaffold post title content:text photo user:references



```ruby
<%= f.hidden_field :user_id, value: current_user.id %>
```


이미지를 s3에 업로드

버킷 만들기



개요 - 폴더만들기



s3사용을 위한 gemfile 추가

Using Amazon S3

https://github.com/carrierwaveuploader/carrierwave

이미지 설정 자동화

https://github.com/minimagick/minimagick



C:\Users\student\project\real_board\config\initializers\carrierwave.rb

생성 후 creditial 및 기타 추가



secret key id access key

cd ~

vi .bashrc

export AWS_ID="키"

export AWS_SECRET="비번"

source .bashrc



ENV['AWS_ID']

ENV['AWS_SECRET']

환경변수에 추가

fog_directory = bucket name



aws region

http://docs.aws.amazon.com/ko_kr/general/latest/gr/rande.html



C:\Users\student\project\real_board\app\uploaders\image_uploader.rb

storage :fog



지금 user중에 posts를 생성



#### minimagick

https://github.com/minimagick/minimagick

gem "mini_magick"



https://www.howtoinstall.co/en/ubuntu/xenial/imagemagick



C:\Users\student\project\real_board\app\uploaders\image_uploader.rb

```ruby
include CarrierWave::MiniMagick

version :thumb do
  process resize_to_fit: [50, 50]
end

version :small do
  process resize_to_fit: [200, 200]
end

fill옵션은 fit하게 200 x 200
version :fill do
  process resize_to_fill: [200, 200]
end

```



##### bootstrap

rails g devise:views



C:\Users\student\project\real_board\app\views\devise\sessions\new.html.erb

로그인 페이지 변경



```ruby
<%= stylesheet_link_tag "https://getbootstrap.com/docs/4.0/examples/signin/signin.css" %>

<div class="container">
  <%= form_for(resource, as: resource_name, url: session_path(resource_name), html: {class: "form-signin"}) do |f| %>
    <h2 class="form-signin-heading"><%= t(".sign_in") %></h2>
      <%= f.email_field :email, required: false, autofocus: true, class: "form-control"%>
      <%= f.password_field :password, required: false, class: "form-control"%>
      <%= f.submit t(".sign_in"), class: "btn btn-primary btn-block"%>
    <%= render "devise/shared/links" %>
  <% end %>
</div>
```



### 이메일 비밁번호 잊어버렸을때  요청메일 send

##### SES Home

서울과 가까운 오레곤

https://us-west-2.console.aws.amazon.com/ses/home?region=us-west-2#

1. Email Addresses

+ verify email

2. sending statistics
3. aws sdk rails

+ https://github.com/aws/aws-sdk-rails
+ C:\Users\student\project\real_board\config\initializers\aws_sdk.rb

​        코드 추가

+ ```ruby
  creds = Aws::Credentials.new(ENV['AWS_ID'], ENV['AWS_SECRET'])
  Aws::Rails.add_action_mailer_delivery_method(:aws_sdk, credentials: creds, region: 'us-west-2')
  ```

4. C:\Users\student\project\real_board\config\initializers\devise.rb
   + 인증받은 메일을 추가

+ ```ruby
  config.mailer_sender = 'rickkim90@gmail.com'
  ```

5. C:\Users\student\project\real_board\config\application.rb

   추가

   ```ruby
   config.action_mailer.delivery_method = :aws_sdk
   ```

6. Request a Sending Lmit increase = 다른 사용자들도 사용

   + Limit = Desired Daily Sending Quota

   + Limit value = 1000

   + System Notifications

   + https://github.com/rickkim90

   + Yes

   + Yes

   + Yes

   + I'm taking a programming course based on the Ruby on Rails for my school tasks. During the course we have a section in which we practice using the mailer service. The teacher recommended the SES Management as a provider so i need to increase the limit in order to test the functionality. Thank you very much..

     ​

   #### Lightsail = 가상머신

   ##### https://lightsail.aws.amazon.com/ls/webapp/create/instance?region=ap-northeast-1

   앱 os -> ubuntu 생성

   ubuntu 접속하여 rails 설치

https://gorails.com/setup/ubuntu/16.04



rbenv version

rbenv을 통해 2.3.5 설치

global 전역 또한 2.3.5

gem install bundler

rbenv rehash



##### installing rails 4.2.9



ssh-keygen -t rsa -b 4096 -C "rickkim90@gmail.com"

cat id_rsa.pub



SSH and GPG keys -> SSH에 추가



git clone https://github.com/rickkim90/fake_watcha.git

cd 후 bundle



13.114.245.222

관리 -> 네트워킹 -> 방화벽 포트 3000 추가



#### Texteditor 추가

https://github.com/maclover7/trix

C:\Users\student\project\real_board\app\views\posts\_form.html.erb

trix_editor로 변경

```ruby
<div class="field">
  <%= f.label :content %><br>
  <%= f.trix_editor :content %>
</div>
```



C:\Users\student\project\real_board\app\views\posts\index.html.erb
