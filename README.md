# ExamGuard Pro — Proctoring Monitor
### Desktop Exam Tracking Application

---

## What This App Does

ExamGuard Pro is a desktop proctoring/monitoring application that tracks:
- ⌨️  **Keyboard keystrokes** — every key pressed is logged with timestamp
- 🖱️  **Mouse clicks** — position (x, y) and button (left/right/middle)
- 🔄  **Mouse scrolls** — direction and position
- 📸  **Auto screenshots** — taken at configurable intervals

All events are saved to a JSON log file and screenshots are stored in a folder
on your Desktop under `exam_logs/`.

---

## How to Run

### Option A — Run from Python (for testing)
```
python tracker.py
```

### Option B — Build the .exe
Double-click `build.bat` OR run in terminal:
```
pip install -r requirements.txt
pyinstaller --onefile --noconsole --name "ExamGuard Pro" tracker.py
```
Your `.exe` will be in the `dist/` folder.

---

## How to Use the App

1. Launch `ExamGuard Pro.exe`
2. (Optional) Adjust screenshot interval in the Settings panel
3. (Optional) Toggle which events to track using checkboxes
4. Click **▶ START SESSION** to begin tracking
5. Use your computer normally — all events are logged in real-time
6. Click **■ STOP SESSION** to end and save the session

---

## Output Files

All files are saved to your Desktop:

```
Desktop/
  exam_logs/
    session_2026-05-16_10-30-00.json       ← event log
    screenshots_2026-05-16_10-30-00/
        screenshot_001_10-30-30.png
        screenshot_002_10-31-00.png
        ...
```

### Sample JSON Log
```json
[
  {"timestamp": "2026-05-16T10:30:00", "type": "session_start", "data": {...}},
  {"timestamp": "2026-05-16T10:30:02", "type": "key_press",    "data": {"key": "h"}},
  {"timestamp": "2026-05-16T10:30:05", "type": "mouse_click",  "data": {"x": 540, "y": 300, "button": "Button.left"}},
  {"timestamp": "2026-05-16T10:30:30", "type": "screenshot",   "data": {"file": "screenshot_001_10-30-30.png"}},
  {"timestamp": "2026-05-16T10:35:00", "type": "session_end",  "data": {"total_keystrokes": 142, ...}}
]
```

---

## Requirements

- Windows 10 / 11
- Python 3.9+ (only needed to build the .exe)
- Libraries: pynput, pyautogui, pillow, pyinstaller

---

## Project Structure

```
exam_tracker/
  tracker.py          ← Main application source code
  requirements.txt    ← Python dependencies
  build.bat           ← One-click build script for .exe
  README.md           ← This file
  dist/
    ExamGuard Pro.exe ← Built executable (after running build.bat)
```

---

## Tech Stack

| Component     | Library        |
|---------------|----------------|
| GUI           | tkinter (built-in Python) |
| Keyboard hook | pynput         |
| Mouse hook    | pynput         |
| Screenshots   | pyautogui      |
| Packaging     | PyInstaller    |

---

Built for job assessment — ExamGuard Pro v1.0
