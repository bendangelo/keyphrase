# frozen_string_literal: true

RSpec.describe Keyphrase do
  it "has a version number" do
    expect(Keyphrase::VERSION).not_to be nil
  end

  describe "#analyse" do
    context "smart stoplist" do

      it do
        result = Keyphrase.analyse "Chopin - Nocturne op.9 No.2 F#"

        expect(result.keys).to eq ["Nocturne op.9 No.2", "Chopin" ]
        expect(result["Nocturne op.9 No.2"]).to eq 10.083333333333332
      end

      it do
        result = Keyphrase.analyse "Do You See It...Yet? | New York Nadia
        poem written and performed by New York Nadia (Nadia Asencio); video production by The Raw Speak and IZ Parrot"

        expect(result.keys).to eq ["The Raw Speak", "New York Nadia", "York Nadia", "Nadia Asencio", "poem written", "video production", "IZ Parrot", "You", "It", "performed"]
      end

      it do
        result = Keyphrase.analyse "Secrets Of The Smithsonian: Humanity's Hidden History | Jay Myers"

        expect(result.keys).to eq ["Humanity's Hidden History", "The Smithsonian", "Jay Myers", "Secrets"]
      end

      it "should remove non-words" do
        result = Keyphrase.analyse "re-move these's: 's & + ! @ # $ % ^ & * ( ) \\ | [ ] { } / ? ~ ` = - _ , . 🎄 £"

        expect(result.keys).to eq ["re-move these's"]
      end

      it do
        result = Keyphrase.analyse "SEMI FINAL! - FURIA vs HAVU - HIGHLIGHTS - Elisa Masters 2023 l CS2"

        expect(result.keys).to eq ["SEMI FINAL", "Elisa Masters", "FURIA", "HAVU", "HIGHLIGHTS", "CS2"]
      end

      it "should remove duplicate words" do
        result = Keyphrase.analyse "Ancient Rome
        ancient Rome"

        expect(result.keys).to eq ["Ancient Rome"]
      end

      it do
        result = Keyphrase.analyse "The Lofi Roman Empire - Music Of Ancient Rome | sleep, study, meditation
        My homage to ancient Rome. Lo-Fi Beats + the Roman Empire works suprisingly well (:"

        expect(result.keys).to eq ["Roman Empire works suprisingly", "Lofi Roman Empire", "Lo-Fi Beats", "Ancient Rome", "Music", "sleep", "study", "meditation", "homage"]
      end

      it "should split hashtags into own keywords" do
        result = Keyphrase.analyse "MEET US! #CREW #sports | cleotoms"

        expect(result.keys).to eq ["MEET", "CREW", "sports", "cleotoms"]
      end

      it "should split on &" do
        result = Keyphrase.analyse "Making & Cutting Sex on The Beach for BeScented Fragrance Oil Supply"

        expect(result.keys).to eq ["BeScented Fragrance Oil Supply", "Cutting Sex", "The Beach", "Making"]
      end

      it do
        result = Keyphrase.analyse "Illegal construction @ the Yonge & Eglinton Centre"


        expect(result.keys).to eq ["Illegal construction", "Eglinton Centre", "Yonge" ]
      end

      it "should split on slashes" do
        result = Keyphrase.analyse "GTA ON LINE 1.39 NEWSAVE CEO OUTFIT SOLO / SALVARE I COMPLETI CEO DA SOLI"

        expect(result.keys).to eq ["LINE NEWSAVE CEO OUTFIT SOLO", "COMPLETI CEO DA SOLI", "GTA", "SALVARE"]
      end

      it "should remove * ! and words with numbers" do
        result = Keyphrase.analyse "*New*Heavy Sniper!!!Fortnite Battle Royale!!!Level 50//5000+Kills//110+Wins!!!"

        expect(result.keys).to eq ["Fortnite Battle Royale", "Heavy Sniper", "Level", "Kills", "Wins"]
      end

      it "should split on [] {} <>"do
        result = Keyphrase.analyse "[Video Beremo] <Nova24TV>: {Gost Rajko Topolovec}"

        expect(result.keys).to eq ["Gost Rajko Topolovec", "Video Beremo", "Nova24TV"]
      end

      it "should remove numbered dates" do
        result = Keyphrase.analyse "Video Beremo 07.04.2018 Nova24TV"

        expect(result.keys).to eq ["Video Beremo Nova24TV"]
      end

    end

    context "strict stoplist" do
    end
  end
end