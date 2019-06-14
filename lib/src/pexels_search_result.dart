
class SearchResult<T> {
  final int page;
  final int perPage;
  final int totalResults;
  final String nextPage;
  final List<T> items;

  const SearchResult(
      this.page, this.perPage, this.totalResults, this.nextPage, this.items);

  T operator [](int index)=> items[index];
}