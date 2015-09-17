require "support/shared_examples_for_models"

module DdrAux::Client
  RSpec.describe AdminSet do
    include_examples "model class methods"
    include_examples "timestamp coercion", [:created_at, :updated_at]
  end
end
