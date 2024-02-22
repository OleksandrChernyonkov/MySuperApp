defmodule MySuperAppWeb.HomeLive do
    use Phoenix.LiveView
    import Surface
  
    alias Moon.Autolayouts.TopToDown
    alias Moon.Components.Heading
    alias Moon.Design.Button
  
    @spec render(map()) :: Phoenix.LiveView.Rendered.t()
    def render(assigns) do
      ~F"""
        <TopToDown class="max-w-sm p-4 m-auto gap-4">
          <Heading size={24} class="text-center" is_regular>Hey!</Heading>
          <Button size="xs">First Moon Button</Button>
          <Button as="a" href="https://www.google.com/">Link HTML element</Button>
          <MenuItem>MOON</MenuItem>
        </TopToDown>
      """
    end
  end