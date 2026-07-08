enum TerminalMouseButton {
  left(id: 0),

  middle(id: 1),

  right(id: 2),

  wheelUp(id: 64, isWheel: true),

  wheelDown(id: 65, isWheel: true),

  wheelLeft(id: 66, isWheel: true),

  wheelRight(id: 67, isWheel: true),
  ;

  /// The id used to report a button press/release to the terminal (goes straight onto the wire in
  /// SGR mode as `ESC[<id;x;yM`). X11 encodes wheel buttons 4–7 as `64 + (button - 4)` — i.e. bit 6
  /// (64) set with the low bits holding `button & 3` — so up=64, down=65, left=66, right=67. (Local
  /// xterm.dart fork fix: upstream 4.0.0 used `64 + button` = 68/69/…, which no app recognises as a
  /// wheel, so mouse-wheel scrolling silently did nothing in full-screen apps like Claude Code.)
  final int id;

  /// Whether this button is a mouse wheel button.
  final bool isWheel;

  const TerminalMouseButton({required this.id, this.isWheel = false});
}
