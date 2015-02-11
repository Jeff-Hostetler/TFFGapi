require 'spec_helper'

describe VendorSerializer do
  let(:object) do
    build_serializable(
      name: "ACME Inc",
      address: "1234 Fake St",
    )
  end

  subject { serialize(object) }

  it { is_expected.to include(name: "ACME Inc") }
  it { is_expected.to include(address: "1234 Fake St") }
end
