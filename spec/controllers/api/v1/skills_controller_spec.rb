require 'rails_helper'

RSpec.describe Api::V1::SkillsController, type: :controller do
  before do
    create(:skill, name: 'test', details: 'test detail')
  end

  describe 'GET #index' do
    it 'responds to json' do
      get :index, format: :json

      expect(response).to have_http_status :success
    end

    it 'returns all skills' do
      get :index, format: :json

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response.count).to eq Skill.count
    end
  end

  describe 'GET #show' do
    it 'returns a single skill' do
      get :show, format: :json, params: { id: Skill.first.id }

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response[:name]).to    eq 'test'
      expect(json_response[:details]).to eq 'test detail'
    end
  end

  describe 'POST #create' do
    it 'creates a new skill' do
      skill_params = { name: 'programming', details: 'Ruby on Rails developer' }

      post :create, format: :json, params: { skill: skill_params }

      skill         = Skill.last
      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status :created

      expect(skill.name).to              eq 'programming'
      expect(skill.details).to           eq 'Ruby on Rails developer'

      expect(json_response[:id]).to      eq skill.id
      expect(json_response[:name]).to    eq 'programming'
      expect(json_response[:details]).to eq 'Ruby on Rails developer'
    end
  end

  describe 'PATCH #update' do
    it 'alters a record' do
      skill_params = { name: 'programming', details: 'Ruby on Rails developer' }
      old_skill    = Skill.first

      patch :update, format: :json, params: { id: old_skill.id, skill: skill_params }

      new_skill     = Skill.find_by(id: old_skill.id)

      expect(response).to have_http_status :no_content

      expect(new_skill.name).to        eq 'programming'
      expect(new_skill.details).to     eq 'Ruby on Rails developer'
      expect(old_skill.name).not_to    eq new_skill.name
      expect(old_skill.details).not_to eq new_skill.details
    end
  end

  describe 'DELETE #destroy' do
    it 'removes a record' do
      skill = Skill.first
      count = Skill.count

      delete :destroy, format: :json, params: { id: skill.id }

      new_skill = Skill.find_by(id: skill.id)

      expect(response).to have_http_status :no_content

      expect(new_skill).to   be_nil
      expect(Skill.count).to eq count - 1
    end
  end

end
