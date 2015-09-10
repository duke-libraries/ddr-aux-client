module DdrAux
  RSpec.describe Client do

    describe ".license" do
      it "returns a hash" do
        expect(Client.license(1)).to be_a(Hash)
      end
      it "raises an exception when not found" do
        expect { Client.license(1000) }.to raise_error(Net::HTTPServerException)
      end
    end

    describe ".licenses" do
      it "returns a list" do
        expect(Client.licenses).to be_a(Array)
      end
      it "accepts a url parameter" do
        result = Client.licenses(url: "https://creativecommons.org/licenses/by/4.0/")
        expect(result.size).to eq(1)
      end
    end

  end
end
