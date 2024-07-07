namespace Application.UseCases.Queries.Searches;

public class SortBy
{
    public SortTypes SortType { get; set; }
    public string PropertyName { get; set; } = string.Empty;
}

public enum SortTypes
{
    Ascending,
    Descending
}
