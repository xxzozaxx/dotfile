//// Include
require("new-tabs.js");
require("favicon");
require("clicks-in-new-buffer.js");

// tabls icon
tab_bar_show_icon = true;

// Enable favicon
read_buffer_show_icons = true;

// let xkcd-mode put the funny alt text into the page.
xkcd_add_title = true;

//compeltion
url_completion_use_history = true;
minibuffer_auto_complete_default = true;
url_completion_use_bookmarks = true;
url_completion_sort_order = 'date_descending';

// middle mouse to open in new buffer
// Set to either OPEN_NEW_BUFFER or OPEN_NEW_BUFFER_BACKGROUND
clicks_in_new_buffer_target = OPEN_NEW_BUFFER_BACKGROUND; // Now buffers open in background.
// Set to 0 = left mouse, 1 = middle mouse, 2 = right mouse
clicks_in_new_buffer_button = 2; //  Now right mouse follows links in new buffers.

// Defual zoom leve
function my_zoom_set (buffer) {
    browser_zoom_set(buffer, false, 120);
}
add_hook('create_buffer_late_hook', my_zoom_set);
