require 'pry'

class Genre
    extend Concerns::Findable

    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.create(name)
        genre = Genre.new(name)
        genre.save
        genre
    end

    def add_song(song)
        self.songs << song
    end

    def artists
        self.songs.collect {|song| song.artist}.uniq
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def self.destroy_all
        self.all.clear
    end

end
