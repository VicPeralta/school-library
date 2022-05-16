def valid_date(date)
  y, m, d = date.split '/'
  return true if (y.to_i > 2000) && (m.to_i > 1 || m.to_i < 12) && (d.to_i > 1 || d.to_i < 31)

  false
end
