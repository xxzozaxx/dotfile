/*
  Handy as the number keys are unbound by default.
  I.e., 1 will switch to the first buffer, 2 to the second buffer, 0 to the tenth buffer.
  These bindings work as expected with the tab-bar module.
*/

function define_switch_buffer_key (key, buf_num) {
    define_key(default_global_keymap, key,
               function (I) {
                   switch_to_buffer(I.window,
                                    I.window.buffers.get_buffer(buf_num));
               });
}
for (let i = 0; i < 10; ++i) {
    define_switch_buffer_key("M-" + String((i+1)%10), i);
}
