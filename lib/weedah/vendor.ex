defmodule Weedah.Vendor do
  use Ecto.Schema
  import Ecto.Changeset

  alias Weedah.ImageUploader

  schema "vendors" do
    field :category, :string
    field :description, :string
    field :name, :string
    field :phone, :string
    field :photo, Weedah.ImageUploader.Type

    timestamps()
  end

  @doc false
  def changeset(vendor, attrs) do
    vendor
    |> cast(attrs, [:name, :description, :photo, :phone, :category])
    |> validate_required([:name, :description, :photo, :phone, :category])
  end
end
