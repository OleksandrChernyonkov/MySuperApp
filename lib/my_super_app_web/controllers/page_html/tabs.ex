defmodule MySuperAppWeb.Tabs do
  import Surface
  use MySuperAppWeb, :surface_live_view
  alias Moon.Design.Tabs
  alias Moon.Design.Table
  alias Moon.Design.Table.Column
  alias MySuperApp.{Repo, Phone, Room, DbQueries}
  import MoonWeb.Helpers.Lorem

  prop(selected, :list, default: [])

  data(rooms_with_phones, :any, default: [])
  data(rooms_without_phones, :any, default: [])
  data(phones_no_rooms, :any, default: [])

  @spec render(map()) :: Phoenix.LiveView.Rendered.t()

  def mount(_params, _session, socket) do
    rooms = DbQueries.rooms_with_phones_preload()

    rooms_with_phones = DbQueries.rooms_with_phones()
    #  rooms
    #  |> Enum.filter(&
    #    &1
    #    |> Map.get(:phones)
    #    |> Enum.any?()
    #  )
    #  |> Enum.map(&
    #    &1
    #    |> Map.take([:room_number, :phones])
    #  )

    rooms_without_phones = DbQueries.rooms_without_phones()
    #  rooms
    #  |> Enum.reject(&
    #    &1
    #    |> Map.get(:phones)
    #    |> Enum.any?()
    #  )
    #  |> Enum.map(&
    #    &1
    #    |> Map.take([:room_number, :phones])
    #  )

    phones_no_rooms = DbQueries.phones_without_rooms()
    #  Phone
    #  |> Repo.all()
    #  |> Repo.preload(:rooms)
    #  |> Enum.reject(&
    #    &1
    #    |> Map.get(:rooms)
    #    |> Enum.any?()
    #  )
    #  |> Enum.map(&
    #    &1
    #    |> Map.take([:phone_number])
    #  )

    {
      :ok,
      assign(
        socket,
        rooms_with_phones: rooms_with_phones,
        rooms_without_phones: rooms_without_phones,
        phones_no_rooms: phones_no_rooms,
        selected: []
      )
    }
  end

  def render(assigns) do
    ~F"""
    <Tabs id="tabs-ex-1">
      <Tabs.List>
        <Tabs.Tab>Кімнати з телефонами</Tabs.Tab>
        <Tabs.Tab>Кімнати без телефонів</Tabs.Tab>
        <Tabs.Tab>Телефони не прив'язані до кімнат</Tabs.Tab>
      </Tabs.List>
      <Tabs.Panels>
        <Tabs.Panel>
          <Table items={room <- @rooms_with_phones} row_click="single_row_click" {=@selected}>
            <Column label="Room Number">
              {room.room_number}
            </Column>
            <Column label="Phones">
              {#for {phone, index} <- room.phones |> Enum.with_index(1)}
                {#if index < room.phones |> Enum.count()}
                  {"#{phone.phone_number}, "}
                {#else}
                  {phone.phone_number}
                {/if}
              {/for}
            </Column>
          </Table>
        </Tabs.Panel>
        <Tabs.Panel>
          <Table items={room <- @rooms_without_phones}>
            <Column label="Room Number">
              {room.room_number}
            </Column>
          </Table>
        </Tabs.Panel>
        <Tabs.Panel>
          <Table items={phone <- @phones_no_rooms}>
            <Column label="Phone">
              {phone.phone_number}
            </Column>
          </Table>
        </Tabs.Panel>
      </Tabs.Panels>
    </Tabs>
    """
  end
end
