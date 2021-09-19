![GitHub Cards Preview](https://github.com/sameersyd/BoxFeed/blob/main/art/cover.png?raw=true)

# Box Feed
News App 📱 built to demonstrate the use of following features,

- SwiftUI 3
  - Async/Await 
  - AsyncImage
  - List
    - Refreshable
    - Swipe Actions
    - Separator
- Core Data
- MVVM Architecture Pattern

*Made with love ❤️ by [Sameer Nawaz](https://github.com/sameersyd)*

<br />

## Preview
Home | Article | Bookmarks
--- | --- | ---
![](https://github.com/sameersyd/BoxFeed/blob/main/art/home.png) | ![](https://github.com/sameersyd/BoxFeed/blob/main/art/article.png) | ![](https://github.com/sameersyd/BoxFeed/blob/main/art/bookmarks.png)

<br />

## Built With 🛠
- [SwiftUI](https://developer.apple.com/documentation/swiftui/) - SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.
- [CoreData](https://developer.apple.com/documentation/coredata) - Framework used to manage the model layer objects in the application.
- [Figma](https://figma.com/) - Figma is a vector graphics editor and prototyping tool which is primarily web-based.

<br />

## Project Structure
    
    BoxFeed # Target
    |
    ├── Resources
    |
    ├── Library
    |   ├── CoreData            # CoreData ManagedObject
    |   ├── Helpers             # All extension functions + CustomViews
    |   ├── Models              # Decodable models
    |   ├── Services            # NewsService
    |
    ├── Screens
    |   |
    |   ├── view
    |   │   ├── main                    # Main root folder
    |   |   │   ├── view                # SwiftUI MainView
    |   |   │   └── viewmodel           # ViewModel for MainView
    |   │   ├── Home                    # Home root folder
    |   |   |   |__ Home                # Home
    |   │   ├── Article                 # Article root folder
    |   |   |   |__ Article             # Article
    |   │   ├── Bookmarks               # Bookmarks root folder
    |   |   |   |__ Bookmarks           # Bookmarks
    |

<br />

## Contribute
If you want to contribute to this app, you're always welcome!
See [Contributing Guidelines](https://github.com/sameersyd/BoxFeed/blob/main/CONTRIBUTION.md). 

<br />

## Donation
If this project helped you reduce time to develop, you can buy me a cup of coffee :) 

<br />

<a href="https://www.buymeacoffee.com/sameersyd" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

## License
```
    Apache 2.0 License


    Copyright 2021 Sameer Nawaz

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

```
