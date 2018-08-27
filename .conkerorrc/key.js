// Scrolling movement
define_key(content_buffer_normal_keymap, "h", "cmd_scrollLeft");
define_key(content_buffer_normal_keymap, "j", "cmd_scrollLineDown");
define_key(content_buffer_normal_keymap, "k", "cmd_scrollLineUp");
define_key(content_buffer_normal_keymap, "l", "cmd_scrollRight");

call_after_load("google-search-results",
                function () {
                    undefine_key(google_search_results_keymap, "j");
                    undefine_key(google_search_results_keymap, "k");
                });

// open with o and O for new buffer
define_key(content_buffer_normal_keymap, "o", "find-url")
define_key(content_buffer_normal_keymap, "O", "find-url-new-buffer")

// follow from F
define_key(content_buffer_normal_keymap, "F", "follow-new-buffer-background")

// yank as term
//undefine_key(caret_keymap,"M-w");
define_key(caret_keymap,"C-M-c", "cmd_copy");
//define_key(caret_keymap,"C-M-v", "cmd_paste");
//undefine_key(content_buffer_normal_keymap,"M-w");
define_key(content_buffer_normal_keymap,"C-M-c", "cmd_copy");
//define_key(content_buffer_normal_keymap,"C-M-v", "cmd_paste");
//undefine_key(special_buffer_keymap,"M-w");
//undefine_key(text_keymap,"M-w");

// Excute as vim
define_key(content_buffer_normal_keymap, ":", "execute-extended-command")
