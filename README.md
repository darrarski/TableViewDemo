# TableViewDemo

Exmple list implementation that uses [DRTableViewManager](https://github.com/darrarski/DRTableViewManager-iOS).

## Content

- `Item` - simple model that represents item on the list
- `ItemsListController` - controller that manages items list and loading more items (data are mocked up)
- Example `DRTableViewManager` usage in `UITableViewController`
- Implementation of table view architecture that uses `DRTableViewSection` and `DRTableViewRow` protocols
- Table view sections:
  - `ItemsSection` - displays list of `Item` objects from `ItemsListController`
  - `LoadingSection` - displays `UIActivityIndicatorView` when `ItemsListController` is loading items
  - `LoadMoreSection` - triggers loading more items when table view is scrolled to the bottom (infinite scroll)

## License

The MIT License (MIT) - check out included [LICENSE](LICENSE) file