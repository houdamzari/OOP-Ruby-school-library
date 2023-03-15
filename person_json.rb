require 'json'

class PersonJSON
  FILENAME = 'people.json'

  def self.load_all
    if File.exist?(FILENAME)
      json_data = File.read(FILENAME)
      people_data = JSON.parse(json_data, symbolize_names: true)
      people_data.map { |person_data| Person.new(person_data[:age], person_data[:name], parent_permission: person_data[:parent_permission]) }
    else
      []
    end
  end

  def self.save_all(people)
    people_data = people.map do |person|
      {
        name: person.name,
        age: person.age,
        parent_permission: person.instance_variable_get(:@parent_permission)
      }
    end

    File.write(FILENAME, JSON.pretty_generate(people_data))
  end
end
