json.spot do
  json.extract! @spot, :id, :host_id, :spot_type, :title, :description,
    :price, :lat, :lng, :capacity, :address, :city
  json.img asset_path(@spot.img)
  json.rating @spot.average_rating
  json.num_reviews @spot.num_reviews
end

json.bookings do
  @spot.bookings.each do |booking|
    json.set! booking.id do
      json.extract! booking, :start_date, :end_date
    end
  end
end

json.host do
  json.extract! @spot.host, :id, :username
  json.img_url @spot.host.avatar.url
end
