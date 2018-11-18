module LinksHelper
  def date_word(date)
    return 'today' if date == Date.today
    return 'yesterday' if date == Date.yesterday
    return date.strftime('%d %b') if date.year == Date.current.year

    date.strftime('%d.%m.%Y')
  end
end
