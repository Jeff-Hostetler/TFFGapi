require 'spec_helper'
require 'rails_helper'

describe ShiftSerializer do
  let(:object) do
    build_serializable(
      start_time: 1232,
      end_time: 1234,
      #cannot figure out spec for association, but taken care of in model spec
    )
  end

  subject { serialize(object) }

  it { is_expected.to include(start_time: 1232) }
  it { is_expected.to include(end_time: 1234) }
end
