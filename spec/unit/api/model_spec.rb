module DdrAux::Client
  module Api
    RSpec.describe Model do

      before do
        allow(described_class).to receive(:path) { "/foo" }
      end

      describe ".get" do
        it "calls Connection with /foo/bar" do
          expect(Connection).to receive(:call).with("/foo/bar") { nil }
          described_class.get("bar")
        end
      end

      describe ".list" do
        it "calls Connection with /foo" do
          expect(Connection).to receive(:call).with("/foo") { [] }
          described_class.list
        end
      end

      describe ".all" do
        it "calls Connection with /foo" do
          expect(Connection).to receive(:call).with("/foo") { [] }
          described_class.all
        end
      end

      describe ".find" do
        it "calls Connection with /foo/find?bar=baz" do
          expect(Connection).to receive(:call).with("/foo/find?bar=baz") { nil }
          described_class.find(bar: "baz")
        end
      end

    end
  end
end
