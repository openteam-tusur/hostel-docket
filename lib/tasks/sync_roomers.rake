require 'progress_bar'
desc "Syncing roomers"
task :sync_roomers => :environment do
  client = Savon.client(:wsdl => Settings.contingent.wsdl, :encoding => 'UTF-8', :log_level => :error)
  response = client.call(:get_student_rooms, :message => Settings.contingent.auth)
  result = response.body[:get_student_rooms_response][:get_student_rooms_result]
  items = result.values.flatten

  Room.update_all(:deleted_at => Time.zone.now)
  Roomer.update_all(:deleted_at => Time.zone.now)

  bar = ProgressBar.new(items.count)

  items.each do |item|
    hostel = Hostel.find_by_contingent_id(item[:hostel_id].squish)
    room = hostel.rooms.find_or_create_by_number("#{item[:room_number_part1]}#{item[:room_number_part2]}#{item[:room_number_part3]}".squish)
    surname, name, patronymic = item[:student_name].split(' ').map(&:squish)
    roomer = room.roomers.find_or_create_by_surname_and_name_and_patronymic(:surname => surname, :name => name, :patronymic => patronymic)
    room.update_column(:deleted_at, nil)
    roomer.update_column(:deleted_at, nil)
    bar.increment!
  end
end
