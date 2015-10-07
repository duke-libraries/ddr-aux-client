require "ddr_aux/client/license"
require "ddr_aux/client/admin_set"

module DdrAux
  RSpec.describe Client do

    describe ".uri" do
      describe "when the API URL is set by environment variable" do
        before do
          allow(ENV).to receive(:[]).with("DDR_AUX_API_URL") { "http://example.com/env" }
        end
        it "should be a URI" do
          expect(described_class.uri).to eq(URI("http://example.com/env"))
        end
      end
      describe "when the API URL is set by attribute" do
        before do
          allow(described_class).to receive(:api_url) { "http://example.com/attr" }
        end
        it "should be a URI" do
          expect(described_class.uri).to eq(URI("http://example.com/attr"))
        end
      end
      describe "when the API URL is not set" do
        before do
          allow(ENV).to receive(:[]).with("DDR_AUX_API_URL") { nil }
        end
        it "should raise an exception" do
          expect { described_class.uri }.to raise_error(described_class::Error)
        end
      end
    end

    describe ".get_license" do
      it "calls License.get" do
        expect(Client::License).to receive(:get).with(1) { nil }
        Client.get_license(1)
      end
    end

    describe ".get_licenses" do
      it "calls License.list" do
        expect(Client::License).to receive(:list) { [] }
        Client.get_licenses
      end
    end

    describe ".licenses" do
      it "calls License.list" do
        expect(Client::License).to receive(:list) { [] }
        Client.licenses
      end
    end

    describe ".find_license" do
      it "calls License.find" do
        expect(Client::License).to receive(:find).with(foo: "bar") { nil }
        Client.find_license(foo: "bar")
      end
    end

    describe ".license" do
      describe "when the argument is (convertable into) a Hash" do
        it "calls License.find" do
          expect(Client::License).to receive(:find).with(foo: "bar") { nil }
          Client.license(foo: "bar")
        end
      end
      describe "when the argument is not (convertable into) a Hash" do
        it "calls License.get" do
          expect(Client::License).to receive(:get).with(1) { nil }
          Client.license(1)
        end
      end
    end

    describe ".get_admin_set" do
      it "calls AdminSet.get" do
        expect(Client::AdminSet).to receive(:get).with(1) { nil }
        Client.get_admin_set(1)
      end
    end

    describe ".get_admin_sets" do
      it "calls AdminSet.list" do
        expect(Client::AdminSet).to receive(:list) { [] }
        Client.get_admin_sets
      end
    end

    describe ".admin_sets" do
      it "calls AdminSet.list" do
        expect(Client::AdminSet).to receive(:list) { [] }
        Client.admin_sets
      end
    end

    describe ".find_admin_set" do
      it "calls AdminSet.find" do
        expect(Client::AdminSet).to receive(:find).with(foo: "bar") { nil }
        Client.find_admin_set(foo: "bar")
      end
    end

    describe ".admin_set" do
      describe "when the argument is (convertable into) a Hash" do
        it "calls AdminSet.find" do
          expect(Client::AdminSet).to receive(:find).with(foo: "bar") { nil }
          Client.admin_set(foo: "bar")
        end
      end
      describe "when the argument is not (convertable into) a Hash" do
        it "calls AdminSet.get" do
          expect(Client::AdminSet).to receive(:get).with(1) { nil }
          Client.admin_set(1)
        end
      end
    end

  end
end
