module DdrAux::Client

  RSpec.shared_examples "model class methods" do
    describe ".get" do
      it "calls Request.get_response with #{described_class.path}/bar" do
        expect(Request).to receive(:get_response).with("#{described_class.path}/bar") { nil }
        described_class.get("bar")
      end
    end

    describe ".list" do
      it "calls Request.get_response with #{described_class.path}" do
        expect(Request).to receive(:get_response).with(described_class.path) { [] }
        described_class.list
      end
    end

    describe ".all" do
      it "calls Request.get_response with #{described_class.path}" do
        expect(Request).to receive(:get_response).with(described_class.path) { [] }
        described_class.all
      end
    end

    describe ".find" do
      it "calls Request.get_response with #{described_class.path}/find?bar=baz" do
        expect(Request).to receive(:get_response).with("#{described_class.path}/find?bar=baz") { nil }
        described_class.find(bar: "baz")
      end
    end

    describe ".where" do
      it "calls Request.get_response with #{described_class.path}/find?bar=baz" do
        expect(Request).to receive(:get_response).with("#{described_class.path}/find?bar=baz") { nil }
        described_class.where(bar: "baz")
      end
    end
  end

  RSpec.shared_examples "timestamp coercion" do |fields|
    subject { described_class.new(record) }
    fields.each do |field|
      describe field.to_s do
        let(:record) { {field.to_s => "2015-09-10T15:27:47.371Z"} }
        its(field) { is_expected.to eq(Time.parse("2015-09-10T15:27:47.371Z")) }
      end
    end
  end

end
