require 'rails_helper'

RSpec.describe "KtmAppSchema" do
  it "schema is up to date" do
    current_defn = KtmAppSchema.to_definition
    printout_defn = File.read(Rails.root.join("app/graphql/schema.graphql"))
    expect(current_defn).to eq(printout_defn), "Update the printed schema with `bundle exec rake gql_dump_schema:dump_schema`"
  end
end
