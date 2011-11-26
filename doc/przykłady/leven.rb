def levenshtein s, t
  cost = 0
  d = Array.new
  m = s.length
  n = t.length

  # Stworz tabele
  0.upto(m) do |i|
    d[i] = Array.new
  end

  # Zainicjuj tabele
  0.upto(m) do |i|
    d[i] = [i]
  end
  1.upto(n) do |j|
    d.first[j] = j
  end

  # Wykonaj obliczenia
  1.upto(m) do |i|
    1.upto(n) do |j|
      cost = (s[i - 1][1] == t[j - 1][1]) ? 0 : 1
      d[i][j] = [(d[i - 1][j] + 1) , (d[i][j - 1] + 1) , (d[i - 1][j - 1] + cost)].min
    end
  end
  d.last.last
end
