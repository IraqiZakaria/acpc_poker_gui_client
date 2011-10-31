require 'spec_helper'

describe ProxyBot do
   before(:each) do
      @match_state = create_initial_match_state
   end

   describe '#initialize' do
      it 'connects to the ACPC Dealer' do
         pending 'mock out dealer communicator'
         patient = ProxyBot.new 
      end
   end

   describe '#hand_ended?' do
      it "correctly reports that the hand has not ended for all rounds in Texas Hold'em" do
         pending 'mock out dealer communicator'
         for_every_round do |round|
            @patient.hand_ended?.should == false
         end
      end
   
      it "correctly reports that the hand has ended when only one player is active" do
         pending 'mock out dealer communicator'
         (@players.length - 1).times do |i|
            @players[i].stubs(:is_active?).returns(false)
         end
         
         @patient.hand_ended?.should == true
      end
   
      it "correctly reports that the hand has ended when no player is active" do
         pending 'mock out dealer communicator'
         (@players.length).times do |i|
            @players[i].stubs(:is_active?).returns(false)
         end
      
         @patient.hand_ended?.should == true
      end
   
      it "correctly reports that the hand has ended when there is a showdown" do
         pending 'mock out dealer communicator'
         list_of_opponents_hole_cards = []
         (@game_definition.number_of_players - 1).times do
            list_of_opponents_hole_cards << arbitrary_hole_card_hand
         end
         @match_state.stubs(:list_of_opponents_hole_cards).returns(list_of_opponents_hole_cards)
      
         list_of_all_player_hole_cards = list_of_opponents_hole_cards.insert @match_state.position_relative_to_dealer, @match_state.users_hole_cards
         @match_state.stubs(:list_of_hole_card_sets).returns(list_of_all_player_hole_cards)
      
         # TODO LOOKFIRST
         pending 'Need to stub :to_acpc_cards() for each player'
      
         @patient.update_state! @match_state
         
         @patient.hand_ended?.should == true
      end
   end
   
   
   
   
   
   
   
   
   
   
   ## Match state strings generated properly for actions #######################
   #
   #it "generates call or check matchstate strings correctly" do
   #   expected_string = setup_action_test @match_state, ACTION_TYPES[:call]
   #   @patient.make_call_or_check_action.should be == expected_string
   #end
   #
   #it "generates fold matchstate strings correctly" do
   #   expected_string = setup_action_test @match_state, ACTION_TYPES[:fold]
   #   @patient.make_fold_action.should be == expected_string
   #end
   #
   #it "generates limit raise or bet matchstate strings correctly" do
   #   expected_string = setup_action_test @match_state, ACTION_TYPES[:raise]
   #   @patient.make_raise_or_bet_action.should be == expected_string
   #end
   #
   #
   ## Properly reports state ###################################################
   #
   #it 'properly reports which player has the dearler button' do
   #   pending
   #   @patient.player_with_the_dealer_button.should be @player_manager.player_with_the_dealer_button
   #end
   #
   #it 'properly reports which player submitted the big blind' do
   #   @patient.player_who_submitted_big_blind.should be @player_manager.player_who_submitted_big_blind
   #end
   #
   #it 'properly reports which player submitted the small blind' do
   #   @patient.player_who_submitted_small_blind.should be @player_manager.player_who_submitted_small_blind
   #end
   #
   #it 'properly reports which player is next to act' do
   #   pending
   #   @patient.player_whose_turn_is_next.should be @player_manager.player_whose_turn_is_next
   #end
   #
   #it 'properly reports which player acted last' do
   #   pending
   #   @patient.player_who_acted_last.should be @player_manager.player_who_acted_last
   #end
   #
   #it 'properly reports the pot size' do
   #   pending
   #   @patient.pot_size.should be @player_manager.pot_size
   #end
   #
   #it "properly reports stack sizes at the beginning of a hand" do
   #   @patient.list_of_player_stacks.should be @player_manager.list_of_player_stacks
   #end
   #
   #it "properly resets stack sizes at the beginning of a hand in Doyle's game" do
   #   @patient.list_of_player_stacks.should be @player_manager.list_of_player_stacks
   #   pending "change the stack sizes, then start a new hand and check that they have reset"
   #end
   #
   #it "properly reports the user's hole cards" do
   #   pending
   #   @patient.users_hole_cards.should be @player_manager.users_hole_cards
   #end
   #
   #it "properly reports the hole cards of the user's opponents" do
   #   pending
   #   @patient.list_of_opponents_hole_cards.should be @player_manager.list_of_opponents_hole_cards
   #end
   #
   #it 'properly reports the betting actions for each player' do
   #   pending
   #   #@patient.list_of_betting_actions.should be @player_manager.list_of_betting_actions
   #end
   #
   #it 'properly reports the board cards' do
   #   pending
   #   #@patient.list_of_board_cards.should be @player_manager.list_of_board_cards
   #end
   #
   #it 'properly reports the hand number' do
   #   pending
   #   #@patient.hand_number.should be @player_manager.hand_number
   #end
   #
   #it "properly reports the user's position" do
   #   pending
   #   #@patient.user_position.should be @player_manager.users_position
   #end
   #
   #it 'properly reports the last action' do
   #   pending
   #   #@patient.last_action.should be @player_manager.last_action
   #end
   #
   #it 'properly reports the list of legal actions' do
   #   pending
   #   #@patient.legal_actions.should be @player_manager.legal_actions
   #end
   #
   #it 'properly reports the round number in every round' do
   #   pending
   #   for_every_round do |round|
   #      @patient.round.should be == round
   #   end
   #end
   #
   #it 'properly reports the active players' do
   #   pending
   #   #@patient.active_players.should be @player_manager.active_players
   #end
   #
   #it 'properly reports the maximum number of hands in this match' do
   #   pending
   #   #@patient.max_number_of_hands.should be @max_number_of_hands
   #end
   #
   #it "properly reports whether or not it is the user's turn next at the beginning of every round in Texas Hold'em" do
   #   for_every_round do |round|
   #      @player_manager.stubs(:users_turn_to_act?).returns(@game_definition.first_player_position_in_each_round[round]-1 == @user_position)
   #      
   #      @patient.users_turn_to_act?.should be @player_manager.users_turn_to_act?
   #   end
   #end
   #
   #it "correctly reports that the hand has not ended for all rounds in Texas Hold'em" do
   #   pending
   #   for_every_round do |round|
   #      @patient.hand_ended?.should == false
   #   end
   #end
   #
   #it "correctly reports that the hand has ended when only one player is active" do
   #   pending
   #   (@players.length - 1).times do |i|
   #      @players[i].stubs(:is_active?).returns(false)
   #   end
   #   
   #   @patient.hand_ended?.should == true
   #end
   #
   #it "correctly reports that the hand has ended when no player is active" do
   #   pending
   #   (@players.length).times do |i|
   #      @players[i].stubs(:is_active?).returns(false)
   #   end
   #   
   #   @patient.hand_ended?.should == true
   #end
   #
   #it "correctly reports that the hand has ended when there is a showdown" do
   #   pending
   #   list_of_opponents_hole_cards = []
   #   (@game_definition.number_of_players - 1).times do
   #      list_of_opponents_hole_cards << arbitrary_hole_card_hand
   #   end
   #   @match_state.stubs(:list_of_opponents_hole_cards).returns(list_of_opponents_hole_cards)
   #   
   #   @patient.update_state! @match_state
   #   
   #   @patient.hand_ended?.should == true
   #end
   #
   #it 'properly reports that the match as ended' do
   #   pending
   #   @patient.match_ended?.should be == (@player_manager.hand_ended? && (@max_number_of_hands == hand_number))
   #end
   #
   #
   ## Helper methods ###########################################################
   #
   def for_every_round
      MAX_VALUES[:rounds].times do |round|
         @match_state.stubs(:round).returns(round)
         @match_state.stubs(:number_of_actions_in_current_round).returns(0)

         yield round
      end
   end
end