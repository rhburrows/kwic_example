module AllTests
  # Taken originally from
  # http://en.wikipedia.org/wiki/Flooding_of_the_Nile but I chopped it
  # up a little bit
  SAMPLE_TEXT = <<-EOT
The flooding of the Nile has been an important natural cycle in Egypt
since ancient times. It is celebrated by Egyptians as an annual
holiday for two weeks starting August 15, known as Wafaa El-Nil. It is
also celebrated in the Coptic Church by ceremonially throwing a
martyr's relic into the river. Ancient Egyptians believed that the
Nile flooded every year because of Isis's tears of sorrow for her dead
husband, Osiris.
EOT

  EXPECTED_TEXT = <<-EOT
15, known as Wafaa El-Nil. It is holiday for two weeks starting August - 3
a also celebrated in the Coptic Church by ceremonially throwing - 4
also celebrated in the Coptic Church by ceremonially throwing a - 4
an annual since ancient times. It is celebrated by Egyptians as - 2
an important natural cycle in Egypt The flooding of the Nile has been - 1
Ancient Egyptians believed that the martyr's relic into the river. - 5
ancient times. It is celebrated by Egyptians as an annual since - 2
annual since ancient times. It is celebrated by Egyptians as an - 2
as an annual since ancient times. It is celebrated by Egyptians - 2
as Wafaa El-Nil. It is holiday for two weeks starting August 15, known - 3
August 15, known as Wafaa El-Nil. It is holiday for two weeks starting - 3
because of Isis's tears of sorrow for her dead Nile flooded every year - 6
been an important natural cycle in Egypt The flooding of the Nile has - 1
believed that the martyr's relic into the river. Ancient Egyptians - 5
by ceremonially throwing a also celebrated in the Coptic Church - 4
by Egyptians as an annual since ancient times. It is celebrated - 2
celebrated by Egyptians as an annual since ancient times. It is - 2
celebrated in the Coptic Church by ceremonially throwing a also - 4
ceremonially throwing a also celebrated in the Coptic Church by - 4
Church by ceremonially throwing a also celebrated in the Coptic - 4
Coptic Church by ceremonially throwing a also celebrated in the - 4
cycle in Egypt The flooding of the Nile has been an important natural - 1
dead Nile flooded every year because of Isis's tears of sorrow for her - 6
Egypt The flooding of the Nile has been an important natural cycle in - 1
Egyptians as an annual since ancient times. It is celebrated by - 2
Egyptians believed that the martyr's relic into the river. Ancient - 5
El-Nil. It is holiday for two weeks starting August 15, known as Wafaa - 3
every year because of Isis's tears of sorrow for her dead Nile flooded - 6
flooded every year because of Isis's tears of sorrow for her dead Nile - 6
flooding of the Nile has been an important natural cycle in Egypt The - 1
for her dead Nile flooded every year because of Isis's tears of sorrow - 6
for two weeks starting August 15, known as Wafaa El-Nil. It is holiday - 3
has been an important natural cycle in Egypt The flooding of the Nile - 1
her dead Nile flooded every year because of Isis's tears of sorrow for - 6
holiday for two weeks starting August 15, known as Wafaa El-Nil. It is - 3
husband, Osiris. - 7
important natural cycle in Egypt The flooding of the Nile has been an - 1
in Egypt The flooding of the Nile has been an important natural cycle - 1
in the Coptic Church by ceremonially throwing a also celebrated - 4
into the river. Ancient Egyptians believed that the martyr's relic - 5
is celebrated by Egyptians as an annual since ancient times. It - 2
is holiday for two weeks starting August 15, known as Wafaa El-Nil. It - 3
Isis's tears of sorrow for her dead Nile flooded every year because of - 6
It is celebrated by Egyptians as an annual since ancient times. - 2
It is holiday for two weeks starting August 15, known as Wafaa El-Nil. - 3
known as Wafaa El-Nil. It is holiday for two weeks starting August 15, - 3
martyr's relic into the river. Ancient Egyptians believed that the - 5
natural cycle in Egypt The flooding of the Nile has been an important - 1
Nile flooded every year because of Isis's tears of sorrow for her dead - 6
Nile has been an important natural cycle in Egypt The flooding of the - 1
of Isis's tears of sorrow for her dead Nile flooded every year because - 6
of sorrow for her dead Nile flooded every year because of Isis's tears - 6
of the Nile has been an important natural cycle in Egypt The flooding - 1
Osiris. husband, - 7
relic into the river. Ancient Egyptians believed that the martyr's - 5
river. Ancient Egyptians believed that the martyr's relic into the - 5
since ancient times. It is celebrated by Egyptians as an annual - 2
sorrow for her dead Nile flooded every year because of Isis's tears of - 6
starting August 15, known as Wafaa El-Nil. It is holiday for two weeks - 3
tears of sorrow for her dead Nile flooded every year because of Isis's - 6
that the martyr's relic into the river. Ancient Egyptians believed - 5
the Coptic Church by ceremonially throwing a also celebrated in - 4
The flooding of the Nile has been an important natural cycle in Egypt - 1
the martyr's relic into the river. Ancient Egyptians believed that - 5
the Nile has been an important natural cycle in Egypt The flooding of - 1
the river. Ancient Egyptians believed that the martyr's relic into - 5
throwing a also celebrated in the Coptic Church by ceremonially - 4
times. It is celebrated by Egyptians as an annual since ancient - 2
two weeks starting August 15, known as Wafaa El-Nil. It is holiday for - 3
Wafaa El-Nil. It is holiday for two weeks starting August 15, known as - 3
weeks starting August 15, known as Wafaa El-Nil. It is holiday for two - 3
year because of Isis's tears of sorrow for her dead Nile flooded every - 6
EOT

  def test_indexing
    assert_equal @kwic.index(SAMPLE_TEXT), EXPECTED_TEXT.chomp
  end

  def output
    @kwic.index(SAMPLE_TEXT)
  end
end
