// automatically handle some mime types internally.
content_handlers.set("application/pdf", content_handler_save);

// external programs for handling various mime types.
external_content_handlers.set("application/pdf", "zathura");
external_content_handlers.set("video/*", "st -e mpv");
external_content_handlers.set("text/*","emacsclient");


//// Editing
// use vi as external editor.
editor_shell_command = "emacsclient";

// view source in your editor.
view_source_use_external_editor = true;
