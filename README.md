<aside class="fixed top-14 bottom-0 right-0 z-20 w-80 backdrop-blur-sm bg-white/30 dark:bg-gray-800/30 shadow-lg rounded-l-lg p-4">
  <%= form_with url: url_for, class: "w-full", method: :get do |form| %>
    <div class="flex flex-col space-y-4">
      <div>
        <%= form.label :location, class: "block mb-1 text-sm font-medium text-gray-900 dark:text-white" %>
        <%= form.text_field :location,
              class: "w-full p-2.5 rounded-lg border text-sm bg-gray-50 border-gray-300 text-gray-900 
                      focus:ring-blue-500 focus:border-blue-500 
                      dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white 
                      dark:focus:ring-blue-500 dark:focus:border-blue-500",
              value: params[:location] %>
      </div>
      <%= form.submit "Search",
          class: "w-full cursor-pointer text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 
                 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 
                 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800" %>
    </div>
  <% end %>
</aside>







Safety Yellow	#FFD300	Color principal (casco obrero)
Amber	#FFC107	Alternativa cálida
Goldenrod	#FFB800	Un poco más profundo
Banana Yellow	#FFE135	Más brillante, llamativo
Mustard	#E1AD01	Más terroso, serio