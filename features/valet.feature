Feature: Calculate valet parking
  In order to have enough money when I get back
  As a airport car parkee
  I want to know what my airport parking will cost
Background:
  Given that I'm using the parking calculator
Scenario: One hour parking
  Given that I park for one hour in valet parking
  When I take my car back
  Then I pay $ 12.00