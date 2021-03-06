module ApplicationHelper

  def card_art_path(id)
    return "cards_jpg/#{id}.jpg" if File.file? (Rails.root + "app/assets/images/cards_jpg/#{id}.jpg")
    return "cards_png/#{id}.png" if File.file? (Rails.root + "app/assets/images/cards_png/#{id}.png")
    "#{id}.gif"
  end

  def art_is_cover?(id)
    if File.file? (Rails.root + "app/assets/images/cards_jpg/#{id}.jpg")
      image = ImageSize.path((Rails.root + "app/assets/images/cards_jpg/#{id}.jpg"))
    elsif File.file? (Rails.root + "app/assets/images/cards_png/#{id}.png")
      image = ImageSize.path((Rails.root + "app/assets/images/cards_png/#{id}.png"))
    end
    image.width > 151 ? 'cover' : ''
  end

  def get_clans(deck)
    result = []
    deck.cards.each do |card|
      unless result.include? card.clan
        result << card.clan
      end
    end
    result
  end

  def get_card_list(cards)
    card_list = []
    cards.each { |card| card_list << card.name.downcase.mb_chars.titleize.to_s }
    card_list.join(', ')
  end

  def clan_id(clan_name)
    clans = {
        1 => 'Micron',
        2 => 'Aliens',
        3 => 'Street',
        4 => 'Mafia',
        5 => 'Circus',
        6 => '[Da:Hack]',
        7 => 'Alpha',
        8 => 'Fury',
        9 => 'Deviants',
        10 => 'Damned',
        11 => 'Saints',
        13 => 'Metropolis',
        15 => 'Workers',
        16 => 'PSI',
        17 => 'Kingpin',
        18 => 'Chasers',
        19 => 'Халифат',
        20 => 'C.O.R.R',
        21 => 'Toyz',
        26 => 'Nemos',
        27 => 'SymBio'
    }
    clans.key(clan_name)
  end

  def clan_name(clan_id)
    clans = {
        1 => 'Micron',
        2 => 'Aliens',
        3 => 'Street',
        4 => 'Mafia',
        5 => 'Circus',
        6 => '[Da:Hack]',
        7 => 'Alpha',
        8 => 'Fury',
        9 => 'Deviants',
        10 => 'Damned',
        11 => 'Saints',
        13 => 'Metropolis',
        15 => 'Workers',
        16 => 'PSI',
        17 => 'Kingpin',
        18 => 'Chasers',
        19 => 'Халифат',
        20 => 'C.O.R.R',
        21 => 'Toyz',
        26 => 'Nemos',
        27 => 'SymBio'
    }
    clans.invert.key(clan_id)
  end

  def clan_id_range
    # [*1..11, 13, *15..19, 21, 26, 27]
    [2, 7, 18, 5, 6, 10, 9, 8, 17, 4, 13, 1, 26, 16, 11, 3, 27, 21, 15, 19]
  end

  def rarities
    %w[common rare uniq legend]
  end

  protected
  def safe_params
    params.except(:host, :port, :protocol).permit!
  end

end
