# 🎮 Ticky Tacky Toe  

> [Play online](https://kaeri-gg.github.io/tic-tac-toe/release/)

A simple two-player **Tic Tac Toe** game built using **Godot 4.5** — currently a work in progress.  
The game follows the classic Tic Tac Toe rules: players take turns marking spaces on a 3×3 grid.  

<img width="1279" height="1275" alt="image" src="https://github.com/user-attachments/assets/23eec409-6fc8-48d3-b3d8-f0f659927a2f" />


## 🚧 Project Status
The core gameplay is complete — grid detection, win checking, reset functionality, and a working main menu are all implemented. Future updates will focus on adding player modes (e.g., Player vs AI) and improved UI animations.


## 🕹️ Game Features & Requirements

### ✅ Basic Functionality
#### Game Board  
- A 3×3 grid of clickable cells.  
- Each player takes turns marking **X** or **O** using the mouse.  

#### Turn System  
- Players alternate turns automatically.  
- The current player indicator is shown.  

#### Win Detection  
- The game automatically detects wins and draws.  
- A message displays the result (Win or Draw).  

#### Reset System  
- A **Reset** button clears the board and restarts the game instantly.  

#### Main Menu  
- A simple main menu allows the player to start the match.  



## 🧩 Future Enhancements
- **Single Player Mode (AI):** Add an opponent that plays automatically using basic logic.  
- **Animated UI:** Add subtle transitions and sounds for marking tiles or winning.  
- **Responsive Layout:** Adjust board size for mobile viewports.  



## 🎮 Controls
| Action | Control |
|--------|----------|
| Mark a cell | 🖱️ Mouse Click |
| Reset / Restart | 🔁 Reset Button |



## 🧾 Credits
Game created and designed by me, **Kaeri** 
Font credits goes to Google Fonts
Music from #Uppbeat (free for Creators!): https://uppbeat.io/t/pecan-pie/pixel-drift
License code: YIEYEUXZPMDVWHZA
Sounds FX 
- **Brackeys**  
- **Asbjørn Thirslund**  
- **Sofia Thirslund**
  


## 🪐 License
This project is shared for educational and learning purposes.  
Feel free to fork, modify, and experiment with it — just credit the original author when reused or redistributed.



## 🌐 GitHub Pages Deployment
This project is configured for automatic deployment to **GitHub Pages**.

### Prerequisites
- Repository must be **public** (for free GitHub Pages hosting).  
- GitHub Pages must be **enabled** in repository settings.  

### Setup Steps
1. Go to your repository **Settings → Pages**.  
2. Set **Source** to “Deploy from a branch.”  
3. Choose the **main** branch and the **root** folder.  
4. The game auto-deploys on every push to main.  


## ⚙️ Export Configuration (Important!)
In **Godot Export Settings → Web (HTML5)** preset:

**Critical Settings (must be disabled):**  
✅ Thread Support: OFF  
✅ Extensions Support: OFF  

After exporting, verify your `index.html` contains:

```javascript
const GODOT_THREADS_ENABLED = false;
```
```javascript
"ensureCrossOriginIsolationHeaders": false
```


