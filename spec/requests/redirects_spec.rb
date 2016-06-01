require "rails_helper"

REDIRECTS = {
  "/dashboard" => "/",
}.freeze

describe "Redirected routes" do
  REDIRECTS.keys.each do |redirected_path|
    context "GET #{redirected_path}" do
      it "redirects to #{REDIRECTS[redirected_path]}" do
        get redirected_path

        expect(response).to redirect_to REDIRECTS[redirected_path]
      end
    end
  end
end
