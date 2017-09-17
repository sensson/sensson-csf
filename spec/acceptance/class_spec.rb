require 'spec_helper_acceptance'

describe 'csf class' do
  context 'authorative server' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-PUPPET
      class { 'csf': }
      PUPPET

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end
end
