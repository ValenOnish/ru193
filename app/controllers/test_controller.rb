class TestController < ApplicationController
#  require 'geokit'
#  include Geokit::Geocoders
#  uses_tiny_mce

#layout false
  def hi
    render :text=>'done'
  end  

  def video
    url                      = "http://vimeo.com/69218846"
p    vimeo_video_id           = url.scan(/vimeo.com\/(\d+)\/?/).flatten.to_s               # extract the video id
p    vimeo_video_json_url     = "http://vimeo.com/api/v2/video/%s.json" % vimeo_video_id   # API call
# Parse the JSON and extract the thumbnail_large url
 p   @thumbnail_image_location = JSON.parse(open(vimeo_video_json_url).read).first['vimeo_holder'] rescue nil
  end

  def  width               #    /public/system/photos/imgs/1/original_0536-1.jpg
p    @photo = Photo.first
#    JPEG.new("#{RAILS_ROOT}/public/images/photos/" + @photo.url).width
p    JPEG.new("#{Rails.root}/public/system/photos/imgs/" + "#{@photo.id}/original_" + @photo.img_file_name).width
    render :text=>'done'
  end

  def tinymce
  end

  def slides

  end

  def form
  end

  def do_form
    p   params    #    {"name"=>"nnn", "commit"=>"Save", "offer_end"=>{"defaultminute59hour23(3i)"=>"14", "defaultminute59hour23(4i)"=>"19", "defaultminute59hour23(5i)"=>"42", "defaultminute59hour23(1i)"=>"2013", "defaultminute59hour23(2i)"=>"6"}, "authenticity_token"=>"kcpngc663Qnbn4jHlk4DQuRD0o9Ub2tRCRCndr3jun4=", "utf8"=>"✓", "action"=>"do_form", "phone"=>"ph", "controller"=>"test"}
    name = params[:name]
    phone = params[:phone]
  end

  def clicks
    @photo = Photo.last
    @arr = [165, 166, 167]
  end

  def img
    p   params[:id]
# p   params[:id] = rand(5)   + 165
p    @photo = Photo.find(params[:id])
p    @photo.img_file_name
  end

  def category
p    @photo = Photo.first
p  @photo.category_id
p  @photo.category.name
    render :text=>'done'
  end

  def session
    session[:name] = nil
    render :text=>'done'
  end

  def send_email      # see user_mailer view
#    p     @user = Purchaser.last #User.last   # we send it in user_mailer/signup_notif
                                     UserMailer.welcome_email('valenonish@gmail.com').deliver
                                 #    UserMailer.signup_notification(@user).deliver           #work
    #UserMailer.new_order_notification(Order.last).deliver
                                 #    Thread.new{UserMailer.reset_notification(@user).deliver}
                                 #   UserMailer.reset_notification(@user).deliver
                                 #    Thread.new{UserMailer.new_appoinment(@user, session[:date], session[:time], @user.name, @user.email).deliver}     #  (b_o, date, time, pur_name, pur_phone)
                                 #    UserMailer.new_appoinment(@user, session[:date], session[:time], @user.name, @user.email).deliver   #+
                                 #    UserMailer.reset_notification(@user).deliver
    render :text=>'email is sent'
  end

  def paypal_live
    
  end

  def set_pass
p   user = User.find(49)
   user.password = '123456'
   user.password_confirmation = '123456'
p   user.save
p user.errors
p User.authenticate('jgphoto@rogers.com', '123456')
p user.activate!
 render :text => 'done'
 end

  def del_viewers
    for photo in Photo.all
      photo.viewers = nil
      photo.save
    end
    render :text=>'done'
  end

  def drag

  end

  def jdrag

  end

  def fancy
    @to_admin_message = ToAdminMessage.new
  end

  def fancy_gal
    @photos_array_id = Photo::FirstPhoto

  end


  def geo
    # 174.112.78.239    93.74.197.151
#p    location = GoogleGeocoder.geocode('174.112.78.239') #if ip !='127.0.0.1'
p    location = IpGeocoder.geocode('12.215.42.19')
#    f.puts(ip + ' ' + location.state.to_s + ' ' + location.full_address.to_s + ' ' + Time.now.to_s) #if ip !='127.0.0.1'
    render :text=>'done'
  end

end
