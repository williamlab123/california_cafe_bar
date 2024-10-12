class Avo::Resources::Stock < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :name, as: :text
    field :user_id, as: :number
    field :amount, as: :number
    field :price, as: :number
    field :barcode, as: :text
    field :user, as: :belongs_to
    field :sales, as: :has_many
  end
end
