# ExamGuard Pro v2.0 — Proctoring Monitor
### Desktop Exam Tracking Application — Built by Ravichandra D

---

## What This App Does

ExamGuard Pro is a professional desktop proctoring/monitoring application that tracks:
- ⌨️  **Keyboard keystrokes** — every key pressed logged with timestamp
- 🖱️  **Mouse clicks** — position (x, y) and button (left/right/middle)
- 🔄  **Mouse scrolls** — direction and position
- 📸  **Auto screenshots** — taken at configurable intervals
- ⚠️  **Suspicious activity detection** — flags Alt+Tab, Ctrl+C, Ctrl+V, Win Key, Alt+F4, Ctrl+Z
- 📊  **Excel report** — color-coded activity report with summary sheet
- 📧  **Auto email** — sends full session report to your email on STOP
- 🔵  **System tray** — minimizes to a small dot in taskbar, runs silently

All events are saved to a JSON log file and screenshots stored on your Desktop under `exam_logs/`.

---

## How to Run

### Step 1 — Install dependencies
```
pip install -r requirements.txt
```

### Step 2 — Run from Python (for testing)
```
python tracker.py
```

### Step 3 — Build the .exe
Double-click `build.bat` OR run in terminal:
```
pyinstaller --onefile --noconsole --name "ExamGuard Pro" tracker.py
```
Your `.exe` will be in the `dist/` folder.

---

## How to Use the App

1. Launch `tracker.py` or `ExamGuard Pro.exe`
2. Adjust screenshot interval (default: 30 seconds)
3. Toggle tracking options: Keys / Clicks / Scrolls / Screenshots
4. Click **▶ START** to begin tracking
5. Use your computer normally — all events logged in real-time
6. Click **■ STOP** to end session
   - Excel report is auto-generated
   - Full report is emailed automatically
7. Minimize the window → app hides as a small dot in system tray
8. Double-click the tray dot to restore the window

---

## Suspicious Activity Detection

These key combinations are automatically flagged with a popup warning:

| Combo | Reason Logged |
|-------|--------------|
| Alt+Tab | Switched applications |
| Win Key | Opened Start Menu |
| Ctrl+C | Copied content |
| Ctrl+V | Pasted content |
| Ctrl+Z | Undo action |
| Alt+F4 | Attempted to close app |

---

## Output Files

All files saved to Desktop automatically:

```
Desktop/
  exam_logs/
    session_2026-05-18_10-30-00.json          ← full event log
    report_2026-05-18_10-30-00.xlsx           ← Excel report
    session_report_2026-05-18_10-30-00.zip    ← emailed zip
    screenshots_2026-05-18_10-30-00/
        screenshot_001_10-30-30.png
        screenshot_002_10-31-00.png
```

### Sample JSON Log
```json
[
  {"timestamp": "2026-05-18T10:30:00", "type": "session_start",  "data": {"time": "..."}},
  {"timestamp": "2026-05-18T10:30:02", "type": "key_press",      "data": {"key": "h"}},
  {"timestamp": "2026-05-18T10:30:05", "type": "mouse_click",    "data": {"x": 540, "y": 300, "button": "Button.left"}},
  {"timestamp": "2026-05-18T10:30:10", "type": "suspicious",     "data": {"combo": "Alt+Tab", "reason": "Switched applications"}},
  {"timestamp": "2026-05-18T10:30:30", "type": "screenshot",     "data": {"file": "screenshot_001_10-30-30.png"}},
  {"timestamp": "2026-05-18T10:35:00", "type": "session_end",    "data": {"total_keystrokes": 142, "total_clicks": 38, "suspicious_events": 2}}
]
```

---

## Requirements

- Windows 10 / 11
- Python 3.9+
- Libraries (all in requirements.txt):

| Library | Purpose |
|---------|---------|
| pynput | Keyboard & mouse global tracking |
| pyautogui | Auto screenshots |
| pillow | Tray icon image creation |
| openpyxl | Excel report generation |
| pystray | System tray icon |
| pyinstaller | Build .exe file |

---

## Project Structure

```
exam_tracker/
  tracker.py            ← Main application source code (~600 lines)
  requirements.txt      ← All Python dependencies
  build.bat             ← One-click .exe builder
  README.md             ← This file
  dist/
    ExamGuard Pro.exe   ← Final executable (after build)
```

---

## Tech Stack

| Component              | Library / Tool          |
|------------------------|-------------------------|
| GUI Framework          | tkinter (built-in)      |
| Keyboard tracking      | pynput                  |
| Mouse tracking         | pynput                  |
| Screenshots            | pyautogui               |
| Excel reports          | openpyxl                |
| System tray            | pystray + Pillow        |
| Email (Gmail SMTP)     | smtplib (built-in)      |
| Multi-threading        | threading (built-in)    |
| JSON logging           | json (built-in)         |
| File packaging         | zipfile (built-in)      |
| .exe packaging         | PyInstaller             |

---

Built for job assessment — ExamGuard Pro v2.0 — by Ravichandra D
