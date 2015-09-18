module DdrAux::Client
  RSpec.describe Model do

    describe "inheritance" do
      let(:superclass) do
        Class.new(described_class) do |klass|
          klass.path = "/foo"
        end
      end
      let(:subclass) { Class.new(superclass) }
      it "inherits the superclass path" do
        expect(subclass.path).to eq("/foo")
      end
    end

  end
end
