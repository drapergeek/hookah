defmodule Hookah.Webhook do
  use Hookah.Web, :model

  schema "webhooks" do
    field :params, :map
    field :headers, :string
    field :path, :string
    field :remote_ip, :string

    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """

  @allowed_fields [
    :headers,
    :params,
    :path,
    :remote_ip,
  ]
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @allowed_fields)
  end
end
