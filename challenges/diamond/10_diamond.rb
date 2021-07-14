module Diamond
  def self.make_diamond(letter)
    chr = 'B'
    spc = 1
    lines = ['A']

    while chr.ord <= letter.ord
      lines << chr + (' ' * spc) + chr
      chr = (chr.ord + 1).chr
      spc += 2
    end

    bspc = spc - 2
    chr = (chr.ord - 1).chr

    unless letter == 'A'
      while chr.ord >= 'B'.ord
        bspc -= 2
        chr = (chr.ord - 1).chr
        if chr == 'A'
          lines << "A"
        else
          lines << chr + (' ' * bspc) + chr
        end
      end
    end

    lines.map { |line| line.center(spc) }.join("\n") + "\n"
  end
end
