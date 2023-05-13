# rulers/lib/rulers/file_model.rb

require "multi_json"

module Rulers
  module Model
    class FileModel
      def initialize(filename)
        @filename = filename

        # Record ID is the name of the file
        basename = File.split(filename).last
        @id = File.basename(basename, ".json").to_i

        obj = File.read(filename)
        @hash = MultiJson.load(obj)
        @hash["id"] = @id
      end

      def [](name)
        @hash[name.to_s]
      end

      def []=(name, value)
        @hash[name.to_s] = value
      end

      def self.find(id)
        new("db/quotes/#{id}.json")
      rescue StandardError => e
        pp e
        nil
      end

      def self.all
        files = Dir["db/quotes/*.json"]
        files.map { |f| FileModel.new f }
      end

      def self.create(attrs)
        puts attrs
        hash = {}
        hash["submitter"] = attrs["submitter"] || ""
        hash["quote"] = attrs["quote"] || ""
        hash["attribution"] = attrs["attribution"] || ""

        files = Dir["db/quotes/*.json"]
        names = files.map { |f| File.split(f).last }
        highest = names.map(&:to_i).max
        new_id = highest + 1

        File.open("db/quotes/#{new_id}.json", "w") do |f|
          f.write <<~TEMPLATE
            {
              "submitter": "#{hash["submitter"]}",
              "quote": "#{hash["quote"]}",
              "attribution": "#{hash["attribution"]}"
            }
          TEMPLATE
        end

        new("db/quotes/#{new_id}.json")
      end

      def update(attrs)
        # Parse file into hash
        # Change hash in ruby
        # Re-write the file
      end
    end
  end
end
