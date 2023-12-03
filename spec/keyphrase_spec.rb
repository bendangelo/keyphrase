# frozen_string_literal: true
require "pry"

RSpec.describe Keyphrase do
  it "has a version number" do
    expect(Keyphrase::VERSION).not_to be nil
  end

  describe "#analyse" do
    context "smart stoplist" do

      it do
        result = Keyphrase.analyse "Chopin - Nocturne op.9 No.2"

        expect(result.keys).to eq ["Chopin", "Nocturne op.9 No.2"]
      end

      it do
        result = Keyphrase.analyse "Do You See It...Yet? | New York Nadia
        poem written and performed by New York Nadia (Nadia Asencio); video production by The Raw Speak and IZ Parrot"

        expect(result.keys).to eq ["You",
                                   "It",
                                   "York Nadia",
                                   "poem written",
                                   "performed",
                                   "New York Nadia",
                                   "Nadia Asencio",
                                   "video production",
                                   "The Raw Speak",
                                   "IZ Parrot"]
      end

      it do
        result = Keyphrase.analyse "Secrets Of The Smithsonian: Humanity's Hidden History | Jay Myers"

        expect(result.keys).to eq ["Secrets", "The Smithsonian", "Humanity's Hidden History", "Jay Myers"]
      end

      it do
        result = Keyphrase.analyse "re-move these's: 's & + ! @ # $ % ^ & * ( ) \\ | [ ] { } / ? ~ ` = - _ , . 🎄 £"

        expect(result.keys).to eq ["re-move these's"]
      end

      it do
        result = Keyphrase.analyse "SEMI FINAL! - FURIA vs HAVU - HIGHLIGHTS - Elisa Masters 2023 l CS2"

        expect(result.keys).to eq ["SEMI FINAL", "FURIA", "HAVU", "HIGHLIGHTS", "Elisa Masters 2023", "CS2"]
      end

      it do
        result = Keyphrase.analyse "The Lofi Roman Empire - Music Of Ancient Rome | sleep, study, meditation
        My homage to ancient Rome. Lo-Fi Beats + the Roman Empire works suprisingly well (:"

        expect(result.keys).to eq ["Lofi Roman Empire", "Music", "Ancient Rome", "sleep", "study", "meditation", "homage", "ancient Rome", "Lo-Fi Beats", "Roman Empire works suprisingly"]
      end

    end

    context "strict stoplist" do
    end
  end
end
