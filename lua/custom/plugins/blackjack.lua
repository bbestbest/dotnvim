local present, blackjack = pcall(require, "blackjack")

if not present then
  return
end

blackjack.setup {
  card_style = "large", -- Can be "mini" or "large".
  suit_style = "black", -- Can be "black" or "white".
  scores_path = "~/Playground/blackjack_scores.json", -- Default location to store the scores.json file.
}
