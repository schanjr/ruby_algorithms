def bag_of_tokens_score(tokens, power)
  tokens = tokens.sort
  return 0 if tokens.empty? || power < tokens[0]
  l, score = 0, 0
  r = tokens.size - 1
  max = 0
  while r >= l
    if power >= tokens[l]
      power -= tokens[l]
      l += 1
      score += 1
      max = [max, score].max
    elsif l != r
      power += tokens[r]
      r -= 1
      score -= 1
    else
      break
    end
  end
  max
end


puts bag_of_tokens_score([100,200,300,400], 200)