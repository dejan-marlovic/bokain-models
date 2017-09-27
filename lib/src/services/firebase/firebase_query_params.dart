enum QUERY_LIMIT_DIRECTION
{
  ASC,
  DESC
}

class FirebaseQueryParams
{
  const FirebaseQueryParams(
      {
        this.limitTo = 100,
        this.limitDirection = QUERY_LIMIT_DIRECTION.ASC,
        this.searchProperty = null,
        this.searchValue = null,
        this.searchRangeStart = null,
        this.searchRangeEnd = null
      });

  @override
  String toString()
  {
    return "limitTo:$limitTo, limitDirection:$limitDirection, searchProperty:$searchProperty, searchValue:$searchValue, searchRangeStart:$searchRangeStart, searchRangeEnd:$searchRangeEnd";
  }

  final String searchProperty;
  final dynamic searchValue;
  final dynamic searchRangeStart;
  final dynamic searchRangeEnd;
  final int limitTo;
  final QUERY_LIMIT_DIRECTION limitDirection;
}