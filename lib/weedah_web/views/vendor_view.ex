defmodule WeedahWeb.VendorView do
    use WeedahWeb, :view

    alias WeedahWeb.VendorView

    def render("one.json", %{vendor: vendor}) do
        %{
            data: render_one(vendor, VendorView, "vendor.json")
        }
    end

    def render("vendor.json", %{vendor: vendor}) do
        %{
            name: vendor.name,
            description: vendor.description,
            photo: vendor.photo,
            phone: vendor.phone,
            category: vendor.category
        }
    end

    def render("all.json", %{vendors: vendors}) do
        %{
            data: render_many(vendors, VendorView, "vendors.json")
        }
    end

    def render("vendors.json", %{vendor: vendor}) do
        %{
            category: vendor.category,
            description: vendor.description,
            name: vendor.name,
            phone: vendor.phone,
            photo: vendor.photo
        }
    end

end