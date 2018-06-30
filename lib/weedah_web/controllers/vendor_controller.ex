defmodule WeedahWeb.VendorController do
    use WeedahWeb, :controller

    alias Weedah.Vendor
    alias Weedah.Repo

    def new(conn, vendor_params) do
        vendor = Vendor.changeset(%Vendor{}, vendor_params)

        case Repo.insert(vendor) do
            {:ok, _} ->
                vendors = Repo.all(Vendor)
                render conn, "all.json", vendors: vendors
            {:error, _} ->
                text conn, "Registeration not finished"
        end
    end

    def detail(conn, %{"id" => vendor_id}) do
        vendor = Repo.get(Vendor,vendor_id)
        IO.inspect vendor
        render conn, "one.json", vendor: vendor
    end

    @radius_of_earth_meters 6371008.8

   def toRad(para) do
       para * 3.14159265359 / 180.0
   end

   def get_vendors(conn, user_params) do
        %{"lat" => user_lat, "lng" => user_lng} = user_params
        {user_lat, _} = Integer.parse(user_lat)
        {user_lng, _} = Integer.parse(user_lng)
        user_location = {user_lat, user_lng}
        ram = [%{"lat" => 12, "lgn" => 12}, %{"lat" => 10,"lgn" => 10}] # result from Map.values
        Enum.map(ram, fn(x) ->
            %{"lat" => vendor_lat, "lgn" => vendor_lng} = x
            vendor_location = {vendor_lat, vendor_lng}
            distance(user_location, vendor_location)
         end)
        text conn, "Location"
   end

   def distance({lon1, lat1},{lon2, lat2}) do

       x = lat2 - lat1
       dlat = :math.sin(toRad(x) / 2)
       y = lon2 - lon1
       dlon = :math.sin(toRad(y) / 2)
       
       a = dlat * dlat + dlon * dlon * :math.cos(toRad(lat1)) * :math.cos(toRad(lat2))
       dist =  2 * :math.atan2(:math.sqrt(a), :math.sqrt(1 - a)) * @radius_of_earth_meters
       IO.inspect dist
   end    
end