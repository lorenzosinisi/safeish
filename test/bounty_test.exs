defmodule BountyTest do
  @moduledoc """
  ## BOUNTY CONDITIONS
  
  I, Robin Hilliard, will pay the submitter of the first pull request to
  my github repo for this project that causes the test
  
  "bounty 2 checked code can guess the secret"

  to pass by changing the contents of `bounty_winners/Elixir.Bounty2.beam`
  AND NOTHING ELSE 100 USD. Provide payment details (email or mobile) within
  one week of PR being accepted to robin.hilliard (at) gmail.com.
  
  Payment will be made by PayPal. If no details are received in that time I will
  put the money towards sponsoring:
  
    https://github.com/sponsors/HappiHacking
  
  The creators and maintainers of the much needed documentation on the BEAM VM:
  
    https://github.com/happi/theBeamBook
  
  
  ## MORE INFORMATION
  
  The current beam file was compiled from this source:
  
  ```
  defmodule Bounty2 do
    def guess(), do: -1
  end
  ```
  You can use Erlang, LFE or anything you like to generate the beam file, but
  this must be done separately to the test run (the idea is that the BEAM file
  was generated somewhere else and that Safeish is testing and loading it here).
  
  The Decompile module is incomplete and will quite possibly choke on your beam file.
  If this happens please submit an issue and I will attempt to fix it.
  
  Curious to see what people can do, I am by no means across all the ins and outs
  of the BEAM and there may be an easy exploit - good luck :-).
  
  ## HALL OF FAME
  
  Bounty Version Date           Winner      What I learned
  ------ ------- ----           ------      --------------
  1      0.1.0   26 Dec 2020    Voltone     The abstract code chunk has nothing to do with the actual code
  """
  use ExUnit.Case
  
  
  test "bounty 1: checked code can guess the secret" do
    <<secret::128>> = :crypto.strong_rand_bytes(16)
    assert {:ok, Bounty1} = Safeish.load_file("test/bounty_winners/Elixir.Bounty1.beam")
    assert ^secret = Bounty1.guess()
  end
  
  test "bounty 2: checked code can guess the secret" do
    <<secret::128>> = :crypto.strong_rand_bytes(16)
    assert {:ok, Bounty2} = Safeish.load_file("test/bounty_winners/Elixir.Bounty2.beam")
    assert ^secret = Bounty2.guess()
  end
  
  
end
