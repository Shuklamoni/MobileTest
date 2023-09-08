@ui @ENS
Feature: As a Torum user, I must be able to view and update my profile with ENS accounts



  @walletSignup
  Scenario: As a user,I must be able to create an account with an ENS enabled wallet address
    Given User create a MetaMask wallet after install extension
    And User Imports account with ENS on Metamask
    And User visit Torum website
    When User click on Join now button in page footer
    And User click on signup with wallet button
    And User choose "MetaMask" wallet
    And User authorize wallet to signup
    And User enter valid username with 12 characters
    And User enter valid email
    And User select phone number country "India"
    And User enter valid phone number
    And USer selects check box for ENS
    And User click on wallet signup next button
    And User click on wallet signup next button again
    And User skips all onboarding steps
    And user clicks on Next on Onboarding page
    And User clicks on Agree and continue
    Then User should be logged in and see the "View Profile" nav bar
    When User click on navigation panel "View Profile"
    And User click on "Edit profile"
    And User click on Address and user checks if the ENS address to be "Jaya3.eth"
    And User click on save changes
    And User is presented with the toast message "Profile successfully updated!"
    Then Check if the user description is "jaya3.eth"


  @walletSignup
  Scenario: As a user,I must be able to Login an account with an ENS enabled wallet address
    Given User create a MetaMask wallet after install extension
    And User Imports account with ENS on Metamask
    And User visit Torum website
    When User click on Login button in page footer
    And User click on connect wallet button
    And User choose "MetaMask" wallet
    And User authorize wallet to login
    And User navigates to setting page
    And User navigates to Manage Page
    And User clicks on more options for the wallet
    And User clicks on Removes wallet
    And User signs the metamask wallet for Removal
    Then User is presented with the toast message "Address removed successfully"



