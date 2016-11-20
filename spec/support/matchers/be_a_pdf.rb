RSpec::Matchers.define :be_a_pdf do
  match do |actual|
    begin
      magic_number = actual[0..7]
    rescue NoMethodError
      magic_number = nil
    end
    expect(magic_number).to eql('%PDF-1.3')
  end

  failure_message do |actual|
    "expected a valid pdf, got `#{actual}`"
  end
end
