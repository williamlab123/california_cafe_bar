class Avo::Resources::Sale < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :client_id, as: :number
    field :stock_id, as: :number
    field :quantity, as: :number
    field :total_price, as: :number
    field :user_id, as: :number
    field :payment_method, as: :text
    field :stock, as: :belongs_to
    # field :recipe, as: :has_one
  end
end
