# Write your solution here!
require "rqrcode"

# Use the RQRCode::QRCode class to encode some text

pp "Hi! Please enter 1 for Wifi QR Code, 2 for URL"

user_option = gets.chomp

#And storing it in location variable
if user_option == "1"
  
    pp "What is the Wifi name?"

    wifi_name = gets.chomp

    pp "What's the Wifi password"

    wifi_password = gets.chomp

    qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{wifi_name};P:#{wifi_password};;")

else if user_option == "2"

  pp "Enter URL for the website you would like to visit"

  url_website = gets.chomp

  qrcode = RQRCode::QRCode.new("https://#{url_website}")
  
else 
  pp "try entering 1 or 2"
end
end


# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite("sometext.png", png.to_s)
