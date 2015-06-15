# Encoding: utf-8

require_relative 'spec_helper'

describe 'roundcube::default' do
  before { stub_resources }
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  %w(
    apt
    php
    mysql::client
    roundcube::install
    roundcube::configure
  ).each do |recipe|
    it "includes #{recipe} recipe" do
      expect(chef_run).to include_recipe(recipe)
    end
  end # each recipe
end
