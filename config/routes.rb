AcpcPokerGuiClient::Application.routes.draw do
  devise_for :users, :controllers => { :invitations => 'devise/invitations' }

  # Routes for MatchStart:
  match 'match_start/new' => 'match_start#new', :as => :new_match
  match 'match_start/rejoin' => 'match_start#rejoin', :as => :rejoin_match
  match 'match_start/join' => 'match_start#join', :as => :join_match
  match 'match_start/poll' => 'match_start#poll', :as => :match_start_poll

  # Routes for PlayerActions
  match 'match_home' => 'player_actions#index', :as => :match_home
  match 'take_action' => 'player_actions#take_action', as: :take_action
  match 'update' => 'player_actions#update', as: :update
  match 'update_state' => 'player_actions#update_state', as: :update_state
  match 'update_hotkeys' => 'player_actions#update_hotkeys', :as => :update_hotkeys
  match 'reset_hotkeys' => 'player_actions#reset_hotkeys', as: :reset_hotkeys
  match 'leave_match' => 'player_actions#leave_match', :as => :leave_match

  resource :advertisements

  # Root of the site
  root :to => 'match_start#index'
end
