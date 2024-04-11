defmodule MySuperAppWeb.HomeLive do
  use MySuperAppWeb, :surface_live_view
  import Surface

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Design.Button
  alias Moon.Design.MenuItem
  alias Moon.Lego

  data(expanded0, :boolean, default: false)
  data(expanded1, :boolean, default: true)
  data(expanded2, :boolean, default: false)

  @spec render(map()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <TopToDown class="max-w-sm p-4 m-auto gap-4">
      <Heading size={24} class="text-center" is_regular>Hey!</Heading>
      <Button size="xs">First Moon Button</Button>
      <Button as="a" href="https://www.google.com/">Link HTML element</Button>
      <div class="flex flex-col gap-2 w-56">
      </div>
    </TopToDown>
    <div class="flex justify-around w-full">
      <div class="w-56 bg-goku flex flex-col gap-2 rounded-moon-s-lg p-4">
        <MenuItem>Vision</MenuItem>
        <MenuItem>Getting started</MenuItem>
        <MenuItem>How to contribute?</MenuItem>
        <MenuItem>Colours</MenuItem>
        <MenuItem>Tokens</MenuItem>
        <MenuItem>Transform SVG</MenuItem>
        <MenuItem>Manifest</MenuItem>
        <MenuItem role="switch" is_selected={@expanded0} title="Tailwind" on_click="on_expand0" />
        {#if @expanded0}
          <MenuItem>
            <span class="w-6" />
            <Lego.Title>
              Accordion</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-6" />
            <Lego.Title>
              Avatar</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-6" />
            <Lego.Title>
              Breadcrumb</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-6" />
            <Lego.Title>
              Button</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-6" />
            <Lego.Title>
              Checkbox</Lego.Title>
          </MenuItem>
        {/if}
      </div>
      <div class="w-56 bg-goku flex flex-col gap-2 rounded-moon-s-lg p-4">
        <MenuItem>
          <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">B</p>
          </span>
          <Lego.Title>
            <p class="leading-6 text-moon-14 font-semibold">Bitcasino</p>
          </Lego.Title>
        </MenuItem>
        <MenuItem>
          <span class="w-3" :on-click="on_expand1" :values={is_selected: !@expanded1}>
            <Lego.ChevronUpDown is_selected={@expanded1} />
          </span>
          <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">CX</p>
          </span>
          <Lego.Title>
            Customer...</Lego.Title>
        </MenuItem>
        {#if @expanded1}
          <MenuItem>
            <span class="w-6" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">S</p>
            </span>
            <Lego.Title>Sub nested item</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-6" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">S</p>
            </span>
            <Lego.Title>Sub nested item</Lego.Title>
          </MenuItem>
        {/if}
        <MenuItem>
          <span class="w-3" />
          <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">CX</p>
          </span>
          <Lego.Title>Quality...</Lego.Title>
        </MenuItem>
        <MenuItem>
          <span class="w-3" />
          <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">RG</p>
          </span>
          <Lego.Title>Responsible...</Lego.Title>
        </MenuItem>
        <MenuItem>
          <span class="w-3" :on-click="on_expand2" :values={is_selected: !@expanded2}>
            <Lego.ChevronUpDown is_selected={@expanded2} />
          </span>
          <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">RG</p>
          </span>
          <Lego.Title>Responsible...</Lego.Title>
        </MenuItem>
        {#if @expanded2}
          <MenuItem>
            <span class="w-6" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">S</p>
            </span>
            <Lego.Title>Sub nested item</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-6" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">S</p>
            </span>
            <Lego.Title>Sub nested item</Lego.Title>
          </MenuItem>
        {/if}
        <div class="flex flex-col gap-2 rounded-moon-s-lg">
          <MenuItem>
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">S</p>
            </span>
            <Lego.Title>
              <p class="leading-6 text-moon-14 font-semibold">Sportsbet</p>
            </Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-3" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">RG</p>
            </span>
            <Lego.Title>Customer...</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-3" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">CX</p>
            </span>
            <Lego.Title>Quality...</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-3" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">RG</p>
            </span>
            <Lego.Title>Responsible...</Lego.Title>
          </MenuItem>
        </div>
        <div class="flex flex-col gap-2 rounded-moon-s-lg">
          <MenuItem>
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">L</p>
            </span>
            <Lego.Title>
              <p class="leading-6 text-moon-14 font-semibold">Livecasino</p>
            </Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-3" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">RG</p>
            </span>
            <Lego.Title>Customer...</Lego.Title>
          </MenuItem>
        </div>
      </div>
    </div>
    """
  end

  def handle_event("on_expand0" <> _number, _params, socket) do
    current_value = get_in(socket.assigns, [:expanded0])
    new_value = !current_value
    {:noreply, assign(socket, :expanded0, new_value)}
  end

  def handle_event("on_expand1" <> _number, _params, socket) do
    current_value = get_in(socket.assigns, [:expanded1])
    new_value = !current_value
    {:noreply, assign(socket, :expanded1, new_value)}
  end

  def handle_event("on_expand2" <> _number, _params, socket) do
    current_value = get_in(socket.assigns, [:expanded2])
    new_value = !current_value
    {:noreply, assign(socket, :expanded2, new_value)}
  end
end
