require 'spec_helper'

describe DistributorSerializer do
  let(:object) do
    build_serializable(
      name: "ACME",
      address: "123 Fake St",
    )
  end

  subject { serialize(object) }

  it { is_expected.to include(name: "ACME") }
  it { is_expected.to include(address: "123 Fake St") }
end
