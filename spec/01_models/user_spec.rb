# frozen_string_literal: true

require 'rails_helper'
require "refile/file_double"

RSpec.describe User, "モデルに関するテスト", type: :model do
  describe 'アソシエーション' do
    it "Studyモデルを多数持っている" do
      is_expected.to have_many(:studies)
    end
  end
    end