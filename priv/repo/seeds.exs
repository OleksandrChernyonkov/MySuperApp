# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MySuperApp.Repo.insert!(%MySuperApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias MySuperApp.{Repo, Phone, Room}

rooms_with_phones = %{Мы можем использовать функцию Repo.get/3, чтобы получить запись из базы по ID. Эта функция принимает два обязательных аргумента: структуру данных, пригодную для запросов, и ID искомой записи. В качестве результата она возвращает запись в виде структуры, если таковая была найдена. В противном случае возвращается nil.


  "301" => ["0991122301", "0993344301"],
  "302" => ["0990000302", "0991111302"],
  "303" => ["0992222303"],
  "304" => ["0993333304", "0994444304"],
  "305" => ["0935555305", "09306666305", "0937777305"]
}

Repo.transaction fn ->
  rooms_with_phones
  |> Enum.each(fn {room, phones} ->
    %Room{}
    |> Room.changeset(%{room_number: room})
    |> Ecto.Changeset.put_assoc(
      :phones,
      phones
      |> Enum.map(&
        %Phone{}
        |> Phone.changeset(%{phone_number: &1})
      )
    )
    |> Repo.insert!()
  end)

  MySuperApp.Repo.insert_all(
    Room,
    [
      %{room_number: 666},
      %{room_number: 1408},
      %{room_number: 237}
    ]
  )

  MySuperApp.Repo.insert_all(
    Phone,
    [
      %{phone_number: "380661112233"},
      %{phone_number: "380669997788"},
      %{phone_number: "380665554466"}
    ]
  )
end
